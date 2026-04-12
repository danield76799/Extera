import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_list/chat_list.dart';
import 'package:extera_next/utils/bridge_utils.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:extera_next/widgets/matrix.dart';
import '../config/themes.dart';

class BridgesView extends StatelessWidget {
  final void Function(Room) onChatTap;
  final void Function() onBack;
  final ChatListController chatListController;

  const BridgesView({
    required this.onChatTap,
    required this.onBack,
    required this.chatListController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final client = Matrix.of(context).client;
    final bridgeRooms = client.rooms.where((room) => isBridgeRoom(room)).toList();

    return SafeArea(
      child: CustomScrollView(
        controller: chatListController.scrollController,
        slivers: [
          SliverAppBar(
            title: Text('Bridges'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBack,
            ),
            floating: true,
            snap: true,
          ),
          if (bridgeRooms.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.link_off,
                      size: 128,
                      color: theme.colorScheme.secondary,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No bridges connected',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    Text(
                      'Bridge bots like WhatsApp or Telegram\nwill appear here when connected.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: theme.colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverList.builder(
              itemCount: bridgeRooms.length,
              itemBuilder: (BuildContext context, int i) {
                final room = bridgeRooms[i];
                final bridgeType = getBridgeType(room);
                final displayname = room.getLocalizedDisplayname(
                  MatrixLocals(L10n.of(context)),
                );
                return Column(
                  children: [
                    _BridgeListItem(
                      room: room,
                      bridgeType: bridgeType,
                      displayname: displayname,
                      onTap: () => onChatTap(room),
                    ),
                    if (bridgeRooms.length - 1 != i)
                      Divider(
                        height: 1,
                        indent: 72,
                        endIndent: 16,
                        color: theme.dividerColor,
                      ),
                  ],
                );
              },
            ),
          SliverToBoxAdapter(child: const SizedBox(height: 172)),
        ],
      ),
    );
  }
}

class _BridgeListItem extends StatelessWidget {
  final Room room;
  final String? bridgeType;
  final String displayname;
  final void Function() onTap;

  const _BridgeListItem({
    required this.room,
    this.bridgeType,
    required this.displayname,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      child: Material(
        borderRadius: borderRadius,
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          onTap: onTap,
          leading: _BridgeAvatar(
            bridgeType: bridgeType,
            room: room,
          ),
          title: Text(
            displayname,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.link,
                size: 14,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              Text(
                bridgeType ?? 'Bridge',
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class _BridgeAvatar extends StatelessWidget {
  final String? bridgeType;
  final Room room;

  const _BridgeAvatar({
    this.bridgeType,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    IconData icon;
    Color color;

    switch (bridgeType) {
      case 'whatsapp':
        icon = Icons.chat;
        color = const Color(0xFF25D366);
        break;
      case 'telegram':
        icon = Icons.send;
        color = const Color(0xFF0088CC);
        break;
      case 'signal':
        icon = Icons.security;
        color = const Color(0xFF3A76F0);
        break;
      case 'discord':
        icon = Icons.headset;
        color = const Color(0xFF5865F2);
        break;
      case 'slack':
        icon = Icons.tag;
        color = const Color(0xFF4A154B);
        break;
      case 'irc':
        icon = Icons.favorite;
        color = const Color(0xFF00FF00);
        break;
      default:
        icon = Icons.link;
        color = theme.colorScheme.primary;
    }

    return Container(
      width: Avatar.defaultSize,
      height: Avatar.defaultSize,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(AppConfig.borderRadius),
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
