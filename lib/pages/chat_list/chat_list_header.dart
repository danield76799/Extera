import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_list/chat_list.dart';
import 'package:extera_next/pages/chat_list/client_chooser_button.dart';
import 'package:extera_next/utils/sync_status_localization.dart';
import '../../widgets/matrix.dart';

class ChatListHeader extends StatelessWidget {
  final ChatListController controller;
  final bool globalSearch;

  const ChatListHeader({
    super.key,
    required this.controller,
    this.globalSearch = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _ChatListHeaderDelegate(
        controller: controller,
        globalSearch: globalSearch,
        topPadding: MediaQuery.of(context).padding.top,
      ),
    );
  }
}

class _ChatListHeaderDelegate extends SliverPersistentHeaderDelegate {
  final ChatListController controller;
  final bool globalSearch;
  final double topPadding;

  _ChatListHeaderDelegate({
    required this.controller,
    required this.globalSearch,
    required this.topPadding,
  });

  @override
  double get minExtent => 56 + topPadding;

  @override
  double get maxExtent => 56 + topPadding;

  @override
  bool shouldRebuild(covariant _ChatListHeaderDelegate oldDelegate) =>
      oldDelegate.controller != controller ||
      oldDelegate.globalSearch != globalSearch ||
      oldDelegate.topPadding != topPadding;

  @override
  Widget build(
    context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final client = Matrix.of(context).client;

    return Material(
      elevation: shrinkOffset > 0 ? 4 : 0,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      color: theme.colorScheme.surface,
      child: Padding(
        padding: EdgeInsets.only(top: topPadding),
        child: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Logo + Plusly tekst
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Plusly logo (turquoise cirkel met plus)
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF49AFC2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Plusly tekst
                    Text(
                      AppConfig.applicationName,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Zoekbalk (subtiel)
                SizedBox(
                  width: 180,
                  height: 36,
                  child: StreamBuilder(
                    stream: client.onSyncStatus.stream,
                    builder: (context, snapshot) {
                      final status = client.onSyncStatus.value ??
                          const SyncStatusUpdate(SyncStatus.waitingForResponse);
                      final hide = client.onSync.value != null &&
                          status.status != SyncStatus.error &&
                          client.prevBatch != null;
                      return TextField(
                        controller: controller.searchController,
                        focusNode: controller.searchFocusNode,
                        textInputAction: TextInputAction.search,
                        onChanged: (text) =>
                            controller.onSearchEnter(text, globalSearch: false),
                        onSubmitted: (text) =>
                            controller.onSearchEnter(text, globalSearch: globalSearch),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.6),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                          hintText: hide ? 'Search...' : status.calcLocalizedString(context),
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: status.error != null
                                ? theme.colorScheme.error
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                          prefixIcon: hide
                              ? (controller.isSearchMode
                                  ? IconButton(
                                      icon: const Icon(Icons.close_outlined, size: 18),
                                      onPressed: controller.cancelSearch,
                                      padding: EdgeInsets.zero,
                                    )
                                  : const Icon(Icons.search_outlined, size: 18))
                              : null,
                          suffixIcon: controller.isSearchMode && globalSearch && controller.isSearching
                              ? const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                                  ),
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8),
                // Profiel rechts
                ClientChooserButton(controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
