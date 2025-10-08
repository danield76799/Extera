import 'dart:io';

import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/download_manager/download_manager_view.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:matrix/matrix.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class Download {
  final String url;
  final String name;
  final BuildContext context;
  late Future<Response<dynamic>> response;
  late int receivedBytes = 0;
  late int totalBytes = 1;
  late double progress = 0;
  late String httpUrl;
  late String downloadPath;
  late CancelToken ct;
  Download(this.context, this.url, this.name);

  void start() async {
    try {
      final mx = Matrix.of(context).client;
      // final directory = await getDownloadsDirectory();
      downloadPath = "/sdcard/Download/Extera";

      httpUrl = (await Uri.parse(url).getDownloadUri(mx)).toString();

      if (downloadPath != null) {
        // Create Dio instance
        final dio = Dio();

        ct = CancelToken();

        // Download the file
        response = dio.download(httpUrl, "$downloadPath/$name",
            onReceiveProgress: (received, total) {
          receivedBytes = received;
          totalBytes = total;
          progress = (receivedBytes / totalBytes) * 100;
          if (progress == 100) {
            Provider.of<DownloadManagerController>(context)
                .downloads
                .remove(this);
          }
          print("Download progress: $progress%");
        },
            options: Options(
                responseType: ResponseType.bytes,
                headers: {'authorization': "Bearer ${mx.accessToken}"}),
            cancelToken: ct);
        print("Download completed and saved to $downloadPath/$name");
      }
    } catch (e) {
      print("Error during download: $e");
    }
  }

  void cancel() async {
    ct.cancel();
    Provider.of<DownloadManagerController>(context).downloads.remove(this);
  }
}

class DownloadManager extends StatefulWidget {
  final BuildContext context;

  const DownloadManager(this.context);

  @override
  State<StatefulWidget> createState() =>
      Provider.of<DownloadManagerController>(this.context);
}

class DownloadManagerController extends State<DownloadManager>
    with ChangeNotifier {
  @override
  Widget build(BuildContext context) => DownloadManagerView(this);

  final List<Download> downloads = [];
  void download(BuildContext context, String name, String url) async {
    final dl = Download(context, url, name);
    downloads.add(dl);
    dl.start();
  }
}
