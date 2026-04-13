import 'package:flutter/material.dart';

import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/settings_backup.dart';
import 'package:extera_next/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'settings_features_view.dart';

class SettingsFeatures extends StatefulWidget {
  const SettingsFeatures({super.key});

  @override
  SettingsFeaturesController createState() => SettingsFeaturesController();
}

class SettingsFeaturesController extends State<SettingsFeatures> {
  void exportSettings() async {
    await SettingsBackup.shareExport(context);
  }

  void restoreSettings() async {
    final l10n = L10n.of(context);
    final confirmed = await showOkCancelAlertDialog(
      context: context,
      title: 'Restore Settings',
      message: 'This will overwrite your current settings. Are you sure?',
      okLabel: l10n.ok,
      cancelLabel: l10n.cancel,
      isDestructive: true,
    );
    if (confirmed == OkCancelResult.cancel) return;

    final data = await SettingsBackup.pickAndRead();
    if (data == null) return;
    if (!mounted) return;

    await SettingsBackup.import(data);
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Settings restored. Restart app to apply all changes.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => SettingsFeaturesView(this);
}
