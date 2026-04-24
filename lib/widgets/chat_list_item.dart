import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';

import '../utils/bridge_utils.dart';
import '../utils/matrix_sdk_extensions/matrix_locals.dart';
import 'avatar.dart';
import 'hover_builder.dart';

/// Custom ChatListItem with platform icons and improved styling
class ChatListItem extends StatelessWidget {
  final Room room;
  final Room? space;
  final String? filter;
  final VoidCallback? onTap;
  final void Function(BuildContext context)? onLongPress;
  final bool activeChat;
  final bool firstElement;
  final bool lastElement;

  const ChatListItem(
    this.room, {
    this.space,
    this.filter,
    this.onTap,
    this.onLongPress,
    this.activeChat = false,
    this.firstElement = false,
    this.lastElement = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final client = room.client;
    final displayname = room.getLocalizedDisplayname(
      MatrixLocals(L10n.of(context)),
    );

    // Check if this is a bridge room
    final isBridge = isBridgeRoom(room);
    final bridgeType = isBridge ? (getBridgeType(room) ?? 'other') : null;
    final bridgeIcon = bridgeType != null
        ? getBridgeTypeIcon(bridgeType)
        : null;
    final bridgeColor = bridgeType != null
        ? getBridgeTypeColor(bridgeType)
        : null;

    // Get last message preview
    final lastEvent = room.lastEvent;
    String? lastMessage;
    if (lastEvent != null) {
      lastMessage = lastEvent.getLocalizedBody(
        MatrixLocals(L10n.of(context)),
        hideReply: true,
        hideEdit: true,
        plaintextBody: true,
        removeMarkdown: true,
      );
    }

    // Check unread status
    final isUnread = room.isUnreadOrInvited;
    final unreadCount = room.notificationCount;

    return HoverBuilder(
      builder: (context, isHovering) => Material(
        color: activeChat
            ? theme.colorScheme.primaryContainer
            : isHovering
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12), // Consistent border-radius
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress != null ? () => onLongPress!(context) : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10, // Reduced from ~12 (15% less)
            ),
            child: Row(
              children: [
                // Avatar with platform icon overlay
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Avatar(mxContent: room.avatar, size: 48, name: displayname),
                    // Platform icon overlay (bottom-right)
                    if (bridgeIcon != null && bridgeColor != null)
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: bridgeColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.surface,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            bridgeIcon,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 12),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Contact name
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              displayname,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600, // Semi-bold
                                color: Colors.black, // #000000
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Unread badge
                          if (unreadCount > 0)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                unreadCount > 99
                                    ? '99+'
                                    : unreadCount.toString(),
                                style: TextStyle(
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      // Last message preview
                      if (lastMessage != null)
                        Text(
                          lastMessage,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: isUnread
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: const Color(
                              0xFF4A4A4A,
                            ), // Darker gray #4A4A4A
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
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
