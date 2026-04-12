import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

/// Gets a display name for a bridge type
String getBridgeTypeLabel(String? type) {
  switch (type) {
    case 'whatsapp':
      return 'WhatsApp';
    case 'telegram':
      return 'Telegram';
    case 'signal':
      return 'Signal';
    case 'discord':
      return 'Discord';
    case 'slack':
      return 'Slack';
    case 'irc':
      return 'IRC';
    default:
      return 'Other';
  }
}

/// Gets an icon for a bridge type
IconData getBridgeTypeIcon(String? type) {
  switch (type) {
    case 'whatsapp':
      return Icons.chat;
    case 'telegram':
      return Icons.send;
    case 'signal':
      return Icons.security;
    case 'discord':
      return Icons.headset;
    case 'slack':
      return Icons.tag;
    case 'irc':
      return Icons.favorite;
    default:
      return Icons.link;
  }
}

/// Gets a color for a bridge type
Color getBridgeTypeColor(String? type) {
  switch (type) {
    case 'whatsapp':
      return const Color(0xFF25D366);
    case 'telegram':
      return const Color(0xFF0088CC);
    case 'signal':
      return const Color(0xFF3A76F0);
    case 'discord':
      return const Color(0xFF5865F2);
    case 'slack':
      return const Color(0xFF4A154B);
    case 'irc':
      return const Color(0xFF00FF00);
    default:
      return Colors.grey;
  }
}

/// Known bridge bot suffixes/patterns for common Matrix bridges
const _excludedBotPatterns = [
  'extera',
];

const _bridgePatterns = [
  // Generic bot patterns
  'bot.signal',
  'bot.telegram',
  'bot.whatsapp',
  'bot.discord',
  'bot.slack',
  'bot.irc',
  'signalbot',
  'telegrambot',
  'whatsappbot',
  'discordbot',
  'slackbot',
  'bridgebot',
  'relaybot',
  // Bridge participant IDs (e.g. @whatsapp_12345:server)
  'whatsapp_',
  'telegram_',
  'signal_',
  'discord_',
  'slack_',
  // Specific patterns
  'wa-bot:',
  'telegram-bot:',
  'mautrix-telegram:',
  'tgbot:',
  'tg-bot:',
  'heisenbridge:',
  'beeper:',
  't2bot:',
  'whappbot:',
  'mx-puppet-bridge:',
  'mx-puppet:',
  'whatsapp-bot:',
  'signal-bot:',
  'discord-bot:',
  'irc-bot:',
  'slack-bot:',
  'hangouts-bot:',
  'gitter-bot:',
  'bridged:',
];

/// Known bridge state event types
const _bridgeStateEventTypes = [
  'io.element.bridge',
  'uk.half-shot.msc2776.bridge',
  'com.beeper.bridge',
];

/// Checks if a user ID matches known bridge bot patterns
bool isBridgeBotByUserId(String userId) {
  final lowerUserId = userId.toLowerCase();
  for (final pattern in _excludedBotPatterns) {
    if (lowerUserId.contains(pattern)) {
      return false;
    }
  }
  for (final pattern in _bridgePatterns) {
    if (lowerUserId.contains(pattern)) {
      return true;
    }
  }
  return false;
}

/// Checks if a room is a bridge room by looking at the bridge state events
bool isBridgeRoomByState(Room room) {
  for (final eventType in _bridgeStateEventTypes) {
    final stateEvent = room.getState(eventType);
    if (stateEvent != null) {
      return true;
    }
  }
  return false;
}

/// Checks if a user ID is a known bridge bot
/// Also checks direct chat matrix ID as bridge bots often initiate DM
bool isBridgeBot(String userId, Room room) {
  // Check by user ID pattern
  if (isBridgeBotByUserId(userId.toString())) {
    return true;
  }

  // Check if this is a direct chat with a bridge bot
  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }

  return false;
}

/// Checks if a room is a bridge room (has bridge-related state or direct chat with bridge bot)
bool isBridgeRoom(Room room) {
  // Check by room state events
  if (isBridgeRoomByState(room)) {
    return true;
  }

  // Check direct chat matrix ID
  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }

  // Check room name and topic for bridge bot patterns as fallback
  final roomName = room.name?.toLowerCase() ?? '';
  final roomTopic = room.topic?.toLowerCase() ?? '';
  final bridgeNamePatterns = [
    'whatsapp',
    'telegram',
    'signal',
    'discord',
    'irc',
    'slack',
    'beeper',
  ];
  if (bridgeNamePatterns.any((pattern) =>
      roomName.contains(pattern) || roomTopic.contains(pattern))) {
    return true;
  }

  // Check canonical alias for common bridge portal patterns
  final canonicalAlias = room.canonicalAlias?.toLowerCase() ?? '';
  final aliasPatterns = [
    'telegram_',
    'discord_',
    'whatsapp_',
    'signal_',
    'mautrix_',
    'bridge_',
    'puppet_',
    'beeper_',
  ];
  if (aliasPatterns.any((pattern) => canonicalAlias.contains(pattern))) {
    return true;
  }

  // Check all room members via state events for bridge bot participation
  // Limit scan to first 50 members to avoid performance issues in huge public rooms
  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final userId in memberStates.keys.take(50)) {
      if (isBridgeBotByUserId(userId)) {
        return true;
      }
    }
  }

  return false;
}

