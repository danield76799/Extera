import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_list/chat_list_item.dart';
import 'package:extera_next/pages/chat_list/search_title.dart';
import 'package:extera_next/pages/profile/profile.dart';
import 'package:extera_next/utils/date_time_extension.dart';
import 'package:extera_next/utils/stream_extension.dart';
import 'package:extera_next/utils/url_launcher.dart';
import 'package:extera_next/widgets/avatar.dart';
import 'package:extera_next/widgets/future_loading_dialog.dart';
import 'package:extera_next/widgets/layouts/max_width_body.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:extera_next/widgets/mxc_image_viewer.dart';
import 'package:extera_next/widgets/presence_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller;

  const ProfileView(this.controller, {super.key});

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(label, textScaler: const TextScaler.linear(0.8)),
          ],
        ),
      ),
    );
  }

  Widget _buildMutualChatList({
    required BuildContext context,
    required String userId,
  }) {
    final client = Matrix.of(context).client;

    return StreamBuilder(
      key: ValueKey(userId),
      stream: client.onSync.stream
          .where((s) => s.hasRoomUpdate)
          .rateLimit(const Duration(seconds: 1)),
      builder: (context, _) {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.mutualRooms.length,
          itemBuilder: (BuildContext context, int i) {
            final room = controller.mutualRooms[i];
            return ChatListItem(
              room,
              key: Key('mutual_chat_list_item_${room.id}'),
              // filter: filter,
              onTap: () => controller.onChatTap(room),
              // onLongPress: (context) =>
              //     controller.chatContextAction(room, context, space),
              // activeChat: controller.activeChat == room.id,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profile = controller.widget.profile;
    final client = Matrix.of(context).client;
    // final dmRoomId = client.getDirectChatFromUserId(profile.userId);
    final displayname =
        profile.displayName ??
        profile.userId.localpart ??
        L10n.of(context).user;
    final theme = Theme.of(context);
    final avatar = profile.avatarUrl;

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: BackButton(onPressed: Navigator.of(context).pop),
        ),
      ),
      body: MaxWidthBody(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            PresenceBuilder(
              userId: profile.userId,
              client: Matrix.of(context).client,
              builder: (context, presence) {
                if (presence == null) return const SizedBox.shrink();
                final statusMsg = presence.statusMsg;
                final lastActiveTimestamp = presence.lastActiveTimestamp;
                final presenceText = presence.currentlyActive == true
                    ? L10n.of(context).currentlyActive
                    : lastActiveTimestamp != null
                    ? L10n.of(context).lastActiveAgo(
                        lastActiveTimestamp.localizedTimeShort(context),
                      )
                    : null;
                return SingleChildScrollView(
                  child: Column(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Avatar(
                          mxContent: avatar,
                          name: displayname,
                          size: Avatar.defaultSize * 2,
                          onTap: avatar != null
                              ? () => showDialog(
                                  context: context,
                                  builder: (_) => MxcImageViewer(avatar),
                                )
                              : null,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 256),
                        child: Center(
                          child: Text(
                            displayname,
                            textAlign: TextAlign.center,
                            textScaler: const TextScaler.linear(1.67),
                          ),
                        ),
                      ),
                      if (presenceText != null)
                        Text(
                          presenceText,
                          style: const TextStyle(fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      if (statusMsg != null)
                        SelectableLinkify(
                          text: statusMsg,
                          textScaleFactor: MediaQuery.textScalerOf(
                            context,
                          ).scale(1),
                          textAlign: TextAlign.center,
                          options: const LinkifyOptions(humanize: false),
                          linkStyle: TextStyle(
                            color: theme.colorScheme.primary,
                            decoration: TextDecoration.underline,
                            decorationColor: theme.colorScheme.primary,
                          ),
                          onOpen: (url) =>
                              UrlLauncher(context, url.url).launchUrl(),
                        ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: constraints,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5,
                      children: [
                        if (client.userID != profile.userId) ...[
                          _buildActionButton(
                            context: context,
                            icon: Icons.chat_bubble_outline,
                            label: L10n.of(context).chat,
                            onPressed: () async {
                              final router = GoRouter.of(context);
                              final roomIdResult =
                                  await showFutureLoadingDialog(
                                    context: context,
                                    future: () =>
                                        client.startDirectChat(profile.userId),
                                  );
                              final roomId = roomIdResult.result;
                              if (roomId == null) return;
                              if (context.mounted) Navigator.of(context).pop();
                              router.go('/rooms/$roomId');
                            },
                          ),
                          if (controller.showCallButton)
                            _buildActionButton(
                              context: context,
                              icon: Icons.call,
                              label: L10n.of(context).placeCall,
                              onPressed: () {
                                controller.onCallTap();
                              },
                            ),
                          _buildActionButton(
                            context: context,
                            icon: Icons.block,
                            label: L10n.of(context).ignoreUser,
                            onPressed: () async {
                              final router = GoRouter.of(context);
                              Navigator.of(context).pop();
                              router.go(
                                '/rooms/settings/security/ignorelist',
                                extra: profile.userId,
                              );
                            },
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.alternate_email),
              trailing: const Icon(Icons.copy),
              title: Text(profile.userId),
              subtitle: Text(L10n.of(context).matrixId),
              onTap: () {
                Clipboard.setData(ClipboardData(text: profile.userId));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(L10n.of(context).copiedToClipboard)),
                );
              },
            ),
            if (controller.about != null && controller.about!.isNotEmpty)
              ListTile(
                leading: const Icon(Icons.wysiwyg),
                title: Text(controller.about!),
                subtitle: Text(L10n.of(context).aboutUser),
              ),
            const SizedBox(height: 8),
            if (controller.mutualRooms.isNotEmpty)
              SearchTitle(
                title: L10n.of(context).mutualRooms,
                icon: const Icon(Icons.chat_bubble_outline),
              ),
            if (profile.userId != client.userID)
              controller.isQueryingMutualRooms
                  ? const CircularProgressIndicator.adaptive()
                  : _buildMutualChatList(
                      context: context,
                      userId: profile.userId,
                    ),
          ],
        ),
      ),
    );
  }
}
