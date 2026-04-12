import 'package:matrix/matrix.dart';

/// Known bridge bot suffixes/patterns for common Matrix bridges
const _bridgePatterns = [
  'wa-bot:',
  'telegram-bot:',
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
bool isBridgeBot(UserId userId, Room room) {
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

/// Checks if a room is a bridge room (has bridge-related participants or state)
bool isBridgeRoom(Room room) {
  // Check by room state events
  if (isBridgeRoomByState(room)) {
    return true;
  }

  // Check if any participant is a bridge bot
  for (final userId in room.joinMemberIds) {
    if (isBridgeBotByUserId(userId.toString())) {
      return true;
    }
  }

  // Check direct chat matrix ID
  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }

  return false;
}

/// Gets the bridge type from a room (e.g., 'whatsapp', 'telegram')
/// Returns null if not a bridge room
String? getBridgeType(Room room) {
  final userId = room.directChatMatrixID ?? '';

  if (userId.contains('wa-bot') || userId.contains('whappbot') || userId.contains('whatsapp')) {
    return 'whatsapp';
  }
  if (userId.contains('telegram-bot')) {
    return 'telegram';
  }
  if (userId.contains('signal-bot')) {
    return 'signal';
  }
  if (userId.contains('discord-bot')) {
    return 'discord';
  }
  if (userId.contains('irc-bot')) {
    return 'irc';
  }
  if (userId.contains('slack-bot')) {
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
