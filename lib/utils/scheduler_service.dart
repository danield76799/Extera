import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:matrix/matrix.dart';

import 'package:Pulsly/utils/scheduled_messages_service.dart';

/// Service to handle background checking of scheduled messages
class SchedulerService {
  static Timer? _checkTimer;
  static const Duration _checkInterval = Duration(minutes: 1);

  /// Start the scheduler service
  static void start(Client client) {
    // Cancel any existing timer
    stop();

    // Initial check
    _checkScheduledMessages(client);

    // Set up periodic checks
    _checkTimer = Timer.periodic(_checkInterval, (_) {
      _checkScheduledMessages(client);
    });

    // Also check when app becomes visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupAppLifecycleListener(client);
    });
  }

  static bool _lifecycleListenerSetup = false;

  static void _setupAppLifecycleListener(Client client) {
    if (_lifecycleListenerSetup) return;
    _lifecycleListenerSetup = true;

    WidgetsBinding.instance.addObserver(_AppLifecycleObserver(client));
  }

  /// Stop the scheduler service
  static void stop() {
    _checkTimer?.cancel();
    _checkTimer = null;
  }

  /// Check and send any due messages
  static Future<void> _checkScheduledMessages(Client client) async {
    try {
      await ScheduledMessagesService.checkAndSendDueMessages(client);
    } catch (e) {
      Logs().e('Error checking scheduled messages', e);
    }
  }

  /// Manually trigger a check (useful for testing)
  static Future<void> checkNow(Client client) async {
    await _checkScheduledMessages(client);
  }
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  final Client client;

  _AppLifecycleObserver(this.client);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App became active - check for due messages
      SchedulerService.checkNow(client);
    }
  }
}
