import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

/// Bridge metadata: label, icon, color
class BridgeTypeInfo {
  final String label;
  final IconData icon;
  final Color color;
  const BridgeTypeInfo(this.label, this.icon, this.color);
}

const Map<String, BridgeTypeInfo> _bridgeTypeInfo = {
  'whatsapp': BridgeTypeInfo('WhatsApp', Icons.chat, Color(0xFF25D366)),
  'telegram': BridgeTypeInfo('Telegram', Icons.send, Color(0xFF0088CC)),
  'signal': BridgeTypeInfo('Signal', Icons.wifi_tethering, Color(0xFF3A76F0)),
  'discord': BridgeTypeInfo('Discord', Icons.headset, Color(0xFF5865F2)),
  'slack': BridgeTypeInfo('Slack', Icons.tag, Color(0xFF4A154B)),
  'matrix': BridgeTypeInfo('Matrix', Icons.view_module, Color(0xFF0DBD8B)),
};

/// Gets a display name for a bridge type
String getBridgeTypeLabel(String? type) => _bridgeTypeInfo[type]?.label ?? 'Other';

/// Gets an icon for a bridge type
IconData getBridgeTypeIcon(String? type) => _bridgeTypeInfo[type]?.icon ?? Icons.link;

/// Gets a color for a bridge type
Color getBridgeTypeColor(String? type) => _bridgeTypeInfo[type]?.color ?? Colors.grey;

/// Gets all metadata for a bridge type
BridgeTypeInfo? getBridgeTypeInfo(String? type) => _bridgeTypeInfo[type];

/// Known bridge bot suffixes/patterns for common Matrix bridges
const _excludedBotPatterns = ['extera'];

const _bridgePatterns = [
  'bot.signal', 'bot.telegram', 'bot.whatsapp', 'bot.discord', 'bot.slack',
  'signalbot', 'telegrambot', 'whatsappbot', 'discordbot', 'slackbot',
  'bridgebot', 'relaybot',
  'whatsapp_', 'telegram_', 'signal_', 'discord_', 'slack_',
  'wa-bot:', 'telegram-bot:', 'mautrix-telegram:', 'tgbot:', 'tg-bot:',
  'heisenbridge:', 'beeper:', 't2bot:', 'whappbot:', 'mx-puppet-bridge:',
  'mx-puppet:', 'whatsapp-bot:', 'signal-bot:', 'discord-bot:', 'slack-bot:',
  'hangouts-bot:', 'gitter-bot:', 'bridged:',
];

const _bridgeNamePatterns = [
  'whatsapp', 'telegram', 'signal', 'discord', 'slack', 'beeper',
];

const _aliasPatterns = [
  'telegram_', 'discord_', 'whatsapp_', 'signal_', 'mautrix_', 'bridge_',
  'puppet_', 'beeper_',
];

/// Pre-compiled regex for performance
final _excludedBotRegex = RegExp(
  _excludedBotPatterns.map(RegExp.escape).join('|'),
  caseSensitive: false,
);
final _bridgeBotRegex = RegExp(
  _bridgePatterns.map(RegExp.escape).join('|'),
  caseSensitive: false,
);
final _bridgeNameRegex = RegExp(
  _bridgeNamePatterns.map(RegExp.escape).join('|'),
  caseSensitive: false,
);
final _aliasRegex = RegExp(
  _aliasPatterns.map(RegExp.escape).join('|'),
  caseSensitive: false,
);

/// Known bridge state event types
const _bridgeStateEventTypes = [
  'io.element.bridge',
  'uk.half-shot.msc2776.bridge',
  'com.beeper.bridge',
];

/// Checks if a user ID matches known bridge bot patterns
bool isBridgeBotByUserId(String userId) {
  if (_excludedBotRegex.hasMatch(userId)) return false;
  return _bridgeBotRegex.hasMatch(userId);
}

/// Checks if a room is a bridge room by looking at the bridge state events
bool isBridgeRoomByState(Room room) {
  for (final eventType in _bridgeStateEventTypes) {
    if (room.getState(eventType) != null) return true;
  }
  return false;
}

/// Checks if a user ID is a known bridge bot
/// Also checks direct chat matrix ID as bridge bots often initiate DM
bool isBridgeBot(String userId, Room room) {
  if (isBridgeBotByUserId(userId)) return true;
  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }
  return false;
}

/// Checks if a room is a bridge room (has bridge-related state or direct chat with bridge bot)
bool isBridgeRoom(Room room) {
  if (isBridgeRoomByState(room)) return true;

  final directChatMatrixId = room.directChatMatrixID;
  if (directChatMatrixId != null && isBridgeBotByUserId(directChatMatrixId)) {
    return true;
  }

  final roomName = room.name ?? '';
  final roomTopic = room.topic ?? '';
  if (_bridgeNameRegex.hasMatch('$roomName $roomTopic')) return true;

  final canonicalAlias = room.canonicalAlias ?? '';
  if (_aliasRegex.hasMatch(canonicalAlias)) return true;

  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final userId in memberStates.keys.take(20)) {
      if (isBridgeBotByUserId(userId)) return true;
    }
  }

  return false;
}

// --- Bridge type detection helpers ---

