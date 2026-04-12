import 'package:flutter/material.dart';

import 'package:extera_next/utils/bridge_utils.dart';

class BridgeFilterBar extends StatelessWidget {
  final Set<String> allBridgeTypes;
  final Set<String> visibleBridgeTypes;
  final void Function(Set<String>) onChanged;

  const BridgeFilterBar({
    required this.allBridgeTypes,
    required this.visibleBridgeTypes,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (allBridgeTypes.isEmpty) return const SizedBox.shrink();

    final sortedTypes = allBridgeTypes.toList()
      ..sort((a, b) {
        const order = ['whatsapp', 'telegram', 'signal', 'discord', 'slack', 'irc'];
        final ia = order.indexOf(a);
        final ib = order.indexOf(b);
        if (ia != -1 && ib != -1) return ia.compareTo(ib);
        if (ia != -1) return -1;
        if (ib != -1) return 1;
        return a.compareTo(b);
      });

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: sortedTypes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final type = sortedTypes[i];
          final isSelected = visibleBridgeTypes.contains(type);
          final color = getBridgeTypeColor(type);
          return FilterChip(
            label: Text(getBridgeTypeLabel(type)),
            selected: isSelected,
            onSelected: (selected) {
              final newSet = Set<String>.from(visibleBridgeTypes);
              if (selected) {
                newSet.add(type);
              } else {
                newSet.remove(type);
              }
              onChanged(newSet);
            },
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            selectedColor: color.withOpacity(0.2),
            checkmarkColor: color,
            labelStyle: TextStyle(
              color: isSelected ? color : theme.colorScheme.onSurface,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            side: BorderSide.none,
          );
        },
      ),
    );
  }
}
