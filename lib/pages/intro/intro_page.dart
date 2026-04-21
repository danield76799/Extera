import 'package:flutter/material.dart';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:Pulsly/config/app_config.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/intro/flows/restore_backup_flow.dart';
import 'package:Pulsly/utils/platform_infos.dart';
import 'package:Pulsly/widgets/layouts/login_scaffold.dart';
import 'package:Pulsly/widgets/matrix.dart';

/// Plusly theme colors for branding pages
class PluslyColors {
  static const bgColor     = Color(0xFF0a0a0f);  // dark background
  static const textColor   = Color(0xFFFFFFFF);  // white text
  static const accentColor = Color(0xFF40E0D0);  // turquoise
  static const secondaryColor = Color(0xFF00B4A6);  // dark turquoise
}

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addMultiAccount = Matrix.of(
      context,
    ).widget.clients.any((client) => client.isLogged());

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: PluslyColors.bgColor,
        colorScheme: const ColorScheme.dark(
          surface: PluslyColors.bgColor,
          onSurface: PluslyColors.textColor,
          primary: PluslyColors.accentColor,
          onPrimary: PluslyColors.bgColor,
          secondary: PluslyColors.secondaryColor,
          onSecondary: PluslyColors.textColor,
        ),
        textTheme: const TextTheme(
          bodyLarge:  TextStyle(color: PluslyColors.textColor),
          bodyMedium: TextStyle(color: PluslyColors.textColor),
          labelLarge: TextStyle(color: PluslyColors.bgColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: PluslyColors.accentColor,
            foregroundColor: PluslyColors.bgColor,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConfig.borderRadius),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: PluslyColors.accentColor,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: PluslyColors.bgColor,
          foregroundColor: PluslyColors.textColor,
          elevation: 0,
        ),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return LoginScaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  context.pushReplacement('/rooms');
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(
                addMultiAccount
                    ? L10n.of(context).addAccount
                    : L10n.of(context).login,
              ),
              actions: [
                PopupMenuButton(
                  useRootNavigator: false,
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      onTap: () => restoreBackupFlow(context),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          const Icon(Icons.import_export_outlined),
                          const SizedBox(width: 12),
                          Text(L10n.of(context).hydrate),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => launchUrl(Uri.parse(AppConfig.privacyUrl)),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          const Icon(Icons.privacy_tip_outlined),
                          const SizedBox(width: 12),
                          Text(L10n.of(context).privacy),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => PlatformInfos.showDialog(context),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          const Icon(Icons.info_outlined),
                          const SizedBox(width: 12),
                          Text(L10n.of(context).about),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Hero(
                              tag: 'info-logo',
                              child: Image.asset(
                                './assets/start_logo.png',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: SelectableLinkify(
                              text: L10n.of(context).appIntro,
                              textScaleFactor: MediaQuery.textScalerOf(
                                context,
                              ).scale(1),
                              textAlign: TextAlign.center,
                              linkStyle: const TextStyle(
                                color: PluslyColors.accentColor,
                                decorationColor: PluslyColors.accentColor,
                              ),
                              onOpen: (link) => launchUrlString(link.url),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: .min,
                              crossAxisAlignment: .stretch,
                              children: [
                                ElevatedButton(
                                  onPressed: () => context.go(
                                    '${GoRouterState.of(context).uri.path}/sign_up',
                                  ),
                                  child: Text(L10n.of(context).createNewAccount),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: PluslyColors.bgColor,
                                    foregroundColor: PluslyColors.accentColor,
                                    side: const BorderSide(color: PluslyColors.accentColor),
                                    minimumSize: const Size(double.infinity, 56),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                                    ),
                                  ),
                                  onPressed: () => context.go(
                                    '${GoRouterState.of(context).uri.path}/sign_in',
                                  ),
                                  child: Text(L10n.of(context).signIn),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final client = await Matrix.of(
                                      context,
                                    ).getLoginClient();
                                    context.go(
                                      '${GoRouterState.of(context).uri.path}/login',
                                      extra: client,
                                    );
                                  },
                                  child: Text(L10n.of(context).loginWithMatrixId),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
