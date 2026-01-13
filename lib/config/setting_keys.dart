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
  presenceStatus<String>('xyz.extera.presence_status', 'online'),
  avatarBorderRadius<double>('xyz.extera.next.avatarBorderRadius', 1),
  autoMarkUnavailable<bool>('xyz.extera.next.autoMarkUnavailable', true),
  incomingCallsOnLockScreen<bool>('xyz.extera.next.incomingCallsOnLockScreen', true),
  pushToTalkHotkey<bool>('xyz.extera.next.pushToTalkHotkey', false),
  twemojiFont<bool>('xyz.extera.next.twemojiFont', false),
  checkForUpdates<bool>('xyz.extera.next.checkForUpdates', true),
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
}

extension AppSettingsBoolExtension on AppSettings<bool> {
  bool getItem(SharedPreferences store) => store.getBool(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, bool value) =>
      store.setBool(key, value);
}

extension AppSettingsStringExtension on AppSettings<String> {
  String getItem(SharedPreferences store) =>
      store.getString(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, String value) =>
      store.setString(key, value);
}

extension AppSettingsIntExtension on AppSettings<int> {
  int getItem(SharedPreferences store) => store.getInt(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, int value) =>
      store.setInt(key, value);
}

extension AppSettingsDoubleExtension on AppSettings<double> {
  double getItem(SharedPreferences store) =>
      store.getDouble(key) ?? defaultValue;

  Future<void> setItem(SharedPreferences store, double value) =>
      store.setDouble(key, value);
}
