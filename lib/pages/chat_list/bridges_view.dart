import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_list/chat_list.dart';
import 'package:extera_next/utils/bridge_utils.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:extera_next/widgets/avatar.dart';
import 'package:extera_next/widgets/matrix.dart';
import '../../config/themes.dart';

class BridgesView extends StatefulWidget {
  final void Function(Room) onChatTap;
  final void Function() onBack;
  final ChatListController chatListController;

  const BridgesView({
    required this.onChatTap,
    required this.onBack,
    required this.chatListController,
    super.key,
  });

  @override
  State<BridgesView> createState() => _BridgesViewState();
}

class _BridgesViewState extends State<BridgesView> {
  String? _selectedBridgeType;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final client = Matrix.of(context).client;
    final bridgeRooms = client.rooms.where((room) => isBridgeRoom(room)).toList();
    bridgeRooms.sort((a, b) {
      final aTs = a.lastEvent?.originServerTs;
      final bTs = b.lastEvent?.originServerTs;
      if (aTs == null && bTs == null) return 0;
      if (aTs == null) return 1;
      if (bTs == null) return -1;
      return bTs.compareTo(aTs);
    });

    if (_selectedBridgeType == null) {
      return _BridgeOverview(
        bridgeRooms: bridgeRooms,
        onBack: widget.onBack,
        onSelectType: (type) {
          setState(() {
            _selectedBridgeType = type;
            _searchQuery = '';
          });
        },
      );
    }

    final roomsForType = bridgeRooms
        .where((room) => getBridgeType(room) == _selectedBridgeType)
        .toList();
    roomsForType.sort((a, b) {
      final aTs = a.lastEvent?.originServerTs;
      final bTs = b.lastEvent?.originServerTs;
      if (aTs == null && bTs == null) return 0;
      if (aTs == null) return 1;
      if (bTs == null) return -1;
      return bTs.compareTo(aTs);
    });
    final filteredRooms = _searchQuery.isEmpty
        ? roomsForType
        : roomsForType.where((room) {
            final name = room
                .getLocalizedDisplayname(MatrixLocals(L10n.of(context)))
                .toLowerCase();
            return name.contains(_searchQuery.toLowerCase());
          }).toList();

    return SafeArea(
      child: CustomScrollView(
        controller: widget.chatListController.scrollController,
        slivers: [
          SliverAppBar(
            title: Text(_bridgeTypeTitle(_selectedBridgeType!)),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _selectedBridgeType = null;
                  _searchQuery = '';
                });
              },
            ),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) => setState(() => _searchQuery = value),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: theme.colorScheme.surfaceContainerHighest,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          if (filteredRooms.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Text('No chats found'),
              ),
            )
          else
            SliverList.builder(
              itemCount: filteredRooms.length,
              itemBuilder: (BuildContext context, int i) {
                final room = filteredRooms[i];
                final bridgeType = getBridgeType(room);
                final displayname = room.getLocalizedDisplayname(
                  MatrixLocals(L10n.of(context)),
                );
                return Column(
                  children: [
                    _BridgeListItem(
                      room: room,
                      bridgeType: bridgeType,
                      displayname: displayname,
                      onTap: () => widget.onChatTap(room),
                      showBridgeLabel: false,
                    ),
                    if (filteredRooms.length - 1 != i)
                      Divider(
                        height: 1,
                        indent: 72,
                        endIndent: 16,
                        color: theme.dividerColor,
                      ),
                  ],
                );
              },
            ),
          SliverToBoxAdapter(child: const SizedBox(height: 172)),
        ],
      ),
    );
  }

  String _bridgeTypeTitle(String type) {
    switch (type) {
      case 'whatsapp':
        return 'WhatsApp';
      case 'telegram':
        return 'Telegram';
      case 'signal':
        return 'Signal';
      case 'discord':
        return 'Discord';
      case 'slack':
        return 'Slack';
      case 'irc':
        return 'IRC';
      default:
        return 'Other bridges';
    }
  }
}

class _BridgeOverview extends StatelessWidget {
  final List<Room> bridgeRooms;
  final void Function() onBack;
  final void Function(String?) onSelectType;

