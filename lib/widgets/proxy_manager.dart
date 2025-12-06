import 'dart:convert';
import 'dart:io';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/utils/xray_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProxyManager extends StatefulWidget {
  final Widget? child;

  final SharedPreferences store;

  const ProxyManager({
    this.child,
    required this.store,
    super.key,
  });

  @override
  ProxyManagerState createState() => ProxyManagerState();

  /// Returns the (nearest) Client instance of your application.
  static ProxyManagerState of(BuildContext context) =>
      Provider.of<ProxyManagerState>(context, listen: false);
}

class ProxyManagerState extends State<ProxyManager>
    with WidgetsBindingObserver {
  get executableExists {
    return File(AppConfig.xrayExecutablePath).existsSync();
  }

  // TODO download dynamically instead
  // TODO download based on device's CPU architecture
  Future<void> writeExecutable() async {
    final data = await rootBundle.load('assets/xray/xray-arm64-v8a');
    final List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(AppConfig.xrayExecutablePath).writeAsBytes(bytes);
  }

  late Process? process;
  Future<void> invokeExecutable() async {
    if (!executableExists) await writeExecutable();
    await Process.run('chmod', ['+x', AppConfig.xrayExecutablePath]);
    process =
        await Process.start(AppConfig.xrayExecutablePath, ['-config', AppConfig.xrayConfigPath], runInShell: true);
  }

  void writeConfig(String? xconfig) {
    final outbound = XrayParser.parse(xconfig ?? AppConfig.xrayConfig);
    final config = {
      'inbounds': [
        {
          'listen': '127.0.0.1',
          'port': 31554,
          'protocol': 'http',
        },
      ],
      'outbounds': [
        outbound,
      ],
    };
    File(AppConfig.xrayConfigPath)
        .writeAsStringSync(const JsonEncoder().convert(config));
  }

  void start() async {
    writeConfig(null);
    AppConfig.httpProxy = "127.0.0.1:31554";
    invokeExecutable();
  }

  void stop() {
    if (process != null) {
      process!.kill();
    }
    AppConfig.httpProxy = "";
  }

  Future<String> findConfig() async {
    if (AppConfig.xrayStrategy == 'random_shadowsocks') {
      Logs().i("Fetching subscription");
      final response = await get(Uri.parse(AppConfig.shadowsocksSubscription));
      File(AppConfig.xraySubscriptionCache)
          .writeAsBytesSync(response.bodyBytes);
    }
    final lines = File(AppConfig.xraySubscriptionCache).readAsLinesSync();
    Logs().w("${lines.length} lines");
    for (final config in lines) {
      Logs().w("Checking $config");
      try {
        final isWorking = await checkConfig(config);
        if (isWorking) {
          Logs().w("Found working $config");
          return config;
        }
      } catch (e) {
        Logs().e("Failed $config", e);
      }
    }
    return "";
  }

  Future<bool> checkConfig(String config) async {
    writeConfig(config);
    await invokeExecutable();
    Logs().w("Started X-Ray: ${process!.pid}");
    if (process == null) {
      Logs().e("Failed to start XRay");
      return false;
    }
    await Future.delayed(const Duration(milliseconds: 150));
    final client = HttpClient();
    client.findProxy = (uri) {
      return "PROXY 127.0.0.1:31554";
    };
    final req = await client.getUrl(Uri.parse(AppConfig.proxyCheckURL));
    final res = await req.done;
    Logs().w("Got response ${res.statusCode}");
    stop();
    return res.statusCode >= 200 && res.statusCode < 300;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => this,
      child: widget.child,
    );
  }
}
