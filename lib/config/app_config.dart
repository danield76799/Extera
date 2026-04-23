import 'dart:ui';

abstract class AppConfig {
  static const String pushIsolatePortName = 'push_isolate';
  static const String mainIsolatePortName = 'main_isolate';

  static const String bannerProfileField = 'chat.commet.profile_banner';

  static const String aboutProfileField = 'xyz.plusly.about';
  static const String updateCheckUrl =
      'https://raw.githubusercontent.com/danield76799/Plusly/main/plusly-version.txt';
  static const String downloadUpdateUrl =
      'https://github.com/danield76799/Plusly/releases';

  static const String appSsoUrlScheme = 'xyz.plusly.auth';

  static final String _applicationName = 'Plusly';

  static String get applicationName => _applicationName;
  static final String? _applicationWelcomeMessage = null;

  static String? get applicationWelcomeMessage => _applicationWelcomeMessage;
  static final String _defaultHomeserver = 'matrix.org';

  static bool alreadyCheckedUpdates = false;

  static String get defaultHomeserver => _defaultHomeserver;
  static const Color chatColor = primaryColor;
  static const bool allowOtherHomeservers = true;
  static const bool enableRegistration = true;
  static const Color primaryColor = Color(0xFF49AFC2);
  static const Color primaryColorLight = Color(0xFF6FC5D8);
  static const Color secondaryColor = Color(0xFF3A8FA0);
  static final String _privacyUrl = 'https://plusly.im/privacy';

  static String get privacyUrl => _privacyUrl;
  static const String website = 'https://plusly.im';
  static const String enablePushTutorial =
      'https://github.com/krille-chan/fluffychat/wiki/Push-Notifications-without-Google-Services';
  static const String encryptionTutorial =
      'https://github.com/krille-chan/fluffychat/wiki/How-to-use-end-to-end-encryption-in-FluffyChat';
  static const String startChatTutorial =
      'https://github.com/krille-chan/fluffychat/wiki/How-to-Find-Users-in-FluffyChat';
  static const String appId = 'com.danield.plusly';
  static const String appOpenUrlScheme = 'com.danield.plusly';
  static final String _webBaseUrl = 'https://fluffychat.im/web';

  static String get webBaseUrl => _webBaseUrl;
  static const String sourceCodeUrl = 'https://github.com/danield76799/Plusly';
  static const String supportUrl = 'https://plusly.im/help';
  static const String changelogUrl = 'https://plusly.im/changelog';
  static final Uri newIssueUrl = Uri(
    scheme: 'https',
    host: 'github.com',
    path: '/danield76799/Plusly/issues',
  );

  static const bool hideTypingUsernames = false;
  static const bool hideAllStateEvents = false;
  static const String inviteLinkPrefix = 'https://matrix.to/#/';
  static const String deepLinkPrefix = 'com.danield.plusly://chat/';
  static const String schemePrefix = 'matrix:';
  static const String pushNotificationsChannelId = 'plusly_push';
  static const String pushNotificationsAppId = 'com.danield.plusly';
  static const String recentEmojisAccountDataKey = 'io.element.recent_emoji';
  static const double borderRadius = 18.0;
  static const double columnWidth = 360.0;
  static final Uri homeserverList = Uri(
    scheme: 'https',
    host: 'servers.joinmatrix.org',
    path: 'servers.json',
  );
  static const Set<String> defaultReactions = {'👍', '❤️', '😂', '😮', '😢'};

  // See CREDITS.md
  static const Map<String, String> ringtoneFiles = {
    'The Groove One': 'sounds/ringtones/the_groove_one.mp3',
    'Future Synth': 'sounds/ringtones/future_synth.mp3',
  };

  static void loadFromJson(Map<String, dynamic> json) {
    // Config loading is now immutable - values are set at compile time
    // For dynamic config, use a separate config provider
    Logs().i('Config loaded from JSON (immutable mode)');
  }
}