/// Gets the bridge type from a room (e.g., 'whatsapp', 'telegram')
/// Returns null if not a bridge room
String? getBridgeType(Room room) {
  final userId = room.directChatMatrixID ?? '';
  final roomName = room.name?.toLowerCase() ?? '';
  final roomTopic = room.topic?.toLowerCase() ?? '';

  if (userId.contains('wa-bot') || userId.contains('whappbot') || userId.contains('whatsapp') || userId.contains('bot.whatsapp') || userId.contains('whatsapp_') || roomName.contains('whatsapp') || roomTopic.contains('whatsapp')) {
    return 'whatsapp';
  }
  if (userId.contains('telegram-bot') || userId.contains('telegram') || userId.contains('mautrix-telegram') || userId.contains('tgbot') || userId.contains('bot.telegram') || userId.contains('telegram_') || roomName.contains('telegram') || roomTopic.contains('telegram')) {
    return 'telegram';
  }
  if (userId.contains('signal-bot') || userId.contains('bot.signal') || userId.contains('signal_') || roomName.contains('signal') || roomTopic.contains('signal')) {
    return 'signal';
  }
  if (userId.contains('discord-bot') || userId.contains('bot.discord') || userId.contains('discord_') || roomName.contains('discord') || roomTopic.contains('discord')) {
    return 'discord';
  }
  if (userId.contains('irc-bot') || userId.contains('bot.irc') || roomName.contains('irc') || roomTopic.contains('irc')) {
    return 'irc';
  }
  if (userId.contains('slack-bot') || userId.contains('bot.slack') || userId.contains('slack_') || roomName.contains('slack') || roomTopic.contains('slack')) {
    return 'slack';
  }
  if (userId.contains('hangouts-bot')) {
    return 'hangouts';
  }
  if (userId.contains('gitter-bot')) {
    return 'gitter';
  }
  if (userId.contains('mx-puppet')) {
    return 'puppet';
  }

  // Check canonical alias for portal patterns
  final canonicalAlias = room.canonicalAlias?.toLowerCase() ?? '';
  if (canonicalAlias.contains('whatsapp')) return 'whatsapp';
  if (canonicalAlias.contains('telegram')) return 'telegram';
  if (canonicalAlias.contains('signal')) return 'signal';
  if (canonicalAlias.contains('discord')) return 'discord';
  if (canonicalAlias.contains('slack')) return 'slack';
  if (canonicalAlias.contains('irc')) return 'irc';

  // Check room creator for bridge bot type
  final createEvent = room.getState(EventTypes.RoomCreate);
  if (createEvent != null) {
    final creator = createEvent.content['creator']?.toString().toLowerCase() ?? '';
    if (creator.contains('whatsapp')) return 'whatsapp';
    if (creator.contains('telegram')) return 'telegram';
    if (creator.contains('signal')) return 'signal';
    if (creator.contains('discord')) return 'discord';
    if (creator.contains('slack')) return 'slack';
    if (creator.contains('irc')) return 'irc';
  }

  // Check room members for bridge bot type (limit scan for performance)
  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final memberId in memberStates.keys.take(50)) {
      final lowerId = memberId.toLowerCase();
      if (lowerId.contains('whatsapp')) return 'whatsapp';
      if (lowerId.contains('telegram')) return 'telegram';
      if (lowerId.contains('signal')) return 'signal';
      if (lowerId.contains('discord')) return 'discord';
      if (lowerId.contains('slack')) return 'slack';
      if (lowerId.contains('irc')) return 'irc';
    }
  }

  // Check state events
  for (final eventType in _bridgeStateEventTypes) {
    final stateEvent = room.getState(eventType);
    if (stateEvent != null) {
      // Try to extract bridge type from content
      final content = stateEvent.content;
      final bridgeName = content['bridge_name'] ?? content['name'] ?? content['service'];
      if (bridgeName != null) {
        return bridgeName.toString().toLowerCase();
      }
      // Return generic bridge type based on event type
      if (eventType == 'io.element.bridge') {
        return 'element';
      }
      return 'bridge';
    }
  }

  return null;
}
