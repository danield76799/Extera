import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:matrix/matrix.dart';
import 'package:universal_html/html.dart' as html;

import 'package:Pulsly/config/setting_keys.dart';
import 'package:Pulsly/utils/matrix_sdk_extensions/oidc_session_json_extension.dart';
import 'package:Pulsly/utils/sign_in_flows/calc_redirect_url.dart';

/// Web-safe storage for OIDC session data using sessionStorage.
/// This is more secure than SharedPreferences because:
/// - Data is cleared when the browser tab is closed
/// - Data is isolated to the same tab (origin-specific)
/// - Not accessible by other browser tabs or cross-site scripts
void _storeOidcSessionWeb(OidcLoginSession session, String homeserver) {
  if (kIsWeb) {
    final sessionJson = jsonEncode(session.toJson());
    html.window.sessionStorage[_OidcSessionStorage.storeKey] = sessionJson;
    html.window.sessionStorage[_OidcSessionStorage.homeserverKey] = homeserver;
  }
}

/// Retrieves OIDC session from web sessionStorage.
/// Returns null if not found or expired.
Map<String, dynamic>? _getOidcSessionWeb() {
  if (kIsWeb) {
    final sessionJson = html.window.sessionStorage[_OidcSessionStorage.storeKey];
    if (sessionJson == null) return null;
    return jsonDecode(sessionJson) as Map<String, dynamic>;
  }
  return null;
}

/// Clears OIDC session from web sessionStorage.
void _clearOidcSessionWeb() {
  if (kIsWeb) {
    html.window.sessionStorage.remove(_OidcSessionStorage.storeKey);
    html.window.sessionStorage.remove(_OidcSessionStorage.homeserverKey);
  }
}

class _OidcSessionStorage {
  static const String storeKey = 'oidc_session_web';
  static const String homeserverKey = 'oidc_homeserver_web';
}

// import 'package:Pulsly/utils/platform_infos.dart';

Future<void> oidcLoginFlow(
  Client client,
  BuildContext context,
  bool signUp,
) async {
  Logs().i('Starting Matrix Native OIDC Flow...');

  final (redirectUrl, urlScheme) = calcRedirectUrl();

  final clientUri = Uri.parse(AppSettings.website.value);
  final supportWebPlatform =
      kIsWeb &&
      kReleaseMode &&
      redirectUrl.scheme == 'https' &&
      redirectUrl.host.contains(clientUri.host);
  if (kIsWeb && !supportWebPlatform) {
    Logs().w(
      'OIDC Application Type web is not supported. Using native now. Please use this instance not in production!',
    );
  }

  final oidcClientData = await client.registerOidcClient(
    redirectUris: [redirectUrl],
    applicationType: supportWebPlatform
        ? OidcApplicationType.web
        : OidcApplicationType.native,
    clientInformation: OidcClientInformation(
      clientName: AppSettings.applicationName.value,
      clientUri: clientUri,
      logoUri: Uri.parse(AppSettings.logoUrl.value),
      tosUri: Uri.parse(AppSettings.tos.value),
      policyUri: Uri.parse(AppSettings.privacyPolicy.value),
    ),
  );

  final session = await client.initOidcLoginSession(
    oidcClientData: oidcClientData,
    redirectUri: redirectUrl,
    prompt: signUp ? 'create' : null,
  );

  if (!context.mounted) return;

  if (kIsWeb) {
    // Use sessionStorage instead of SharedPreferences for better security on web.
    // Session data is cleared when the browser tab is closed and is isolated
    // to the same origin, reducing the risk of XSS token theft.
    _storeOidcSessionWeb(session, client.homeserver!.toString());
  }

  final returnUrlString = await FlutterWebAuth2.authenticate(
    url: session.authenticationUri.toString(),
    callbackUrlScheme: urlScheme,
    options: FlutterWebAuth2Options(
      useWebview: false,
      preferEphemeral: true,
      // intentFlags: ephemeralIntentFlags,
      windowName: '_self',
    ),
  );
  if (kIsWeb) return; // On Web we return at intro page when app starts again!

  final returnUrl = Uri.parse(returnUrlString);
  final queryParameters = returnUrl.hasFragment
      ? Uri.parse(returnUrl.fragment).queryParameters
      : returnUrl.queryParameters;
  final code = queryParameters['code'] as String;
  final state = queryParameters['state'] as String;

  await client.oidcLogin(session: session, code: code, state: state);
}
