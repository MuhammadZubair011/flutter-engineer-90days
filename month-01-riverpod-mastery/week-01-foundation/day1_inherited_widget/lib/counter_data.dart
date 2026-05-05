import 'package:flutter/material.dart';

class CounterData extends InheritedWidget{

  final int count;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onReset;

  const CounterData({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    required this.onReset,
    required super.child
});

  static CounterData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<CounterData>();

    assert(
    result != null,
    'Counter not found!\n'
        'Make sure CounterProvider wraps your widget tree in main.dart'
    );

    return result!;
  }

  @override
  bool updateShouldNotify(CounterData oldWidget) {
    return count != oldWidget.count;
  }}

