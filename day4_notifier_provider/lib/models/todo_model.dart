import 'package:flutter/foundation.dart';

@immutable // Dart annotation — prevents accidental mutation
class Todo {
  final String id;
  final String title;
  final bool isDone;
  final DateTime createdAt;


  const Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt
});

// ── Factory constructor — creates a new Todo ───────────────
// Uses DateTime.now() as unique ID (simple approach)
// In production you'd use uuid package

factory Todo.create(String title){
  final now =DateTime.now();
  return Todo(id: now.millisecondsSinceEpoch.toString(), title: title, isDone: false, createdAt: now);
}

// ── copyWith — creates modified copy ──────────────────────
// CRITICAL PATTERN — used everywhere in Riverpod.
// Instead of: todo.isDone = true  ← mutates (WRONG)
// We do:      todo.copyWith(isDone: true) ← new object (CORRECT)
//
// Named parameters are optional — if not provided,
// the original value is kept.


  Todo copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,   // if isDone provided → use it
      createdAt: createdAt ?? this.createdAt, // else keep original
    );
  }

  // ── Computed properties ────────────────────────────────────
  String get formattedDate {
    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }

}