import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:matrix/matrix.dart';

/// Service to write recent chats data for the Android home screen widget
class ChatWidgetService {
  static const String _chatDataFileName = 'chat_widget_data.json';
  static const int _maxChats = 4;
  static const int _maxMessageChars = 40;

  /// Get the directory where widget data is stored
  /// Uses filesDir which is shared between Flutter and Android in the same app
  static Future<Directory> _getWidgetDataDirectory() async {
    if (kIsWeb) {
      return await getApplicationDocumentsDirectory();
    }
    
    // Use MethodChannel to get the exact path from Android
    try {
      final channel = MethodChannel('com.danield.plusly/widget_data');
      final path = await channel.invokeMethod<String>('getWidgetDataPath');
      if (path != null) {
        return Directory(path.substring(0, path.lastIndexOf('/')));
      }
    } catch (e) {
      Logs().e('Failed to get widget data path from Android', e);
    }
    
    // Fallback
    return await getApplicationSupportDirectory();
  }

  /// Update the widget with the latest chat data from all rooms
  static Future<void> updateWidgetData(List<Room> rooms) async {
    if (rooms.isEmpty) return;

    // Sort rooms by last event timestamp (most recent first)
    final sortedRooms = List<Room>.from(rooms)
      ..sort((a, b) {
        final aTime = a.lastEvent?.originServerTs ?? DateTime(1970);
        final bTime = b.lastEvent?.originServerTs ?? DateTime(1970);
        return bTime.compareTo(aTime);
      });

    // Take the most recent chats
    final recentRooms = sortedRooms.take(_maxChats);

    final chatData = recentRooms.map((room) {
      final lastEvent = room.lastEvent;
      String lastMessage = '';
      
      if (lastEvent != null) {
        if (lastEvent.type == EventTypes.Message) {
          lastMessage = lastEvent.body;
        } else if (lastEvent.type == EventTypes.Encrypted) {
          lastMessage = '🔒 Encrypted message';
        } else {
          lastMessage = lastEvent.type;
        }
      }
      
      // Truncate message
      if (lastMessage.length > _maxMessageChars) {
        lastMessage = '${lastMessage.substring(0, _maxMessageChars)}…';
      }

      // Get online status (simplified - would need presence data for real online status)
      final isOnline = false; // Default to offline, can be enhanced with presence

      // Format timestamp for widget
      String timestamp = '';
      if (lastEvent != null) {
        final ts = lastEvent.originServerTs;
        final now = DateTime.now();
        final diff = now.difference(ts);
        if (diff.inMinutes < 1) {
          timestamp = 'now';
        } else if (diff.inHours < 1) {
          timestamp = '${diff.inMinutes}m';
        } else if (diff.inHours < 24) {
          timestamp = '${diff.inHours}h';
        } else if (diff.inDays < 7) {
          timestamp = '${diff.inDays}d';
        } else {
          timestamp = '${ts.day}/${ts.month}';
        }
      }

      return {
        'chatId': room.id,
        'name': room.getLocalizedDisplayname(),
        'lastMessage': lastMessage,
        'isOnline': isOnline,
        'timestamp': timestamp,
      };
    }).toList();

    // Write to files directory - this is shared between Flutter and Android
    final directory = await _getWidgetDataDirectory();
    final file = File('${directory.path}/$_chatDataFileName');
    await file.writeAsString(jsonEncode(chatData));
  }

  /// Clear the widget data
  static Future<void> clearWidgetData() async {
    try {
      final directory = await _getWidgetDataDirectory();
      final file = File('${directory.path}/$_chatDataFileName');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      // Ignore errors when clearing
    }
  }
}
