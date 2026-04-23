import 'package:flutter/material.dart';

import 'package:Pulsly/utils/bridge_utils.dart';

class BridgeFilterBar extends StatelessWidget {
  final Set<String> allBridgeTypes;
  final Set<String> visibleBridgeTypes;
  final void Function(Set<String>) onChanged;
  final Map<String, int>
  unreadCounts; // Nieuw: ongelezen counts per bridge type

  const BridgeFilterBar({
    required this.allBridgeTypes,
    required this.visibleBridgeTypes,
    required this.onChanged,
    this.unreadCounts = const {}, // Default leeg
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (allBridgeTypes.isEmpty) return const SizedBox.shrink();

    final sortedTypes = allBridgeTypes.toList()
      ..sort((a, b) {
        const order = [
          'whatsapp',
          'telegram',
          'signal',
          'discord',
          'slack',
          'irc',
          'matrix',
        ];
        final ia = order.indexOf(a);
        final ib = order.indexOf(b);
        if (ia != -1 && ib != -1) return ia.compareTo(ib);
        if (ia != -1) return -1;
        if (ib != -1) return 1;
        return a.compareTo(b);
      });

    final hasActiveFilters = visibleBridgeTypes.length < allBridgeTypes.length;

    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: sortedTypes.length + (hasActiveFilters ? 1 : 0),
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          if (hasActiveFilters && i == sortedTypes.length) {
            return ActionChip(
              label: const Text('Clear'),
              avatar: const Icon(Icons.close, size: 18),
              onPressed: () => onChanged(Set<String>.from(allBridgeTypes)),
              backgroundColor: theme.colorScheme.errorContainer,
              side: BorderSide.none,
            );
          }
          final type = sortedTypes[i];
          final isSelected = visibleBridgeTypes.contains(type);
          final color = getBridgeTypeColor(type);
          final unreadCount = unreadCounts[type] ?? 0;

          return FilterChip(
            avatar: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  getBridgeTypeIcon(type),
                  size: 16,
                  color: isSelected ? color : Colors.black87,
                ),
                // Badge voor ongelezen
                if (unreadCount > 0)
                  Positioned(
                    right: -6,
                    top: -4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        unreadCount > 99 ? '99+' : unreadCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
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
              color: isSelected
                  ? color
                  : Colors.black87, // Donkerder voor beter contrast (WCAG AA)
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            side: BorderSide.none,
          );
        },
      ),
    );
  }
}
