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
    case 'matrix':
      return 'Matrix';
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
      return Icons.wifi_tethering;
    case 'discord':
      return Icons.headset;
    case 'slack':
      return Icons.tag;
    case 'matrix':
      return Icons.view_module;
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
    case 'matrix':
      return const Color(0xFF0DBD8B);
    default:
      return Colors.grey;
  }
}

/// Known bridge bot suffixes/patterns for common Matrix bridges
const _excludedBotPatterns = ['extera'];

const _bridgePatterns = [
  // Generic bot patterns (any server)
  'bot.signal',
  'bot.telegram',
  'bot.whatsapp',
  'bot.discord',
  'bot.slack',
  'signalbot',
  'telegrambot',
  'whatsappbot',
  'botwhatsapp',
  'whatsapp.bot',
  'bot.whatsapp',
  'discordbot',
  'slackbot',
  'bridgebot',
  'relaybot',
  'bridge bot',
  // Bridge participant IDs (any server)
  'whatsapp_',
  'telegram_',
  'signal_',
  'discord_',
  'slack_',
  'whatsapp_lid',
  // Specific patterns (any server)
  'wa-bot',
  'telegram-bot',
  'mautrix-telegram',
  'tgbot',
  'tg-bot',
  'heisenbridge',
  'beeper',
  't2bot',
  'whappbot',
  'mx-puppet-bridge',
  'mx-puppet',
  'whatsapp-bot',
  'signal-bot',
  'discord-bot',
  'slack-bot',
  'hangouts-bot',
  'gitter-bot',
  'bridged',
  // Server-independent patterns
  '@whatsapp',
  '@telegram',
  '@signal',
  '@discord',
  '@slack',
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
  // Check by room state events FIRST (most reliable)
  if (isBridgeRoomByState(room)) {
    return true;
  }

  // Check direct chat matrix ID
  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }

  // Check room name and topic for bridge bot patterns
  final roomName = room.name?.toLowerCase() ?? '';
  final roomTopic = room.topic?.toLowerCase() ?? '';
  final bridgeNamePatterns = [
    'whatsapp',
    'telegram',
    'signal',
    'discord',
    'slack',
    'beeper',
    'mautrix',
  ];
  if (bridgeNamePatterns.any(
    (pattern) => roomName.contains(pattern) || roomTopic.contains(pattern),
  )) {
    return true;
  }

  // Check for phone numbers in room name (WhatsApp bridge indicator)
  // Phone number formats: +316..., +31 6..., 06..., etc.
  final name = room.name;
  if (name != null && name.isNotEmpty) {
    // Simple phone number check: starts with + and has 10+ digits, or starts with 0 and has 10+ chars
    final cleaned = name.replaceAll(RegExp(r'\s'), '');
    if ((cleaned.startsWith('+') && cleaned.length >= 10 && cleaned.substring(1).split('').every((c) => RegExp(r'\d').hasMatch(c))) ||
        (cleaned.startsWith('0') && cleaned.length >= 10 && cleaned.split('').every((c) => RegExp(r'\d').hasMatch(c)))) {
      return true;
    }
  }

  // Check canonical alias
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

  // Check room members for bridge bot participation
  // Check ALL members, not just first 20, and also check display names
  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final entry in memberStates.entries) {
      final userId = entry.key;
      if (isBridgeBotByUserId(userId)) {
        return true;
      }
      // Also check display name in the member event
      final event = entry.value;
      final displayName = event.content['displayname']?.toString().toLowerCase() ?? '';
      if (displayName.contains('(wa)') || displayName.contains('whatsapp')) {
        return true;
      }
    }
  }

  // Fallback for groups: if we can't find the bridge bot in loaded members
  // (SDK only loads ~20), use group size as heuristic
  // Groups are likely WhatsApp bridges if not detected otherwise
  if (!room.isDirectChat) {
    final memberCount = room.summary?.mJoinedMemberCount;
    // If memberCount is known, check range. If unknown (null), assume it's a group
    if (memberCount == null || (memberCount > 2 && memberCount < 200)) {
      return true;
    }
  }

  return false;
}

