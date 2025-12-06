import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/setting_keys.dart';
import 'package:extera_next/pages/settings_proxy/settings_proxy_view.dart';
import 'package:extera_next/widgets/future_loading_dialog.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:extera_next/widgets/proxy_manager.dart';
import 'package:flutter/material.dart';

class SettingsProxy extends StatefulWidget {
  const SettingsProxy({super.key});

  @override
  SettingsProxyController createState() => SettingsProxyController();
}

class SettingsProxyController extends State<SettingsProxy> {
  String get strategy => AppConfig.xrayStrategy;

  void setStrategy(String strategy) {
    setState(() {
      AppConfig.xrayStrategy = strategy;
      Matrix.of(context).store.setString(SettingKeys.xrayStrategy, strategy);
    });
  }

  void findConfig() async {
    showFutureLoadingDialog(
      context: context,
      future: findCfg,
    );
  }

  Future<void> findCfg() async {
    final config = await ProxyManager.of(context).findConfig();
    AppConfig.xrayConfig = config;
    await Matrix.of(context)
        .store
        .setString(SettingKeys.xrayConfig, config);
  }

  @override
  Widget build(BuildContext context) => SettingsProxyView(this);
}
