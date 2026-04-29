import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:app_links/app_links.dart';
import 'package:cross_file/cross_file.dart';
import 'package:flutter_shortcuts_new/flutter_shortcuts_new.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart' as sdk;
import 'package:matrix/matrix.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

import 'package:Pulsly/config/app_config.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/chat_list/chat_list_view.dart';
import 'package:Pulsly/pages/chat_list/invite_dialog.dart';
import 'package:Pulsly/utils/adaptive_bottom_sheet.dart';
import 'package:Pulsly/utils/localized_exception_extension.dart';
import 'package:Pulsly/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:Pulsly/utils/platform_infos.dart';
import 'package:Pulsly/utils/show_scaffold_dialog.dart';
import 'package:Pulsly/utils/show_update_snackbar.dart';
import 'package:Pulsly/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:Pulsly/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:Pulsly/widgets/adaptive_dialogs/show_text_input_dialog.dart';
import 'package:Pulsly/widgets/avatar.dart';
import 'package:Pulsly/widgets/future_loading_dialog.dart';
import 'package:Pulsly/widgets/future_loading_snackbar.dart';
import 'package:Pulsly/widgets/share_scaffold_dialog.dart';
import '../../../utils/account_bundles.dart';
import '../../config/setting_keys.dart';
import '../../utils/bridge_utils.dart';
import '../../utils/url_launcher.dart';
import '../../widgets/matrix.dart';

enum PopupMenuAction { settings, invite, newGroup, newSpace, archive }

enum ActiveFilter { allChats, messages, groups, unread, spaces, people }

enum SearchScope { local, public }

extension LocalizedActiveFilter on ActiveFilter {
  String toLocalizedString(BuildContext context) {
    switch (this) {
      case ActiveFilter.allChats:
        return L10n.of(context).all;
      case ActiveFilter.messages:
        return L10n.of(context).messages;
      case ActiveFilter.unread:
        return L10n.of(context).unread;
      case ActiveFilter.groups:
        return L10n.of(context).groups;
      case ActiveFilter.spaces:
        return L10n.of(context).spaces;
      case ActiveFilter.people:
        return L10n.of(context).people;
    }
  }

  IconData toIconData(bool outline) {
    switch (this) {
      case .allChats:
      case .messages:
        return outline ? Icons.chat_bubble_outline : Icons.chat_bubble;
      case .unread:
        return outline
            ? Icons.mark_unread_chat_alt_outlined
            : Icons.mark_unread_chat_alt;
      case .groups:
        return outline ? Icons.people_outline : Icons.people;
      case .spaces:
        return outline ? Icons.grid_view_outlined : Icons.grid_view_rounded;
      case .people:
        return Icons.people_outline;
    }
  }
}

class ChatList extends StatefulWidget {
  static BuildContext? contextForVoip;
  final String? activeChat;
  final bool displayNavigationRail;

  const ChatList({
    super.key,
    required this.activeChat,
    this.displayNavigationRail = false,
  });

  @override
  ChatListController createState() => ChatListController();
}

