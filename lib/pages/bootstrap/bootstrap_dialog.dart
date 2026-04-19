import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/encryption.dart';
import 'package:matrix/matrix.dart';

import 'package:extera_next/config/themes.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/error_reporter.dart';
import 'package:extera_next/utils/fluffy_share.dart';
import 'package:extera_next/utils/localized_exception_extension.dart';
import 'package:extera_next/utils/platform_infos.dart';
import 'package:extera_next/utils/sync_status_localization.dart';
import 'package:extera_next/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:extera_next/widgets/future_loading_dialog.dart';
import 'package:extera_next/widgets/layouts/login_scaffold.dart';
import 'package:extera_next/widgets/matrix.dart';
import '../key_verification/key_verification_dialog.dart';

/// Plusly theme for recovery key screens
/// Colors: warm cream background, dark brown text, bronze accent
ThemeData _buildPluslyTheme(BuildContext context) {
  const bgColor = Color(0xFFFDF6F0);
  const textColor = Color(0xFF2D1C16);
  const accentColor = Color(0xFF8B5E34);

  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgColor,
    colorScheme: const ColorScheme.light(
      surface: bgColor,
      onSurface: textColor,
      primary: accentColor,
      onPrimary: bgColor,
      secondary: accentColor,
      onSecondary: bgColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: bgColor,
      foregroundColor: textColor,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(color: textColor),
      bodyLarge: TextStyle(color: textColor),
      bodyMedium: TextStyle(color: textColor),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: bgColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: bgColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accentColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accentColor, width: 2),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return accentColor;
        return null;
      }),
    ),
    dividerColor: accentColor.withAlpha(77),
  );
}

class BootstrapDialog extends StatefulWidget {
  final bool wipe;

  const BootstrapDialog({super.key, this.wipe = false});

  @override
  BootstrapDialogState createState() => BootstrapDialogState();
}

class BootstrapDialogState extends State<BootstrapDialog> {
  final TextEditingController _recoveryKeyTextEditingController =
      TextEditingController();

  Bootstrap? bootstrap;

  String? _recoveryKeyInputError;

  String _currentStep = '';

  bool _recoveryKeyInputLoading = false;

  String? titleText;

  bool _recoveryKeyStored = false;
  bool _recoveryKeyCopied = false;

  bool? _storeInSecureStorage = false;

  bool? _wipe;

  String _bootstrapStep = 'Initializing...';

  String get _secureStorageKey =>
      'ssss_recovery_key_${bootstrap!.client.userID}';

  bool get _supportsSecureStorage =>
      PlatformInfos.isMobile || PlatformInfos.isDesktop;

  String _getSecureStorageLocalizedName() {
    if (PlatformInfos.isAndroid) {
      return L10n.of(context).storeInAndroidKeystore;
    }
    if (PlatformInfos.isIOS || PlatformInfos.isMacOS) {
      return L10n.of(context).storeInAppleKeyChain;
    }
    return L10n.of(context).storeSecurlyOnThisDevice;
  }

  late final Client client;

  @override
  void initState() {
    super.initState();
    client = Matrix.of(context).client;
    _createBootstrap(widget.wipe);
  }

  void _cancelAction() async {
    final consent = await showOkCancelAlertDialog(
      context: context,
      title: L10n.of(context).skipChatBackup,
      message: L10n.of(context).skipChatBackupWarning,
      okLabel: L10n.of(context).skip,
      isDestructive: true,
    );
    if (consent != OkCancelResult.ok) return;
    if (!mounted) return;
    _goBackAction(false);
  }

  void _goBackAction(bool success) {
    if (success) _decryptLastEvents();

    context.canPop() ? context.pop(success) : context.go('/rooms');
  }

  void _decryptLastEvents() async {
    for (final room in client.rooms) {
      final event = room.lastEvent;
      if (event != null &&
          event.type == EventTypes.Encrypted &&
          event.messageType == MessageTypes.BadEncrypted &&
          event.content['can_request_session'] == true) {
        final sessionId = event.content.tryGet<String>('session_id');
        final senderKey = event.content.tryGet<String>('sender_key');
        if (sessionId != null && senderKey != null) {
          room.client.encryption?.keyManager.maybeAutoRequest(
            room.id,
            sessionId,
            senderKey,
          );
        }
      }
    }
  }

