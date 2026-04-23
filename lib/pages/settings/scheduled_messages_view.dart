import 'package:flutter/material.dart';

import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/utils/scheduled_messages_service.dart';
import 'package:Pulsly/widgets/matrix.dart';

class ScheduledMessagesView extends StatelessWidget {
  const ScheduledMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).chatBackup)),
      body: FutureBuilder<List<ScheduledMessage>>(
        future: ScheduledMessagesService.loadScheduledMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          final messages = snapshot.data ?? [];
          final pendingMessages = messages.where((m) => !m.isSent).toList();

          if (pendingMessages.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.schedule_outlined,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No scheduled messages',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Messages you schedule will appear here',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: pendingMessages.length,
            itemBuilder: (context, index) {
              final message = pendingMessages[index];
              return _ScheduledMessageTile(message: message);
            },
          );
        },
      ),
    );
  }
}

class _ScheduledMessageTile extends StatelessWidget {
  final ScheduledMessage message;

  const _ScheduledMessageTile({required this.message});

  String _formatScheduledTime(BuildContext context) {
    final scheduled = message.scheduledAt;
    final now = DateTime.now();
    final diff = scheduled.difference(now);

    if (diff.isNegative) {
      return 'Due now';
    }

    if (diff.inMinutes < 60) {
      return 'In ${diff.inMinutes} minutes';
    }

    if (diff.inHours < 24) {
      return 'In ${diff.inHours} hours';
    }

    if (diff.inDays < 7) {
      return 'In ${diff.inDays} days';
    }

    // Format as date
    return '${scheduled.day}/${scheduled.month}/${scheduled.year} at ${scheduled.hour}:${scheduled.minute.toString().padLeft(2, '0')}';
  }

  String _getRoomName(BuildContext context) {
    final client = Matrix.of(context).client;
    final room = client.getRoomById(message.roomId);
    return room?.displayname ?? 'Unknown room';
  }

  String _getMessagePreview() {
    final body = message.content['body'] as String? ?? '';
    if (body.length > 50) {
      return '${body.substring(0, 50)}...';
    }
    return body;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(
          Icons.schedule,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
      title: Text(
        _getRoomName(context),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _getMessagePreview(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 14,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Text(
                _formatScheduledTime(context),
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
        onPressed: () async {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Cancel scheduled message?'),
              content: const Text('This message will not be sent.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Keep'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: theme.colorScheme.error),
                  ),
                ),
              ],
            ),
          );

          if (confirm == true) {
            await ScheduledMessagesService.removeScheduledMessage(message.id);
            // Force rebuild
            if (context.mounted) {
              (context as Element).markNeedsBuild();
            }
          }
        },
      ),
      isThreeLine: true,
    );
  }
}
