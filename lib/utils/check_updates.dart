import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:matrix/matrix.dart';

import 'package:Pulsly/config/app_config.dart';
import 'package:Pulsly/config/setting_keys.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/utils/adaptive_bottom_sheet.dart';
import 'package:Pulsly/utils/platform_infos.dart';

/// GitHub Releases API response for a release.
class GitHubRelease {
  final String tagName;
  final String downloadUrl;
  final String browserDownloadUrl;

  GitHubRelease({
    required this.tagName,
    required this.downloadUrl,
    required this.browserDownloadUrl,
  });

  factory GitHubRelease.fromJson(Map<String, dynamic> json) {
    String apkUrl = '';
    String browserUrl = '';

    // Find the first APK asset
    final assets = json['assets'] as List<dynamic>? ?? [];
    for (final asset in assets) {
      final name = (asset['name'] as String? ?? '').toLowerCase();
      if (name.endsWith('.apk')) {
        apkUrl = asset['browser_download_url'] as String? ?? '';
        break;
      }
    }

    // Fall back to tarball/zipball URL if no APK found
    browserUrl = json['tarball_url'] as String? ??
                 json['zipball_url'] as String? ??
                 '';

    return GitHubRelease(
      tagName: json['tag_name'] as String? ?? '',
      downloadUrl: apkUrl,
      browserDownloadUrl: browserUrl,
    );
  }
}

Future<GitHubRelease?> getLatestRelease() async {
  const repo = 'danield76799/Plusly';
  final url = 'https://api.github.com/repos/$repo/releases/latest';

  try {
    final response = await Dio().get(
      url,
      options: Options(
        headers: {
          'Accept': 'application/vnd.github+json',
          'User-Agent': 'ExteraApp',
        },
        // Timeout voor API call
        sendTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    if (response.statusCode == 200) {
      return GitHubRelease.fromJson(response.data as Map<String, dynamic>);
    } else {
      Logs().w('GitHub API returned status ${response.statusCode}');
    }
  } on DioException catch (e) {
    Logs().e('Failed to fetch GitHub release', 'DioError: ${e.type} - ${e.message}');
  } catch (e) {
    Logs().e('Failed to fetch GitHub release', e);
  }
  return null;
}

/// Compare two version strings (e.g. "1.2.3" vs "1.2.4").
/// Returns true if latest is newer than current.
bool isNewerVersion(String latest, String current) {
  // Strip 'v' prefix if present
  latest = latest.startsWith('v') ? latest.substring(1) : latest;
  current = current.startsWith('v') ? current.substring(1) : current;

  // Handle Plusly build tags like "plusly-build-337"
  // Extract the build number for comparison
  final latestBuildMatch = RegExp(r'(\d+)$').firstMatch(latest);
  final currentBuildMatch = RegExp(r'(\d+)$').firstMatch(current);
  
  if (latestBuildMatch != null && currentBuildMatch != null) {
    final latestBuild = int.tryParse(latestBuildMatch.group(1) ?? '0') ?? 0;
    final currentBuild = int.tryParse(currentBuildMatch.group(1) ?? '0') ?? 0;
    return latestBuild > currentBuild;
  }

  // Fall back to semantic version comparison
  final latestParts = latest.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final currentParts = current.split('.').map((e) => int.tryParse(e) ?? 0).toList();

  // Pad with zeros
  while (latestParts.length < currentParts.length) {
    latestParts.add(0);
  }
  while (currentParts.length < latestParts.length) {
    currentParts.add(0);
  }

  for (var i = 0; i < latestParts.length; i++) {
    if (latestParts[i] > currentParts[i]) return true;
    if (latestParts[i] < currentParts[i]) return false;
  }
  return false;
}

Future<void> downloadAndInstallApk(BuildContext context, String url) async {
  final l10n = L10n.of(context);
  final scaffold = ScaffoldMessenger.of(context);

  // Progress state
  var progress = 0.0;
  var statusText = 'Downloaden...';

  try {
    // Show downloading indicator with progress
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(l10n.downloadUpdateButton),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(value: progress > 0 ? progress : null),
                  const SizedBox(height: 16),
                  Text(
                    statusText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (progress > 0)
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            );
          },
        ),
      );
    }

    final tempDir = await getTemporaryDirectory();
    final fileName = url.split('/').last;
    if (fileName.isEmpty) {
      throw Exception('Ongeldige download URL');
    }
    final filePath = '${tempDir.path}/$fileName';

    await Dio().download(
      url,
      filePath,
      options: Options(
        headers: {
          'Accept': 'application/vnd.android.package-archive',
          'User-Agent': 'ExteraApp',
        },
        // 30 seconden timeout voor connect + receive
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 10),
      ),
      onReceiveProgress: (received, total) {
        if (total > 0) {
          progress = received / total;
          statusText = 'Downloaden... ${(progress * 100).toStringAsFixed(0)}%';
        } else {
          statusText = 'Downloaden... ${(received / 1024 / 1024).toStringAsFixed(1)} MB';
        }
        // Force dialog rebuild
        if (context.mounted) {
          (context as Element).markNeedsBuild();
        }
      },
    );

    // Verify file exists and has content
    final file = File(filePath);
    if (!await file.exists()) {
      throw Exception('Bestand niet gevonden na download');
    }
    final fileSize = await file.length();
    if (fileSize == 0) {
      throw Exception('Gedownload bestand is leeg');
    }

    if (context.mounted) {
      // Close downloading dialog
      Navigator.of(context).pop();
    }

    // Show success message
    if (context.mounted) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Download compleet! Installeren...'),
          duration: const Duration(seconds: 3),
        ),
      );
    }

    // Open the APK — Android will show the install prompt
    final result = await OpenFile.open(filePath);
    if (result.type != ResultType.done) {
      throw Exception('Kon APK niet openen: ${result.message}');
    }

  } on DioException catch (e) {
    // Handle Dio specific errors
    if (context.mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    
    String errorMsg;
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMsg = 'Download timeout - check je internetverbinding';
        break;
      case DioExceptionType.badResponse:
        errorMsg = 'Server fout: ${e.response?.statusCode ?? 'onbekend'}';
        break;
      case DioExceptionType.cancel:
        errorMsg = 'Download geannuleerd';
        break;
      default:
        errorMsg = 'Download mislukt: ${e.message}';
    }
    
    if (context.mounted) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text(errorMsg),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {},
          ),
        ),
      );
    }
  } catch (e) {
    if (context.mounted && Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
    if (context.mounted) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Download mislukt: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }
}

