import 'package:extera_next/pages/download_manager/download_manager.dart';
import 'package:flutter/material.dart';

import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:extera_next/config/routes.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/widgets/app_lock.dart';
import 'package:extera_next/widgets/theme_builder.dart';
import '../config/app_config.dart';
import '../utils/custom_scroll_behaviour.dart';
import 'matrix.dart';

class FluffyChatApp extends StatelessWidget {
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
    routes: AppRoutes.routes,
    debugLogDiagnostics: true,
  );

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, themeMode, primaryColor, pureBlack) =>
          MaterialApp.router(
            title: AppConfig.applicationName,
            themeMode: themeMode,
            theme: FluffyThemes.buildTheme(
              context,
              Brightness.light,
              primaryColor,
              pureBlack,
            ),
            darkTheme: FluffyThemes.buildTheme(
              context,
              Brightness.dark,
              primaryColor,
              pureBlack,
            ),
            scrollBehavior: CustomScrollBehavior(),
            localizationsDelegates: L10n.localizationsDelegates,
            supportedLocales: L10n.supportedLocales,
            routerConfig: router,
            builder: (context, child) => AppLockWidget(
              pincode: pincode,
              clients: clients,
              // Need a navigator above the Matrix widget for
              // displaying dialogs
              child: ChangeNotifierProvider(
                create: (context) => DownloadManagerController(),
                child: Matrix(
                  clients: clients,
                  store: store,
                  child: testWidget ?? child,
                ),
              ),
            ),
          ),
    );
  }
}
