import 'package:extera_next/config/themes.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/settings_proxy/settings_proxy.dart';
import 'package:extera_next/widgets/layouts/max_width_body.dart';
import 'package:flutter/material.dart';

class SettingsProxyView extends StatelessWidget {
  final SettingsProxyController controller;

  const SettingsProxyView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !FluffyThemes.isColumnMode(context),
        centerTitle: FluffyThemes.isColumnMode(context),
        title: Text(l10n.proxy),
      ),
      backgroundColor: theme.colorScheme.surface,
      body: MaxWidthBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                showSelectedIcon: false, // Cleaner look for text-only segments
                segments: [
                  ButtonSegment<String>(
                    value: 'disabled',
                    label: Text(l10n.xrayDisabled),
                    icon: const Icon(Icons.cancel_outlined),
                  ),
                  ButtonSegment<String>(
                    value: 'random_shadowsocks',
                    label: Text(l10n.xrayShadowsocks),
                    icon: const Icon(Icons.lock_outline),
                  ),
                  ButtonSegment<String>(
                    value: 'russian_lte',
                    label: Text(l10n.xrayRuLte),
                    icon: const Icon(Icons
                        .signal_cellular_connected_no_internet_4_bar_outlined),
                  ),
                ],
                selected: {controller.strategy},
                onSelectionChanged: (Set<String> newSelection) {
                  controller.setStrategy(newSelection.first);
                },
              ),
            ),
            Divider(color: theme.dividerColor),
            FilledButton(
              onPressed: controller.findConfig,
              child: Text(l10n.findConfig),
            ),
          ],
        ),
      ),
    );
  }
}
