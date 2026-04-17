import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  bool isShrink = false;

  // 3 regels: branding (48) + search (52) + filters (44) + padding
  static const double _headerHeight = 160.0;

  _ChatListHeaderDelegate({
    required this.controller,
    required this.globalSearch,
    required this.topPadding,
  });

  @override
  double get minExtent => _headerHeight + topPadding;

  @override
  double get maxExtent => _headerHeight + topPadding;

  @override
  bool shouldRebuild(covariant _ChatListHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
    BuildContext context,
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
          height: _headerHeight,
          child: Column(
            children: [
              // REGEL 1: Branding & Profiel (logo + tekst + avatar)
              SizedBox(
                height: 56,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      // Logo + tekst links
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
              
              // REGEL 2: Zoekbalk (full width, subtiel)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder(
                  stream: client.onSyncStatus.stream,
                  builder: (context, snapshot) {
                    final status =
                        client.onSyncStatus.value ??
                        const SyncStatusUpdate(
                          SyncStatus.waitingForResponse,
                        );
                    final hide =
                        client.onSync.value != null &&
                        status.status != SyncStatus.error &&
                        client.prevBatch != null;
                    return Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
                          width: 0.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: theme.colorScheme.shadow.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        focusNode: controller.searchFocusNode,
                        textInputAction: TextInputAction.search,
                        style: const TextStyle(fontSize: 15),
                        onChanged: (text) => controller.onSearchEnter(
                          text,
                          globalSearch: false,
                        ),
                        onSubmitted: (text) => controller.onSearchEnter(
                          text,
                          globalSearch: globalSearch,
                        ),
                        decoration: InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          hintText: hide
                              ? L10n.of(context).searchChatsRooms
                              : status.calcLocalizedString(context),
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: status.error != null
                                ? theme.colorScheme.error
                                : theme.colorScheme.onSurfaceVariant,
                            fontWeight: FontWeight.normal,
                          ),
                          prefixIcon: hide
                              ? controller.isSearchMode
                                    ? IconButton(
                                        tooltip: L10n.of(context).cancel,
                                        icon: Icon(
                                          Icons.close_outlined,
                                          size: 20,
                                          color: theme.colorScheme.onSurfaceVariant,
                                        ),
                                        onPressed: controller.cancelSearch,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(
                                          minWidth: 40,
                                          minHeight: 40,
                                        ),
                                      )
                                    : Icon(
                                        Icons.search_outlined,
                                        size: 20,
                                        color: theme.colorScheme.onSurfaceVariant,
                                      )
                              : Container(
                                  margin: const EdgeInsets.all(10),
                                  width: 8,
                                  height: 8,
                                  child: Center(
                                    child:
                                        CircularProgressIndicator.adaptive(
                                          constraints: const BoxConstraints.tightFor(
                                            width: 20,
                                            height: 20,
                                          ),
                                          strokeWidth: 2,
                                          value: status.progress,
                                          valueColor: status.error != null
                                              ? AlwaysStoppedAnimation<
                                                  Color
                                                >(theme.colorScheme.error)
                                              : null,
                                        ),
                                  ),
                                ),
                          suffixIcon:
                              controller.isSearchMode && globalSearch
                              ? controller.isSearching
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.0,
                                          horizontal: 12,
                                        ),
                                        child: SizedBox.square(
                                          dimension: 18,
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
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          minimumSize: Size.zero,
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                              : null,
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 12),
              
              // REGEL 3: Platform Filters (dynamisch op basis van gekoppelde bridges)
              _DynamicBridgeFilters(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

// Dynamische bridge filters - alleen tonen als gekoppeld
class _DynamicBridgeFilters extends StatelessWidget {
  final ChatListController controller;

  const _DynamicBridgeFilters({required this.controller});

  @override
  Widget build(BuildContext context) {
    final bridgeTypes = controller.allBridgeTypes;
    final visibleTypes = controller.visibleBridgeTypes;
    
    // Als er geen bridges zijn, toon niets
    if (bridgeTypes.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          // Altijd "All" tonen
          _FilterPillWithIcon(
            label: 'All',
            icon: Icons.apps,
            isActive: visibleTypes.isEmpty,
            onTap: () {
              controller.setState(() {
                controller.visibleBridgeTypes = {};
              });
            },
          ),
          // Alleen gekoppelde bridges tonen
          ...bridgeTypes.map((type) => _FilterPillWithIcon(
            label: _getBridgeLabel(type),
            icon: _getBridgeIcon(type),
            color: _getBridgeColor(type),
            isActive: visibleTypes.contains(type),
            onTap: () {
              controller.setState(() {
                final newTypes = Set<String>.from(visibleTypes);
                if (newTypes.contains(type)) {
                  newTypes.remove(type);
                } else {
                  newTypes.add(type);
                }
                controller.visibleBridgeTypes = newTypes;
              });
            },
          )),
        ],
      ),
    );
  }

  String _getBridgeLabel(String type) {
    switch (type.toLowerCase()) {
      case 'whatsapp':
        return 'WhatsApp';
      case 'telegram':
        return 'Telegram';
      case 'discord':
        return 'Discord';
      case 'signal':
        return 'Signal';
      case 'matrix':
        return 'Matrix';
      default:
        return type;
    }
  }

  IconData _getBridgeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'whatsapp':
        return MdiIcons.whatsapp; // Echt WhatsApp logo
      case 'telegram':
        return MdiIcons.send; // Telegram vliegtuig
      case 'discord':
        return MdiIcons.gamepadVariant; // Discord gamepad
      case 'signal':
        return MdiIcons.shieldCheck; // Signal shield
      case 'matrix':
        return MdiIcons.matrix; // Matrix logo
      default:
        return Icons.chat;
    }
  }

  Color _getBridgeColor(String type) {
    switch (type.toLowerCase()) {
      case 'whatsapp':
        return const Color(0xFF25D366);
      case 'telegram':
        return const Color(0xFF0088cc);
      case 'discord':
        return const Color(0xFF5865F2);
      case 'signal':
        return const Color(0xFF3A76F0);
      case 'matrix':
        return const Color(0xFF0DBD8B);
      default:
        return Colors.grey;
    }
  }
}

// Filter pill met icon
class _FilterPillWithIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterPillWithIcon({
    required this.label,
    required this.icon,
    this.color,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = color ?? theme.colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        color: isActive 
            ? iconColor.withOpacity(0.15)
            : theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: isActive ? iconColor : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                    color: isActive 
                        ? iconColor 
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
