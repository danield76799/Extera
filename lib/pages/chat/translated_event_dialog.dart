import 'package:extera_next/config/themes.dart';
import 'package:extera_next/pages/chat/events/message.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

import 'package:extera_next/generated/l10n/l10n.dart';

class TranslatedEventDialog extends StatefulWidget {
  final Event event;
  final Timeline timeline;

  const TranslatedEventDialog({
    required this.event,
    required this.timeline,
    super.key,
  });

  @override
  TranslatedEventDialogState createState() =>
      TranslatedEventDialogState(event, timeline);
}

class TranslatedEventDialogState extends State<TranslatedEventDialog> {
  final Event event;
  final Timeline timeline;
  TranslatedEventDialogState(this.event, this.timeline);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final colors = [
      theme.secondaryBubbleColor,
      theme.bubbleColor,
    ];

	final message = Message(
                        event,
                        colors: colors,
                        onInfoTab: (Event ev) => {},
                        onMention: () => {},
                        onSelect: (Event ev) => {},
                        onSwipe: () => {},
                        scrollToEventId: (String p0) => {},
                        timeline: timeline,
                        animateIn: false,
                        displayReadMarker: false,
                        highlightMarker: false,
                        longPressSelect: false,
                        selected: false,
                        wallpaperMode: false,
                        gradient: false
                      );

    return Scaffold(
		appBar: AppBar(
			title: Text(L10n.of(context).translatedMessage)
		),
		body: Container(
			child: Column(
				children: [
					message,
				],
			),
		),
	);
  }
}
