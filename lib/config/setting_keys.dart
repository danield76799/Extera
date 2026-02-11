import 'dart:convert';

import 'package:extera_next/utils/platform_infos.dart';
import 'package:flutter/foundation.dart';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix_api_lite/utils/logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingKeys {
  static const String avatarBorderRadius = 'xyz.extera.next.avatarBorderRadius';
  static const String autoMarkUnavailable = 'xyz.extera.next.autoMarkUnavailable';
  static const String pushToTalkHotkey = 'xyz.extera.next.pushToTalkHotkey';
  static const String incomingCallsOnLockScreen = 'xyz.extera.next.incomingCallsOnLockScreen';
  static const String checkForUpdates = 'xyz.extera.next.checkForUpdates';
  static const String twemojiFont = 'xyz.extera.next.twemojiFont';
  static const String ringtone = 'xyz.extera.next.ringtone';
  static const String httpProxy = 'xyz.extera.next.httpProxy';
  static const String cleanExif = 'xyz.extera.next.cleanExif';
  static const String doNotSendIfCantClean =
      'xyz.extera.next.doNotSendIfCantClean';
  static const String displayNavigationRail =
      'chat.fluffy.displayNavigationRail';
  static const String hideAvatarsInInvites =
      'xyz.extera.next.hideAvatarsInInvites';
  static const String pureBlack = 'xyz.extera.next.pureBlack';
  static const String renderHtml = 'chat.fluffy.renderHtml';
  static const String hideRedactedEvents = 'chat.fluffy.hideRedactedEvents';
  static const String hideUnknownEvents = 'chat.fluffy.hideUnknownEvents';
  static const String hideUnimportantStateEvents =
      'chat.fluffy.hideUnimportantStateEvents';
  static const String separateChatTypes = 'chat.fluffy.separateChatTypes';
  static const String sentry = 'sentry';
  static const String theme = 'theme';
  static const String codeLanguage = 'code_language';
  static const String showNoGoogle = 'chat.fluffy.show_no_google';
  static const String fontSizeFactor = 'chat.fluffy.font_size_factor';
  static const String showNoPid = 'chat.fluffy.show_no_pid';
  static const String databasePassword = 'database-password';
  static const String appLockKey = 'chat.fluffy.app_lock';
  static const String unifiedPushRegistered =
      'chat.fluffy.unifiedpush.registered';
  static const String unifiedPushEndpoint = 'chat.fluffy.unifiedpush.endpoint';
  static const String ownStatusMessage = 'chat.fluffy.status_msg';
  static const String dontAskForBootstrapKey =
      'chat.fluffychat.dont_ask_bootstrap';
  static const String autoplayImages = 'chat.fluffy.autoplay_images';
  static const String sendTypingNotifications =
      'chat.fluffy.send_typing_notifications';
  static const String sendPublicReadReceipts =
      'chat.fluffy.send_public_read_receipts';
  static const String sendOnEnter = 'chat.fluffy.send_on_enter';
  static const String swipeRightToLeftToReply =
      'chat.fluffy.swipeRightToLeftToReply';
  static const String experimentalVoip = 'chat.fluffy.experimental_voip';
  static const String showPresences = 'chat.fluffy.show_presences';
  static const String enableGradient = 'xyz.extera.next.enableGradient';
}

