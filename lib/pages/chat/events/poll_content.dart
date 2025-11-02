import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/poll_events.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class PollWidget extends StatefulWidget {
  final Color color;
  final Color linkColor;
  final double fontSize;
  final Event event;
  final Timeline timeline;

  const PollWidget(
    this.event, {
    required this.color,
    required this.linkColor,
    required this.fontSize,
    required this.timeline,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => PollWidgetState();
}

class PollWidgetState extends State<PollWidget> {
  List<String> selectedAnswers = [];
  List<String> originalVote = []; // Store the original vote to detect changes
  Map<String, int>? pollResults;
  bool hasVoted = false;
  bool isLoading = false;
  bool hasEnded = false;

  @override
  void initState() {
    super.initState();
    _loadPollData();
  }

  void _loadPollData() {
    final event = widget.event;
    final content = event.content[PollEvents.PollStart] as Map<String, dynamic>;

    // Check if user has already voted
    _checkExistingVote();

    // For disclosed polls, load initial results
    final kind = content['kind'] as String?;
    if (kind == 'org.matrix.msc3381.disclosed') {
      _calculateResults();
    }
  }

  void _checkExistingVote() async {
    final room = widget.event.room;
    final currentUserId = room.client.userID;

    final rel = await Matrix.of(context)
        .client
        .getRelatingEventsWithRelTypeAndEventType(
          room.id,
          widget.event.eventId,
          "m.reference",
          "org.matrix.msc3381.poll.response",
        );

    // Get all poll response events for this poll
    final responses = rel.chunk;

    if (responses.isNotEmpty) {
      // Use the latest response
      for (final response in responses) {
        final responseContent =
            response.content['org.matrix.msc3381.poll.response']
                as Map<String, dynamic>;
        if (responseContent != null && response.senderId == currentUserId) {
          final List<dynamic> answers = responseContent['answers'];
          setState(() {
            selectedAnswers = answers.cast<String>();
            originalVote =
                List.from(answers.cast<String>()); // Store original vote
            hasVoted = true;
          });
        }
      }
    }
  }

  void _calculateResults() async {
    final room = widget.event.room;
    final pollEventId = widget.event.eventId;
    final results = <String, int>{};

    final rel = await Matrix.of(context)
        .client
        .getRelatingEventsWithRelTypeAndEventType(
          room.id,
          pollEventId,
          "m.reference",
          "org.matrix.msc3381.poll.response",
        );

    // Get all poll response events for this poll
    final responses = rel.chunk;

    // Count votes for each answer
    for (final response in responses) {
      final responseContent = response
          .content['org.matrix.msc3381.poll.response'] as Map<String, dynamic>;
      if (responseContent != null) {
        final List<dynamic> answers = responseContent['answers'];
        for (final answer in answers.cast<String>()) {
          results[answer] = (results[answer] ?? 0) + 1;
        }
      }
    }

    setState(() {
      pollResults = results;
    });
  }

  Future<void> _vote(List<String> answers) async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      final room = widget.event.room;

      // Send poll response event
      await room.sendEvent(
        {
          'm.relates_to': {
            'rel_type': 'm.reference',
            'event_id': widget.event.eventId,
          },
          'org.matrix.msc3381.poll.response': {
            'answers': answers,
          },
        },
        type: 'org.matrix.msc3381.poll.response',
      );

      setState(() {
        selectedAnswers = answers;
        originalVote = List.from(answers); // Update original vote after voting
        hasVoted = true;
        isLoading = false;
      });

      // Recalculate results for disclosed polls
      final content =
          widget.event.content[PollEvents.PollStart] as Map<String, dynamic?>;
      final kind = content['kind'] as String?;
      if (kind == 'org.matrix.msc3381.disclosed') {
        _calculateResults();
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to vote: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _onAnswerSelected(String answerId, bool selected) {
    final content =
        widget.event.content[PollEvents.PollStart] as Map<String, dynamic?>;
    final maxSelections = content['max_selections'] as int? ?? 1;
    final List<dynamic> answers = content['answers'];

    setState(() {
      if (maxSelections == 1) {
        // Single selection - replace current selection
        selectedAnswers = selected ? [answerId] : [];
      } else {
        // Multiple selection
        if (selected) {
          if (selectedAnswers.length < maxSelections) {
            selectedAnswers.add(answerId);
          }
        } else {
          selectedAnswers.remove(answerId);
        }
      }
    });
  }

  bool _isPollEnded() {
    final room = widget.event.room;
    if (widget.timeline == null) return false;
    // Check if there's an end event for this poll
    final endEvents = widget.timeline!.events.where((e) {
      return e.type == 'org.matrix.msc3381.poll.end' &&
          e.senderId == widget.event.senderId &&
          e.relationshipEventId == widget.event.eventId;
    });
    return endEvents.isNotEmpty;
  }

  bool _shouldShowResults() {
    final content =
        widget.event.content[PollEvents.PollStart] as Map<String, dynamic?>;
    final kind = content['kind'] as String?;
    final isDisclosed = kind == 'org.matrix.msc3381.disclosed';
    final isEnded = _isPollEnded();

    return isDisclosed ? (isEnded || hasVoted) : isEnded;
  }

  double _getAnswerPercentage(String answerId) {
    if (pollResults == null || pollResults!.isEmpty) return 0.0;
    final totalVotes = pollResults!.values.reduce((a, b) => a + b);
    if (totalVotes == 0) return 0.0;

    // if (_shouldShowResults()) {
    //   Logs().w("Get answer percentage for $answerId");
    //   Logs().w(pollResults.toString());
    //   Logs().w("${pollResults![answerId]?.toDouble() ?? 0} / $totalVotes");
    // }

    return (pollResults![answerId]?.toDouble() ?? 0) / totalVotes.toDouble();
  }

  // Check if the current selection is different from the original vote
  bool _hasSelectionChanged() {
    if (selectedAnswers.length != originalVote.length) return true;

    // Sort both lists to compare regardless of order
    final sortedSelected = List.from(selectedAnswers)..sort();
    final sortedOriginal = List.from(originalVote)..sort();

    for (int i = 0; i < sortedSelected.length; i++) {
      if (sortedSelected[i] != sortedOriginal[i]) return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final content =
        event.content[PollEvents.PollStart] as Map<String, dynamic?>;
    final question = content?['question']?['m.text'] as String? ?? 'Poll';
    final List<dynamic> answers = content?['answers'] ?? [];
    final maxSelections = content?['max_selections'] as int? ?? 1;
    final kind = content?['kind'] as String?;

    final shouldShowResults = _shouldShowResults();
    final isEnded = _isPollEnded();
    final canVote = !isEnded && !isLoading;
    final hasChanged = _hasSelectionChanged();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question
          Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: widget.fontSize,
              color: widget.color,
            ),
          ),
          const SizedBox(height: 12),

          // Answers
          ...answers.asMap().entries.map((entry) {
            final index = entry.key;
            final answer = entry.value as Map<String, dynamic>;
            final answerId = answer['id'] as String;
            final answerText = answer['m.text'] as String? ??
                answer['org.matrix.msc1767.text'] as String? ??
                'Answer ${index + 1}';
            final isSelected = selectedAnswers.contains(answerId);
            final percentage = _getAnswerPercentage(answerId);
            final voteCount = pollResults?[answerId] ?? 0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Answer row
                  Row(
                    children: [
                      // Selection indicator
                      if (canVote) ...[
                        if (maxSelections == 1)
                          Radio<bool>(
                            value: true,
                            groupValue: isSelected,
                            onChanged: (_) =>
                                _onAnswerSelected(answerId, !isSelected),
                          )
                        else
                          Checkbox(
                            value: isSelected,
                            onChanged: (_) =>
                                _onAnswerSelected(answerId, !isSelected),
                          ),
                      ] else if (isSelected)
                        Icon(Icons.check, color: Colors.green, size: 20),

                      Expanded(
                        child: GestureDetector(
                          onTap: canVote
                              ? () => _onAnswerSelected(answerId, !isSelected)
                              : null,
                          child: Text(
                            answerText,
                            style: TextStyle(
                              fontSize: widget.fontSize - 1,
                              color: widget.color.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ),

                      // Vote count and percentage
                      if (shouldShowResults && pollResults != null)
                        Text(
                          '${(percentage * 100).toStringAsFixed(1)}% ($voteCount)',
                          style: TextStyle(
                            fontSize: widget.fontSize - 2,
                            color: widget.color.withOpacity(0.7),
                          ),
                        ),
                    ],
                  ),

                  // Progress bar
                  if (shouldShowResults && pollResults != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 40),
                      child: LinearProgressIndicator(
                        value: percentage,
                        backgroundColor: widget.color.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isSelected
                              ? Colors.blue
                              : widget.color.withOpacity(0.5),
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),

          const SizedBox(height: 12),

          // Vote button and info
          Row(
            children: [
              if (canVote && selectedAnswers.isNotEmpty)
                // Show "Change Vote" button only when selection has changed
                if (!hasVoted || (hasVoted && hasChanged))
                  ElevatedButton(
                    onPressed: isLoading ? null : () => _vote(selectedAnswers),
                    child: isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            hasVoted
                                ? L10n.of(context).changeVote
                                : L10n.of(context).vote,
                          ),
                  ),

              const Spacer(),

              // Poll info
              Text(
                '${maxSelections == 1 ? L10n.of(context).singleChoice : L10n.of(context).multipleChoice} • '
                '${kind == 'org.matrix.msc3381.undisclosed' ? L10n.of(context).anonymousPoll : L10n.of(context).publicPoll} • '
                '${isEnded ? L10n.of(context).endedPoll : L10n.of(context).activePoll}',
                style: TextStyle(
                  fontSize: widget.fontSize - 2,
                  color: widget.color.withOpacity(0.6),
                ),
              ),
            ],
          ),

          if (selectedAnswers.isNotEmpty && maxSelections > 1)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                L10n.of(context)
                    .choicesSelected(selectedAnswers.length, maxSelections),
                style: TextStyle(
                  fontSize: widget.fontSize - 2,
                  color: widget.color.withOpacity(0.6),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
