import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:matrix/matrix.dart';

class SendPollDialog extends StatefulWidget {
  final Room room;
  final BuildContext outerContext;
  final Event? replyEvent;
  final Thread? thread;

  const SendPollDialog({
    required this.room,
    required this.thread,
    required this.outerContext,
    this.replyEvent,
    super.key,
  });

  @override
  SendPollDialogState createState() => SendPollDialogState();
}

class SendPollDialogState extends State<SendPollDialog> {
  final TextEditingController _questionController = TextEditingController();
  final List<TextEditingController> _answerControllers = [
    TextEditingController(),
    TextEditingController(),
  ];
  int _maxSelections = 1;
  String _kind = 'org.matrix.msc3381.disclosed';

  void _addAnswer() {
    setState(() {
      _answerControllers.add(TextEditingController());
    });
  }

  void _removeAnswer(int index) {
    if (_answerControllers.length > 2) {
      setState(() {
        _answerControllers.removeAt(index);
        if (_maxSelections > _answerControllers.length) {
          _maxSelections = _answerControllers.length;
        }
      });
    }
  }

  void _sendPoll() async {
    final question = _questionController.text.trim();
    final answers = _answerControllers
        .map((controller) => controller.text.trim())
        .where((answer) => answer.isNotEmpty)
        .toList();

    if (question.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L10n.of(context).pleaseEnterQuestion)),
      );
      return;
    }

    if (answers.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(L10n.of(context).atLeastTwoAnswersRequired)),
      );
      return;
    }

    final pollContent = {
      'org.matrix.msc3381.poll.start': {
        'question': {
          'org.matrix.msc1767.text': question,
          'm.text': question,
        },
        'answers': answers
            .map(
              (answer) => {
                'id': const Uuid().v4(),
                'org.matrix.msc1767.text': answer,
                'm.text': answer,
              },
            )
            .toList(),
        'max_selections': _maxSelections,
        'kind': _kind,
      },
    };

    try {
      await widget.room.sendEvent(
        pollContent,
        type: 'org.matrix.msc3381.poll.start',
        threadLastEventId: widget.thread?.lastEvent?.eventId ??
            widget.thread?.rootEvent.eventId,
        threadRootEventId: widget.thread?.rootEvent.eventId,
      );
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send poll: $e')),
      );
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (final controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(L10n.of(context).createPoll),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: L10n.of(context).question,
                border: const OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ..._answerControllers.asMap().entries.map((entry) {
              final index = entry.key;
              final controller = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: '${L10n.of(context).answer} ${index + 1}',
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () => _removeAnswer(index),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: _addAnswer,
              child: Text(L10n.of(context).addAnswer),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              initialValue: _maxSelections,
              decoration: InputDecoration(
                labelText: L10n.of(context).maxSelections,
                border: const OutlineInputBorder(),
              ),
              items: List.generate(
                _answerControllers.length,
                (i) => DropdownMenuItem(
                  value: i + 1,
                  child: Text('${i + 1}'),
                ),
              ),
              onChanged: (value) => setState(() => _maxSelections = value!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _kind,
              decoration: InputDecoration(
                labelText: L10n.of(context).pollType,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: 'org.matrix.msc3381.disclosed',
                  child: Text(L10n.of(context).publicPoll),
                ),
                DropdownMenuItem(
                  value: 'org.matrix.msc3381.undisclosed',
                  child: Text(L10n.of(context).anonymousPoll),
                ),
              ],
              onChanged: (value) => setState(() => _kind = value!),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(L10n.of(context).cancel),
        ),
        FilledButton(
          onPressed: _sendPoll,
          child: Text(L10n.of(context).send),
        ),
      ],
    );
  }
}
