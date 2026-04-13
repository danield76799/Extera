import 'package:flutter/material.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/url_launcher.dart';
import 'package:extera_next/widgets/mxc_image.dart';

class RichPresenceContent extends StatelessWidget {
  final Map<String, dynamic> richPresenceData;
  final bool noBackground;
  final bool noPadding;

  const RichPresenceContent({
    required this.richPresenceData,
    this.noBackground = false,
    this.noPadding = false,
    super.key,
  });

  bool get _isMedia {
    if (richPresenceData['type'] != 'com.ip-logger.msc4320.rpc.media') {
      return false;
    }
    if (richPresenceData['artist'] is! String ||
        richPresenceData['album'] is! String ||
        richPresenceData['track'] is! String) {
      return false;
    }
    if (richPresenceData.containsKey('cover_art') &&
        richPresenceData['cover_art'] is! String) {
      return false;
    }
    if (richPresenceData.containsKey('player') &&
        richPresenceData['player'] is! String) {
      return false;
    }
    if (richPresenceData.containsKey('streaming_link') &&
        richPresenceData['streaming_link'] is! String) {
      return false;
    }
    return true;
  }

  bool get _isActivity {
    if (richPresenceData['type'] != 'com.ip-logger.msc4320.rpc.activity') {
      return false;
    }
    if (!richPresenceData.containsKey('name')) return false;
    if (richPresenceData.containsKey('image') &&
        richPresenceData['image'] is! String) {
      return false;
    }
    if (richPresenceData.containsKey('details') &&
        richPresenceData['details'] is! String) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_isMedia) ...[
          Material(
            clipBehavior: Clip.hardEdge,
            color: noBackground
                ? Colors.transparent
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: borderRadius,
            child: Padding(
              padding: EdgeInsets.all(noPadding ? 0 : 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      richPresenceData.containsKey('player')
                          ? L10n.of(
                              context,
                            ).listeningTo(richPresenceData['player'])
                          : L10n.of(context).listeningToSomeTunes,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(
                          AppConfig.borderRadius / 2,
                        ),
                        color: theme.colorScheme.surfaceContainerHigh,
                        child: richPresenceData.containsKey('cover_art')
                            ? MxcImage(
                                uri: Uri.parse(richPresenceData['cover_art']),
                                width: 128,
                                height: 128,
                                isThumbnail: true,
                                thumbnailMethod: .scale,
                              )
                            : SizedBox(
                                width: 128,
                                height: 128,
                                child: Icon(Icons.music_note, size: 48),
                              ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                richPresenceData['track'],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(richPresenceData['album']),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(richPresenceData['artist']),
                            ),
                            if (richPresenceData.containsKey(
                              'streaming_link',
                            )) ...[
                              const SizedBox(height: 8),
                              FilledButton.tonalIcon(
                                onPressed: () {
                                  UrlLauncher(
                                    context,
                                    richPresenceData['streaming_link'],
                                    richPresenceData['player'],
                                  ).launchUrl();
                                },
                                label: Text(
                                  richPresenceData['player'] as String? ??
                                      L10n.of(context).openLinkInBrowser,
                                ),
                                icon: const Icon(Icons.open_in_new),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (_isActivity) ...[
          Material(
            clipBehavior: Clip.hardEdge,
            color: noBackground
                ? Colors.transparent
                : theme.colorScheme.surfaceContainerHighest,
            borderRadius: borderRadius,
            child: Padding(
              padding: EdgeInsets.all(noPadding ? 0 : 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      L10n.of(context).playing,
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(
                          AppConfig.borderRadius / 2,
                        ),
                        color: theme.colorScheme.surfaceContainerHigh,
                        child: richPresenceData.containsKey('image')
                            ? MxcImage(
                                uri: Uri.parse(richPresenceData['image']),
                                width: 128,
                                height: 128,
                                isThumbnail: true,
                                thumbnailMethod: .scale,
                              )
                            : SizedBox(
                                width: 128,
                                height: 128,
                                child: Icon(Icons.games_rounded, size: 48),
                              ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                richPresenceData['name'],
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(richPresenceData['details']),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
