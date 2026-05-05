import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

class AddTodoBar extends ConsumerStatefulWidget {
  const AddTodoBar({super.key});

  @override
  ConsumerState<AddTodoBar> createState() => _AddTodoBarState();
}

class _AddTodoBarState extends ConsumerState<AddTodoBar> {
  // Local state — TextEditingController belongs to this widget only
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  // Dispose is critical — prevents memory leaks
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addTodo() {
    final title = _controller.text.trim();
    if (title.isEmpty) return;

    // ref is available because we extend ConsumerStatefulWidget
    // ref.read — calling a method, no subscription needed
    ref.read(todoProvider.notifier).addTodo(title);

    // Clear input after adding
    _controller.clear();
    _focusNode.requestFocus(); // keep keyboard open for fast entry
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xFF09091A),
        border: Border(top: BorderSide(color: Colors.white12)),
      ),
      child: Row(
        children: [
          // ── Text input ──────────────────────────────────────
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              decoration: InputDecoration(
                hintText: 'Add a new todo...',
                hintStyle: const TextStyle(color: Colors.white38),
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color(0xFF7B61FF), width: 1.5),
                ),
              ),
              // Submit on keyboard done button
              onSubmitted: (_) => _addTodo(),
              textInputAction: TextInputAction.done,
            ),
          ),

          const SizedBox(width: 12),

          // ── Add button ──────────────────────────────────────
          GestureDetector(
            onTap: _addTodo,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF7B61FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.add_rounded,
                  color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}