import 'dart:convert';
import 'dart:io';

import 'package:extera_next/utils/platform_infos.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:extera_next/config/isrg_x1.dart';

class CustomHttpClient {
  static HttpClient customHttpClient(String? cert) {
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

    // Use Nekoray mixed proxy
    // Made it for myself, remove later
    final httpClient = HttpClient(context: context);
    // httpClient.findProxy = (uri) {
    //   return 'PROXY localhost:2080;';
    // };

    return httpClient;
  }

  static http.Client createHTTPClient() => IOClient(customHttpClient(ISRG_X1));
}
