import 'package:extera_next/utils/poll_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matrix/matrix.dart';

class PollWidget extends StatefulWidget {
  final Color color;
  final Color linkColor;
  final double fontSize;
  final Event event;

  const PollWidget(
    this.event, {
    required this.color,
    required this.linkColor,
    required this.fontSize,
    super.key,
  });
  
  @override
  State<StatefulWidget> createState() => PollWidgetState();
}

class PollWidgetState extends State<PollWidget> {
  @override
  Widget build(BuildContext context) {
    final event = widget.event;
    final content = event.content[PollEvents.PollStart] as Map<String, dynamic?>;
    return Padding(
      padding: EdgeInsetsGeometry.all(16),
      child: Column(
        children: [
          Text(content?['question']['m.text'] as String, style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: EdgeInsets.fromLTRB(4, 4, 4, 2),
            child: Column(
              children: [
                
              ],
            ),
          )
        ],
      ),
    );
  }
}