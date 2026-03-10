import 'package:flutter/material.dart';

import 'settings_features_view.dart';

class SettingsFeatures extends StatefulWidget {
  const SettingsFeatures({super.key});

  @override
  SettingsFeaturesController createState() => SettingsFeaturesController();
}

class SettingsFeaturesController extends State<SettingsFeatures> {
  @override
  Widget build(BuildContext context) => SettingsFeaturesView(this);
}