String? _detectFromUserId(String userId) {
  final lower = userId.toLowerCase();
  if (lower.contains('wa-bot') || lower.contains('whappbot') || lower.contains('whatsapp_') || lower.contains('bot.whatsapp')) return 'whatsapp';
  if (lower.contains('telegram-bot') || lower.contains('mautrix-telegram') || lower.contains('tgbot') || lower.contains('tg-bot') || lower.contains('bot.telegram') || lower.contains('telegram_')) return 'telegram';
  if (lower.contains('signal-bot') || lower.contains('bot.signal') || lower.contains('signal_')) return 'signal';
  if (lower.contains('discord-bot') || lower.contains('bot.discord') || lower.contains('discord_')) return 'discord';
  if (lower.contains('slack-bot') || lower.contains('bot.slack') || lower.contains('slack_')) return 'slack';
  if (lower.contains('hangouts-bot')) return 'hangouts';
  if (lower.contains('gitter-bot')) return 'gitter';
  if (lower.contains('mx-puppet')) return 'puppet';
  return null;
}

String? _detectFromNameTopic(String text) {
  final lower = text.toLowerCase();
  if (lower.contains('whatsapp_')) return 'whatsapp';
  if (lower.contains('telegram_')) return 'telegram';
  return null;
}

String? _detectFromAlias(String text) {
  final lower = text.toLowerCase();
  if (lower.contains('whatsapp')) return 'whatsapp';
  if (lower.contains('telegram')) return 'telegram';
  if (lower.contains('signal')) return 'signal';
  if (lower.contains('discord')) return 'discord';
  if (lower.contains('slack')) return 'slack';
  return null;
}

String? _detectFromGeneric(String text) {
  final lower = text.toLowerCase();
  if (lower.contains('whatsapp')) return 'whatsapp';
  if (lower.contains('telegram')) return 'telegram';
  if (lower.contains('signal')) return 'signal';
  if (lower.contains('discord')) return 'discord';
  if (lower.contains('slack')) return 'slack';
  return null;
}

/// TTL-based cache for getBridgeType results
class BridgeTypeCache {
  static final BridgeTypeCache instance = BridgeTypeCache._();
  BridgeTypeCache._();

  final Map<String, _CacheEntry> _cache = {};
  static const _ttl = Duration(seconds: 10);

  String? get(String roomId) {
    final entry = _cache[roomId];
    if (entry == null) return null;
    if (DateTime.now().difference(entry.time) > _ttl) {
      _cache.remove(roomId);
      return null;
    }
    return entry.value;
  }

  void set(String roomId, String? value) {
    _cache[roomId] = _CacheEntry(value, DateTime.now());
  }

  void clear() => _cache.clear();
}

class _CacheEntry {
  final String? value;
  final DateTime time;
  _CacheEntry(this.value, this.time);
}

/// Gets the bridge type from a room (e.g., 'whatsapp', 'telegram')
/// Returns null if not a bridge room.
/// Results are cached per room ID for 10 seconds.
String? getBridgeType(Room room) {
  final cached = BridgeTypeCache.instance.get(room.id);
  if (cached != null) return cached;

  String? type;

  // 1. Direct chat matrix ID
  type = _detectFromUserId(room.directChatMatrixID ?? '');
  if (type != null) {
    BridgeTypeCache.instance.set(room.id, type);
    return type;
  }

  // 2. Room name / topic
  type = _detectFromNameTopic(room.name ?? '') ?? _detectFromNameTopic(room.topic ?? '');
  if (type != null) {
    BridgeTypeCache.instance.set(room.id, type);
    return type;
  }

  // 3. Canonical alias
  type = _detectFromAlias(room.canonicalAlias ?? '');
  if (type != null) {
    BridgeTypeCache.instance.set(room.id, type);
    return type;
  }

  // 4. Room creator
  final createEvent = room.getState(EventTypes.RoomCreate);
  if (createEvent != null) {
    final creator = createEvent.content['creator']?.toString() ?? '';
    type = _detectFromGeneric(creator);
    if (type != null) {
      BridgeTypeCache.instance.set(room.id, type);
      return type;
    }
  }

  // 5. Members (limit scan for performance)
  final memberStates = room.states[EventTypes.RoomMember];
  if (memberStates != null) {
    for (final memberId in memberStates.keys.take(20)) {
      type = _detectFromGeneric(memberId);
      if (type != null) {
        BridgeTypeCache.instance.set(room.id, type);
        return type;
      }
    }
  }

  // 6. State events
  for (final eventType in _bridgeStateEventTypes) {
    final stateEvent = room.getState(eventType);
    if (stateEvent != null) {
      final content = stateEvent.content;
      final bridgeName = content['bridge_name'] ?? content['name'] ?? content['service'];
      if (bridgeName != null) {
        final result = bridgeName.toString().toLowerCase();
        BridgeTypeCache.instance.set(room.id, result);
        return result;
      }
      final result = eventType == 'io.element.bridge' ? 'element' : 'bridge';
      BridgeTypeCache.instance.set(room.id, result);
      return result;
    }
  }

  BridgeTypeCache.instance.set(room.id, null);
  return null;
}
