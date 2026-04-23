import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:Pulsly/config/setting_keys.dart';
import 'package:Pulsly/config/themes.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/chat_list/chat_list.dart';
import 'package:Pulsly/pages/chat_list/chat_list_bottom_navbar.dart';
import 'package:Pulsly/pages/chat_list/chat_list_legacy_bottom_navbar.dart';
import 'package:Pulsly/widgets/matrix.dart';
import 'package:Pulsly/widgets/navigation_rail.dart';
import 'chat_list_body.dart';

class ChatListView extends StatelessWidget {
  final ChatListController controller;

  const ChatListView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final theme = Theme.of(context);

    return PopScope(
      canPop: !controller.isSearchMode && controller.activeSpaceId == null,
      onPopInvokedWithResult: (pop, _) {
        if (pop) return;
        if (controller.activeSpaceId != null) {
          controller.clearActiveSpace();
          return;
        }
        if (controller.isSearchMode) {
          controller.cancelSearch();
          return;
        }
      },
      child: Row(
        children: [
          if (FluffyThemes.isColumnMode(context) ||
              AppSettings.displayNavigationRail.value) ...[
            SpacesNavigationRail(
              activeSpaceId: controller.activeSpaceId,
              onGoToChats: controller.clearActiveSpace,
              onGoToSpaceId: controller.setActiveSpace,
            ),
            Container(color: Theme.of(context).dividerColor, width: 1),
          ],
          Expanded(
            child: GestureDetector(
              onTap: FocusManager.instance.primaryFocus?.unfocus,
              excludeFromSemantics: true,
              behavior: HitTestBehavior.translucent,
              child: Scaffold(
                body: Stack(
                  children: [
                    ChatListViewBody(controller),
                    if (client.rooms.isNotEmpty &&
                        !controller.isSearchMode &&
                        !AppSettings.useLegacyNavBar.value)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: IgnorePointer(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  theme.colorScheme.surface.withValues(
                                    alpha: 0,
                                  ),
                                  theme.colorScheme.surface,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    SafeArea(
                      child: Stack(
                        children: [
                          if (!controller.isSearchMode &&
                              controller.activeSpaceId == null &&
                              !AppSettings.useLegacyNavBar.value)
                            Positioned(
                              right: 16,
                              bottom:
                                  88, // 16dp above navbar (56dp height + 16dp margin + 16dp padding)
                              child: Material(
                                elevation: 6,
                                borderRadius: BorderRadius.circular(16),
                                child: FloatingActionButton.extended(
                                  onPressed: () =>
                                      context.go('/rooms/newprivatechat'),
                                  icon: const Icon(
                                    Icons.chat_outlined,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    L10n.of(context).newChat,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: const Color(0xFF49AFC2),
                                ),
                              ),
                            ),

                          if (client.rooms.isNotEmpty &&
                              !controller.isSearchMode &&
                              !AppSettings.useLegacyNavBar.value)
                            Positioned(
                              left: 16,
                              right: 16,
                              bottom: 16,
                              child: ChatListBottomNavbar(controller),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                floatingActionButton:
                    !controller.isSearchMode &&
                        controller.activeSpaceId == null &&
                        AppSettings.useLegacyNavBar.value
                    ? FloatingActionButton.extended(
                        onPressed: () => context.go('/rooms/newprivatechat'),
                        icon: const Icon(
                          Icons.chat_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          L10n.of(context).newChat,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: const Color(0xFF49AFC2),
                      )
                    : const SizedBox.shrink(),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endFloat,
                bottomNavigationBar:
                    client.rooms.isNotEmpty &&
                        !controller.isSearchMode &&
                        AppSettings.useLegacyNavBar.value
                    ? ChatListLegacyBottomNavbar(controller)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
