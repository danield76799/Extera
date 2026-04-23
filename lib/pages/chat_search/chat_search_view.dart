import 'package:flutter/material.dart';

import 'package:Pulsly/config/themes.dart';
import 'package:Pulsly/generated/l10n/l10n.dart';
import 'package:Pulsly/pages/chat_search/chat_search_files_tab.dart';
import 'package:Pulsly/pages/chat_search/chat_search_images_tab.dart';
import 'package:Pulsly/pages/chat_search/chat_search_message_tab.dart';
import 'package:Pulsly/pages/chat_search/chat_search_page.dart';
import 'package:Pulsly/utils/matrix_sdk_extensions/matrix_locals.dart';
import 'package:Pulsly/widgets/layouts/max_width_body.dart';
import 'package:matrix/matrix.dart';

class ChatSearchView extends StatelessWidget {
  final ChatSearchController controller;

  const ChatSearchView(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    final room = controller.room;
    if (room == null) {
      return Scaffold(
        appBar: AppBar(title: Text(L10n.of(context).oopsSomethingWentWrong)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(L10n.of(context).youAreNoLongerParticipatingInThisChat),
          ),
        ),
      );
    }

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Center(child: BackButton()),
        titleSpacing: 0,
        title: Text(
          L10n.of(context).searchIn(
            room.getLocalizedDisplayname(MatrixLocals(L10n.of(context))),
          ),
        ),
      ),
      body: MaxWidthBody(
        withScrolling: false,
        child: Column(
          children: [
            if (FluffyThemes.isThreeColumnMode(context))
              const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    controller: controller.searchController,
                    onSubmitted: (_) => controller.restartSearch(),
                    autofocus: true,
                    enabled: controller.tabController.index == 0,
                    decoration: InputDecoration(
                      hintText: L10n.of(context).search,
                      prefixIcon: const Icon(Icons.search_outlined),
                      filled: true,
                      fillColor: theme.colorScheme.secondaryContainer,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      hintStyle: TextStyle(
                        color: theme.colorScheme.onSecondaryContainer,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Filter chips row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _FilterChip(
                          label: controller.filterSenderId != null
                              ? 'Sender: ${room.unsafeGetUserFromMemoryOrFallback(controller.filterSenderId!).calcDisplayname()}'
                              : 'Sender: All',
                          icon: Icons.person_outline,
                          onPressed: () =>
                              _showSenderPicker(context, room, controller),
                          onClear: controller.filterSenderId != null
                              ? () {
                                  controller.filterSenderId = null;
                                  controller.restartSearch();
                                }
                              : null,
                        ),
                        const SizedBox(width: 8),
                        _FilterChip(
                          label: controller.filterFromDate != null
                              ? 'From: ${_formatDate(controller.filterFromDate!)}'
                              : 'From date',
                          icon: Icons.calendar_today_outlined,
                          onPressed: () => _showDatePicker(
                            context,
                            controller,
                            isFrom: true,
                          ),
                          onClear: controller.filterFromDate != null
                              ? () {
                                  controller.filterFromDate = null;
                                  controller.restartSearch();
                                }
                              : null,
                        ),
                        const SizedBox(width: 8),
                        _FilterChip(
                          label: controller.filterToDate != null
                              ? 'To: ${_formatDate(controller.filterToDate!)}'
                              : 'To date',
                          icon: Icons.calendar_today_outlined,
                          onPressed: () => _showDatePicker(
                            context,
                            controller,
                            isFrom: false,
                          ),
                          onClear: controller.filterToDate != null
                              ? () {
                                  controller.filterToDate = null;
                                  controller.restartSearch();
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: controller.tabController,
              tabs: [
                Tab(child: Text(L10n.of(context).messages)),
                Tab(child: Text(L10n.of(context).gallery)),
                Tab(child: Text(L10n.of(context).files)),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: [
                  ChatSearchMessageTab(
                    searchQuery: controller.searchController.text,
                    room: room,
                    startSearch: controller.startMessageSearch,
                    searchStream: controller.searchStream,
                  ),
                  ChatSearchImagesTab(
                    room: room,
                    startSearch: controller.startGallerySearch,
                    searchStream: controller.galleryStream,
                  ),
                  ChatSearchFilesTab(
                    room: room,
                    startSearch: controller.startFileSearch,
                    searchStream: controller.fileStream,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime d) => '${d.day}/${d.month}/${d.year}';

  Future<void> _showSenderPicker(
    BuildContext context,
    Room room,
    ChatSearchController controller,
  ) async {
    List<User> members;
    try {
      members = await room.requestParticipants();
    } catch (_) {
      members = [];
    }
    if (!context.mounted) return;

    final senders = members
        .map((m) => m.stateKey)
        .whereType<String>()
        .toSet()
        .toList();

    await showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Filter by sender', style: Theme.of(ctx).textTheme.titleLarge),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text('All senders'),
              onTap: () {
                controller.filterSenderId = null;
                controller.restartSearch();
                Navigator.pop(ctx);
              },
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: senders.length,
                itemBuilder: (ctx, i) {
                  final user = room.unsafeGetUserFromMemoryOrFallback(
                    senders[i],
                  );
                  final name = user.calcDisplayname();
                  final selected = senders[i] == controller.filterSenderId;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: selected
                          ? Theme.of(ctx).colorScheme.primary
                          : Theme.of(ctx).colorScheme.surfaceContainerHighest,
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                      ),
                    ),
                    title: Text(name),
                    trailing: selected ? const Icon(Icons.check) : null,
                    onTap: () {
                      controller.filterSenderId = senders[i];
                      controller.restartSearch();
                      Navigator.pop(ctx);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(
    BuildContext context,
    ChatSearchController controller, {
    required bool isFrom,
  }) async {
    final initial = isFrom
        ? (controller.filterFromDate ?? DateTime.now())
        : (controller.filterToDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      if (isFrom) {
        controller.filterFromDate = picked;
      } else {
        controller.filterToDate = picked;
      }
      controller.restartSearch();
    }
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final VoidCallback? onClear;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActive = onClear != null;

    return Material(
      color: isActive
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive
                    ? theme.colorScheme.onPrimaryContainer
                    : theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive
                      ? theme.colorScheme.onPrimaryContainer
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (onClear != null) ...[
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onClear,
                  child: Icon(
                    Icons.close,
                    size: 14,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
