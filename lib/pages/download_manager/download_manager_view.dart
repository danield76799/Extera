import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/download_manager/download_manager.dart';
import 'package:extera_next/utils/adaptive_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadManagerView extends StatelessWidget {
  final DownloadManagerController controller;
  const DownloadManagerView(this.controller, {super.key});

  static void showDownloads(BuildContext context) {
    showAdaptiveBottomSheet(
      context: context,
      builder: (context) => DownloadManagerView(Provider.of<DownloadManagerController>(context)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 256, maxWidth: 512),
        child: ListView.builder(
          itemCount: controller.downloads.length,
          itemBuilder: (context, index) {
            final download = controller.downloads[index];
            return ListTile(
              title: Text(download.name),
              subtitle: LinearProgressIndicator(
                value: download.progress / 100,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  download.cancel();
                },
                child: Text(L10n.of(context).cancel),
              ),
            );
          },
        ),
      ),
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 256),
        child: Center(child: Text(L10n.of(context).downloads, textAlign: TextAlign.center)),
      ),
    );
  }
}