  void _createBootstrap(bool wipe) async {
    _bootstrapStep = 'Loading rooms...';
    setState(() {});
    await client.roomsLoading;
    _bootstrapStep = 'Loading account data...';
    setState(() {});
    await client.accountDataLoading;
    _bootstrapStep = 'Loading device keys...';
    setState(() {});
    await client.userDeviceKeysLoading;
    _bootstrapStep = 'Waiting for server sync...';
    setState(() {});
    while (client.prevBatch == null) {
      await client.onSync.stream.first;
    }
    _bootstrapStep = 'Updating device keys...';
    setState(() {});
    await client.updateUserDeviceKeys();
    _wipe = wipe;
    titleText = null;
    _recoveryKeyStored = false;
    _bootstrapStep = 'Setting up encryption...';
    setState(() {});
    bootstrap = client.encryption!.bootstrap(onUpdate: (_) => setState(() {}));
    final key = await const FlutterSecureStorage().read(key: _secureStorageKey);
    if (key == null) {
      _bootstrapStep = '';
      return;
    }
    _recoveryKeyTextEditingController.text = key;
    _bootstrapStep = '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bootstrap = this.bootstrap;
    if (bootstrap == null) {
      return Theme(
        data: _buildPluslyTheme(context),
        child: LoginScaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const SizedBox.shrink(),
            title: Text(L10n.of(context).chatBackup),
          ),
          body: Center(
            child: StreamBuilder(
              stream: client.onSyncStatus.stream,
              builder: (context, snapshot) {
                final status = snapshot.data;
                final isComplete = status?.progress != null && (status!.progress ?? 0) >= 1.0;
                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    CircularProgressIndicator.adaptive(
                      value: status?.progress,
                      color: const Color(0xFF8B5E34),
                    ),
                    if (status != null) Text(status.calcLocalizedString(context)),
                    if (_bootstrapStep.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        _bootstrapStep,
                        style: const TextStyle(
                          color: Color(0xFF2D1C16),
                          fontSize: 14,
                        ),
                      ),
                    ],
                    if (isComplete) ...[
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () => _goBackAction(true),
                        child: const Text(
                          'Continue anyway',
                          style: TextStyle(color: Color(0xFF8B5E34)),
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ),
        ),
      );
    }

    final defaultFontSize =
        ElevatedButton.styleFrom().textStyle
            ?.resolve(const <WidgetState>{})
            ?.fontSize ??
        14.0;
    final scale =
        clampDouble(
          MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0,
          1.0,
          2.0,
        ) -
        1.0;

    _wipe ??= widget.wipe;
    final buttons = <Widget>[];
    Widget body = const Center(child: CircularProgressIndicator.adaptive());
    titleText = L10n.of(context).loadingPleaseWait;

    if (bootstrap.newSsssKey?.recoveryKey != null &&
        _recoveryKeyStored == false) {
      final key = bootstrap.newSsssKey!.recoveryKey;
      titleText = L10n.of(context).recoveryKey;
      return Theme(
        data: _buildPluslyTheme(context),
        child: LoginScaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: const SizedBox.shrink(),
            title: Text(L10n.of(context).recoveryKey),
          ),
          body: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: FluffyThemes.columnWidth * 1.5,
              ),
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.info_outlined,
                        color: const Color(0xFF8B5E34),
                      ),
                    ),
                    subtitle: Text(L10n.of(context).chatBackupDescription),
                  ),
                  const Divider(height: 32, thickness: 1),
                  TextField(
                    minLines: 2,
                    maxLines: 4,
                    readOnly: true,
                    style: const TextStyle(fontFamily: 'RobotoMono', color: Color(0xFF2D1C16)),
                    controller: TextEditingController(text: key),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      suffixIcon: const Icon(Icons.key_outlined, color: Color(0xFF8B5E34)),
                      fillColor: const Color(0xFFFDF6F0),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF8B5E34)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF8B5E34), width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (_supportsSecureStorage)
                    CheckboxListTile.adaptive(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      value: _storeInSecureStorage,
                      activeColor: const Color(0xFF8B5E34),
                      onChanged: (b) {
                        setState(() {
                          _storeInSecureStorage = b;
                        });
                      },
                      title: Text(_getSecureStorageLocalizedName()),
                      subtitle: Text(
                        L10n.of(context).storeInSecureStorageDescription,
                      ),
                    ),
                  const SizedBox(height: 16),
                  CheckboxListTile.adaptive(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                    value: _recoveryKeyCopied,
                    activeColor: const Color(0xFF8B5E34),
                    onChanged: (b) {
                      FluffyShare.share(key!, context);
                      setState(() => _recoveryKeyCopied = true);
                    },
                    title: Text(L10n.of(context).copyToClipboard),
                    subtitle: Text(L10n.of(context).saveKeyManuallyDescription),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check_outlined),
                    label: Text(L10n.of(context).next),
                    onPressed:
                        (_recoveryKeyCopied || _storeInSecureStorage == true)
                        ? () {
                            if (_storeInSecureStorage == true) {
                              const FlutterSecureStorage().write(
                                key: _secureStorageKey,
                                value: key,
                              );
                            }
                            setState(() => _recoveryKeyStored = true);
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      switch (bootstrap.state) {
        case BootstrapState.loading:
          break;
        case BootstrapState.askWipeSsss:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.wipeSsss(_wipe!),
          );
          break;
        case BootstrapState.askBadSsss:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.ignoreBadSecrets(true),
          );
          break;
        case BootstrapState.askUseExistingSsss:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.useExistingSsss(!_wipe!),
          );
          break;
        case BootstrapState.askUnlockSsss:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.unlockedSsss(),
          );
          break;
        case BootstrapState.askNewSsss:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.newSsss(),
          );
          break;
        case BootstrapState.openExistingSsss:
          _recoveryKeyStored = true;
          return LoginScaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const SizedBox.shrink(),
              title: Text(L10n.of(context).setupChatBackup),
            ),
            body: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: FluffyThemes.columnWidth * 1.5,
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      trailing: Icon(
                        Icons.info_outlined,
                        color: theme.colorScheme.primary,
                      ),
                      subtitle: Text(
                        L10n.of(context).pleaseEnterRecoveryKeyDescription,
                      ),
                    ),
                    const Divider(height: 32),
                    TextField(
                      minLines: 1,
                      maxLines: 2,
                      autocorrect: false,
                      readOnly: _recoveryKeyInputLoading,
                      autofillHints: _recoveryKeyInputLoading
                          ? null
                          : [AutofillHints.password],
                      controller: _recoveryKeyTextEditingController,
                      style: const TextStyle(fontFamily: 'RobotoMono'),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintStyle: TextStyle(
                          fontFamily: theme.textTheme.bodyLarge?.fontFamily,
                        ),
                        prefixIcon: const Icon(Icons.key_outlined),
                        labelText: L10n.of(context).recoveryKey,
                        hintText: 'Pj** **** **** **sk',
                        errorText: _recoveryKeyInputError,
                        errorMaxLines: 2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: theme.colorScheme.onPrimary,
                        iconColor: theme.colorScheme.onPrimary,
                        backgroundColor: theme.colorScheme.primary,
                      ),
                      onPressed: _recoveryKeyInputLoading
                          ? null
                          : () async {
                              setState(() {
                                _recoveryKeyInputError = null;
                                _recoveryKeyInputLoading = true;
                              });
                              
                              // Progress tracking
                              void updateStep(String step) {
                                if (mounted) setState(() => _currentStep = step);
                              }
                              
                              try {
                                final key = _recoveryKeyTextEditingController
                                    .text
                                    .trim();
                                if (key.isEmpty) {
                                  setState(() => _recoveryKeyInputLoading = false);
                                  return;
                                }
                                
                                // Step 1: Unlock with timeout
                                updateStep('Validating key...');
                                await bootstrap.newSsssKey!.unlock(
                                  keyOrPassphrase: key,
                                ).timeout(
                                  const Duration(seconds: 30),
                                  onTimeout: () {
                                    throw TimeoutException(
                                      'Recovery key validation timed out. Server may be slow.',
                                    );
                                  },
                                );
                                
                                // Step 2: Open existing SSSS
                                updateStep('Opening encrypted backup...');
                                await bootstrap.openExistingSsss().timeout(
                                  const Duration(seconds: 30),
                                  onTimeout: () {
                                    throw TimeoutException(
                                      'Opening backup timed out. Please try again.',
                                    );
                                  },
                                );
                                
                                Logs().d('SSSS unlocked');
                                
                                // Step 3: Self-sign if needed
                                if (bootstrap.encryption.crossSigning.enabled) {
                                  updateStep('Setting up cross-signing...');
                                  Logs().v(
                                    'Cross signing is already enabled. Try to self-sign',
                                  );
                                  await bootstrap
                                      .client
                                      .encryption!
                                      .crossSigning
                                      .selfSign(recoveryKey: key)
                                      .timeout(
                                        const Duration(seconds: 30),
                                        onTimeout: () {
                                          throw TimeoutException(
                                            'Cross-signing setup timed out.',
                                          );
                                        },
                                      );
                                  Logs().d('Successful selfsigned');
                                }
                              } on TimeoutException catch (e) {
                                setState(
                                  () => _recoveryKeyInputError = 
                                    'Timeout: ${e.message}\n\nThe server is taking too long. Try again later or use "Transfer from another device".',
                                );
                              } on Exception catch (e) {
                                // Handle specific cross-signing errors
                                final errorMsg = e.toString();
                                if (errorMsg.contains('Master or user keys not found')) {
                                  // Keys don't exist yet, this is OK - just log and continue
                                  Logs().w('Cross-signing keys not found, skipping self-sign');
                                  // Don't show error, just continue
                                } else {
                                  rethrow;
                                }
                              } on InvalidPassphraseException catch (e) {
                                setState(
                                  () => _recoveryKeyInputError = e
                                      .toLocalizedString(context),
                                );
                              } on FormatException catch (_) {
                                setState(
                                  () => _recoveryKeyInputError = L10n.of(
                                    context,
                                  ).wrongRecoveryKey,
                                );
                              } catch (e, s) {
                                ErrorReporter(
                                  context,
                                  'Unable to open SSSS with recovery key',
                                ).onErrorCallback(e, s);
                                setState(
                                  () => _recoveryKeyInputError = e
                                      .toLocalizedString(context),
                                );
                              } finally {
                                setState(
                                  () => _recoveryKeyInputLoading = false,
                                );
                              }
                            },
                      child: _recoveryKeyInputLoading
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const LinearProgressIndicator(),
                                const SizedBox(height: 8),
                                Text(
                                  _currentStep,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              spacing: lerpDouble(8, 4, scale)!,
                              children: [
                                const Icon(Icons.lock_open_outlined),
                                Flexible(
                                  child: Text(
                                    L10n.of(context).unlockOldMessages,
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(L10n.of(context).or),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.cast_connected_outlined),
                      label: Text(L10n.of(context).transferFromAnotherDevice),
                      onPressed: _recoveryKeyInputLoading
                          ? null
                          : () async {
                              final consent = await showOkCancelAlertDialog(
                                context: context,
                                title: L10n.of(context).verifyOtherDevice,
                                message: L10n.of(
                                  context,
                                ).verifyOtherDeviceDescription,
                                okLabel: L10n.of(context).ok,
                                cancelLabel: L10n.of(context).cancel,
                              );
                              if (consent != OkCancelResult.ok) return;
                              final req = await showFutureLoadingDialog(
                                context: context,
                                delay: false,
                                future: () async {
                                  await client.updateUserDeviceKeys();
                                  return client.userDeviceKeys[client.userID!]!
                                      .startVerification();
                                },
                              );
                              if (req.error != null) return;
                              final success = await KeyVerificationDialog(
                                request: req.result!,
                              ).show(context);
                              if (success != true) return;
                              if (!mounted) return;

                              final result = await showFutureLoadingDialog(
                                context: context,
                                future: () async {
                                  final allCached =
                                      await client.encryption!.keyManager
                                          .isCached() &&
                                      await client.encryption!.crossSigning
                                          .isCached();
                                  if (!allCached) {
                                    await client
                                        .encryption!
                                        .ssss
                                        .onSecretStored
                                        .stream
                                        .first;
                                  }
                                  return;
                                },
                              );
                              if (!mounted) return;
                              if (!result.isError) _goBackAction(true);
                            },
                    ),
                    // Wipe/recreate button hidden for safety
                    // const SizedBox(height: 16),
                    // ElevatedButton.icon(... recoveryKeyLost ...),
                  ],
                ),
              ),
            ),
          );
        case BootstrapState.askWipeCrossSigning:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.wipeCrossSigning(_wipe!),
          );
          break;
        case BootstrapState.askSetupCrossSigning:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.askSetupCrossSigning(
              setupMasterKey: true,
              setupSelfSigningKey: true,
              setupUserSigningKey: true,
            ),
          );
          break;
        case BootstrapState.askWipeOnlineKeyBackup:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.wipeOnlineKeyBackup(_wipe!),
          );

          break;
        case BootstrapState.askSetupOnlineKeyBackup:
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => bootstrap.askSetupOnlineKeyBackup(true),
          );
          break;
        case BootstrapState.error:
          titleText = L10n.of(context).oopsSomethingWentWrong;
          body = const Icon(Icons.error_outline, color: Colors.red, size: 80);
          buttons.add(
            ElevatedButton(
              onPressed: () => _goBackAction(false),
              child: Text(L10n.of(context).close),
            ),
          );
          break;
        case BootstrapState.done:
          titleText = L10n.of(context).everythingReady;
          body = Column(
            mainAxisSize: .min,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 120,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              Text(
                L10n.of(context).yourChatBackupHasBeenSetUp,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
            ],
          );
          buttons.add(
            ElevatedButton(
              onPressed: () => _goBackAction(true),
              child: Text(L10n.of(context).close),
            ),
          );
          break;
      }
    }

    return LoginScaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Text(titleText ?? L10n.of(context).loadingPleaseWait),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [body, const SizedBox(height: 8), ...buttons],
          ),
        ),
      ),
    );
  }
}
