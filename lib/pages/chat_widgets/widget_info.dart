import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/url_launcher.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class WidgetInfo extends StatelessWidget {
  final StrippedStateEvent widgetEvent;
  final Room room;

  const WidgetInfo({required this.room, required this.widgetEvent, super.key});

  void onOpenTap(BuildContext context) async {
    final client = Matrix.of(context).client;

    final content = widgetEvent.content;
    final data = content.tryGet<Map<String, dynamic>>('data') ?? {};
    var url = content.tryGet<String>('url')!;

    if (!url.startsWith('https://')) return;

    final profile = await client.getUserProfile(client.userID!);

    data['matrix_user_id'] = client.userID!;
    data['matrix_room_id'] = room.id;
    data['matrix_display_name'] = profile.displayname ?? client.userID!;
    data['matrix_avatar_url'] = profile.avatarUrl?.getDownloadUri(client) ?? '';

    for (final key in data.keys) {
      url = url.replaceAll('\$$key', data[key]);
    }

    UrlLauncher(context, url).launchUrl();
  }

  @override
  Widget build(BuildContext context) {
    final client = Matrix.of(context).client;

    final content = widgetEvent.content;
    final title =
        content.tryGet<Map<String, dynamic>>('data')?.tryGet<String>('title') ??
        content.tryGet('name') ??
        'Widget';
    final creatorUserId =
        content.tryGet<String>('creatorUserId') ?? widgetEvent.senderId;
    final widgetType = content.tryGet<String>('type') ?? 'm.custom';

    return Scaffold(
      appBar: AppBar(title: Text(L10n.of(context).widget)),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: Text(title),
            subtitle: Text(L10n.of(context).widgetName),
          ),
          ListTile(
            leading: const Icon(Icons.widgets_outlined),
            title:
                {
                  'm.etherpad': Text(L10n.of(context).widgetEtherpad),
                  'm.jitsi': Text(L10n.of(context).widgetJitsi),
                  'm.video': Text(L10n.of(context).widgetVideo),
                  'm.custom': Text(L10n.of(context).widgetCustom),
                }.tryGet(widgetType) ??
                Text(L10n.of(context).widget),
            subtitle: Text(L10n.of(context).widgetType),
          ),
          ListTile(
            leading: const Icon(Icons.person_add_outlined),
            title: Text(creatorUserId),
            subtitle: Text(L10n.of(context).widgetCreatorUser),
          ),
          const Divider(),
            ListTile(
              leading: const Icon(Icons.open_in_browser_outlined),
              title: Text(L10n.of(context).open),
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop();
                onOpenTap(context);
              },
            ),
          if (room.canChangeStateEvent('im.vector.modular.widgets'))
            ListTile(
              leading: const Icon(Icons.cancel_outlined, color: Colors.red),
              title: Text(L10n.of(context).deleteWidget),
              onTap: () {
                room.setState(
                  StrippedStateEvent(
                    type: 'im.vector.modular.widgets',
                    content: {},
                    senderId: client.userID!,
                    stateKey: widgetEvent.stateKey,
                  ),
                );
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
        ],
      ),
    );
  }
}
