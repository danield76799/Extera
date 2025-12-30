import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:extera_next/pages/chat/events/html_message.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart';
import 'package:opus_caf_converter_dart/opus_caf_converter_dart.dart';
import 'package:path_provider/path_provider.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/utils/error_reporter.dart';
import 'package:extera_next/utils/file_description.dart';
import 'package:extera_next/utils/localized_exception_extension.dart';
import 'package:extera_next/utils/url_launcher.dart';
import '../../../utils/matrix_sdk_extensions/event_extension.dart';

class AudioPlayerWidget extends StatefulWidget {
  final Color color;
  final Color linkColor;
  final double fontSize;
  final Event event;

  static String? currentId;

  static const int wavesCount = 40;

  const AudioPlayerWidget(
    this.event, {
    required this.color,
    required this.linkColor,
    required this.fontSize,
    super.key,
  });

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

enum AudioPlayerStatus { notDownloaded, downloading, downloaded }

class AudioPlayerState extends State<AudioPlayerWidget> {
  AudioPlayerStatus status = AudioPlayerStatus.notDownloaded;
  AudioPlayer? audioPlayer;

  StreamSubscription? onAudioPositionChanged;
  StreamSubscription? onDurationChanged;
  StreamSubscription? onPlayerStateChanged;
  StreamSubscription? onPlayerError;

  String? statusText;
  double currentPosition = 0;
  double maxPosition = 1;

  MatrixFile? matrixFile;
  File? audioFile;

  @override
  void dispose() {
    if (audioPlayer?.state == PlayerState.playing) {
      audioPlayer?.stop();
    }
    audioPlayer?.release();

    onAudioPositionChanged?.cancel();
    onDurationChanged?.cancel();
    onPlayerStateChanged?.cancel();
    onPlayerError?.cancel();

    super.dispose();
  }

  void _startAction() {
    if (status == AudioPlayerStatus.downloaded) {
      _playAction();
    } else {
      _downloadAction();
    }
  }

