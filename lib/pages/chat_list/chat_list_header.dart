import 'package:flutter/material.dart';

import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/pages/chat_list/chat_list.dart';
import 'package:extera_next/pages/chat_list/client_chooser_button.dart';
import 'package:extera_next/utils/sync_status_localization.dart';
import '../../widgets/matrix.dart';

class ChatListHeader extends StatefulWidget implements PreferredSizeWidget {
  final ChatListController controller;
  final bool globalSearch;

  const ChatListHeader({
    super.key,
    required this.controller,
    this.globalSearch = true,
  });

  @override
  State<StatefulWidget> createState() => ChatListHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class ChatListHeaderState extends State<ChatListHeader> {
  ChatListController get controller => widget.controller;

  bool hideSearch = false;

  void updateView() {
    setState(() {
      hideSearch = !controller.scrolledToTop.value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.scrolledToTop.removeListener(updateView);
  }

  @override
  void initState() {
    super.initState();
    controller.scrolledToTop.addListener(updateView);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final client = Matrix.of(context).client;

    return SliverAppBar(
      toolbarHeight: hideSearch && !controller.isSearchMode ? 56 : 100,
      pinned: true,
      scrolledUnderElevation: 4,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppConfig.applicationName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (hideSearch && !controller.isSearchMode) ...[
                IconButton(onPressed: () {
                  controller.scrollController.animateTo(0, duration: FluffyThemes.animationDuration, curve: FluffyThemes.animationCurve);
                  controller.isSearchMode = true;
                  controller.searchFocusNode.requestFocus();
                }, icon: const Icon(Icons.search)),
              ],
              ClientChooserButton(controller),
            ],
          ),
          if (!hideSearch) const SizedBox(height: 8),
          AnimatedSize(
            duration: FluffyThemes.animationDuration,
            child: hideSearch && !controller.isSearchMode
                ? null
                : StreamBuilder(
                    stream: client.onSyncStatus.stream,
                    builder: (context, snapshot) {
                      final status =
                          client.onSyncStatus.value ??
                          const SyncStatusUpdate(SyncStatus.waitingForResponse);
                      final hide =
                          client.onSync.value != null &&
                          status.status != SyncStatus.error &&
                          client.prevBatch != null;
                      return SizedBox(
                        height: 40,
                        child: TextField(
                          controller: controller.searchController,
                          focusNode: controller.searchFocusNode,
                          textInputAction: TextInputAction.search,
                          style: const TextStyle(fontSize: 14),
                          onChanged: (text) => controller.onSearchEnter(
                            text,
                            globalSearch: false,
                          ),
                          onSubmitted: (text) => controller.onSearchEnter(
                            text,
                            globalSearch: widget.globalSearch,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: theme.colorScheme.secondaryContainer,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            hintText: hide
                                ? L10n.of(context).searchChatsRooms
                                : status.calcLocalizedString(context),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: status.error != null
                                  ? theme.colorScheme.error
                                  : theme.colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.normal,
                            ),
                            prefixIcon: hide
                                ? controller.isSearchMode
                                      ? IconButton(
                                          tooltip: L10n.of(context).cancel,
                                          icon: const Icon(
                                            Icons.close_outlined,
                                            size: 20,
                                          ),
                                          onPressed: controller.cancelSearch,
                                          color: theme
                                              .colorScheme
                                              .onSecondaryContainer,
                                        )
                                      : IconButton(
                                          onPressed: controller.startSearch,
                                          icon: Icon(
                                            Icons.search_outlined,
                                            size: 20,
                                            color: theme
                                                .colorScheme
                                                .onSecondaryContainer,
                                          ),
                                        )
                                : Container(
                                    margin: const EdgeInsets.all(8),
                                    width: 8,
                                    height: 8,
                                    child: Center(
                                      child: CircularProgressIndicator.adaptive(
                                        constraints: const .tightFor(width: 24, height: 36),
                                        strokeWidth: 2,
                                        value: status.progress,
                                        valueColor: status.error != null
                                            ? AlwaysStoppedAnimation<Color>(
                                                theme.colorScheme.error,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                            suffixIcon:
                                controller.isSearchMode && widget.globalSearch
                                ? controller.isSearching
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 8.0,
                                            horizontal: 10,
                                          ),
                                          child: SizedBox.square(
                                            dimension: 20,
                                            child:
                                                CircularProgressIndicator.adaptive(
                                                  strokeWidth: 2,
                                                ),
                                          ),
                                        )
                                      : TextButton.icon(
                                          onPressed: controller.setServer,
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(99),
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 11,
                                            ),
                                          ),
                                          icon: const Icon(
                                            Icons.edit_outlined,
                                            size: 14,
                                          ),
                                          label: Text(
                                            controller.searchServer ??
                                                Matrix.of(
                                                  context,
                                                ).client.homeserver!.host,
                                            maxLines: 2,
                                          ),
                                        )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
