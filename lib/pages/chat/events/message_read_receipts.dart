import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:Pulsly/widgets/avatar.dart';

/// A small widget that displays read receipt avatars under a message
/// Shows who has read this specific message (excluding the sender)
class MessageReadReceipts extends StatelessWidget {
  final List<Receipt> receipts;
  final bool isOwnMessage;
  final String? ownUserId; // To filter out own receipts
  
  const MessageReadReceipts({
    super.key,
    required this.receipts,
    required this.isOwnMessage,
    this.ownUserId,
  });

  @override
  Widget build(BuildContext context) {
    // Filter out own receipts - only show other people's receipts
    final filteredReceipts = ownUserId != null 
        ? receipts.where((r) => r.user.id != ownUserId).toList()
        : receipts;
    
    if (filteredReceipts.isEmpty) return const SizedBox.shrink();
    
    final theme = Theme.of(context);
    
    return Padding(
      padding: EdgeInsets.only(
        top: 2,
        left: isOwnMessage ? 0 : 48,
        right: isOwnMessage ? 12 : 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // Show up to 3 avatars
          ...filteredReceipts.take(3).map((receipt) => Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Avatar(
              mxContent: receipt.user.avatarUrl,
              name: receipt.user.calcDisplayname(),
              size: 12,
            ),
          )),
          if (filteredReceipts.length > 3)
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                '+${filteredReceipts.length - 3}',
                style: TextStyle(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface.withAlpha(128),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
