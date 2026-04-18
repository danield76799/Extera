import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as b;
import 'package:matrix/matrix.dart';

import 'matrix.dart';

class UnreadRoomsBadge extends StatelessWidget {
  final bool Function(Room) filter;
  final b.BadgePosition? badgePosition;
  final Widget? child;

  const UnreadRoomsBadge({
    super.key,
    required this.filter,
    this.badgePosition,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final unreadCount = Matrix.of(context).client.rooms
        .where(filter)
        .where((r) => (r.isUnread || r.membership == Membership.invite))
        .length;
    return b.Badge(
      badgeStyle: b.BadgeStyle(
        badgeColor: const Color(0xFFFF6B6B),  // Coral red consistent with unread bubble
        elevation: 4,
        borderSide: BorderSide(color: theme.colorScheme.surface, width: 2),
      ),
      badgeContent: Text(
        unreadCount.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 12),  // White text on red
      ),
      showBadge: unreadCount != 0,
      badgeAnimation: const b.BadgeAnimation.scale(),
      position: badgePosition ?? b.BadgePosition.bottomEnd(),
      child: child,
    );
  }
}
