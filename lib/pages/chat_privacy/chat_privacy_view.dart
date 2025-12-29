import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_privacy/chat_privacy.dart';
import 'package:extera_next/utils/stream_extension.dart';
import 'package:extera_next/widgets/layouts/max_width_body.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';

class ChatPrivacyView extends StatelessWidget {
  final ChatPrivacyController controller;

  const ChatPrivacyView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).chatPrivacyTitle),
      ),
      body: MaxWidthBody(
        child: StreamBuilder(
          stream: client.onSync.stream
              .where((update) => update.accountData?.isNotEmpty ?? false)
              .rateLimit(const Duration(seconds: 1)),
          builder: (context, _) {
            return Column(
              children: [
                  ListTile(
                    title: Text(
                      L10n.of(context).privacy,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ListTile(
                  title: Text(L10n.of(context).sendReadReceipts),
                  subtitle: Text(L10n.of(context).sendReadReceiptsDescription),
                  trailing: Switch(
                    value: controller.sendReadReceipts,
                    onChanged: (value) {
                      controller.setReadReceipts(value);
                    },
                  ),
                ),
                ListTile(
                  title: Text(L10n.of(context).sendTypingNotifications),
                  subtitle: Text(L10n.of(context).sendTypingNotificationsDescription),
                  trailing: Switch(
                    value: controller.sendTypingNotifications,
                    onChanged: (value) {
                      controller.setTypingNotifications(value);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
