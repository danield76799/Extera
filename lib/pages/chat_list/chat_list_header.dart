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
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

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
