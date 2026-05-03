import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';
import '../providers/filter_provider.dart';
import '../widgets/todo_item.dart';
import '../widgets/add_todo_bar.dart';
import '../widgets/filter_tabs.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todos = ref.watch(filteredTodosProvider);

    final notifier = ref.watch(todoProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF06060E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09091A),
        elevation: 0,
        title: const Text(
          'Day 4 — NotifierProvider',
          style: TextStyle(
            color: Color(0xFF7B61FF),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${notifier.completedCount}/${ref.watch(todoProvider).length}',
                style: const TextStyle(
                  color: Color(0xFF7B61FF),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          _StatsBar(),

          const FilterTabs(),

          const Divider(color: Colors.white12, height: 1),

          Expanded(
            child: todos.isEmpty
                ? _EmptyState()
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(todo: todos[index]);
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: const AddTodoBar(),
    );
  }
}

class _StatsBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(todoProvider.notifier);
    final total = ref.watch(todoProvider).length;

    // Progress: 0.0 to 1.0
    final progress = total == 0 ? 0.0 : notifier.completedCount / total;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${notifier.activeCount} tasks remaining',
                style: const TextStyle(
                    color: Colors.white54, fontSize: 12),
              ),
              Text(
                '${(progress * 100).toInt()}% complete',
                style: const TextStyle(
                    color: Color(0xFF7B61FF), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Overall progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(
                  Color(0xFF7B61FF)),
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('✅', style: TextStyle(fontSize: 48)),
          SizedBox(height: 16),
          Text(
            'All done!',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add a new todo below',
            style: TextStyle(color: Colors.white24, fontSize: 13),
          ),
        ],
      ),
    );
  }
}