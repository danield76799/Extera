import 'package:extera_next/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import 'package:extera_next/config/themes.dart';
import 'package:extera_next/pages/chat/chat.dart';
import 'package:extera_next/pages/chat/events/message.dart';
import 'package:extera_next/pages/chat/seen_by_row.dart';
import 'package:extera_next/pages/chat/typing_indicators.dart';
import 'package:extera_next/utils/account_config.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/filtered_timeline_extension.dart';
import 'package:extera_next/utils/platform_infos.dart';

class ChatEventList extends StatelessWidget {
  final ChatController controller;
  final bool showThreadRoots;
  
  const ChatEventList({
    super.key,
    required this.controller,
    this.showThreadRoots = false,
  });

  @override
  Widget build(BuildContext context) {
    final timeline = controller.timeline;

    if (timeline == null) {
      return const Center(child: CupertinoActivityIndicator());
    }
    final theme = Theme.of(context);

    final colors = [
      theme.secondaryBubbleColor,
      theme.bubbleColor,
    ];

    final horizontalPadding = FluffyThemes.isColumnMode(context) ? 8.0 : 0.0;
	
    var events = timeline.events;

    if (showThreadRoots) {
      events = events.filterThreadRoots();
    } else {
      events = events.filterByThreaded(controller.thread != null);
    }

    events = events.filterByVisibleInGui();

    final animateInEventIndex = controller.animateInEventIndex;
    final threads = controller.room.threads;

    // create a map of eventId --> index to greatly improve performance of
    // ListView's findChildIndexCallback
    final thisEventsKeyMap = <String, int>{};
    for (var i = 0; i < events.length; i++) {
      //print('${events[i].roomId} ${events[i].senderId} ${events[i].body}');
      thisEventsKeyMap[events[i].eventId] = i;
    }

    final hasWallpaper =
        controller.room.client.applicationAccountConfig.wallpaperUrl != null;

    return SelectionArea(
      child: ListView.custom(
        padding: EdgeInsets.only(
          top: 16,
          bottom: 8,
          left: horizontalPadding,
          right: horizontalPadding,
        ),
        reverse: true,
        controller: controller.scrollController,
        keyboardDismissBehavior: PlatformInfos.isIOS
            ? ScrollViewKeyboardDismissBehavior.onDrag
            : ScrollViewKeyboardDismissBehavior.manual,
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int i) {
            // Footer to display typing indicator and read receipts:
            if (i == 0) {
              if (timeline.isRequestingFuture) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                );
              }
              if (timeline.canRequestFuture) {
                return Center(
                  child: IconButton(
                    onPressed: controller.requestFuture,
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SeenByRow(controller),
                  TypingIndicators(controller),
                ],
              );
            }

            // Request history button or progress indicator:
            if (i == events.length + 1) {
              if (timeline.isRequestingHistory) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(strokeWidth: 2),
                );
              }
              if (timeline.canRequestHistory) {
                return Builder(
                  builder: (context) {
                    WidgetsBinding.instance
                        .addPostFrameCallback(controller.requestHistory);
                    return Center(
                      child: IconButton(
                        onPressed: controller.requestHistory,
                        icon: const Icon(Icons.refresh_outlined),
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            }
            i--;

            // The message at this index:
            final event = events[i];
            final animateIn = animateInEventIndex != null &&
                timeline.events.length > animateInEventIndex &&
                event == timeline.events[animateInEventIndex];
              
            final thread = threads.containsKey(event.eventId)
              ? threads[event.eventId]
              : null;

            return AutoScrollTag(
              key: ValueKey(event.eventId),
              index: i,
              controller: controller.scrollController,
              child: Message(
                event,
                animateIn: animateIn,
                thread: thread,
                resetAnimateIn: () {
                  controller.animateInEventIndex = null;
                },
                singleSelected: controller.selectedEvents.length == 1
                  && controller.selectedEvents.first.eventId == event.eventId,
                onSwipe: () => controller.replyAction(replyTo: event),
                onInfoTab: controller.showEventInfo,
                onMention: () => controller.sendController.text +=
                    '${event.senderFromMemoryOrFallback.mention} ',
                highlightMarker:
                    controller.scrollToEventIdMarker == event.eventId,
                onSelect: controller.onSelectMessage,
                scrollToEventId: (String eventId) =>
                    controller.scrollToEventId(eventId),
                longPressSelect: controller.selectedEvents.isNotEmpty,
                selected: controller.selectedEvents
                    .any((e) => e.eventId == event.eventId),
                timeline: timeline,
                displayReadMarker:
                    i > 0 && controller.readMarkerEventId == event.eventId,
                nextEvent: i + 1 < events.length ? events[i + 1] : null,
                previousEvent: i > 0 ? events[i - 1] : null,
                wallpaperMode: hasWallpaper,
                scrollController: controller.scrollController,
                colors: colors,
                gradient: AppConfig.enableGradient,
              ),
            );
          },
          childCount: events.length + 2,
          findChildIndexCallback: (key) =>
              controller.findChildIndexCallback(key, thisEventsKeyMap),
        ),
      ),
    );
  }
}