/// Gets the bridge type from a room (e.g., 'whatsapp', 'telegram')
/// Returns null if not a bridge room
String? getBridgeType(Room room) {
  // 1. Check bridge state events FIRST (most reliable)
  for (final eventType in _bridgeStateEventTypes) {
    final stateEvent = room.getState(eventType);
    if (stateEvent != null) {
      final content = stateEvent.content;
      final bridgeName =
          content['bridge_name'] ?? content['name'] ?? content['service'] ?? content['type'];
      if (bridgeName != null) {
        final name = bridgeName.toString().toLowerCase();
        if (name.contains('whatsapp')) return 'whatsapp';
        if (name.contains('telegram')) return 'telegram';
        if (name.contains('signal')) return 'signal';
        if (name.contains('discord')) return 'discord';
        if (name.contains('slack')) return 'slack';
        return name;
      }
      return 'bridge';
    }
  }

  // 2. Check directChatMatrixID
  final userId = room.directChatMatrixID?.toLowerCase() ?? '';
  final roomName = room.name?.toLowerCase() ?? '';
  final roomTopic = room.topic?.toLowerCase() ?? '';

  // WhatsApp patterns
  if (userId.contains('wa-bot') ||
      userId.contains('whappbot') ||
      userId.contains('whatsappbot') ||
      userId.contains('botwhatsapp') ||
      userId.contains('whatsapp_') ||
      userId.contains('whatsapp.bot') ||
      userId.contains('bot.whatsapp') ||
      userId.contains('@whatsapp') ||
      userId.contains('@botwhatsapp') ||
      userId.contains('@bot.whatsapp') ||
      userId.contains('@whatsappbot')) {
    return 'whatsapp';
  }
  // Telegram patterns
  if (userId.contains('telegram-bot') ||
      userId.contains('mautrix-telegram') ||
      userId.contains('tgbot') ||
      userId.contains('bot.telegram') ||
      userId.contains('telegram_')) {
    return 'telegram';
  }
  // Signal patterns
  if (userId.contains('signal-bot') ||
      userId.contains('bot.signal') ||
      userId.contains('signal_')) {
    return 'signal';
  }
  // Discord patterns
  if (userId.contains('discord-bot') ||
      userId.contains('bot.discord') ||
      userId.contains('discord_')) {
    return 'discord';
  }
  // Slack patterns
  if (userId.contains('slack-bot') ||
      userId.contains('bot.slack') ||
      userId.contains('slack_')) {
    return 'slack';
  }

  // 3. Check room name/topic
  if (roomName.contains('whatsapp_') || roomTopic.contains('whatsapp_') ||
      roomName.contains('wa ') || roomTopic.contains('wa ')) {
    return 'whatsapp';
  }
  
  // Check for phone numbers (WhatsApp bridge indicator)
  final name = room.name;
  if (name != null && name.isNotEmpty) {
    final cleaned = name.replaceAll(RegExp(r'\s'), '');
    if ((cleaned.startsWith('+') && cleaned.length >= 10 && cleaned.substring(1).split('').every((c) => RegExp(r'\d').hasMatch(c))) ||
        (cleaned.startsWith('0') && cleaned.length >= 10 && cleaned.split('').every((c) => RegExp(r'\d').hasMatch(c)))) {
      return 'whatsapp';
    }
  }
  
  if (roomName.contains('telegram_') || roomTopic.contains('telegram_')) {
    return 'telegram';
  }
  if (roomName.contains('signal_') || roomTopic.contains('signal_')) {
    return 'signal';
  }
  if (roomName.contains('discord_') || roomTopic.contains('discord_')) {
    return 'discord';
  }

  // 4. Check canonical alias
  final canonicalAlias = room.canonicalAlias?.toLowerCase() ?? '';
  if (canonicalAlias.contains('whatsapp')) return 'whatsapp';
  if (canonicalAlias.contains('telegram')) return 'telegram';
  if (canonicalAlias.contains('signal')) return 'signal';
  if (canonicalAlias.contains('discord')) return 'discord';
  if (canonicalAlias.contains('slack')) return 'slack';

  // 5. Check room creator
  final createEvent = room.getState(EventTypes.RoomCreate);
  if (createEvent != null) {
    final creator =
        createEvent.content['creator']?.toString().toLowerCase() ?? '';
    if (creator.contains('whatsapp')) return 'whatsapp';
    if (creator.contains('telegram')) return 'telegram';
    if (creator.contains('signal')) return 'signal';
    if (creator.contains('discord')) return 'discord';
    if (creator.contains('slack')) return 'slack';
  }

  // 6. Check room members for bridge bot
  // Check ALL members and their display names
  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final entry in memberStates.entries) {
      final memberId = entry.key.toLowerCase();
      final event = entry.value;
      final displayName = event.content['displayname']?.toString().toLowerCase() ?? '';
      
      if (memberId.contains('whatsapp') || displayName.contains('whatsapp') || displayName.contains('(wa)')) return 'whatsapp';
      if (memberId.contains('telegram') || displayName.contains('telegram')) return 'telegram';
      if (memberId.contains('signal') || displayName.contains('signal')) return 'signal';
      if (memberId.contains('discord') || displayName.contains('discord')) return 'discord';
      if (memberId.contains('slack') || displayName.contains('slack')) return 'slack';
    }
  }

  // Fallback for groups: if we can't find the bridge bot in loaded members
  // but the room is a group, assume WhatsApp
  if (!room.isDirectChat) {
    final memberCount = room.summary?.mJoinedMemberCount;
    if (memberCount == null || (memberCount > 2 && memberCount < 200)) {
      return 'whatsapp';
    }
  }

    // If isBridgeRoom is true but we can't determine type, it's a generic bridge
  if (isBridgeRoom(room)) {
    return 'other';
  }

  return null;
}
