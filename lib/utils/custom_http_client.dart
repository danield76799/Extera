import 'dart:convert';
import 'dart:io';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:extera_next/config/isrg_x1.dart';

class CustomHttpClient {
  static HttpClient? customHttpClient(String? cert) {
    if (PlatformInfos.isWeb) return null;

    final context = SecurityContext.defaultContext;

    if (PlatformInfos.isAndroid) {
      try {
        if (cert != null) {
          final bytes = utf8.encode(cert);
          context.setTrustedCertificatesBytes(bytes);
        }
      } on TlsException catch (e) {
        if (e.osError != null &&
            e.osError!.message.contains('CERT_ALREADY_IN_HASH_TABLE')) {
        } else {
          rethrow;
        }
      }
    }

    final client = HttpClient(context: context);

    if (AppConfig.httpProxy != null) {
      client.findProxy = (uri) {
        return "PROXY ${AppConfig.httpProxy}";
      };
    }

    return client;
  }

  static http.Client createHTTPClient() => IOClient(customHttpClient(ISRG_X1));
}