enum AppSettings<T> {
  useLegacyChatListAppBar<bool>('xyz.extera.legacyAppBar', false),
  useLegacyNavBar<bool>('xyz.extera.legacyNavBar', false),
  showSpaceRoomsInGlobalList<bool>('xyz.extera.showSpaceRoomsInGlobalList', true),
  unifiedPushRegistered<bool>(
      'chat.fluffy.unifiedpush.registered', false),
  unifiedPushEndpoint<String>(
      'chat.fluffy.unifiedpush.endpoint', ''),
  showNoGoogle<bool>('chat.fluffy.show_no_google', false),
  twemojiFont<bool>('xyz.extera.next.twemojiFont', false),
  checkForUpdates<bool>('xyz.extera.next.checkForUpdates', true),
  colorSchemeSeed<int>(
    'xyz.extera.next.colorSchemeSeed',
    0x5625BA,
  ),
  hideAvatarsInInvites<bool>(
      'xyz.extera.next.hideAvatarsInInvites', true),
  displayNavigationRail<bool>(
      'chat.fluffy.displayNavigationRail', true),
  httpProxy<String>('xyz.extera.next.httpProxy', ''),
  cleanExif<bool>('xyz.extera.next.cleanExif', true),
  doNotSendIfCantClean<bool>(
      'xyz.extera.next.doNotSendIfCantClean', true),
      themeMode<String>('xyz.extera.next.themeMode', 'system'),
  pureBlack<bool>('xyz.extera.next.pureBlack', false),
  renderHtml<bool>('chat.fluffy.renderHtml', true),
  schemeVariant<int>(
      'xyz.extera.next.schemeVariant',
      0,
  ),
  hideRedactedEvents<bool>('chat.fluffy.hideRedactedEvents', false),
  hideUnknownEvents<bool>('chat.fluffy.hideUnknownEvents', true),
  hideUnimportantStateEvents<bool>(
      'chat.fluffy.hideUnimportantStateEvents', true),
  separateChatTypes<bool>('chat.fluffy.separateChatTypes', false),
  autoplayImages<bool>('chat.fluffy.autoplay_images', true),
  sendTypingNotifications<bool>(
      'chat.fluffy.send_typing_notifications', true),
  sendPublicReadReceipts<bool>(
      'chat.fluffy.send_public_read_receipts', true),
  swipeRightToLeftToReply<bool>(  
      'chat.fluffy.swipeRightToLeftToReply', true),
  sendOnEnter<bool>('chat.fluffy.send_on_enter', true),
  fontSizeFactor<double>('chat.fluffy.font_size_factor', 1.0),
  messageFontSize<double>('chat.fluffy.message_font_size', 16.0),
  hideMemberChangesInPublicChats<bool>(
      'chat.fluffy.hide_member_changes_in_public_chats', false),
  experimentalVoip<bool>('chat.fluffy.experimental_voip', false),
  showPresences<bool>('chat.fluffy.show_presences', true),
  presenceStatus<String>('xyz.extera.presence_status', 'online'),
  avatarBorderRadius<double>('xyz.extera.next.avatarBorderRadius', 1),
  autoMarkUnavailable<bool>('xyz.extera.next.autoMarkUnavailable', true),
  incomingCallsOnLockScreen<bool>('xyz.extera.next.incomingCallsOnLockScreen', true),
  pushToTalkHotkey<bool>('xyz.extera.next.pushToTalkHotkey', false),
  ringtone<String>('xyz.extera.next.ringtone', 'system'),
  audioRecordingNumChannels<int>('audioRecordingNumChannels', 1),
  audioRecordingAutoGain<bool>('audioRecordingAutoGain', true),
  audioRecordingEchoCancel<bool>('audioRecordingEchoCancel', false),
  audioRecordingNoiseSuppress<bool>('audioRecordingNoiseSuppress', true),
  audioRecordingBitRate<int>('audioRecordingBitRate', 64000),
  audioRecordingSamplingRate<int>('audioRecordingSamplingRate', 44100),
  enableSoftLogout<bool>('enableSoftLogout', false),
  enableGradient<bool>('enableGradient', true),
  pushNotificationsGatewayUrl<String>(
    'pushNotificationsGatewayUrl',
    'https://push.fluffychat.im/_matrix/push/v1/notify',
  ),
  pushNotificationsPusherFormat<String>(
    'pushNotificationsPusherFormat',
    'event_id_only',
  ),
  shareKeysWith<String>('chat.fluffy.share_keys_with_2', 'all'),
  noEncryptionWarningShown<bool>(
    'chat.fluffy.no_encryption_warning_shown',
    false,
  ),
  displayChatDetailsColumn('chat.fluffy.display_chat_details_column', false);

  final String key;
  final T defaultValue;

  const AppSettings(this.key, this.defaultValue);

  static SharedPreferences get store => _store!;
  static SharedPreferences? _store;

  static Future<SharedPreferences> init({bool loadWebConfigFile = true}) async {
    if (AppSettings._store != null) return AppSettings.store;

    final store = AppSettings._store = await SharedPreferences.getInstance();

    // Migrate wrong datatype for fontSizeFactor
    final fontSizeFactorString = Result(
      () => store.getString(AppSettings.fontSizeFactor.key),
    ).asValue?.value;
    if (fontSizeFactorString != null) {
      Logs().i('Migrate wrong datatype for fontSizeFactor!');
      await store.remove(AppSettings.fontSizeFactor.key);
      final fontSizeFactor = double.tryParse(fontSizeFactorString);
      if (fontSizeFactor != null) {
        await store.setDouble(AppSettings.fontSizeFactor.key, fontSizeFactor);
      }
    }

    if (store.getBool(AppSettings.sendOnEnter.key) == null) {
      await store.setBool(AppSettings.sendOnEnter.key, !PlatformInfos.isMobile);
    }
    if (kIsWeb && loadWebConfigFile) {
      try {
        final configJsonString = utf8.decode(
          (await http.get(Uri.parse('config.json'))).bodyBytes,
        );
        final configJson =
            json.decode(configJsonString) as Map<String, Object?>;
        for (final setting in AppSettings.values) {
          if (store.get(setting.key) != null) continue;
          final configValue = configJson[setting.name];
          if (configValue == null) continue;
          if (configValue is bool) {
            await store.setBool(setting.key, configValue);
          }
          if (configValue is String) {
            await store.setString(setting.key, configValue);
          }
          if (configValue is int) {
            await store.setInt(setting.key, configValue);
          }
          if (configValue is double) {
            await store.setDouble(setting.key, configValue);
          }
        }
      } on FormatException catch (_) {
        Logs().v('[ConfigLoader] config.json not found');
      } catch (e) {
        Logs().v('[ConfigLoader] config.json not found', e);
      }
    }

    return store;
  }
}

extension AppSettingsBoolExtension on AppSettings<bool> {
  bool get value {
    final value = Result(() => AppSettings.store.getBool(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(bool value) => AppSettings.store.setBool(key, value);
}

extension AppSettingsStringExtension on AppSettings<String> {
  String get value {
    final value = Result(() => AppSettings.store.getString(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(String value) => AppSettings.store.setString(key, value);
}

extension AppSettingsIntExtension on AppSettings<int> {
  int get value {
    final value = Result(() => AppSettings.store.getInt(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(int value) => AppSettings.store.setInt(key, value);
}

extension AppSettingsDoubleExtension on AppSettings<double> {
  double get value {
    final value = Result(() => AppSettings.store.getDouble(key));
    final error = value.asError;
    if (error != null) {
      Logs().e(
        'Unable to fetch $key from storage. Removing entry...',
        error.error,
        error.stackTrace,
      );
    }
    return value.asValue?.value ?? defaultValue;
  }

  Future<void> setItem(double value) => AppSettings.store.setDouble(key, value);
}
