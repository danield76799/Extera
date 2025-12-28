/*
 *   Famedly
 *   Copyright (C) 2019, 2020, 2021 Famedly GmbH
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as
 *   published by the Free Software Foundation, either version 3 of the
 *   License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:async';
import 'dart:math';

import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart' hide VideoRenderer;
import 'package:just_audio/just_audio.dart';
import 'package:matrix/matrix.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:extera_next/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/utils/voip/video_renderer.dart';
import 'package:extera_next/widgets/avatar.dart';
import 'pip/pip_view.dart';

class _StreamView extends StatelessWidget {
  const _StreamView(
    this.wrappedStream, {
    this.mainView = false,
    required this.matrixClient,
  });

  final WrappedMediaStream wrappedStream;
  final Client matrixClient;

  final bool mainView;

  Uri? get avatarUrl => wrappedStream.getUser().avatarUrl;

  String? get displayName => wrappedStream.displayName;

  String get avatarName => wrappedStream.avatarName;

  bool get isLocal => wrappedStream.isLocal();

  bool get mirrored =>
      wrappedStream.isLocal() &&
      wrappedStream.purpose == SDPStreamMetadataPurpose.Usermedia;

  bool get audioMuted => wrappedStream.audioMuted;

  bool get videoMuted => wrappedStream.videoMuted;

  bool get isScreenSharing =>
      wrappedStream.purpose == SDPStreamMetadataPurpose.Screenshare;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          VideoRenderer(
            wrappedStream,
            mirror: mirrored,
            fit: RTCVideoViewObjectFit.RTCVideoViewObjectFitContain,
          ),
          if (videoMuted) ...[
            Container(color: Colors.black54),
            Positioned(
              child: Avatar(
                mxContent: avatarUrl,
                name: displayName,
                size: mainView ? 96 : 48,
                client: matrixClient,
                // textSize: mainView ? 36 : 24,
                // matrixClient: matrixClient,
              ),
            ),
          ],
          if (!isScreenSharing)
            Positioned(
              left: 4.0,
              bottom: 4.0,
              child: Icon(
                audioMuted ? Icons.mic_off : Icons.mic,
                color: Colors.white,
                size: 18.0,
              ),
            ),
        ],
      ),
    );
  }
}

class Calling extends StatefulWidget {
  final VoidCallback? onClear;
  final BuildContext context;
  final String callId;
  final CallSession call;
  final Client client;
  final DateTime startedAt;

  const Calling({
    required this.context,
    required this.call,
    required this.client,
    required this.callId,
    required this.startedAt,
    this.onClear,
    super.key,
  });

  @override
  CallingView createState() => CallingView();
}

class CallingView extends State<Calling> {
  Room? get room => call.room;

  String get displayName => call.room.getLocalizedDisplayname(
        MatrixLocals(L10n.of(widget.context)),
      );

  String get callId => widget.callId;

  CallSession get call => widget.call;

  MediaStream? get localStream {
    if (call.localUserMediaStream != null) {
      return call.localUserMediaStream!.stream!;
    }
    return null;
  }

  MediaStream? get remoteStream {
    if (call.getRemoteStreams.isNotEmpty) {
      return call.getRemoteStreams[0].stream!;
    }
    return null;
  }

  bool get isMicrophoneMuted => call.isMicrophoneMuted;

  bool get isLocalVideoMuted => call.isLocalVideoMuted;

  bool get isScreensharingEnabled => call.screensharingEnabled;

  bool get isRemoteOnHold => call.remoteOnHold;

  bool get voiceonly => call.type == CallType.kVoice;

  bool get connecting => call.state == CallState.kConnecting;

  bool get connected => call.state == CallState.kConnected;

  double? _localVideoHeight;
  double? _localVideoWidth;
  EdgeInsetsGeometry? _localVideoMargin;
  CallState? _state;
  AudioPlayer? callSoundPlayer;

  void _playCallSound() async {
    if (!{CallState.kInviteSent, CallState.kConnecting, CallState.kRinging}
        .contains(_state)) {
      return;
    }
    if (call.direction == CallDirection.kOutgoing) {
      Logs().w("Playing kOutgoing call sound");
      final path = 'assets/sounds/${_state!.name}.ogg';
      if (kIsWeb || PlatformInfos.isMobile || PlatformInfos.isMacOS) {
        final player = callSoundPlayer = AudioPlayer();
        await player.setAsset(path);
        player.setLoopMode(LoopMode.one);
        player.play();
      } else {
        Logs().w('Playing sound not implemented for this platform!');
      }
    } else {
      Logs().w("Playing ringtone, ${call.direction.name}");
      Matrix.of(context).voipPlugin?.playRingtone();
    }
  }

  void _stopCallSound() {
    if (callSoundPlayer != null) {
      callSoundPlayer!.stop();
      callSoundPlayer = null;
    }
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  late StreamSubscription<CallState> onCallStateChangedSubscription;
  late StreamSubscription<CallStateChange> onCallEventChangedSubscription;

  void initialize() async {
    final call = this.call;

    if (call.direction == CallDirection.kOutgoing) {
      registerListeners();
    }
    
    _state = call.state;

    try {
      // Enable wakelock (keep screen on)
      unawaited(WakelockPlus.enable());
    } catch (_) {}
  }

  void registerListeners() {
    onCallStateChangedSubscription =
        call.onCallStateChanged.stream.listen(_handleCallState);
    onCallEventChangedSubscription =
        call.onCallEventChanged.stream.listen((event) {
      if (event == CallStateChange.kFeedsChanged) {
        setState(() {
          call.tryRemoveStopedStreams();
        });
      } else if (event == CallStateChange.kLocalHoldUnhold ||
          event == CallStateChange.kRemoteHoldUnhold) {
        setState(() {});
        Logs().i(
          'Call hold event: local ${call.localHold}, remote ${call.remoteOnHold}',
        );
      }
    });
  }

  void cleanUp() {
    Timer(
      const Duration(seconds: 2),
      () => widget.onClear?.call(),
    );
    try {
      unawaited(WakelockPlus.disable());
    } catch (_) {}
  }

  void minimise() {
    final voipPlugin = Matrix.of(context).voipPlugin;
    setState(() {
      voipPlugin!.overlayMinimised = true;
      voipPlugin.overlayEntry?.markNeedsBuild();
    });
  }

  @override
  void dispose() {
    super.dispose();
    call.cleanUp.call();
  }

  void _resizeLocalVideo(Orientation orientation) {
    final shortSide = min(
      MediaQuery.sizeOf(widget.context).width,
      MediaQuery.sizeOf(widget.context).height,
    );
    _localVideoMargin = remoteStream != null
        ? const EdgeInsets.only(top: 20.0, right: 20.0)
        : EdgeInsets.zero;
    _localVideoWidth = remoteStream != null
        ? shortSide / 3
        : MediaQuery.sizeOf(widget.context).width;
    _localVideoHeight = remoteStream != null
        ? shortSide / 4
        : MediaQuery.sizeOf(widget.context).height;
  }

  void _handleCallState(CallState state) {
    Logs().v('CallingPage::handleCallState: ${state.toString()}');
    if ({CallState.kConnected, CallState.kEnded}.contains(state)) {
      Matrix.of(context).voipPlugin?.stopCallingSound();
      HapticFeedback.heavyImpact();
    }

    if ({CallState.kInviteSent, CallState.kConnecting}.contains(state)) {
      Matrix.of(context).voipPlugin?.playCallingSound(call);
    } else {
      Matrix.of(context).voipPlugin?.stopCallingSound();
    }

    if (mounted) {
      setState(() {
        _state = state;
        if (_state == CallState.kEnded) cleanUp();
      });
    }
  }

  void _answerCall() {
    registerListeners();
    setState(() {
      call.answer();
    });
  }

  void _hangUp() {
    Matrix.of(context).voipPlugin?.stopCallingSound();
    setState(() {
      if (call.isRinging) {
        call.reject();
      } else {
        call.hangup(reason: CallErrorCode.userHangup);
      }
    });
  }

  void _muteMic() {
    setState(() {
      call.setMicrophoneMuted(!call.isMicrophoneMuted);
    });
  }

  void _screenSharing() async {
    if (PlatformInfos.isAndroid) {
      if (!call.screensharingEnabled) {
        FlutterForegroundTask.init(
          androidNotificationOptions: AndroidNotificationOptions(
            channelId: 'notification_channel_id',
            channelName: 'Foreground Notification',
            channelDescription:
                L10n.of(widget.context).foregroundServiceRunning,
          ),
          iosNotificationOptions: const IOSNotificationOptions(),
          foregroundTaskOptions: ForegroundTaskOptions(
            eventAction: ForegroundTaskEventAction.nothing(),
          ),
        );
        FlutterForegroundTask.startService(
          notificationTitle: L10n.of(widget.context).screenSharingTitle,
          notificationText: L10n.of(widget.context)
              .screenSharingDetail(room!.getLocalizedDisplayname()),
          serviceTypes: [
            ForegroundServiceTypes.mediaProjection,
          ],
        );
      } else {
        FlutterForegroundTask.stopService();
      }
    }

    setState(() {
      call.setScreensharingEnabled(!call.screensharingEnabled);
      call.tryRemoveStopedStreams();
    });
  }

  void _remoteOnHold() {
    setState(() {
      call.setRemoteOnHold(!call.remoteOnHold);
    });
  }

  void _muteCamera() {
    setState(() {
      call.setLocalVideoMuted(!call.isLocalVideoMuted);
    });
  }

  void _switchCamera() async {
    if (call.localUserMediaStream != null) {
      await Helper.switchCamera(
        call.localUserMediaStream!.stream!.getVideoTracks()[0],
      );
    }
    setState(() {});
  }

  bool _speakerOn = false;

  void _switchSpeaker() {
    final audioTracks = call.remoteUserMediaStream?.stream?.getAudioTracks();
    setState(() {
      _speakerOn = !_speakerOn;
      if (audioTracks != null && audioTracks.isNotEmpty) {
        audioTracks[0].enableSpeakerphone(_speakerOn);
      }
    });
  }

  List<Widget> _buildActionButtons(bool isFloating) {
    if (isFloating) {
      return [];
    }

    final switchCameraButton = FloatingActionButton(
      heroTag: 'switchCamera',
      onPressed: _switchCamera,
      backgroundColor: Colors.black45,
      tooltip: L10n.of(context).switchCamera,
      child: const Icon(Icons.switch_camera),
    );

    final switchSpeakerButton = FloatingActionButton(
      heroTag: 'switchSpeaker',
      onPressed: _switchSpeaker,
      foregroundColor: _speakerOn ? Colors.black26 : Colors.white,
      backgroundColor: _speakerOn ? Colors.white : Colors.black45,
      tooltip: L10n.of(context).switchSpeaker,
      child: Icon(_speakerOn ? Icons.volume_up : Icons.volume_off),
    );

    final hangupButton = FloatingActionButton(
      heroTag: 'hangup',
      onPressed: _hangUp,
      tooltip: L10n.of(context).hangUp,
      backgroundColor: _state == CallState.kEnded ? Colors.black45 : Colors.red,
      child: const Icon(Icons.call_end),
    );

    final answerButton = FloatingActionButton(
      heroTag: 'answer',
      onPressed: _answerCall,
      tooltip: L10n.of(context).answerCall,
      backgroundColor: Colors.green,
      child: const Icon(Icons.phone),
    );

    final muteMicButton = FloatingActionButton(
      heroTag: 'muteMic',
      onPressed: _muteMic,
      foregroundColor: isMicrophoneMuted ? Colors.black26 : Colors.white,
      backgroundColor: isMicrophoneMuted ? Colors.white : Colors.black45,
      tooltip: L10n.of(context).muteMic,
      child: Icon(isMicrophoneMuted ? Icons.mic_off : Icons.mic),
    );

    final screenSharingButton = FloatingActionButton(
      heroTag: 'screenSharing',
      onPressed: _screenSharing,
      foregroundColor: isScreensharingEnabled ? Colors.black26 : Colors.white,
      backgroundColor: isScreensharingEnabled ? Colors.white : Colors.black45,
      tooltip: L10n.of(context).screenSharing,
      child: const Icon(Icons.desktop_mac),
    );

    final holdButton = FloatingActionButton(
      heroTag: 'hold',
      onPressed: _remoteOnHold,
      foregroundColor: isRemoteOnHold ? Colors.black26 : Colors.white,
      backgroundColor: isRemoteOnHold ? Colors.white : Colors.black45,
      tooltip: L10n.of(context).holdCall,
      child: const Icon(Icons.pause),
    );

    final muteCameraButton = FloatingActionButton(
      heroTag: 'muteCam',
      onPressed: _muteCamera,
      foregroundColor: isLocalVideoMuted ? Colors.black26 : Colors.white,
      backgroundColor: isLocalVideoMuted ? Colors.white : Colors.black45,
      tooltip: L10n.of(context).muteCam,
      child: Icon(isLocalVideoMuted ? Icons.videocam_off : Icons.videocam),
    );

    switch (_state) {
      case CallState.kRinging:
      case CallState.kInviteSent:
      case CallState.kCreateAnswer:
      case CallState.kConnecting:
        return call.isOutgoing
            ? <Widget>[hangupButton]
            : <Widget>[answerButton, hangupButton];
      case CallState.kConnected:
        return <Widget>[
          muteMicButton,
          switchSpeakerButton,
          if (!voiceonly && !kIsWeb) switchCameraButton,
          if (!voiceonly) muteCameraButton,
          if (PlatformInfos.isMobile || PlatformInfos.isWeb)
            screenSharingButton,
          holdButton,
          hangupButton,
        ];
      case CallState.kEnded:
        return <Widget>[
          hangupButton,
        ];
      case CallState.kFledgling:
      case CallState.kWaitLocalMedia:
      case CallState.kCreateOffer:
      case CallState.kEnding:
      case null:
        break;
    }
    return <Widget>[];
  }

  List<Widget> _buildContent(Orientation orientation, bool isFloating) {
    final stackWidgets = <Widget>[];

    final call = this.call;

    stackWidgets.add(
      Padding(
        padding: const EdgeInsetsGeometry.symmetric(vertical: 128),
        child: Center(
          child: Column(
            spacing: 4,
            children: [
              Text(
                call.remoteUser?.calcDisplayname() ??
                    call.remoteUserId ??
                    room!.name,
                textScaler: const TextScaler.linear(1.67),
              ),
              Text(
                call.state == CallState.kConnected
                    ? L10n.of(context).callConnected
                    : call.state == CallState.kConnecting
                        ? L10n.of(context).callConnecting
                        : call.state == CallState.kEnded
                            ? L10n.of(context).callEnded
                            : call.state == CallState.kEnding
                                ? L10n.of(context).callEnding
                                : call.state == CallState.kRinging
                                    ? L10n.of(context).callRinging
                                    : call.state == CallState.kInviteSent
                                        ? L10n.of(context).callInviteSent
                                        : "",
              ),
            ],
          ),
        ),
      ),
    );

    if (call.callHasEnded) {
      return stackWidgets;
    }

    if (call.localHold || call.remoteOnHold) {
      var title = '';
      if (call.localHold) {
        title = L10n.of(context).heldTheCall(call.room.getLocalizedDisplayname(
          MatrixLocals(L10n.of(widget.context)),
        ));
      } else if (call.remoteOnHold) {
        title = L10n.of(context).youHeldTheCall;
      }
      stackWidgets.add(
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.pause,
                size: 48.0,
                color: Colors.white,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
        ),
      );
      return stackWidgets;
    }

    var primaryStream = call.remoteScreenSharingStream ??
        call.localScreenSharingStream ??
        call.remoteUserMediaStream ??
        call.localUserMediaStream;

    if (!connected) {
      primaryStream = call.localUserMediaStream;
    }

    if (primaryStream != null && connected) {
      stackWidgets.add(
        Center(
          child: _StreamView(
            primaryStream,
            mainView: true,
            matrixClient: widget.client,
          ),
        ),
      );
    } else {
      stackWidgets.add(
        Center(
          child: Avatar(
            mxContent: call.remoteUser?.avatarUrl,
            name: displayName,
            size: 96,
          ),
        ),
      );
    }

    if (isFloating || !connected) {
      return stackWidgets;
    }

    _resizeLocalVideo(orientation);

    if (call.getRemoteStreams.isEmpty) {
      return stackWidgets;
    }

    final secondaryStreamViews = <Widget>[];

    if (call.remoteScreenSharingStream != null) {
      final remoteUserMediaStream = call.remoteUserMediaStream;
      secondaryStreamViews.add(
        SizedBox(
          width: _localVideoWidth,
          height: _localVideoHeight,
          child:
              _StreamView(remoteUserMediaStream!, matrixClient: widget.client),
        ),
      );
      secondaryStreamViews.add(const SizedBox(height: 10));
    }

    final localStream =
        call.localUserMediaStream ?? call.localScreenSharingStream;
    if (localStream != null && !isFloating) {
      secondaryStreamViews.add(
        SizedBox(
          width: _localVideoWidth,
          height: _localVideoHeight,
          child: _StreamView(localStream, matrixClient: widget.client),
        ),
      );
      secondaryStreamViews.add(const SizedBox(height: 10));
    }

    if (call.localScreenSharingStream != null && !isFloating) {
      secondaryStreamViews.add(
        SizedBox(
          width: _localVideoWidth,
          height: _localVideoHeight,
          child: _StreamView(
            call.remoteUserMediaStream!,
            matrixClient: widget.client,
          ),
        ),
      );
      secondaryStreamViews.add(const SizedBox(height: 10));
    }

    if (secondaryStreamViews.isNotEmpty) {
      stackWidgets.add(
        Container(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 120),
          alignment: Alignment.bottomRight,
          child: Container(
            width: _localVideoWidth,
            margin: _localVideoMargin,
            child: Column(
              children: secondaryStreamViews,
            ),
          ),
        ),
      );
    }

    return stackWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final voipPlugin = Matrix.of(context).voipPlugin;
    if (voipPlugin!.overlayMinimised) return const SizedBox.shrink();

    return PIPView(
      builder: (context, isFloating) {
        return Scaffold(
          resizeToAvoidBottomInset: !isFloating,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: 320.0,
            height: 150.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildActionButtons(isFloating),
            ),
          ),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                minimise();
              },
              icon: Icon(Icons.adaptive.arrow_back),
            ),
          ),
          body: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                ),
                child: Stack(
                  children: [
                    ..._buildContent(orientation, isFloating),
                    if (!isFloating)
                      Positioned(
                        top: 24.0,
                        left: 24.0,
                        child: IconButton(
                          color: Colors.black45,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            PIPView.of(context)?.setFloating(true);
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
