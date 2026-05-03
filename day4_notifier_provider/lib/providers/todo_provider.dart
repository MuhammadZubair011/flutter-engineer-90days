import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo_model.dart';

class TodoNotifier extends Notifier<List<Todo>> {

  @override
  List<Todo> build() {
    return [
      Todo.create('Learn InheritedWidget'),
      Todo(
        id: '1',
        title: 'Learn InheritedWidget',
        isDone: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Todo(
        id: '2',
        title: 'Learn Provider package',
        isDone: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Todo(
        id: '3',
        title: 'Learn Riverpod FutureProvider',
        isDone: true,
        createdAt: DateTime.now(),
      ),
      Todo(
        id: '4',
        title: 'Learn Riverpod NotifierProvider',
        isDone: false,
        createdAt: DateTime.now(),
      ),
    ];
  }


  void addTodo(String title) {
    if (title.trim().isEmpty) return; // ignore empty titles
    final newTodo = Todo.create(title.trim());
    state = [...state, newTodo]; // NEW list = rebuild triggered
  }


  void toggleTodo(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        // copyWith creates a modified copy — doesn't mutate original
        return todo.copyWith(isDone: !todo.isDone);
      }
      return todo; // all other todos unchanged
    }).toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }


  void clearCompleted() {
    state = state.where((todo) => !todo.isDone).toList();
  }

  // ── EDIT todo title ───────────────────────────────────────
  void editTodo(String id, String newTitle) {
    if (newTitle.trim().isEmpty) return;
    state = state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(title: newTitle.trim());
      }
      return todo;
    }).toList();
  }

  // ── Computed getters ──────────────────────────────────────
  // Business logic in the Notifier — not in the UI.
  int get completedCount => state.where((t) => t.isDone).length;
  int get activeCount => state.where((t) => !t.isDone).length;
  bool get allDone => state.isNotEmpty && state.every((t) => t.isDone);
}

final todoProvider = NotifierProvider<TodoNotifier, List<Todo>>(
  TodoNotifier.new, // shorthand for () => TodoNotifier()
);