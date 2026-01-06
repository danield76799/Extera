import 'dart:ui';

import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/widgets/list_divider.dart';
import 'package:extera_next/widgets/theme_builder.dart';
import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:extera_next/config/setting_keys.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/pages/chat/events/state_message.dart';
import 'package:extera_next/utils/account_config.dart';
import 'package:extera_next/utils/color_value.dart';
import 'package:extera_next/widgets/avatar.dart';
import 'package:extera_next/widgets/layouts/max_width_body.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:extera_next/widgets/mxc_image.dart';
import '../../config/app_config.dart';
import '../../widgets/settings_switch_list_tile.dart';
import 'settings_style.dart';

class SettingsStyleView extends StatelessWidget {
  final SettingsStyleController controller;

  const SettingsStyleView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);

    const colorPickerSize = 32.0;
    final client = Matrix.of(context).client;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !FluffyThemes.isColumnMode(context),
        centerTitle: FluffyThemes.isColumnMode(context),
        title: Text(L10n.of(context).changeTheme),
      ),
      backgroundColor: theme.colorScheme.surface,
      body: MaxWidthBody(
        child: Padding(
          padding: const .symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Material(
                color: theme.colorScheme.surfaceContainerHigh,
                clipBehavior: .hardEdge,
                borderRadius: borderRadius,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SegmentedButton<ThemeMode>(
                        selected: {controller.currentTheme},
                        onSelectionChanged: (selected) =>
                            controller.switchTheme(selected.single),
                        segments: [
                          ButtonSegment(
                            value: ThemeMode.light,
                            label: Text(L10n.of(context).lightTheme),
                            icon: const Icon(Icons.light_mode_outlined),
                          ),
                          ButtonSegment(
                            value: ThemeMode.dark,
                            label: Text(L10n.of(context).darkTheme),
                            icon: const Icon(Icons.dark_mode_outlined),
                          ),
                          ButtonSegment(
                            value: ThemeMode.system,
                            label: Text(L10n.of(context).systemTheme),
                            icon: const Icon(Icons.auto_mode_outlined),
                          ),
                        ],
                      ),
                    ),
                    if (controller.currentTheme != ThemeMode.light) ...[
                      const ListDivider(),
                      SettingsSwitchListTile.adaptive(
                        title: L10n.of(context).pureBlackToggle,
                        onChanged: (b) =>
                            ThemeController.of(context).setPureBlack(b),
                        storeKey: SettingKeys.pureBlack,
                        defaultValue: ThemeController.of(context).pureBlack,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Material(
                color: theme.colorScheme.surfaceContainerHigh,
                clipBehavior: .hardEdge,
                borderRadius: borderRadius,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        L10n.of(context).setColorTheme,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DynamicColorBuilder(
                      builder: (light, dark) {
                        final systemColor =
                            Theme.of(context).brightness == Brightness.light
                            ? light?.primary
                            : dark?.primary;
                        final colors = List<Color?>.from(
                          SettingsStyleController.customColors,
                        );
                        if (systemColor == null) {
                          colors.remove(null);
                        }
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 64,
                              ),
                          itemCount: colors.length,
                          itemBuilder: (context, i) {
                            final color = colors[i];
                            return Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Tooltip(
                                message: color == null
                                    ? L10n.of(context).systemTheme
                                    : '#${color.hexValue.toRadixString(16).toUpperCase()}',
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(
                                    colorPickerSize,
                                  ),
                                  onTap: () => controller.setChatColor(color),
                                  child: Material(
                                    color: color ?? systemColor,
                                    elevation: 6,
                                    borderRadius: BorderRadius.circular(
                                      colorPickerSize,
                                    ),
                                    child: SizedBox(
                                      width: colorPickerSize,
                                      height: colorPickerSize,
                                      child: controller.currentColor == color
                                          ? Center(
                                              child: Icon(
                                                Icons.check,
                                                size: 16,
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.onPrimary,
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Material(
                color: theme.colorScheme.surfaceContainerHigh,
                clipBehavior: .hardEdge,
                borderRadius: borderRadius,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        L10n.of(context).messagesStyle,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    StreamBuilder(
                      stream: client.onSync.stream.where(
                        (syncUpdate) =>
                            syncUpdate.accountData?.any(
                              (accountData) =>
                                  accountData.type ==
                                  ApplicationAccountConfigExtension
                                      .accountDataKey,
                            ) ??
                            false,
                      ),
                      builder: (context, snapshot) {
                        final accountConfig = client.applicationAccountConfig;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration: FluffyThemes.animationDuration,
                              curve: FluffyThemes.animationCurve,
                              decoration: const BoxDecoration(),
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  if (accountConfig.wallpaperUrl != null)
                                    Opacity(
                                      opacity: controller.wallpaperOpacity,
                                      child: ImageFiltered(
                                        imageFilter: ImageFilter.blur(
                                          sigmaX: controller.wallpaperBlur,
                                          sigmaY: controller.wallpaperBlur,
                                        ),
                                        child: MxcImage(
                                          key: ValueKey(
                                            accountConfig.wallpaperUrl,
                                          ),
                                          uri: accountConfig.wallpaperUrl,
                                          fit: BoxFit.cover,
                                          isThumbnail: true,
                                          width: FluffyThemes.columnWidth * 2,
                                          height: 212,
                                        ),
                                      ),
                                    ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 16),
                                      Material(
                                        color: theme.scaffoldBackgroundColor,
                                        child: Column(
                                          children: [
                                            StateMessage(
                                              Event(
                                                eventId: 'style_dummy',
                                                room: Room(
                                                  id: '!style_dummy',
                                                  client: client,
                                                ),
                                                content: {'membership': 'join'},
                                                type: EventTypes.RoomMember,
                                                senderId: client.userID!,
                                                originServerTs: DateTime.now(),
                                                stateKey: client.userID!,
                                              ),
                                            ),
                                            Align(
                                              alignment: .centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left:
                                                      12 +
                                                      12 +
                                                      Avatar.defaultSize,
                                                  right: 12,
                                                  top:
                                                      accountConfig
                                                              .wallpaperUrl ==
                                                          null
                                                      ? 0
                                                      : 12,
                                                  bottom: 12,
                                                ),
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: theme.bubbleColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          AppConfig
                                                              .borderRadius,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 8,
                                                        ),
                                                    child: Text(
                                                      L10n.of(
                                                        context,
                                                      ).settingsStyleMessage1,
                                                      style: TextStyle(
                                                        color:
                                                            theme.onBubbleColor,
                                                        fontSize:
                                                            AppConfig
                                                                .messageFontSize *
                                                            AppConfig
                                                                .fontSizeFactor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment: .start,
                                              children: [
                                                const Avatar(name: "K"),
                                                Align(
                                                  alignment: .centerLeft,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 12,
                                                      left: 12,
                                                      top:
                                                          accountConfig
                                                                  .wallpaperUrl ==
                                                              null
                                                          ? 0
                                                          : 12,
                                                      bottom: 12,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Material(
                                                          color: theme
                                                              .colorScheme
                                                              .surfaceContainerHigh,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                AppConfig
                                                                    .borderRadius,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      16,
                                                                  vertical: 8,
                                                                ),
                                                            child: Text(
                                                              L10n.of(
                                                                context,
                                                              ).settingsStyleMessage2,
                                                              style: TextStyle(
                                                                color: theme
                                                                    .colorScheme
                                                                    .onSurface,
                                                                fontSize:
                                                                    AppConfig
                                                                        .messageFontSize *
                                                                    AppConfig
                                                                        .fontSizeFactor,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: .centerRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left:
                                                      12 +
                                                      12 +
                                                      Avatar.defaultSize,
                                                  right: 12,
                                                  top:
                                                      accountConfig
                                                              .wallpaperUrl ==
                                                          null
                                                      ? 0
                                                      : 12,
                                                  bottom: 12,
                                                ),
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: theme.bubbleColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          AppConfig
                                                              .borderRadius,
                                                        ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 8,
                                                        ),
                                                    child: Text(
                                                      L10n.of(
                                                        context,
                                                      ).settingsStyleMessage3,
                                                      style: TextStyle(
                                                        color:
                                                            theme.onBubbleColor,
                                                        fontSize:
                                                            AppConfig
                                                                .messageFontSize *
                                                            AppConfig
                                                                .fontSizeFactor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SettingsSwitchListTile.adaptive(
                              title: L10n.of(context).enableGradient,
                              onChanged: (b) => AppConfig.enableGradient = b,
                              storeKey: SettingKeys.enableGradient,
                              defaultValue: AppConfig.enableGradient,
                            ),
                            if (!PlatformInfos.isMobile &&
                                !AppConfig.twemojiFont)
                              SettingsSwitchListTile.adaptive(
                                title: L10n.of(context).useTwemoji,
                                onChanged: (b) => AppConfig.twemojiFont = b,
                                storeKey: SettingKeys.twemojiFont,
                                defaultValue: AppConfig.twemojiFont,
                              ),
                            const SizedBox(height: 8),
                            ListTile(
                              title: TextButton.icon(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      theme.colorScheme.secondaryContainer,
                                  foregroundColor:
                                      theme.colorScheme.onSecondaryContainer,
                                ),
                                onPressed: controller.setWallpaper,
                                icon: const Icon(Icons.edit_outlined),
                                label: Text(L10n.of(context).setWallpaper),
                              ),
                              trailing: accountConfig.wallpaperUrl == null
                                  ? null
                                  : IconButton(
                                      icon: const Icon(Icons.delete_outlined),
                                      color: theme.colorScheme.error,
                                      onPressed: controller.deleteChatWallpaper,
                                    ),
                            ),
                            if (accountConfig.wallpaperUrl != null) ...[
                              ListTile(title: Text(L10n.of(context).opacity)),
                              Slider.adaptive(
                                min: 0.1,
                                max: 1.0,
                                divisions: 9,
                                semanticFormatterCallback: (d) => d.toString(),
                                value: controller.wallpaperOpacity,
                                onChanged: controller.updateWallpaperOpacity,
                                onChangeEnd: controller.saveWallpaperOpacity,
                              ),
                              ListTile(title: Text(L10n.of(context).blur)),
                              Slider.adaptive(
                                min: 0.0,
                                max: 10.0,
                                divisions: 10,
                                semanticFormatterCallback: (d) => d.toString(),
                                value: controller.wallpaperBlur,
                                onChanged: controller.updateWallpaperBlur,
                                onChangeEnd: controller.saveWallpaperBlur,
                              ),
                            ],
                            const SizedBox(height: 8),
                          ],
                        );
                      },
                    ),
                    const ListDivider(),
                    ListTile(
                      title: Text(L10n.of(context).fontSize),
                      trailing: Text('× ${AppConfig.fontSizeFactor}'),
                    ),
                    Slider.adaptive(
                      min: 0.5,
                      max: 2.5,
                      divisions: 20,
                      value: AppConfig.fontSizeFactor,
                      semanticFormatterCallback: (d) => d.toString(),
                      onChanged: controller.changeFontSizeFactor,
                    ),
                    const ListDivider(),
                    ListTile(
                      title: Text(L10n.of(context).avatarBorderRadius),
                      trailing: Text('× ${AppConfig.avatarBorderRadius}'),
                    ),
                    Slider.adaptive(
                      min: 0.5,
                      max: 1,
                      divisions: 20,
                      value: AppConfig.avatarBorderRadius,
                      semanticFormatterCallback: (d) => d.toString(),
                      onChanged: controller.changeAvatarBorderRadius,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Material(
                color: theme.colorScheme.surfaceContainerHigh,
                clipBehavior: .hardEdge,
                borderRadius: borderRadius,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        L10n.of(context).overview,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SettingsSwitchListTile.adaptive(
                      title: L10n.of(context).presencesToggle,
                      onChanged: (b) => AppConfig.showPresences = b,
                      storeKey: SettingKeys.showPresences,
                      defaultValue: AppConfig.showPresences,
                    ),
                    const ListDivider(),
                    SettingsSwitchListTile.adaptive(
                      title: L10n.of(context).separateChatTypes,
                      onChanged: (b) => AppConfig.separateChatTypes = b,
                      storeKey: SettingKeys.separateChatTypes,
                      defaultValue: AppConfig.separateChatTypes,
                    ),
                    const ListDivider(),
                    SettingsSwitchListTile.adaptive(
                      title: L10n.of(context).displayNavigationRail,
                      onChanged: (b) => AppConfig.displayNavigationRail = b,
                      storeKey: SettingKeys.displayNavigationRail,
                      defaultValue: AppConfig.displayNavigationRail,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
