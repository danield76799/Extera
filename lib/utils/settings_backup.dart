import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBackup {
  static const _backupFileName = 'plusly_settings_backup.json';

  static Future<Map<String, dynamic>> export() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final result = <String, dynamic>{};
    for (final key in keys) {
      final value = prefs.get(key);
      if (value != null) {
        result[key] = value;
      }
    }
    return result;
  }

  static Future<void> import(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;
      if (value is bool) {
        await prefs.setBool(key, value);
      } else if (value is int) {
        await prefs.setInt(key, value);
      } else if (value is double) {
        await prefs.setDouble(key, value);
      } else if (value is String) {
        await prefs.setString(key, value);
      } else if (value is List) {
        final stringList = value.whereType<String>().toList();
        await prefs.setStringList(key, stringList);
      }
    }
  }

  /// Saves backup to the app documents directory and returns the file path.
  static Future<String> saveToAppFolder() async {
    final data = await export();
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$_backupFileName');
    await file.writeAsString(jsonString);
    return file.path;
  }

  static Future<void> shareExport(BuildContext context) async {
    final data = await export();
    final jsonString = const JsonEncoder.withIndent('  ').convert(data);
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$_backupFileName');
    await file.writeAsString(jsonString);
    await Share.shareXFiles([
      XFile(file.path),
    ], subject: 'Plusly Settings Backup');
  }

  static Future<Map<String, dynamic>?> pickAndRead() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );
    if (result == null || result.files.isEmpty) return null;
    final bytes = result.files.first.bytes;
    if (bytes == null) return null;
    final jsonString = utf8.decode(bytes);
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  /// Tries to read the default backup file from the app documents directory.
  static Future<Map<String, dynamic>?> readFromAppFolder() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$_backupFileName');
    if (!await file.exists()) return null;
    final jsonString = await file.readAsString();
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
