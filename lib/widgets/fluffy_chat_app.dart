import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:android_system_font/android_system_font.dart'; // TEMPORARILY DISABLED - causes Kotlin daemon crash on cross-drive builds
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:Pulsly/config/routes.dart';
import 'package:Pulsly/config/themes.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/download_manager/download_manager.dart';
import 'package:Pulsly/utils/check_updates.dart';
import 'package:Pulsly/widgets/app_lock.dart';
import 'package:Pulsly/widgets/background_audio_player.dart';
import 'package:Pulsly/widgets/theme_builder.dart';
import '../config/app_config.dart';
import '../utils/custom_scroll_behaviour.dart';
import '../utils/scheduler_service.dart';
import 'matrix.dart';

class FluffyChatApp extends StatefulWidget {
  final Widget? testWidget;
  final List<Client> clients;
  final String? pincode;
  final SharedPreferences store;

  const FluffyChatApp({
    super.key,
    this.testWidget,
    required this.clients,
    required this.store,
    this.pincode,
  });

  /// getInitialLink may rereturn the value multiple times if this view is
  /// opened multiple times for example if the user logs out after they logged
  /// in with qr code or magic link.
  static bool gotInitialLink = false;

  // Router must be outside of build method so that hot reload does not reset
  // the current path.
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: AppRoutes.routes,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Ignore content:// URIs from shared media intents,
      // let receive_sharing_intent handle them instead.
      if (state.uri.scheme == 'content') return '/';
      return null;
    },
  );

  @override
  State<FluffyChatApp> createState() => _FluffyChatAppState();
}

class _FluffyChatAppState extends State<FluffyChatApp> {
  // final _androidSystemFontPlugin = AndroidSystemFont(); // DISABLED

  @override
  void initState() {
    super.initState();
    initPlatformState();
    _startScheduler();
    // Check for updates on app startup (with delay to let UI load)
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) checkForUpdates(context);
    });
  }

  void _startScheduler() {
    final client = widget.clients.firstOrNull;
    if (client != null) {
      SchedulerService.start(client);
    }
  }

  static Future<ByteData> _readFileBytes(String path) async {
    final bytes = await File(path).readAsBytes();
    return ByteData.view(bytes.buffer);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  // DISABLED - android_system_font plugin causes Kotlin daemon crash on cross-drive builds
  Future<void> initPlatformState() async {
    // Font loading disabled - was using android_system_font plugin
    // if (!mounted) return;
    // setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder:
          (
            context,
            themeMode,
            primaryColor,
            schemeVariant,
            pureBlack,
            twemoji,
          ) => MaterialApp.router(
            title: AppConfig.applicationName,
            themeMode: themeMode,
            theme: FluffyThemes.buildTheme(
              context,
              Brightness.light,
              primaryColor,
              schemeVariant,
              pureBlack,
              twemoji,
            ),
            darkTheme: FluffyThemes.buildTheme(
              context,
              Brightness.dark,
              primaryColor,
              schemeVariant,
              pureBlack,
              twemoji,
            ),
            scrollBehavior: CustomScrollBehavior(),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            routerConfig: FluffyChatApp.router,
            builder: (context, child) => AppLockWidget(
              pincode: widget.pincode,
              clients: widget.clients,
              // Need a navigator above the Matrix widget for
              // displaying dialogs
              child: DownloadManager(
                child: BackgroundAudioPlayer(
                  child: Matrix(
                    clients: widget.clients,
                    store: widget.store,
                    child: widget.testWidget ?? child,
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
