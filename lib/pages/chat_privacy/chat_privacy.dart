import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/pages/chat_privacy/chat_privacy_view.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class ChatPrivacy extends StatefulWidget {
  final String roomId;

  const ChatPrivacy({required this.roomId, super.key});

  @override
  ChatPrivacyController createState() => ChatPrivacyController();
}

class ChatPrivacyController extends State<ChatPrivacy> {

  Room get room {
    final client = Matrix.of(context).client;
    return client.getRoomById(widget.roomId)!;
  }

  String get _eventKey => 'xyz.extera.room_privacy_settings.${room.id}';

  bool get privacySettingsEnabled {
    final client = Matrix.of(context).client;
    return client.accountData.containsKey(_eventKey);
  }

  bool get sendReadReceipts {
    final client = Matrix.of(context).client;
    if (!privacySettingsEnabled) return AppConfig.sendPublicReadReceipts;
    final content = client.accountData[_eventKey]!.content;
    return content.tryGet<bool>('read_receipts') ?? AppConfig.sendPublicReadReceipts;
  }

  bool get sendTypingNotifications {
    final client = Matrix.of(context).client;
    if (!privacySettingsEnabled) return AppConfig.sendPublicReadReceipts;
    final content = client.accountData[_eventKey]!.content;
    return content.tryGet<bool>('typing_notifications') ?? AppConfig.sendTypingNotifications;
  }

  void setReadReceipts(bool readReceipts) async {
    final client = Matrix.of(context).client;
    setState(() {
      client.setAccountData(client.userID!, _eventKey, {
        'read_receipts': readReceipts,
        'typing_notifications': sendTypingNotifications,
      });
    });
  }

  void setTypingNotifications(bool typingNotifications) async {
    final client = Matrix.of(context).client;
    setState(() {
      client.setAccountData(client.userID!, _eventKey, {
        'read_receipts': sendReadReceipts,
        'typing_notifications': typingNotifications,
      });
    });
  }

  @override
  Widget build(BuildContext context) => ChatPrivacyView(this);
  
}