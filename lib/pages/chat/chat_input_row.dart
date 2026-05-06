import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:matrix/matrix.dart';

import 'package:Pulsly/config/setting_keys.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/chat/recording_input_row.dart';
import 'package:Pulsly/pages/chat/recording_view_model.dart';
import 'package:Pulsly/pages/chat/video_note_recording_dialog.dart';
import 'package:Pulsly/shortcuts/chat/paste_shortcut.dart';
import 'package:Pulsly/utils/platform_infos.dart';
import 'package:Pulsly/widgets/avatar.dart';
import 'package:Pulsly/widgets/matrix.dart';
import '../../config/themes.dart';
import 'chat.dart';
import 'input_bar.dart';

class ChatInputRow extends StatelessWidget {
  final ChatController controller;

  static const double height = 56.0;

  const ChatInputRow(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selectedTextButtonStyle = TextButton.styleFrom(
      foregroundColor: theme.colorScheme.onSurface,
    );

    return RecordingViewModel(
      builder: (context, recordingViewModel) {
        if (recordingViewModel.isRecording) {
          return RecordingInputRow(
            state: recordingViewModel,
            onSend: controller.onVoiceMessageSend,
            onVideoSend: controller.onVideoNoteSend,
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: controller.selectMode
              ? <Widget>[
                  if (controller.selectedEvents.every(
                    (event) => event.status == EventStatus.error,
                  ))
                    SizedBox(
                      height: height,
                      child: Semantics(
                        label: L10n.of(context).delete,
                        button: true,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: theme.colorScheme.error,
                          ),
                          onPressed: controller.deleteErrorEventsAction,
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.delete_forever_outlined),
                              Text(L10n.of(context).delete),
                            ],
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: height,
                      child: Semantics(
                        label: L10n.of(context).forward,
                        button: true,
                        child: TextButton(
                          style: selectedTextButtonStyle,
                          onPressed: controller.forwardEventsAction,
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.keyboard_arrow_left_outlined),
                              Text(L10n.of(context).forward),
                            ],
                          ),
                        ),
                      ),
                    ),
                  controller.selectedEvents.length == 1
                      ? controller.selectedEvents.first
                                .getDisplayEvent(controller.timeline!)
                                .status
                                .isSent
                            ? SizedBox(
                                height: height,
                                child: Semantics(
                                  label: L10n.of(context).reply,
                                  button: true,
                                  child: TextButton(
                                    style: selectedTextButtonStyle,
                                    onPressed: controller.replyAction,
                                    child: Row(
                                      children: <Widget>[
                                        Text(L10n.of(context).reply),
                                        const Icon(Icons.keyboard_arrow_right),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: height,
                                child: Semantics(
                                  label: L10n.of(context).tryToSendAgain,
                                  button: true,
                                  child: TextButton(
                                    style: selectedTextButtonStyle,
                                    onPressed: controller.sendAgainAction,
                                    child: Row(
                                      children: <Widget>[
                                        Text(L10n.of(context).tryToSendAgain),
                                        const SizedBox(width: 4),
                                        const Icon(Icons.send_outlined, size: 16),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                      : const SizedBox.shrink(),
                ]
              : <Widget>[
                  const SizedBox(width: 4),
                  AnimatedContainer(
                    duration: FluffyThemes.animationDuration,
                    curve: FluffyThemes.animationCurve,
                    width: controller.sendController.text.isNotEmpty
                        ? 0
                        : height,
                    child: controller.sendController.text.isNotEmpty
                        ? const SizedBox.shrink()
                        : Semantics(
                            label: 'Open emoji picker',
                            button: true,
                            child: Container(
                              height: height,
                              width: height,
                              alignment: Alignment.center,
                              child: IconButton(
                                tooltip: L10n.of(context).emojis,
                                color: theme.colorScheme.onSurface,
                                icon: Icon(
                                  controller.sendController.text.isEmpty
                                      ? controller.showEmojiPicker
                                            ? MdiIcons.sticker
                                            : MdiIcons.stickerOutline
                                      : controller.showEmojiPicker
                                      ? Icons.add_reaction
                                      : Icons.add_reaction_outlined,
                                  key: ValueKey(controller.showEmojiPicker),
                                ),
                                onPressed: controller.emojiPickerAction,
                              ),
                            ),
                          ),
                  ),
                  if (Matrix.of(context).isMultiAccount &&
                      Matrix.of(context).hasComplexBundles &&
                      Matrix.of(context).currentBundle!.length > 1)
                    Container(
                      height: height,
                      width: height,
                      alignment: Alignment.center,
                      child: _ChatAccountPicker(controller),
                    ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: controller.sendController.text.isNotEmpty
                                ? theme.colorScheme.primary.withOpacity(0.3)
                                : theme.colorScheme.outline.withOpacity(0.2),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.colorScheme.shadow.withOpacity(0.05),
                              blurRadius: 8.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ChatPasteShortcut(
                          onPaste: () {
                            controller.sendImageFromClipBoard(null);
                          },
                          child: InputBar(
                            room: controller.room,
                            minLines: 1,
                            maxLines: 8,
                            autofocus: !PlatformInfos.isMobile,
                            keyboardType: TextInputType.multiline,
                            textInputAction:
                                AppSettings.sendOnEnter.value &&
                                    PlatformInfos.isMobile
                                ? TextInputAction.send
                                : null,
                            onSubmitted: controller.onInputBarSubmitted,
                            onSubmitImage: controller.sendImageFromClipBoard,
                            focusNode: controller.inputFocus,
                            controller: controller.sendController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 12.0,
                                top: 12.0,
                              ),
                              counter: const SizedBox.shrink(),
                              hintText: L10n.of(context).writeAMessage,
                              hintMaxLines: 1,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              filled: false,
                            ),
                            onChanged: controller.onInputBarChanged,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height,
                    width: height,
                    alignment: Alignment.center,
                    child:
                        PlatformInfos.platformCanRecord &&
                            controller.sendController.text.isEmpty
                        ? Semantics(
                            label: recordingViewModel.recordingMode == RecordingMode.video
                                ? 'Record video note'
                                : 'Record voice message',
                            button: true,
                            child: IconButton(
                              tooltip:
                                  recordingViewModel.recordingMode ==
                                      RecordingMode.video
                                  ? L10n.of(context).videoNote
                                  : L10n.of(context).voiceMessage,
                              onPressed: () {
                                // On tap: show tip and toggle mode if video notes enabled
                                final videoNotesEnabled =
                                    AppSettings.enableVideoNotes.value &&
                                    PlatformInfos.isMobile;
                                if (videoNotesEnabled) {
                                  final newMode =
                                      recordingViewModel.recordingMode ==
                                          RecordingMode.audio
                                      ? RecordingMode.video
                                      : RecordingMode.audio;
                                  recordingViewModel.setRecordingMode(newMode);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      margin: const EdgeInsets.only(
                                        bottom: height + 16,
                                        left: 16,
                                        right: 16,
                                        top: 16,
                                      ),
                                      showCloseIcon: true,
                                      content: Text(
                                        newMode == RecordingMode.video
                                            ? L10n.of(
                                                context,
                                              ).longPressToRecordVideoNote
                                            : L10n.of(
                                                context,
                                              ).longPressToRecordVoiceMessage,
                                      ),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      margin: const EdgeInsets.only(
                                        bottom: height + 16,
                                        left: 16,
                                        right: 16,
                                        top: 16,
                                      ),
                                      showCloseIcon: true,
                                      content: Text(
                                        L10n.of(
                                          context,
                                        ).longPressToRecordVoiceMessage,
                                      ),
                                    ),
                                  );
                                }
                              },
                              onLongPress: () {
                                if (recordingViewModel.recordingMode ==
                                    RecordingMode.video) {
                                  // Open full-screen video note dialog
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (_) => VideoNoteRecordingDialog(
                                        room: controller.room,
                                        onVideoSend: controller.onVideoNoteSend,
                                      ),
                                    ),
                                  );
                                } else {
                                  recordingViewModel.startRecording(
                                    controller.room,
                                  );
                                }
                              },
                              style: IconButton.styleFrom(
                                backgroundColor: theme.bubbleColor,
                                foregroundColor: theme.onBubbleColor,
                              ),
                              icon: Icon(
                                recordingViewModel.recordingMode ==
                                        RecordingMode.video
                                    ? Icons.camera_alt_outlined
                                    : Icons.mic_none_outlined,
                              ),
                            ),
                          )
                        : Semantics(
                            label: 'Send message',
                            button: true,
                            child: Container(
                              height: 56,
                              width: 56,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                gradient: controller.sendController.text.isNotEmpty
                                    ? const LinearGradient(
                                        colors: [Color(0xFF49AFC2), Color(0xFF6FC5D8)],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      )
                                    : null,
                                color: controller.sendController.text.isEmpty
                                    ? theme.bubbleColor
                                    : null,
                                borderRadius: BorderRadius.circular(28.0),
                                boxShadow: controller.sendController.text.isNotEmpty
                                    ? [
                                        BoxShadow(
                                          color: const Color(0xFF49AFC2).withOpacity(0.3),
                                          blurRadius: 8.0,
                                          offset: const Offset(0, 2),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(28.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(28.0),
                                  onTap: controller.sendController.text.isNotEmpty
                                      ? controller.send
                                      : null,
                                  onLongPress: controller.sendController.text.isNotEmpty
                                      ? () => controller.sendScheduleAction()
                                      : null,
                                  child: Container(
                                    height: 56,
                                    width: 56,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(18.0),
                                    child: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      child: Icon(
                                        Icons.send_outlined,
                                        key: ValueKey(controller.sendController.text.isNotEmpty),
                                        color: controller.sendController.text.isNotEmpty
                                            ? Colors.white
                                            : theme.onBubbleColor,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ],
        );
      },
    );
  }
}

class _ChatAccountPicker extends StatelessWidget {
  final ChatController controller;

  const _ChatAccountPicker(this.controller);

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    return FutureBuilder(
      future: client.ownProfile,
      builder: (context, snapshot) => InkWell(
        onTap: () => controller.onSelectAccount(accountPickerAction: true),
        child: Row(
          children: [
            Avatar(
              mxContent: snapshot.data?.avatarUrl,
              name:
                  snapshot.data?.displayName ??
                  Matrix.of(context).client.userID!.localpart,
              size: 20,
            ),
            AnimatedContainer(
              duration: FluffyThemes.animationDuration,
              curve: FluffyThemes.animationCurve,
              width: controller.accountPickerActive ? 4 : 0,
            ),
            AnimatedContainer(
              duration: FluffyThemes.animationDuration,
              curve: FluffyThemes.animationCurve,
              width: controller.accountPickerActive ? 20 : 0,
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