void checkForUpdates(BuildContext context) async {
  if (!AppSettings.checkForUpdates.value || AppConfig.alreadyCheckedUpdates)
    return;

  Logs().v('Checking updates via GitHub Releases...');

  try {
    final currentVersion = await PlatformInfos.getVersion();
    final release = await getLatestRelease();

    if (release == null) {
      Logs().v('No release found or failed to fetch');
      return;
    }

    final latestVersion = release.tagName;
    Logs().v(
      'Latest version: $latestVersion | Current version: $currentVersion',
    );

    if (!isNewerVersion(latestVersion, currentVersion)) return;

    AppConfig.alreadyCheckedUpdates = true;

    if (!context.mounted) return;

    final l10n = L10n.of(context);

    await showAdaptiveBottomSheet(
      context: context,
      useRootNavigator: false,
      builder: (ctx) {
        return Scaffold(
          appBar: AppBar(title: Text(l10n.updateAvailableTitle)),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(l10n.updateAvailable(latestVersion)),
              ),
              const Divider(),
              if (release.downloadUrl.isNotEmpty)
                ListTile(
                  leading: const Icon(Icons.android),
                  title: const Text('Download & installeer APK'),
                  subtitle: const Text('GitHub Releases'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.of(ctx).pop();
                    downloadAndInstallApk(context, release.downloadUrl);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.open_in_browser),
                title: const Text('Open GitHub releasepagina'),
                subtitle: const Text('Direct downloaden via browser'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.of(ctx).pop();
                  launchUrlString('https://github.com/danield76799/Plusly/releases');
                },
              ),
              if (release.browserDownloadUrl.isNotEmpty)
                ListTile(
                  leading: const Icon(Icons.source),
                  title: const Text('Download source code'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    launchUrlString(release.browserDownloadUrl);
                  },
                ),
            ],
          ),
        );
      },
    );
  } catch (e) {
    Logs().e('Failed to check for updates', e);
  }
}
