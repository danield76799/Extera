import 'package:device_info_plus/device_info_plus.dart';
import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/profile/profile_view.dart';
import 'package:extera_next/utils/localized_exception_extension.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/msc2666_extension.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/widgets/adaptive_dialogs/show_modal_action_popup.dart';
import 'package:extera_next/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class ProfilePage extends StatefulWidget {
  final Profile profile;
  final bool noProfileWarning;

  const ProfilePage(this.profile, {this.noProfileWarning = false, super.key});

  @override
  State<StatefulWidget> createState() => ProfileController();
}

class ProfileController extends State<ProfilePage> {
  String? about;
  bool isQueryingAbout = false;

  Future<void> queryAbout() async {
    final client = Matrix.of(context).client;
    if (isQueryingAbout) return;
    setState(() {
      isQueryingAbout = true;
    });
    final aboutResponse =
        await client.getProfileField(widget.profile.userId, AppConfig.aboutProfileField);
    if (aboutResponse.containsKey(AppConfig.aboutProfileField) &&
        aboutResponse[AppConfig.aboutProfileField] is String &&
        aboutResponse[AppConfig.aboutProfileField].toString().length <= 256) {
      setState(() {
        about = aboutResponse[AppConfig.aboutProfileField].toString();
        isQueryingAbout = false;
      });
    } else {
      setState(() {
        isQueryingAbout = false;
      });
    }
  }

  List<Room> mutualRooms = [];
  bool canQueryMutualRooms = true;
  bool isQueryingMutualRooms = false;

  Future<void> queryMutualRooms() async {
    final client = Matrix.of(context).client;
    if (!canQueryMutualRooms || isQueryingMutualRooms) return;
    canQueryMutualRooms = await client.isMsc2666Supported();
    setState(() {
      isQueryingMutualRooms = true;
    });
    final rooms = (await client.queryMutualRoomsIds(widget.profile.userId))
        .map(
          (roomId) => client.getRoomById(roomId),
        )
        .where(
          (room) => room != null && !room.isSpace && !room.isDirectChat,
        );
    setState(() {
      mutualRooms = rooms.map((room) => room!).toList();
      isQueryingMutualRooms = false;
    });
  }

  @override
  void initState() {
    super.initState();
    queryAbout();

    if (Matrix.of(context).client.userID != widget.profile.userId) {
      queryMutualRooms();
    }
  }

  void onChatTap(Room room) {
    if (room.membership == Membership.leave) {
      context.go('/rooms/archive/${room.id}');
      return;
    }

    context.go('/rooms/${room.id}');
  }

  bool get showCallButton {
    if (Matrix.of(context).voipPlugin == null) return false;
    final client = Matrix.of(context).client;
    final roomId = client.getDirectChatFromUserId(widget.profile.userId);
    return roomId != null;
  }

  void onCallTap() async {
    // VoIP required Android SDK 21
    if (PlatformInfos.isAndroid) {
      DeviceInfoPlugin().androidInfo.then((value) {
        if (value.version.sdkInt < 21) {
          Navigator.pop(context);
          showOkAlertDialog(
            context: context,
            title: L10n.of(context).unsupportedAndroidVersion,
            message: L10n.of(context).unsupportedAndroidVersionLong,
            okLabel: L10n.of(context).close,
          );
        }
      });
    }
    final callType = await showModalActionPopup<CallType>(
      context: context,
      title: L10n.of(context).warning,
      message: L10n.of(context).videoCallsBetaWarning,
      cancelLabel: L10n.of(context).cancel,
      actions: [
        AdaptiveModalAction(
          label: L10n.of(context).voiceCall,
          icon: const Icon(Icons.phone_outlined),
          value: CallType.kVoice,
        ),
        AdaptiveModalAction(
          label: L10n.of(context).videoCall,
          icon: const Icon(Icons.video_call_outlined),
          value: CallType.kVideo,
        ),
      ],
    );
    if (callType == null) return;

    final client = Matrix.of(context).client;
    final roomId = client.getDirectChatFromUserId(widget.profile.userId);
    final room = client.getRoomById(roomId!);
    if (room == null) return;    
    final voipPlugin = Matrix.of(context).voipPlugin;
    try {
      final session = await voipPlugin!.voip.inviteToCall(room, callType);
      voipPlugin.addCallingOverlay(session.callId, session);
      context.go('/rooms/$roomId');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toLocalizedString(context))),
      );
      Logs().e("onCallTap", e);
    }
  }

  @override
  Widget build(BuildContext context) => ProfileView(this);
}
