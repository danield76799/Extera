import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';

extension InterestingPresencesExtension on Client {
  Set<String> get interestingPresences {
    if (userID == null) return {};  // Guard against null userID
    final allHeroes = rooms
        .map((room) => room.summary.mHeroes)
        .fold(
          <String>{},
          (previousValue, element) => previousValue..addAll(element ?? {}),
        );
    allHeroes.add(userID!);
    return allHeroes;
  }
}

bool isInterestingPresence(CachedPresence presence) =>
    !presence.presence.isOffline || (presence.statusMsg?.isNotEmpty ?? false);

extension GradientCachedPresenceExtension on CachedPresence {
  DateTime get sortOrderDateTime =>
      lastActiveTimestamp ??
      (currentlyActive == true
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(0));

  LinearGradient get gradient => presence.isOnline == true
      ? LinearGradient(
          colors: [Colors.green, Colors.green.shade200, Colors.green.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      : presence.isUnavailable
      ? LinearGradient(
          colors: [
            Colors.yellow,
            Colors.yellow.shade200,
            Colors.yellow.shade900,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      : LinearGradient(
          colors: [Colors.grey, Colors.grey.shade200, Colors.grey.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
}
