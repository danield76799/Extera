import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:matrix/matrix.dart';

import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/download_manager/download_manager_view.dart';
import 'package:Pulsly/widgets/adaptive_dialogs/show_ok_cancel_alert_dialog.dart';
import 'package:Pulsly/widgets/avatar.dart';
import 'package:Pulsly/widgets/matrix.dart';
import '../../utils/fluffy_share.dart';
import 'chat_list.dart';

class ClientChooserButton extends StatelessWidget {
  final ChatListController controller;

  const ClientChooserButton(this.controller, {super.key});

  List<PopupMenuEntry<Object>> _bundleMenuItems(BuildContext context) {
    final matrix = Matrix.of(context);
    final bundles = matrix.accountBundles.keys.toList()
      ..sort(
        (a, b) => a!.isValidMatrixId == b!.isValidMatrixId
            ? 0
            : a.isValidMatrixId && !b.isValidMatrixId
            ? -1
            : 1,
      );
    return <PopupMenuEntry<Object>>[
      PopupMenuItem(
        value: SettingsAction.newGroup,
        child: Row(
          children: [
            const Icon(Icons.group_add_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(L10n.of(context).createGroup),
          ],
        ),
      ),
      PopupMenuItem(
        value: SettingsAction.invite,
        child: Row(
          children: [
            Icon(Icons.adaptive.share_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(L10n.of(context).inviteContact),
          ],
        ),
      ),
      PopupMenuItem(
        value: SettingsAction.downloads,
        child: Row(
          children: [
            const Icon(Icons.download_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(L10n.of(context).downloads),
          ],
        ),
      ),
      PopupMenuItem(
        value: SettingsAction.archive,
        child: Row(
          children: [
            const Icon(Icons.archive_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(L10n.of(context).archive),
          ],
        ),
      ),
      PopupMenuItem(
        value: SettingsAction.notifications,
        child: Row(
          children: [
            const Icon(Icons.notifications_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(L10n.of(context).notifications),
          ],
        ),
      ),
      PopupMenuItem(
        value: SettingsAction.settings,
        child: Row(
          children: [
            const Icon(Icons.settings_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 18),
            Text(L10n.of(context).settings),
          ],
        ),
      ),
      // Section divider
      const PopupMenuDivider(height: 8),
      for (final bundle in bundles) ...[
        if (matrix.accountBundles[bundle]!.length != 1 ||
            matrix.accountBundles[bundle]!.single!.userID != bundle)
          PopupMenuItem(
            value: null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  bundle!,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                    fontSize: 14,
                  ),
                ),
                const Divider(height: 1),
              ],
            ),
          ),
        ...matrix.accountBundles[bundle]!
            .whereType<Client>()
            .where((client) => client.isLogged())
            .map(
              (client) => PopupMenuItem(
                value: client,
                child: FutureBuilder<Profile?>(
                  future: client.fetchOwnProfile(),
                  builder: (context, snapshot) {
                    final isActive = client == matrix.client;
                    return Row(
                      children: [
                        Avatar(
                          mxContent: snapshot.data?.avatarUrl,
                          name:
                              snapshot.data?.displayName ??
                              client.userID!.localpart,
                          size: 40,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            snapshot.data?.displayName ??
                                client.userID!.localpart!,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: isActive
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isActive ? const Color(0xFF49AFC2) : null,
                            ),
                          ),
                        ),
                        if (isActive)
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(
                              Icons.check_circle,
                              color: Color(0xFF49AFC2),
                              size: 20,
                            ),
                          ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 18),
                          onPressed: () => controller.editBundlesForAccount(
                            client.userID,
                            bundle,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
      ],
      PopupMenuItem(
        value: SettingsAction.addAccount,
        child: Row(
          children: [
            const Icon(Icons.person_add_outlined, color: Color(0xFF49AFC2)),
            const SizedBox(width: 22),
            Text(
              L10n.of(context).addAccount,
              style: const TextStyle(color: Color(0xFF49AFC2)),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final matrix = Matrix.of(context);

    var clientCount = 0;
    matrix.accountBundles.forEach((key, value) => clientCount += value.length);
    return FutureBuilder<Profile>(
      future: matrix.client.fetchOwnProfile(),
      builder: (context, snapshot) => Stack(
        alignment: Alignment.center,
        children: [
          ...List.generate(clientCount, (index) => const SizedBox.shrink()),
          const SizedBox.shrink(),
          const SizedBox.shrink(),
          PopupMenuButton<Object>(
            onSelected: (o) => _clientSelected(o, context),
            itemBuilder: _bundleMenuItems,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(99),
              child: Avatar(
                mxContent: snapshot.data?.avatarUrl,
                name:
                    snapshot.data?.displayName ??
                    matrix.client.userID!.localpart,
                size: 32,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _clientSelected(Object object, BuildContext context) async {
    if (object is Client) {
      controller.setActiveClient(object);
    } else if (object is String) {
      controller.setActiveBundle(object);
    } else if (object is SettingsAction) {
      switch (object) {
        case SettingsAction.addAccount:
          final consent = await showOkCancelAlertDialog(
            context: context,
            title: L10n.of(context).addAccount,
            message: L10n.of(context).enableMultiAccounts,
            okLabel: L10n.of(context).next,
            cancelLabel: L10n.of(context).cancel,
          );
          if (consent != OkCancelResult.ok) return;
          context.go('/addaccount/sign_in');
          break;
        case SettingsAction.newGroup:
          context.go('/rooms/newgroup');
          break;
        case SettingsAction.invite:
          FluffyShare.shareInviteLink(context);
          break;
        case SettingsAction.settings:
          context.go('/rooms/settings');
          break;
        case SettingsAction.archive:
          context.go('/rooms/archive');
          break;
        case SettingsAction.notifications:
          context.go('/rooms/notifications');
          break;
        case SettingsAction.downloads:
          DownloadManagerView.showDownloads(context);
          break;
      }
    }
  }
}

enum SettingsAction {
  addAccount,
  newGroup,
  downloads,
  invite,
  settings,
  archive,
  notifications,
}
