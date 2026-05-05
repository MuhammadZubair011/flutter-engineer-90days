import 'package:day4_notifier_provider/providers/todo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/todo_model.dart';

enum TodoFilter { all, active, completed }

final filterProvider = StateProvider<TodoFilter>(
      (ref) => TodoFilter.all, // start with 'all' filter
);


final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final todos = ref.watch(todoProvider);
  final filter = ref.watch(filterProvider);

  switch (filter) {
    case TodoFilter.active:
      return todos.where((t) => !t.isDone).toList();
    case TodoFilter.completed:
      return todos.where((t) => t.isDone).toList();
    case TodoFilter.all:
      return todos; // return all todos unchanged
  }
});