import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/setting_keys.dart';
import 'package:extera_next/pages/settings_ringtone/settings_ringtone_view.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRingtone extends StatefulWidget {
  const SettingsRingtone({super.key});

  @override
  State<StatefulWidget> createState() => SettingsRingtoneController();
}

class SettingsRingtoneController extends State<SettingsRingtone> {

  late final SharedPreferences store;

  @override
  void initState() {
    super.initState();
    store = Matrix.of(context).store;
  }

  String get currentRingtone {
    return store.getString(SettingKeys.ringtone) ?? AppConfig.ringtone;
  }

  bool get isSystemRingtoneAvailable => PlatformInfos.isMobile;

  void setRingtone(String ringtone) {
    setState(() {
      AppConfig.ringtone = ringtone;
      store.setString(SettingKeys.ringtone, ringtone);
    });
  }

  @override
  Widget build(BuildContext context) => SettingsRingtoneView(this);
}
