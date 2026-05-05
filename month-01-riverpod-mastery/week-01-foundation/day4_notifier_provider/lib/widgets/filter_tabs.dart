

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filter_provider.dart';
import '../providers/todo_provider.dart';

class FilterTabs extends ConsumerWidget {
  const FilterTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current filter — rebuild when it changes
    final currentFilter = ref.watch(filterProvider);

    // Watch todos for counts — rebuild when todos change
    final notifier = ref.watch(todoProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // ── Filter buttons ───────────────────────────────────
          Expanded(
            child: Row(
              children: [
                _FilterButton(
                  label: 'All',
                  count: ref.watch(todoProvider).length,
                  isSelected: currentFilter == TodoFilter.all,
                  onTap: () {
                    // Update StateProvider — set .state directly
                    ref.read(filterProvider.notifier).state =
                        TodoFilter.all;
                  },
                ),
                const SizedBox(width: 8),
                _FilterButton(
                  label: 'Active',
                  count: notifier.activeCount,
                  isSelected: currentFilter == TodoFilter.active,
                  onTap: () {
                    ref.read(filterProvider.notifier).state =
                        TodoFilter.active;
                  },
                ),
                const SizedBox(width: 8),
                _FilterButton(
                  label: 'Done',
                  count: notifier.completedCount,
                  isSelected: currentFilter == TodoFilter.completed,
                  onTap: () {
                    ref.read(filterProvider.notifier).state =
                        TodoFilter.completed;
                  },
                ),
              ],
            ),
          ),

          // ── Clear completed button ───────────────────────────
          if (notifier.completedCount > 0)
            TextButton(
              onPressed: () {
                ref.read(todoProvider.notifier).clearCompleted();
              },
              child: const Text(
                'Clear done',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.redAccent,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF7B61FF).withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF7B61FF).withOpacity(0.5)
                : Colors.white12,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: isSelected
                    ? const Color(0xFF7B61FF)
                    : Colors.white38,
              ),
            ),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 6, vertical: 1),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF7B61FF)
                    : Colors.white12,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.white : Colors.white38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}