// ignore_for_file: deprecated_member_use

import 'package:collection/collection.dart';
import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/config/setting_keys.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/pages/chat_list/chat_list.dart';
import 'package:extera_next/pages/chat_list/chat_list_header.dart';
import 'package:extera_next/pages/chat_list/chat_list_legacy_header.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/interesting_presences_extension.dart';
import 'package:extera_next/utils/stream_extension.dart';
import 'package:extera_next/widgets/matrix.dart';
import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

class PeopleView extends StatefulWidget {
  final void Function() onBack;
  final void Function(Room) onChatTap;
  final ChatListController chatListController;

  const PeopleView({
    required this.onBack,
    required this.onChatTap,
    required this.chatListController,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PeopleViewState();
}

class _PeopleViewState extends State<PeopleView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final client = Matrix.of(context).client;
    final interestingPresences = client.interestingPresences;

    final borderRadius = BorderRadius.circular(AppConfig.borderRadius);

    // return StreamBuilder(
    //   stream: client.onSync.stream.rateLimit(const Duration(seconds: 3)),
    //   builder: (context, snapshot) {
    //     return SizedBox.shrink();
    //   },
    // );
    return SafeArea(
      child: StreamBuilder(
        stream: client.onSync.stream.rateLimit(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          final onlineCount = interestingPresences
              .where((mxid) => client.presences[mxid]?.presence == .online)
              .length;
          final atLeastOneOnline =
              interestingPresences.firstWhereOrNull(
                (mxid) => client.presences[mxid]?.presence == .online,
              ) !=
              null;
          final atLeastOneUnavailable =
              interestingPresences.firstWhereOrNull(
                (mxid) => client.presences[mxid]?.presence == .unavailable,
              ) !=
              null;
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              if (AppSettings.useLegacyChatListAppBar.value)
                ChatListLegacyHeader(controller: widget.chatListController)
              else
                ChatListHeader(controller: widget.chatListController),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const .all(16),
                  child: Material(
                    borderRadius: borderRadius,
                    color: theme.colorScheme.surfaceContainerHigh,
                    clipBehavior: .hardEdge,
                    child: Padding(
                      padding: const .all(16),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: atLeastOneOnline
                                  ? Colors.green
                                  : atLeastOneUnavailable
                                  ? Colors.orange
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(L10n.of(context).peopleOnline(onlineCount)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