  const _BridgeOverview({
    required this.bridgeRooms,
    required this.onBack,
    required this.onSelectType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final grouped = <String?, List<Room>>{};
    for (final room in bridgeRooms) {
      final type = getBridgeType(room);
      grouped.putIfAbsent(type, () => []).add(room);
    }

    final knownOrder = [
      'whatsapp',
      'telegram',
      'signal',
      'discord',
      'slack',
      'irc',
    ];

    final sortedTypes = grouped.keys.toList()
      ..sort((a, b) {
        final indexA = knownOrder.indexOf(a ?? '');
        final indexB = knownOrder.indexOf(b ?? '');
        if (indexA != -1 && indexB != -1) return indexA.compareTo(indexB);
        if (indexA != -1) return -1;
        if (indexB != -1) return 1;
        return (a ?? '').compareTo(b ?? '');
      });

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Bridges'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            ),
            floating: true,
            snap: true,
          ),
          if (bridgeRooms.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.link_off,
                      size: 128,
                      color: theme.colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No bridges connected',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    Text(
                      'Bridge bots like WhatsApp or Telegram\nwill appear here when connected.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(12.0),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.4,
                ),
                itemCount: sortedTypes.length,
                itemBuilder: (context, i) {
                  final type = sortedTypes[i];
                  final rooms = grouped[type]!;
                  final meta = _bridgeTypeMeta(type);
                  return InkWell(
                    onTap: () => onSelectType(type),
                    borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(meta.icon, color: meta.color, size: 40),
                          const SizedBox(height: 8),
                          Text(
                            meta.label,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${rooms.length} chat${rooms.length == 1 ? '' : 's'}',
                            style: TextStyle(
                              fontSize: 12,
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 172)),
        ],
      ),
    );
  }

  _BridgeMeta _bridgeTypeMeta(String? type) {
    switch (type) {
      case 'whatsapp':
        return _BridgeMeta('WhatsApp', Icons.chat, const Color(0xFF25D366));
      case 'telegram':
        return _BridgeMeta('Telegram', Icons.send, const Color(0xFF0088CC));
      case 'signal':
        return _BridgeMeta('Signal', Icons.security, const Color(0xFF3A76F0));
      case 'discord':
        return _BridgeMeta('Discord', Icons.headset, const Color(0xFF5865F2));
      case 'slack':
        return _BridgeMeta('Slack', Icons.tag, const Color(0xFF4A154B));
      case 'irc':
        return _BridgeMeta('IRC', Icons.favorite, const Color(0xFF00FF00));
      default:
        return _BridgeMeta('Other', Icons.link, Colors.grey);
    }
  }
}

class _BridgeMeta {
  final String label;
  final IconData icon;
  final Color color;
  _BridgeMeta(this.label, this.icon, this.color);
}

class _BridgeListItem extends StatelessWidget {
  final Room room;
  final String? bridgeType;
  final String displayname;
  final void Function() onTap;
  final bool showBridgeLabel;

  const _BridgeListItem({
    required this.room,
    this.bridgeType,
    required this.displayname,
    required this.onTap,
    this.showBridgeLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: Material(
        borderRadius: borderRadius,
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          onTap: onTap,
          leading: _BridgeAvatar(
            bridgeType: bridgeType,
            room: room,
            useRoomAvatar: !showBridgeLabel,
          ),
          title: Text(
            displayname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: showBridgeLabel
              ? Row(
                  children: [
                    Icon(
                      Icons.link,
                      size: 14,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      bridgeType ?? 'Bridge',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                )
              : null,
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class _BridgeAvatar extends StatelessWidget {
  final String? bridgeType;
  final Room room;
  final bool useRoomAvatar;

  const _BridgeAvatar({
    this.bridgeType,
    required this.room,
    this.useRoomAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    if (useRoomAvatar) {
      return Avatar(
        mxContent: room.avatar,
        name: room.getLocalizedDisplayname(
          MatrixLocals(L10n.of(context)),
        ),
        size: Avatar.defaultSize,
      );
    }

    final theme = Theme.of(context);

    IconData icon;
    Color color;

    switch (bridgeType) {
      case 'whatsapp':
        icon = Icons.chat;
        color = const Color(0xFF25D366);
        break;
      case 'telegram':
        icon = Icons.send;
        color = const Color(0xFF0088CC);
        break;
      case 'signal':
        icon = Icons.security;
        color = const Color(0xFF3A76F0);
        break;
      case 'discord':
        icon = Icons.headset;
        color = const Color(0xFF5865F2);
        break;
      case 'slack':
        icon = Icons.tag;
        color = const Color(0xFF4A154B);
        break;
      case 'irc':
        icon = Icons.favorite;
        color = const Color(0xFF00FF00);
        break;
      default:
        icon = Icons.link;
        color = theme.colorScheme.primary;
    }

    return Container(
      width: Avatar.defaultSize,
      height: Avatar.defaultSize,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