class ChatListController extends State<ChatList>
    with TickerProviderStateMixin, RouteAware, WidgetsBindingObserver {
  StreamSubscription? _intentDataStreamSubscription;

  StreamSubscription? _intentFileStreamSubscription;

  StreamSubscription? _intentUriStreamSubscription;

  // Performance cache variables
  Set<String> _cachedBridgeTypes = {};
  DateTime _lastBridgeSync = DateTime(2000);
  Map<String, int> _cachedUnreadCounts = {};
  DateTime _lastUnreadCalc = DateTime(2000);
  List<Room> _cachedFilteredRooms = [];
  DateTime _lastFilterCalc = DateTime(2000);
  ActiveFilter _lastActiveFilter = ActiveFilter.allChats;
  Set<String> _lastVisibleBridgeTypes = {};

  ActiveFilter activeFilter = AppSettings.separateChatTypes.value
      ? ActiveFilter.messages
      : ActiveFilter.allChats;

  String? _activeSpaceId;
  String? get activeSpaceId => _activeSpaceId;

  void setActiveSpace(String spaceId) async {
    final room = Matrix.of(context).client.getRoomById(spaceId);
    if (room == null) return;
    await room.postLoad();

    setState(() {
      _activeSpaceId = spaceId;
    });
  }

  void clearActiveSpace() => setState(() {
    _activeSpaceId = null;
  });

  void onChatTap(Room room) async {
    if (room.membership == Membership.invite) {
      if (room.isSpace) {
        // For spaces, keep the old behavior since they can't be opened as chat
        await showAdaptiveBottomSheet(
          context: context,
          builder: (context) => InviteDialog(room),
        );
        return;
      }
      context.go('/rooms/${room.id}');
      // Force badge refresh after opening chat
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() {});
      });
      return;
    }

    if (room.membership == Membership.ban) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L10n.of(context).youHaveBeenBannedFromThisChat)),
      );
      return;
    }

    if (room.membership == Membership.leave) {
      context.go('/rooms/archive/${room.id}');
      return;
    }

    if (room.isSpace) {
      setActiveSpace(room.id);
      return;
    }

    context.go('/rooms/${room.id}');
  }

  Set<String> allBridgeTypes = {};
  Set<String> visibleBridgeTypes = {};

  // Cached getter voor ongelezen counts - 2 second cache
  Map<String, int> get unreadBridgeCounts {
    final now = DateTime.now();
    if (now.difference(_lastUnreadCalc) < Duration(seconds: 2)) {
      return _cachedUnreadCounts;
    }

    final client = Matrix.of(context).client;
    final counts = <String, int>{};
    for (final room in client.rooms) {
      if (!room.isSpace && room.isUnreadOrInvited) {
        final bridgeType = isBridgeRoom(room)
            ? (getBridgeType(room) ?? 'other')
            : 'matrix';
        counts[bridgeType] = (counts[bridgeType] ?? 0) + 1;
      }
    }

    _cachedUnreadCounts = counts;
    _lastUnreadCalc = now;
    return counts;
  }

  void _initVisibleBridgeTypes() {
    syncBridgeTypes();
  }

  Future<void> syncBridgeTypes() async {
    // If allBridgeTypes is empty, we haven't detected any bridges yet - don't cache
    // and keep trying on every call until we find something
    // Once we have detected bridges, use a 2-second cache to avoid excessive recomputation
    if (!allBridgeTypes.isEmpty) {
      if (DateTime.now().difference(_lastBridgeSync) < const Duration(seconds: 2)) {
        return;
      }
    }

    final client = Matrix.of(context).client;
    
    // Pre-load room states to ensure bridge state events are available
    // Note: We cannot force-load all members for large groups - the SDK only loads ~20 by default
    // Bridge detection for large groups relies on other heuristics (room name, alias, etc.)
    for (final room in client.rooms) {
      try {
        await room.postLoad();
      } catch (_) {
        // Ignore errors for individual rooms
      }
    }
    
    // Debug: log all rooms and their bridge status
    final bridgeRooms = client.rooms.where((room) => isBridgeRoom(room)).toList();
    Logs().d('[BridgeSync] Total rooms: ${client.rooms.length}, Bridge rooms: ${bridgeRooms.length}');
    for (final room in bridgeRooms) {
      final bt = getBridgeType(room);
      Logs().d('[BridgeSync] Room "${room.name}" isBridgeRoom=true bridgeType=${bt ?? 'null'}');
    }
    
    final hasMatrixRooms = client.rooms.any((room) => !isBridgeRoom(room));
    final detectedTypes = client.rooms
        .where((room) => isBridgeRoom(room))
        .map((room) => getBridgeType(room) ?? 'other')
        .toSet();
    
    // Always add 'matrix' if there are any rooms at all
    // This ensures the filter bar shows even when bridge detection hasn't run yet
    if (client.rooms.isNotEmpty) {
      detectedTypes.add('matrix');
    }
    Logs().d('[BridgeSync] Detected types: $detectedTypes, allBridgeTypes was: $allBridgeTypes');
    
    // Only auto-add types that were not previously known.
    // If a user manually removed a type, do not re-add it.
    visibleBridgeTypes = {
      ...visibleBridgeTypes,
      ...detectedTypes.where((t) => !allBridgeTypes.contains(t)),
    };
    allBridgeTypes = detectedTypes;
    _cachedBridgeTypes = detectedTypes;
    _lastBridgeSync = DateTime.now();
    Logs().d('[BridgeSync] Final allBridgeTypes: $allBridgeTypes');
    
    // Trigger UI rebuild after bridge types are updated
    if (mounted) {
      setState(() {});
    }
  }

  bool Function(Room) getRoomFilterByActiveFilter(ActiveFilter activeFilter) {
    switch (activeFilter) {
      case .allChats:
        return (room) =>
            !room.isSpace &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty) &&
            _isBridgeTypeVisible(room);
      case .messages:
        return (room) =>
            !room.isSpace &&
            room.isDirectChat &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty) &&
            _isBridgeTypeVisible(room);
      case .groups:
        return (room) =>
            !room.isSpace &&
            !room.isDirectChat &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty);
      case .unread:
        return (room) => room.isUnreadOrInvited && _isBridgeTypeVisible(room);
      case .spaces:
        return (room) => room.isSpace;
      case .people:
        return (room) => false;
    }
  }

  bool _isBridgeTypeVisible(Room room) {
    // If no bridge types have been detected yet, show all rooms
    // This prevents rooms from disappearing during initial load
    if (allBridgeTypes.isEmpty) {
      return true;
    }
    if (!isBridgeRoom(room)) {
      return visibleBridgeTypes.contains('matrix');
    }
    final bridgeType = getBridgeType(room) ?? 'other';
    final visible = visibleBridgeTypes.contains(bridgeType);
    Logs().d('[Filter] Room ${room.name} bridgeType=$bridgeType visible=$visible visibleBridgeTypes=$visibleBridgeTypes');
    return visible;
  }

  // Cached filteredRooms - 500ms cache
  List<Room> get filteredRooms {
    final now = DateTime.now();
    if (now.difference(_lastFilterCalc) < Duration(milliseconds: 500) &&
        _lastActiveFilter == activeFilter &&
        _lastVisibleBridgeTypes == visibleBridgeTypes) {
      return _cachedFilteredRooms;
    }

    _cachedFilteredRooms = Matrix.of(
      context,
    ).client.rooms.where(getRoomFilterByActiveFilter(activeFilter)).where(_isBridgeTypeVisible).toList();
    _lastFilterCalc = now;
    _lastActiveFilter = activeFilter;
    _lastVisibleBridgeTypes = Set<String>.from(visibleBridgeTypes);
    return _cachedFilteredRooms;
  }

  List<Room> get searchRooms => Matrix.of(context).client.rooms.where((room) {
    switch (activeFilter) {
      case .allChats:
        return !room.isSpace &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty);
      case .messages:
        return !room.isSpace &&
            room.isDirectChat &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty);
      case .groups:
        return !room.isSpace &&
            !room.isDirectChat &&
            (AppSettings.showSpaceRoomsInGlobalList.value ||
                room.spaceParents.isEmpty);
      case .unread:
        return room.isUnreadOrInvited;
      case .spaces:
        return room.isSpace;
      case .people:
        return false;
    }
  }).toList();

  bool isSearchMode = false;
  Future<QueryPublicRoomsResponse>? publicRoomsResponse;
  String? searchServer;
  Timer? _coolDown;
  SearchUserDirectoryResponse? userSearchResult;
  QueryPublicRoomsResponse? roomSearchResult;

  bool isSearching = false;
  SearchScope searchScope = SearchScope.local;
  static const String _serverStoreNamespace = 'im.fluffychat.search.server';

  void triggerSearch() => _search();

  void setServer() async {
    final newServer = await showTextInputDialog(
      useRootNavigator: false,
      title: L10n.of(context).changeTheHomeserver,
      context: context,
      okLabel: L10n.of(context).ok,
      cancelLabel: L10n.of(context).cancel,
      prefixText: 'https://',
      hintText: Matrix.of(context).client.homeserver?.host,
      initialText: searchServer,
      keyboardType: TextInputType.url,
      autocorrect: false,
      validator: (server) => server.contains('.') == true
          ? null
          : L10n.of(context).invalidServerName,
    );
    if (newServer == null) return;
    Matrix.of(context).store.setString(_serverStoreNamespace, newServer);
    setState(() {
      searchServer = newServer;
    });
    _coolDown?.cancel();
    _coolDown = Timer(const Duration(milliseconds: 500), _search);
  }

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  void _search() async {
    final client = Matrix.of(context).client;
    if (!isSearching) {
      setState(() {
        isSearching = true;
      });
    }
    SearchUserDirectoryResponse? userSearchResult;
    QueryPublicRoomsResponse? roomSearchResult;
    final searchQuery = searchController.text.trim();
    try {
      if (searchScope == SearchScope.public) {
        roomSearchResult = await client.queryPublicRooms(
          server: searchServer,
          filter: PublicRoomQueryFilter(genericSearchTerm: searchQuery),
          limit: 20,
        );

        if (searchQuery.isValidMatrixId &&
            searchQuery.sigil == '#' &&
            roomSearchResult.chunk.any(
                  (room) => room.canonicalAlias == searchQuery,
                ) ==
                false) {
          final response = await client.getRoomIdByAlias(searchQuery);
          final roomId = response.roomId;
          if (roomId != null) {
            roomSearchResult.chunk.add(
              PublicRoomsChunk(
                name: searchQuery,
                guestCanJoin: false,
                numJoinedMembers: 0,
                roomId: roomId,
                worldReadable: false,
                canonicalAlias: searchQuery,
              ),
            );
          }
        }
      }
      if (searchScope == SearchScope.local) {
        userSearchResult = await client.searchUserDirectory(
          searchController.text,
          limit: 20,
        );
      }
    } catch (e, s) {
      Logs().w('Searching has crashed', e, s);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toLocalizedString(context))));
    }
    if (!isSearchMode) return;
    setState(() {
      isSearching = false;
      this.roomSearchResult = roomSearchResult;
      this.userSearchResult = userSearchResult;
    });
  }

  void onSearchEnter(String text, {bool globalSearch = true}) {
    if (text.isEmpty) {
      cancelSearch(unfocus: false);
      return;
    }

    setState(() {
      isSearchMode = true;
    });
    _coolDown?.cancel();
    if (globalSearch) {
      _coolDown = Timer(const Duration(milliseconds: 500), _search);
    }
  }

  void startSearch() {
    setState(() {
      isSearchMode = true;
    });
    searchFocusNode.requestFocus();
    _coolDown?.cancel();
    _coolDown = Timer(const Duration(milliseconds: 500), _search);
  }

  void cancelSearch({bool unfocus = true}) {
    setState(() {
      searchController.clear();
      isSearchMode = false;
      roomSearchResult = userSearchResult = null;
      isSearching = false;
    });
    if (unfocus) searchFocusNode.unfocus();
  }

  BoxConstraints? snappingSheetContainerSize;

  final ScrollController scrollController = ScrollController();
  final ValueNotifier<bool> scrolledToTop = ValueNotifier(true);

  final StreamController<Client> _clientStream = StreamController.broadcast();

  Stream<Client> get clientStream => _clientStream.stream;

  void addAccountAction() => context.go('/addaccount');

  void _onScroll() {
    final newScrolledToTop = scrollController.position.pixels <= 0;
    if (newScrolledToTop != scrolledToTop.value) {
      scrolledToTop.value = newScrolledToTop;
    }
  }

  void editSpace(BuildContext context, String spaceId) async {
    final room = Matrix.of(context).client.getRoomById(spaceId);
    if (room == null) return;
    await room.postLoad();
    if (mounted) {
      context.push('/rooms/$spaceId/details');
    }
  }

  // Needs to match GroupsSpacesEntry for 'separate group' checking.
  List<Room> get spaces =>
      Matrix.of(context).client.rooms.where((r) => r.isSpace).toList();

  String? get activeChat => widget.activeChat;

  void _processIncomingSharedMedia(List<SharedMediaFile> files) {
    if (files.isEmpty) return;

    files.removeWhere(
      (file) =>
          file.path.startsWith(AppConfig.deepLinkPrefix) ||
          file.path.startsWith(AppConfig.appSsoUrlScheme),
    );

    showScaffoldDialog(
      context: context,
      builder: (context) => ShareScaffoldDialog(
        items: files.map((file) {
          if ({SharedMediaType.text, SharedMediaType.url}.contains(file.type)) {
            return TextShareItem(file.path);
          }
          return FileShareItem(
            XFile(
              file.path.replaceFirst('file://', ''),
              mimeType: file.mimeType,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _processIncomingUris(Uri? uri) async {
    if (uri == null) return;
    Logs().w("Processing incoming url: ${uri.toString()}");
    context.go('/rooms');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UrlLauncher(context, uri.toString()).openMatrixToUrl();
    });
  }

  void _initReceiveSharingIntent() {
    if (!PlatformInfos.isMobile) return;

    // For sharing images coming from outside the app while the app is in the memory
    _intentFileStreamSubscription = ReceiveSharingIntent.instance
        .getMediaStream()
        .listen(_processIncomingSharedMedia, onError: print);

    // For sharing images coming from outside the app while the app is closed
    ReceiveSharingIntent.instance.getInitialMedia().then(
      _processIncomingSharedMedia,
    );

    // For receiving shared Uris
    _intentUriStreamSubscription = AppLinks().uriLinkStream.listen(
      _processIncomingUris,
    );

    if (PlatformInfos.isAndroid) {
      final shortcuts = FlutterShortcuts();
      shortcuts.initialize().then(
        (_) => shortcuts.listenAction((action) {
          if (!mounted) return;
          UrlLauncher(context, action).launchUrl();
        }),
      );
    }
  }

  @override
  void initState() {
    _initReceiveSharingIntent();
    WidgetsBinding.instance.addObserver(this);

    scrollController.addListener(_onScroll);
    _waitForFirstSync();
    _hackyWebRTCFixForWeb();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        searchServer = Matrix.of(
          context,
        ).store.getString(_serverStoreNamespace);
        Matrix.of(
          context,
        ).backgroundPush?.setupPush(Matrix.of(context).widget.clients);
        UpdateNotifier.showUpdateSnackBar(context);
      }

      // Workaround for system UI overlay style not applied on app start
      SystemChrome.setSystemUIOverlayStyle(
        Theme.of(context).appBarTheme.systemOverlayStyle!,
      );
    });

    // checkForUpdates disabled

    super.initState();
  }

  @override
  void dispose() {
    _intentDataStreamSubscription?.cancel();
    _intentFileStreamSubscription?.cancel();
    _intentUriStreamSubscription?.cancel();
    scrollController.removeListener(_onScroll);
    _clientStream.close();
    searchController.dispose();
    searchFocusNode.dispose();
    _coolDown?.cancel();
    scrolledToTop.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void chatContextAction(
    Room room,
    BuildContext posContext, [
    Room? space,
  ]) async {
    final overlay =
        Overlay.of(posContext).context.findRenderObject() as RenderBox;

    final button = posContext.findRenderObject() as RenderBox;

    final position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(const Offset(0, -65), ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero) + const Offset(-50, 0),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    final displayname = room.getLocalizedDisplayname(
      MatrixLocals(L10n.of(context)),
    );

    final spacesWithPowerLevels = room.client.rooms
        .where(
          (space) =>
              space.isSpace &&
              space.canChangeStateEvent(EventTypes.SpaceChild) &&
              !space.spaceChildren.any((c) => c.roomId == room.id),
        )
        .toList();

    final action = await showMenu<ChatContextAction>(
      context: posContext,
      position: position,
      items: [
        PopupMenuItem(
          value: ChatContextAction.open,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!AppSettings.hideAvatarsInInvites.value ||
                  room.membership != Membership.invite)
                Avatar(
                  mxContent: room.avatar,
                  size: Avatar.defaultSize / 2,
                  name: displayname,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  displayname,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        if (space != null)
          PopupMenuItem(
            value: ChatContextAction.goToSpace,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!AppSettings.hideAvatarsInInvites.value ||
                    room.membership != Membership.invite)
                  Avatar(
                    mxContent: space.avatar,
                    size: Avatar.defaultSize / 2,
                    name: space.getLocalizedDisplayname(),
                  ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    L10n.of(context).goToSpace(space.getLocalizedDisplayname()),
                  ),
                ),
              ],
            ),
          ),
        if (room.membership == Membership.join) ...[
          PopupMenuItem(
            value: ChatContextAction.mute,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  room.pushRuleState == PushRuleState.notify
                      ? Icons.notifications_off_outlined
                      : Icons.notifications_off,
                ),
                const SizedBox(width: 12),
                Text(
                  room.pushRuleState == PushRuleState.notify
                      ? L10n.of(context).muteChat
                      : L10n.of(context).unmuteChat,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: ChatContextAction.markUnread,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  room.markedUnread
                      ? Icons.mark_as_unread
                      : Icons.mark_as_unread_outlined,
                ),
                const SizedBox(width: 12),
                Text(
                  room.markedUnread
                      ? L10n.of(context).markAsRead
                      : L10n.of(context).markAsUnread,
                ),
              ],
            ),
          ),
          if (!room.isLowPriority)
            PopupMenuItem(
              value: ChatContextAction.favorite,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    room.isFavourite ? Icons.push_pin : Icons.push_pin_outlined,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    room.isFavourite
                        ? L10n.of(context).unpin
                        : L10n.of(context).pin,
                  ),
                ],
              ),
            ),
          if (!room.isFavourite)
            PopupMenuItem(
              value: ChatContextAction.lowPriority,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    room.isLowPriority
                        ? Icons.low_priority
                        : Icons.low_priority_outlined,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    room.isFavourite
                        ? L10n.of(context).unsetLowPriority
                        : L10n.of(context).setLowPriority,
                  ),
                ],
              ),
            ),
          if (spacesWithPowerLevels.isNotEmpty)
            PopupMenuItem(
              value: ChatContextAction.addToSpace,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.group_work_outlined),
                  const SizedBox(width: 12),
                  Text(L10n.of(context).addToSpace),
                ],
              ),
            ),
        ],
        if (room.membership == Membership.invite)
          PopupMenuItem(
            value: ChatContextAction.join,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  L10n.of(context).accept,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        if (room.isDirectChat || room.membership == Membership.invite)
          PopupMenuItem(
            value: ChatContextAction.block,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.block_outlined,
                  color: Theme.of(context).colorScheme.error,
                ),
                const SizedBox(width: 12),
                Text(
                  L10n.of(context).block,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
          ),
        PopupMenuItem(
          value: ChatContextAction.leave,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete_outlined,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
              const SizedBox(width: 12),
              Text(
                room.membership == Membership.invite
                    ? L10n.of(context).delete
                    : L10n.of(context).leave,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (action == null) return;
    if (!mounted) return;

    switch (action) {
      case ChatContextAction.join:
        final joinResult = await showFutureLoadingSnackbar(
          context: context,
          future: () async {
            final waitForRoom = room.client.waitForRoomInSync(
              room.id,
              join: true,
            );
            await room.join();
            await waitForRoom;
          },
          exceptionContext: ExceptionContext.joinRoom,
        );
        if (joinResult.error != null) return;
        return;
      case ChatContextAction.open:
        onChatTap(room);
        return;
      case ChatContextAction.goToSpace:
        setActiveSpace(space!.id);
        return;
      case ChatContextAction.favorite:
        await showFutureLoadingSnackbar(
          context: context,
          future: () => room.setFavourite(!room.isFavourite),
        );
        return;
      case ChatContextAction.lowPriority:
        await showFutureLoadingSnackbar(
          context: context,
          future: () => room.setLowPriority(!room.isLowPriority),
        );
        return;
      case ChatContextAction.markUnread:
        await showFutureLoadingSnackbar(
          context: context,
          future: () => room.markUnread(!room.markedUnread),
        );
        return;
      case ChatContextAction.mute:
        await showFutureLoadingSnackbar(
          context: context,
          future: () => room.setPushRuleState(
            room.pushRuleState == PushRuleState.notify
                ? PushRuleState.mentionsOnly
                : PushRuleState.notify,
          ),
        );
        return;
      case ChatContextAction.leave:
        final confirmed = await showOkCancelAlertDialog(
          context: context,
          title: L10n.of(context).areYouSure,
          message: L10n.of(context).archiveRoomDescription,
          okLabel: L10n.of(context).leave,
          cancelLabel: L10n.of(context).cancel,
          isDestructive: true,
        );
        if (confirmed == OkCancelResult.cancel) return;
        if (!mounted) return;

        await showFutureLoadingSnackbar(context: context, future: room.leave);

        return;
      case ChatContextAction.addToSpace:
        final space = await showModalActionPopup(
          context: context,
          title: L10n.of(context).space,
          actions: spacesWithPowerLevels
              .map(
                (space) => AdaptiveModalAction(
                  value: space,
                  label: space.getLocalizedDisplayname(
                    MatrixLocals(L10n.of(context)),
                  ),
                ),
              )
              .toList(),
        );
        if (space == null) return;
        await showFutureLoadingSnackbar(
          context: context,
          future: () => space.setSpaceChild(room.id),
        );
      case ChatContextAction.block:
        final userId = room
            .getState(EventTypes.RoomMember, room.client.userID!)
            ?.senderId;
        context.go('/rooms/settings/security/ignorelist', extra: userId);
    }
  }

  void dismissStatusList() async {
    final result = await showOkCancelAlertDialog(
      title: L10n.of(context).hidePresences,
      context: context,
    );
    if (result == OkCancelResult.ok) {
      AppSettings.showPresences.setItem(false);
      if (!mounted) return;
      setState(() {});
    }
  }

  bool waitForFirstSync = false;

  Future<void> _waitForFirstSync() async {
    final router = GoRouter.of(context);
    final client = Matrix.of(context).client;
    await client.roomsLoading;
    await client.accountDataLoading;
    await client.userDeviceKeysLoading;
    if (client.prevBatch == null) {
      await client.onSyncStatus.stream.firstWhere(
        (status) => status.status == SyncStatus.finished,
      );

      if (!mounted) return;
      setState(() {
        waitForFirstSync = true;
      });
    }
    if (!mounted) return;
    setState(() {
      waitForFirstSync = true;
    });

    // Sync bridge types after first sync completes
    // Bridge state events should now be available
    syncBridgeTypes();

    if (client.userDeviceKeys[client.userID!]?.deviceKeys.values.any(
          (device) => !device.verified && !device.blocked,
        ) ??
        false) {
      late final ScaffoldFeatureController controller;
      final theme = Theme.of(context);
      controller = ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 15),
          showCloseIcon: true,
          backgroundColor: theme.colorScheme.errorContainer,
          closeIconColor: theme.colorScheme.onErrorContainer,
          content: Text(
            L10n.of(context).oneOfYourDevicesIsNotVerified,
            style: TextStyle(color: theme.colorScheme.onErrorContainer),
          ),
          action: SnackBarAction(
            onPressed: () {
              controller.close();
              router.go('/rooms/settings/devices');
            },
            textColor: theme.colorScheme.onErrorContainer,
            label: L10n.of(context).settings,
          ),
        ),
      );
    }
  }

  void setActiveFilter(ActiveFilter filter) {
    setState(() {
      activeFilter = filter;
      if (filter != .spaces && activeSpaceId != null) {
        _activeSpaceId = null;
      }
    });
  }

  void setActiveClient(Client client) {
    context.go('/rooms');
    setState(() {
      activeFilter = ActiveFilter.allChats;
      _activeSpaceId = null;
      Matrix.of(context).setActiveClient(client);
    });
    _clientStream.add(client);
  }

  void setActiveBundle(String bundle) {
    context.go('/rooms');
    setState(() {
      _activeSpaceId = null;
      Matrix.of(context).activeBundle = bundle;
      if (!Matrix.of(
        context,
      ).currentBundle!.any((client) => client == Matrix.of(context).client)) {
        Matrix.of(
          context,
        ).setActiveClient(Matrix.of(context).currentBundle!.first);
      }
    });
  }

  void editBundlesForAccount(String? userId, String? activeBundle) async {
    final l10n = L10n.of(context);
    final client = Matrix.of(
      context,
    ).widget.clients[Matrix.of(context).getClientIndexByMatrixId(userId!)];
    final action = await showModalActionPopup<EditBundleAction>(
      context: context,
      title: L10n.of(context).editBundlesForAccount,
      cancelLabel: L10n.of(context).cancel,
      actions: [
        AdaptiveModalAction(
          value: EditBundleAction.addToBundle,
          label: L10n.of(context).addToBundle,
        ),
        if (activeBundle != client.userID)
          AdaptiveModalAction(
            value: EditBundleAction.removeFromBundle,
            label: L10n.of(context).removeFromBundle,
          ),
      ],
    );
    if (action == null) return;
    switch (action) {
      case EditBundleAction.addToBundle:
        final bundle = await showTextInputDialog(
          context: context,
          title: l10n.bundleName,
          hintText: l10n.bundleName,
        );
        if (bundle == null || bundle.isEmpty) return;
        await showFutureLoadingSnackbar(
          context: context,
          future: () => client.setAccountBundle(bundle),
        );
        break;
      case EditBundleAction.removeFromBundle:
        await showFutureLoadingSnackbar(
          context: context,
          future: () => client.removeFromAccountBundle(activeBundle!),
        );
    }
  }

  bool get displayBundles =>
      Matrix.of(context).hasComplexBundles &&
      Matrix.of(context).accountBundles.keys.length > 1;

  String? get secureActiveBundle {
    if (Matrix.of(context).activeBundle == null ||
        !Matrix.of(
          context,
        ).accountBundles.keys.contains(Matrix.of(context).activeBundle)) {
      return Matrix.of(context).accountBundles.keys.first;
    }
    return Matrix.of(context).activeBundle;
  }

  void resetActiveBundle() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!mounted) return;
      setState(() {
        Matrix.of(context).activeBundle = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) => ChatListView(this);

  void _hackyWebRTCFixForWeb() {
    ChatList.contextForVoip = context;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-sync bridge types when app resumes (e.g., from background)
    // Bridge state events may have been loaded while app was inactive
    if (state == AppLifecycleState.resumed) {
      syncBridgeTypes();
    }
  }

  Future<void> dehydrate() => Matrix.of(context).dehydrateAction(context);
}

enum EditBundleAction { addToBundle, removeFromBundle }

enum InviteActions { accept, decline, block }

enum ChatContextAction {
  join,
  open,
  goToSpace,
  favorite,
  lowPriority,
  markUnread,
  mute,
  leave,
  addToSpace,
  block,
}
