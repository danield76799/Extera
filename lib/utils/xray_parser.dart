import 'dart:convert';

import 'package:matrix/matrix.dart';

class XrayParser {
  static Map<String, dynamic> parse(String url) {
    if (url.startsWith("vless:")) {
      return parseVLESS(url);
    } else if (url.startsWith("ss:")) {
      return parseShadowsocks(url);
    } else {
      return {};
    }
  }

  static Map<String, dynamic> parseShadowsocks(String ssUrl) {
    final url = ssUrl.substring('ss://'.length);

    Logs().w("Parsing $ssUrl");

    final atIndex = url.indexOf('@');
    final credsB64 = url.substring(0, atIndex);
    final endpoint = url.substring(atIndex + 1);
    Logs().w("$credsB64 $endpoint");
    final credentials = ascii.decode(base64.decode(credsB64));
    Logs().w(credentials);
    
    final semicolonIndex = endpoint.indexOf(':');

    return {
      'protocol': 'shadowsocks',
      'settings': {
        'servers': [
          {
            'address': endpoint.substring(0, semicolonIndex),
            'port': int.parse(endpoint.substring(semicolonIndex + 1)),
            'method': credentials.substring(0, credentials.indexOf(':')),
            'password': credentials.substring(credentials.indexOf(':') + 1),
          },
        ],
      },
      'tag': 'proxy',
    };
  }

  static Map<String, dynamic> parseVLESS(String vlessUrl) {
    // Remove "vless://" prefix
    final url = vlessUrl.substring('vless://'.length);

    // Split by '@' to separate user_id and host:port?query#fragment
    final atIndex = url.indexOf('@');
    final userHost = url.substring(0, atIndex);
    final rest = url.substring(atIndex + 1);

    // Split host:port and query#fragment
    final questionIndex = rest.indexOf('?');
    final hostPort =
        questionIndex == -1 ? rest : rest.substring(0, questionIndex);
    final queryFragment =
        questionIndex == -1 ? '' : rest.substring(questionIndex + 1);

    // Split query and fragment
    final hashIndex = queryFragment.indexOf('#');
    final query =
        hashIndex == -1 ? queryFragment : queryFragment.substring(0, hashIndex);
    final fragment =
        hashIndex == -1 ? '' : queryFragment.substring(hashIndex + 1);

    // Extract user_id, host, and port
    final userId = userHost;
    final colonIndex = hostPort.indexOf(':');
    final host = hostPort.substring(0, colonIndex);
    final port = int.parse(hostPort.substring(colonIndex + 1));

    // Parse query parameters
    final params = <String, String>{};
    if (query.isNotEmpty) {
      final pairs = query.split('&');
      for (final pair in pairs) {
        final keyValue = pair.split('=');
        if (keyValue.length == 2) {
          params[keyValue[0]] = keyValue[1];
        }
      }
    }

    // Parse fragment for pbk and sid
    String? publicKey;
    var shortId = '';
    if (fragment.isNotEmpty) {
      final fragParts = fragment.split('&');
      for (final part in fragParts) {
        if (part.startsWith('pbk=')) {
          publicKey = part.substring(4);
        } else if (part.startsWith('sid=')) {
          shortId = part.substring(4);
        }
      }
    }

    return {
      'protocol': 'vless',
      'settings': {
        'vnext': [
          {
            'address': host,
            'port': port,
            'users': [
              {
                'id': userId,
                'encryption': params['encryption'] ?? 'none',
                'flow': params['flow'] ?? '',
              },
            ],
          },
        ],
      },
      'streamSettings': {
        'network': params['type'] ?? 'tcp',
        'security': params['security'] ?? '',
        'realitySettings': {
          'show': false,
          'fingerprint': params['fp'] ?? '',
          'serverName': params['sni'] ?? '',
          'publicKey': publicKey ?? '',
          'shortId': shortId,
        },
      },
      'tag': 'proxy',
    };
  }
}
