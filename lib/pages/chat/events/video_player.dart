import 'dart:io';

import 'package:extera_next/pages/chat/events/html_message.dart';
import 'package:extera_next/pages/image_viewer/image_viewer.dart';
import 'package:extera_next/widgets/mxc_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:video_player/video_player.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/pages/chat/events/image_bubble.dart';
import 'package:extera_next/utils/file_description.dart';
import 'package:extera_next/utils/localized_exception_extension.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/event_extension.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/utils/url_launcher.dart';
import 'package:extera_next/widgets/blur_hash.dart';
import '../../../utils/error_reporter.dart';

class EventVideoPlayer extends StatelessWidget {
  final Event event;
  final Timeline? timeline;
  final Color textColor;
  final Color linkColor;

  const EventVideoPlayer(
    this.event,
    this.textColor,
    this.linkColor, {
    this.timeline,
    super.key,
  });

  static const String fallbackBlurHash = 'L5H2EC=PM+yV0g-mq.wG9c010J}I';

  @override
  Widget build(BuildContext context) {
    final supportsVideoPlayer = PlatformInfos.supportsVideoPlayer;

    final blurHash = (event.infoMap as Map<String, dynamic>)
            .tryGet<String>('xyz.amorgan.blurhash') ??
        fallbackBlurHash;
    final fileDescription = event.fileDescription;
    final infoMap = event.content.tryGetMap<String, Object?>('info');
    final videoWidth = infoMap?.tryGet<int>('w') ?? 400;
    final videoHeight = infoMap?.tryGet<int>('h') ?? 300;
    const height = 300.0;
    final width = videoWidth * (height / videoHeight);

    final durationInt = infoMap?.tryGet<int>('duration');
    final duration =
        durationInt == null ? null : Duration(milliseconds: durationInt);

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Material(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppConfig.borderRadius),
          child: InkWell(
            onTap: () => supportsVideoPlayer
                ? showDialog(
                    context: context,
                    builder: (_) => ImageViewer(
                      event,
                      timeline: timeline,
                      outerContext: context,
                    ),
                  )
                : event.saveFile(context),
            borderRadius: BorderRadius.circular(AppConfig.borderRadius),
            child: SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
                  if (event.hasThumbnail)
                    MxcImage(
                      event: event,
                      isThumbnail: true,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                      placeholder: (context) => BlurHash(
                        blurhash: blurHash,
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    BlurHash(
                      blurhash: blurHash,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
                  Center(
                    child: CircleAvatar(
                      child: supportsVideoPlayer
                          ? const Icon(Icons.play_arrow_outlined)
                          : const Icon(Icons.file_download_outlined),
                    ),
                  ),
                  if (duration != null)
                    Positioned(
                      bottom: 8,
                      left: 16,
                      child: Text(
                        '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Colors.white,
                          backgroundColor: Colors.black.withAlpha(32),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (fileDescription != null &&
            textColor != null &&
            linkColor != null &&
            !event.isRichFileDescription)
          SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Linkify(
                text: fileDescription,
                textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
                style: TextStyle(
                  color: textColor,
                  fontSize:
                      AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                ),
                options: const LinkifyOptions(humanize: false),
                linkStyle: TextStyle(
                  color: linkColor,
                  fontSize:
                      AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: linkColor,
                ),
                onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
              ),
            ),
          ),
        if (fileDescription != null &&
            textColor != null &&
            linkColor != null &&
            event.isRichFileDescription)
          SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: HtmlMessage(
                html: fileDescription,
                textColor: textColor,
                room: event.room,
                fontSize: AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                linkStyle: TextStyle(
                  color: linkColor,
                  fontSize:
                      AppConfig.fontSizeFactor * AppConfig.messageFontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: linkColor,
                ),
                onOpen: (url) => UrlLauncher(context, url.url).launchUrl(),
              ),
            ),
          ),
      ],
    );
  }
}
