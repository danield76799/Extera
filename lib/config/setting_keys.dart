import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:matrix/matrix_api_lite/utils/logs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Pulsly/utils/platform_infos.dart';

abstract class SettingKeys {
  static const String appLockKey = 'chat.fluffy.app_lock';
}

enum AppSettings<T> {
  enablePeopleTab<bool>('xyz.plusly.enablePeopleTab', true),
  autoLoadMedia<bool>('xyz.plusly.autoLoadMedia', true),
  showCameraButton<bool>('xyz.plusly.cameraButton', true),
  stickerScale<double>('xyz.plusly.stickerScale', 2),
  wallpaperPath<String>('xyz.plusly.wallpaper_path', ''),
  wallpaperOpacity<double>('xyz.plusly.wallpaper_opacity', 0.5),
  wallpaperBlur<double>('xyz.plusly.wallpaper_blur', 0.0),
  experimentalJitsi<bool>('xyz.plusly.jitsi', false),
  jitsiDomain<String>('xyz.plusly.jitsi_domain', 'meet.jit.si'),
  applicationName<String>('xyz.plusly.app_name', 'Plusly'),
  logoUrl<String>('xyz.plusly.logo_url', 'https://plusly.im/logo.svg'),
  privacyPolicy<String>('xyz.plusly.privacy', 'https://plusly.im/privacy'),
  tos<String>('xyz.plusly.tos', 'https://plusly.im/terms'),
  website<String>('xyz.plusly.website', 'https://plusly.im'),
  defaultHomeserver<String>('xyz.plusly.default_hs', 'https://plusly.im'),
  enableMatrixNativeOIDC<bool>('xyz.plusly.enable_matrix_native_oidc', false),
  systemFont<bool>('xyz.plusly.systemFont', false),
  translationTargetLanguage<String>('xyz.plusly.translationTargetLanguage', ''),
  exteraServiceUrl<String>(
    'xyz.plusly.serviceUrl',
    'https://plusly.im/service',
  ),
  latexMath<bool>('xyz.plusly.latexMath', false),
  messageTranslation<bool>('xyz.plusly.messageTranslation', true),
  useLegacyChatListAppBar<bool>('xyz.plusly.legacyAppBar', false),
  useLegacyNavBar<bool>('xyz.plusly.legacyNavBar', false),
  showSpaceRoomsInGlobalList<bool>(
    'xyz.plusly.showSpaceRoomsInGlobalList',
    true,
  ),
  unifiedPushRegistered<bool>('chat.fluffy.unifiedpush.registered', false),
  unifiedPushEndpoint<String>('chat.fluffy.unifiedpush.endpoint', ''),
  showNoGoogle<bool>('chat.fluffy.show_no_google', false),
  twemojiFont<bool>('xyz.plusly.next.twemojiFont', false),
  checkForUpdates<bool>('xyz.plusly.next.checkForUpdates', true),
  colorSchemeSeed<int>('xyz.plusly.next.colorSchemeSeed', 0x49AFC2),
  hideAvatarsInInvites<bool>('xyz.plusly.next.hideAvatarsInInvites', true),
  displayNavigationRail<bool>('chat.fluffy.displayNavigationRail', true),
  httpProxy<String>('xyz.plusly.next.httpProxy', ''),
  cleanExif<bool>('xyz.plusly.next.cleanExif', true),
  doNotSendIfCantClean<bool>('xyz.plusly.next.doNotSendIfCantClean', true),
  themeMode<String>('xyz.plusly.next.themeMode', 'system'),
  pureBlack<bool>('xyz.plusly.next.pureBlack', false),
  renderHtml<bool>('chat.fluffy.renderHtml', true),
  schemeVariant<int>('xyz.plusly.next.schemeVariant', 0),
  hideRedactedEvents<bool>('chat.fluffy.hideRedactedEvents', false),
  hideUnknownEvents<bool>('chat.fluffy.hideUnknownEvents', true),
  // hideUnimportantStateEvents<bool>(
  //     'chat.fluffy.hideUnimportantStateEvents', true),
  separateChatTypes<bool>('chat.fluffy.separateChatTypes', false),
  autoplayImages<bool>('chat.fluffy.autoplay_images', true),
  sendTypingNotifications<bool>('chat.fluffy.send_typing_notifications', true),
  sendPublicReadReceipts<bool>('chat.fluffy.send_public_read_receipts', true),
  swipeRightToLeftToReply<bool>('chat.fluffy.swipeRightToLeftToReply', true),
  sendOnEnter<bool>('chat.fluffy.send_on_enter', true),
  fontSizeFactor<double>('chat.fluffy.font_size_factor', 1.0),
  messageFontSize<double>('chat.fluffy.message_font_size', 16.0),
  hideMemberChangesInPublicChats<bool>(
    'chat.fluffy.hide_member_changes_in_public_chats',
    false,
  ),
  experimentalVoip<bool>('chat.fluffy.experimental_voip', false),
  showPresences<bool>('chat.fluffy.show_presences', true),
  presenceStatus<String>('xyz.plusly.presence_status', 'online'),
  avatarBorderRadius<double>('xyz.plusly.next.avatarBorderRadius', 1),
  autoMarkUnavailable<bool>('xyz.plusly.next.autoMarkUnavailable', true),
  incomingCallsOnLockScreen<bool>(
    'xyz.plusly.next.incomingCallsOnLockScreen',
    true,
  ),
  pushToTalkHotkey<bool>('xyz.plusly.next.pushToTalkHotkey', false),
  ringtone<String>('xyz.plusly.next.ringtone', 'system'),
  audioRecordingNumChannels<int>('audioRecordingNumChannels', 1),
  audioRecordingAutoGain<bool>('audioRecordingAutoGain', true),
  audioRecordingEchoCancel<bool>('audioRecordingEchoCancel', false),
  audioRecordingNoiseSuppress<bool>('audioRecordingNoiseSuppress', true),
  audioRecordingBitRate<int>('audioRecordingBitRate', 64000),
  audioRecordingSamplingRate<int>('audioRecordingSamplingRate', 44100),
  enableVideoNotes<bool>('xyz.plusly.next.enableVideoNotes', false),
  enableChatFrostedGlass<bool>('xyz.plusly.next.enableChatFrostedGlass', false),
  enableAppBarCenterTitle<bool>(
    'xyz.plusly.next.enableAppBarCenterTitle',
    false,
  ),
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
