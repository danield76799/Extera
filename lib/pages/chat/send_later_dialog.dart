import 'dart:math';

import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/utils/scheduled_messages_service.dart';

class SendLaterDialog extends StatefulWidget {
  final Room room;
  final BuildContext outerContext;
  final Event? replyEvent;
  final Map<String, dynamic>? content;
  final Thread? thread;
  final String? text;

  const SendLaterDialog({
    required this.room,
    required this.thread,
    this.content,
    required this.outerContext,
    this.replyEvent,
    this.text,
    super.key,
  });

  @override
  SendLaterDialogState createState() => SendLaterDialogState();
}

class SendLaterDialogState extends State<SendLaterDialog> {
  DateTime? _selected;
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.text ?? '');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final now = DateTime.now();
    final initialDate = _selected ?? now.add(const Duration(minutes: 5));
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate),
    );
    if (time == null) return;
    setState(() {
      _selected = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String _formatSelected() {
    if (_selected == null) return L10n.of(context).select;
    return '${MaterialLocalizations.of(context).formatFullDate(_selected!)} ${MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.fromDateTime(_selected!))}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send later')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Pick date and time to send the message'),
            const SizedBox(height: 16),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Message',
                hintText: 'Type your message here',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              minLines: 1,
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _pickDateTime,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(_selected == null ? 'Select' : _formatSelected()),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _scheduleMessage,
                    child: const Text('Schedule'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _scheduleMessage() async {
    if (_selected == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
      return;
    }

    final now = DateTime.now();
    if (!_selected!.isAfter(now)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selected time is in the past')),
      );
      return;
    }

    final text = _textController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a message')));
      return;
    }

    // Build message content
    final messageContent =
        widget.content ?? {'msgtype': 'm.text', 'body': text};

    // Generate a unique ID for this scheduled message
    final id =
        'sched_${DateTime.now().millisecondsSinceEpoch}_${_generateRandomId()}';

    // Create the scheduled message
    final scheduledMessage = ScheduledMessage(
      id: id,
      roomId: widget.room.id,
      senderId: widget.room.client.userID!,
      content: messageContent,
      scheduledAt: _selected!,
      replyEventId: widget.replyEvent?.eventId,
      threadRootEventId: widget.thread?.rootEvent.eventId,
      threadLastEventId: widget.thread?.lastEvent?.eventId,
    );

    // Save to local storage
    await ScheduledMessagesService.addScheduledMessage(scheduledMessage);

    // Show success and close
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message scheduled for ${_formatSelected()}'),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.of(context).pop();
    }
  }

  String _generateRandomId() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(8, (_) => chars[random.nextInt(chars.length)]).join();
  }
}
