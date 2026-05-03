import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';
import '../providers/todo_provider.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      // Swipe to delete
      key: Key(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        // ref.read — calling a method in a callback
        // NOT ref.watch — we don't need to rebuild on this
        ref.read(todoProvider.notifier).deleteTodo(todo.id);
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.delete_rounded,
            color: Colors.white, size: 24),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF09091A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: todo.isDone
                ? Colors.white12
                : const Color(0xFF7B61FF).withOpacity(0.3),
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 4),

          // ── Checkbox ────────────────────────────────────────
          leading: GestureDetector(
            onTap: () {
              // ref.read — calling method in callback
              ref.read(todoProvider.notifier).toggleTodo(todo.id);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: todo.isDone
                    ? const Color(0xFF00E5C8)
                    : Colors.transparent,
                border: Border.all(
                  color: todo.isDone
                      ? const Color(0xFF00E5C8)
                      : Colors.white38,
                  width: 2,
                ),
              ),
              child: todo.isDone
                  ? const Icon(Icons.check_rounded,
                  color: Colors.black, size: 14)
                  : null,
            ),
          ),

          // ── Title ────────────────────────────────────────────
          title: Text(
            todo.title,
            style: TextStyle(
              fontSize: 14,
              color: todo.isDone ? Colors.white38 : Colors.white,
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              decorationColor: Colors.white38,
            ),
          ),

          // ── Date ─────────────────────────────────────────────
          subtitle: Text(
            todo.formattedDate,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white24,
            ),
          ),

          // ── Delete button ─────────────────────────────────────
          trailing: IconButton(
            onPressed: () {
              ref.read(todoProvider.notifier).deleteTodo(todo.id);
            },
            icon: const Icon(Icons.close_rounded,
                color: Colors.white24, size: 18),
          ),
        ),
      ),
    );
  }
}