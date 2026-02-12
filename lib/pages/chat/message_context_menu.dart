import 'package:collection/collection.dart';
import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat/chat.dart';
import 'package:extera_next/utils/adaptive_bottom_sheet.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/utils/room_status_extension.dart';
import 'package:extera_next/widgets/emoji_picker.dart';
import 'package:extera_next/widgets/list_divider.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:extera_next/widgets/mxc_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matrix/matrix.dart';

class MessageContextMenu extends StatelessWidget {
  final ChatController controller;
  final Event event;
  Room get room => controller.room;
  Timeline? get timeline => controller.timeline;

  const MessageContextMenu({
    required this.controller,
    required this.event,
    super.key,
  });

  Widget _buildMenuItem({
    required Event event,
    required String label,
    required IconData icon,
    Color? color,
    required void Function() onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 12),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final clients = Matrix.of(context).currentBundle;
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);
    final imagePacks = controller.room.getImagePacks(ImagePackUsage.emoticon);

    final recentEmojis = client.recentEmojis.entries
        .sortedByCompare((element) => element.value, (a, b) => b - a)
        .map((entry) => entry.key)
        .take(5)
        .toList();

    final receipts = room
        .getReceipts(timeline!, eventId: event.eventId)
        .where((receipt) => receipt.user.id != client.userID!);