  Future<void> _downloadAction() async {
    if (status != AudioPlayerStatus.notDownloaded) return;
    setState(() => status = AudioPlayerStatus.downloading);
    try {
      final matrixFile = await widget.event.downloadAndDecryptAttachment();
      File? file;

      if (!kIsWeb) {
        final tempDir = await getTemporaryDirectory();
        final fileName = Uri.encodeComponent(
          widget.event.attachmentOrThumbnailMxcUrl()!.pathSegments.last,
        );
        file = File('${tempDir.path}/${fileName}_${matrixFile.name}');

        await file.writeAsBytes(matrixFile.bytes);

        if (Platform.isIOS &&
            matrixFile.mimeType.toLowerCase() == 'audio/ogg') {
          Logs().v('Convert ogg audio file for iOS...');
          final convertedFile = File('${file.path}.caf');
          if (await convertedFile.exists() == false) {
            OpusCaf().convertOpusToCaf(file.path, convertedFile.path);
          }
          file = convertedFile;
        }
      }

      setState(() {
        audioFile = file;
        this.matrixFile = matrixFile;
        status = AudioPlayerStatus.downloaded;
      });
      _playAction();
    } catch (e, s) {
      Logs().v('Could not download audio file', e, s);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toLocalizedString(context))));
    }
  }

  void _playAction() async {
    final client = Matrix.of(context).client;
    final audioPlayer = this.audioPlayer ??= AudioPlayer(
      playerId: 'audio_message',
    );
    if (AudioPlayerWidget.currentId != widget.event.eventId) {
      if (AudioPlayerWidget.currentId != null) {
        if (audioPlayer.state == PlayerState.playing) {
          await audioPlayer.stop();
          setState(() {});
        }
      }
      AudioPlayerWidget.currentId = widget.event.eventId;
    }
    final audioFile = this.audioFile;

    onAudioPositionChanged ??= audioPlayer.onPositionChanged.listen((state) {
      if (maxPosition <= 0) return;
      setState(() {
        statusText =
            '${state.inMinutes.toString().padLeft(2, '0')}:${(state.inSeconds % 60).toString().padLeft(2, '0')}';
        currentPosition = state.inMilliseconds.toDouble();
      });
      if (state.inMilliseconds.toDouble() == maxPosition) {
        audioPlayer.stop();
        audioPlayer.seek(Duration.zero);
      }
    });
    onDurationChanged ??= audioPlayer.onDurationChanged.listen((max) {
      if (max == Duration.zero) return;
      setState(() => maxPosition = max.inMilliseconds.toDouble());
    });
    onPlayerStateChanged ??= audioPlayer.onPlayerStateChanged.listen(
      (_) => setState(() {}),
    );
    
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
      return;
    } else if (await audioPlayer.getCurrentPosition() != Duration.zero) {
      await audioPlayer.play(
        DeviceFileSource(audioFile!.path, mimeType: matrixFile?.mimeType),
      );
      return;
    }
    audioPlayer
        .play(
          UrlSource(
            (await widget.event.attachmentMxcUrl?.getDownloadUri(
              client,
            )).toString(),
          ),
        )
        .onError(
          ErrorReporter(
            context,
            'Unable to play audio message',
          ).onErrorCallback,
        );
  }

  static const double buttonSize = 36;

  String? get _durationString {
    final durationInt = widget.event.content
        .tryGetMap<String, dynamic>('info')
        ?.tryGet<int>('duration');
    if (durationInt == null) return null;
    final duration = Duration(milliseconds: durationInt);
    return '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  List<int>? _getWaveform() {
    final eventWaveForm = widget.event.content
        .tryGetMap<String, dynamic>('org.matrix.msc1767.audio')
        ?.tryGetList<int>('waveform');
    if (eventWaveForm == null || eventWaveForm.isEmpty) {
      return null;
    }
    while (eventWaveForm.length < AudioPlayerWidget.wavesCount) {
      for (var i = 0; i < eventWaveForm.length; i = i + 2) {
        eventWaveForm.insert(i, eventWaveForm[i]);
      }
    }
    var i = 0;
    final step = (eventWaveForm.length / AudioPlayerWidget.wavesCount).round();
    while (eventWaveForm.length > AudioPlayerWidget.wavesCount) {
      eventWaveForm.removeAt(i);
      i = (i + step) % AudioPlayerWidget.wavesCount;
    }
    return eventWaveForm.map((i) => i > 1024 ? 1024 : i).toList();
  }

  late final List<int>? _waveform;

  void _toggleSpeed() async {
    final audioPlayer = this.audioPlayer;
    if (audioPlayer == null) return;
    switch (audioPlayer.playbackRate) {
      case 1.0:
        await audioPlayer.setPlaybackRate(1.25);
        break;
      case 1.25:
        await audioPlayer.setPlaybackRate(1.5);
        break;
      case 1.5:
        await audioPlayer.setPlaybackRate(2.0);
        break;
      case 2.0:
        await audioPlayer.setPlaybackRate(0.5);
        break;
      case 0.5:
      default:
        await audioPlayer.setPlaybackRate(1.0);
        break;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _waveform = _getWaveform();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final waveform = _waveform;

    final statusText = this.statusText ??= _durationString ?? '00:00';
    final audioPlayer = this.audioPlayer;

    final textColor = widget.color;
    final linkColor = widget.linkColor;

    final fileDescription = widget.event.fileDescription;

    final wavePosition =
        (currentPosition / maxPosition) * AudioPlayerWidget.wavesCount;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: FluffyThemes.columnWidth,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: buttonSize,
                  height: buttonSize,
                  child: status == AudioPlayerStatus.downloading
                      ? CircularProgressIndicator(
                          strokeWidth: 2,
                          color: widget.color,
                        )
                      : InkWell(
                          borderRadius: BorderRadius.circular(64),
                          onLongPress: () => widget.event.saveFile(context),
                          onTap: _startAction,
                          child: Material(
                            color: widget.color.withAlpha(64),
                            borderRadius: BorderRadius.circular(64),
                            child: Icon(
                              audioPlayer?.state == PlayerState.playing
                                  ? Icons.pause_outlined
                                  : Icons.play_arrow_outlined,
                              color: widget.color,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Stack(
                    children: [
                      if (waveform != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              for (
                                var i = 0;
                                i < AudioPlayerWidget.wavesCount;
                                i++
                              )
                                Expanded(
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: i < wavePosition
                                            ? widget.color
                                            : widget.color.withAlpha(128),
                                        borderRadius: BorderRadius.circular(64),
                                      ),
                                      height: 32 * (waveform[i] / 1024),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 32,
                        child: Slider(
                          thumbColor:
                              widget.event.senderId ==
                                  widget.event.room.client.userID
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.primary,
                          activeColor: waveform == null
                              ? widget.color
                              : Colors.transparent,
                          inactiveColor: waveform == null
                              ? widget.color.withAlpha(128)
                              : Colors.transparent,
                          max: maxPosition,
                          value: currentPosition,
                          onChanged: (position) => audioPlayer == null
                              ? _startAction()
                              : audioPlayer.seek(
                                  Duration(milliseconds: position.round()),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 36,
                  child: Text(
                    statusText,
                    style: TextStyle(color: widget.color, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.mic_none_outlined, color: widget.color),
                  ),
                  secondChild: Material(
                    color: widget.color.withAlpha(64),
                    borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(
                        AppConfig.borderRadius,
                      ),
                      onTap: _toggleSpeed,
                      child: SizedBox(
                        width: 32,
                        height: 20,
                        child: Center(
                          child: Text(
                            '${audioPlayer?.playbackRate.toString()}x',
                            style: TextStyle(color: widget.color, fontSize: 9),
                          ),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                  crossFadeState: audioPlayer == null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: FluffyThemes.animationDuration,
                ),
              ],
            ),
          ),
          if (fileDescription != null &&
              !widget.event.isRichFileDescription) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Linkify(
                text: fileDescription,
                textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
                style: TextStyle(
                  color: widget.color,
                  fontSize: widget.fontSize,
                ),
                options: const LinkifyOptions(humanize: false),
                linkStyle: TextStyle(
                  color: widget.linkColor,
                  fontSize: widget.fontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: widget.linkColor,
                ),
                onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
              ),
            ),
          ],
          if (fileDescription != null &&
              widget.event.isRichFileDescription) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HtmlMessage(
                html: fileDescription,
                textColor: textColor,
                room: widget.event.room,
                fontSize: AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                linkStyle: TextStyle(
                  color: linkColor,
                  fontSize:
                      AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: linkColor,
                ),
                onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