    final sentReactions = <String>{};
    sentReactions.addAll(
      event
          .aggregatedEvents(timeline!, RelationshipTypes.reaction)
          .where(
            (event) =>
                event.senderId == event.room.client.userID &&
                event.type == 'm.reaction',
          )
          .map(
            (event) => event.content
                .tryGetMap<String, Object?>('m.relates_to')
                ?.tryGet<String>('key'),
          )
          .whereType<String>(),
    );

    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias, // Ensures ink splashes don't bleed
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 200,
          maxWidth: PlatformInfos.isMobile ? double.infinity : 280,
          maxHeight: 580,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const .all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (event.status == EventStatus.error)
                    Material(
                      color: theme.colorScheme.surfaceContainerHigh,
                      clipBehavior: .hardEdge,
                      borderRadius: borderRadius,
                      child: Column(
                        children: [
                          _buildMenuItem(
                            event: event,
                            icon: Icons.send_outlined,
                            label: L10n.of(context).tryToSendAgain,
                            onPressed: () {
                              if (!PlatformInfos.isMobile) {
                                controller.closeMessageMenu();
                              }
                              controller.sendAgainAction(event: event);
                            },
                          ),
                          _buildMenuItem(
                            event: event,
                            icon: Icons.cancel_outlined,
                            label: L10n.of(context).cancel,
                            color: Colors.red,
                            onPressed: () {
                              if (!PlatformInfos.isMobile) {
                                controller.closeMessageMenu();
                              }
                              event.cancelSend();
                            },
                          ),
                        ],
                      ),
                    ),
                  if (event.status == EventStatus.sent ||
                      event.status == EventStatus.synced) ...[
                    if (room.canSendEvent(EventTypes.Reaction))
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Material(
                          color: theme.colorScheme.surfaceContainerHigh,
                          clipBehavior: .hardEdge,
                          borderRadius: borderRadius,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ...recentEmojis.map(
                                (emoji) => IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Center(
                                    child: Opacity(
                                      opacity: sentReactions.contains(emoji)
                                          ? 0.33
                                          : 1,
                                      child: emoji.startsWith("mxc://")
                                      ? MxcImage(
                                        uri: Uri.parse(emoji),
                                        width: 32,
                                        height: 32,
                                      )
                                      : Text(
                                        emoji,
                                        style: const TextStyle(fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  onPressed: sentReactions.contains(emoji)
                                      ? null
                                      : () {
                                          Navigator.of(
                                            context,
                                            rootNavigator: true,
                                          ).pop();
                                          event.room.sendReaction(
                                            event.eventId,
                                            emoji,
                                          );
                                        },
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_reaction_outlined),
                                tooltip: L10n.of(context).customReaction,
                                onPressed: () async {
                                  if (!PlatformInfos.isMobile) {
                                    controller.closeMessageMenu();
                                  }
                                  final emoji =
                                      await showAdaptiveBottomSheet<String>(
                                        context: context,
                                        builder: (context) => Scaffold(
                                          appBar: AppBar(
                                            title: Text(
                                              L10n.of(context).customReaction,
                                            ),
                                            leading: CloseButton(
                                              onPressed: () => Navigator.of(
                                                context,
                                              ).pop(null),
                                            ),
                                          ),
                                          body: SizedBox(
                                            height: double.infinity,
                                            child: MatrixEmojiPicker(
                                              onEmojiSelected: (_, emoji) =>
                                                  Navigator.of(context).pop(
                                                    emoji.customData ??
                                                        emoji
                                                            .standardEmoji!
                                                            .char,
                                                  ),
                                              onBackspacePressed: () {},
                                              customCategories: imagePacks
                                                  .entries
                                                  .map(
                                                    (entry) => CustomCategory(
                                                      id: entry.key,
                                                      name: entry
                                                          .value
                                                          .pack
                                                          .displayName!,
                                                      icon: MxcImage(
                                                        uri: entry
                                                            .value
                                                            .images
                                                            .values
                                                            .first
                                                            .url,
                                                        width: 32,
                                                        height: 32,
                                                      ),
                                                      emojis: entry.value.images
                                                          .map((name, content) {
                                                            return MapEntry(
                                                              name,
                                                              content.url
                                                                  .toString(),
                                                            );
                                                          }),
                                                    ),
                                                  )
                                                  .toList(),
                                              customEmojiBuilder:
                                                  (context, name, size) {
                                                    return MxcImage(
                                                      uri: Uri.parse(name),
                                                      width: 32,
                                                      height: 32,
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),
                                      );
                                  if (emoji == null) {
                                    return;
                                  }
                                  if (sentReactions.contains(emoji)) {
                                    return;
                                  }
                                  controller.closeMessageMenu();

                                  await event.room.sendReaction(
                                    event.eventId,
                                    emoji,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Material(
                      color: theme.colorScheme.surfaceContainerHigh,
                      clipBehavior: .hardEdge,
                      borderRadius: borderRadius,
                      child: Column(
                        children: [
                          if (receipts.isNotEmpty) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.done_all,
                              label: L10n.of(context).nViews(receipts.length),
                              onPressed: () {
                                if (!PlatformInfos.isMobile) {
                                  controller.closeMessageMenu();
                                }
                                controller.showReadReceipts(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (event.hasAggregatedEvents(controller.timeline!, RelationshipTypes.edit))...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.edit_outlined,
                              label: L10n.of(context).nEdits(event.aggregatedEvents(controller.timeline!, RelationshipTypes.edit).length),
                              onPressed: () {
                                if (!PlatformInfos.isMobile) {
                                  controller.closeMessageMenu();
                                }
                                controller.showEdits(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (room.canSendDefaultMessages) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.reply_outlined,
                              label: L10n.of(context).reply,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.replyAction(replyTo: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (room.canSendDefaultMessages) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.chat_bubble_outline,
                              label: L10n.of(context).discuss,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.discussAction(
                                  threadRootEvent: event,
                                );
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (room.canSendDefaultMessages &&
                              event.senderId == client.userID!) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.edit_outlined,
                              label: L10n.of(context).edit,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.editSelectedEventAction(
                                  event: event,
                                );
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (event.type == 'org.matrix.msc3381.poll.start' &&
                              event.senderId ==
                                  Matrix.of(context).client.userID)
                            _buildMenuItem(
                              event: event,
                              icon: Icons.check,
                              label: L10n.of(context).endPoll,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.endPollAction(event: event);
                              },
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Material(
                      color: theme.colorScheme.surfaceContainerHigh,
                      clipBehavior: .hardEdge,
                      borderRadius: borderRadius,
                      child: Column(
                        children: [
                          _buildMenuItem(
                            event: event,
                            icon: Icons.forward_outlined,
                            label: L10n.of(context).forward,
                            onPressed: () {
                              controller.closeMessageMenu();
                              controller.forwardEventsAction(event: event);
                            },
                          ),
                          const ListDivider(),
                          _buildMenuItem(
                            event: event,
                            icon: Icons.copy_outlined,
                            label: L10n.of(context).copy,
                            onPressed: () {
                              controller.closeMessageMenu();
                              Clipboard.setData(
                                ClipboardData(
                                  text: event
                                      .getDisplayEvent(timeline!)
                                      .calcLocalizedBodyFallback(
                                        MatrixLocals(L10n.of(context)),
                                      ),
                                ),
                              );
                            },
                          ),
                          const ListDivider(),
                          _buildMenuItem(
                            event: event,
                            icon: Icons.link,
                            label: L10n.of(context).copyLink,
                            onPressed: () {
                              controller.closeMessageMenu();
                              controller.copyLinkAction(event: event);
                            },
                          ),
                          const ListDivider(),
                          _buildMenuItem(
                            event: event,
                            icon: Icons.check_circle_outline,
                            label: L10n.of(context).select,
                            onPressed: () {
                              controller.closeMessageMenu();
                              controller.onMultiSelect(event);
                            },
                          ),
                          const ListDivider(),
                          if (!room.encrypted) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.translate,
                              label: L10n.of(context).translate,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.translateEventAction(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (event.redacted) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.redo,
                              label: L10n.of(context).recoverMessage,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.recoverEventAction(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          if (room.canChangeStateEvent(
                            EventTypes.RoomPinnedEvents,
                          )) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.push_pin_outlined,
                              label: room.pinnedEventIds.contains(event.eventId)
                                  ? L10n.of(context).unpin
                                  : L10n.of(context).pin,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.pinEvent(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          _buildMenuItem(
                            event: event,
                            icon: Icons.info_outline,
                            label: L10n.of(context).messageInfo,
                            onPressed: () {
                              controller.closeMessageMenu();
                              controller.showEventInfo(event);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Material(
                      color: theme.colorScheme.surfaceContainerHigh,
                      clipBehavior: .hardEdge,
                      borderRadius: borderRadius,
                      child: Column(
                        children: [
                          if (event.canRedact ||
                              (clients!.any(
                                (cl) => event.senderId == cl!.userID,
                              ))) ...[
                            _buildMenuItem(
                              event: event,
                              icon: Icons.delete_outlined,
                              color: Colors.red,
                              label: L10n.of(context).delete,
                              onPressed: () {
                                controller.closeMessageMenu();
                                controller.redactEventsAction(event: event);
                              },
                            ),
                            const ListDivider(),
                          ],
                          _buildMenuItem(
                            event: event,
                            icon: Icons.report_outlined,
                            color: Colors.red,
                            label: L10n.of(context).reportMessage,
                            onPressed: () {
                              controller.closeMessageMenu();
                              controller.reportEventAction(event: event);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
