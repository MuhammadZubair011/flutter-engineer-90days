import 'package:day1_inherited_widget/counter_data.dart';
import 'package:flutter/material.dart';

class CounterProvider extends StatefulWidget {
  final Widget child;

  const CounterProvider({super.key, required this.child});

  @override
  State<CounterProvider> createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
  int _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      if (_count > 0) _count--;
    });
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterData(
      count: _count,
      onIncrement: _increment,
      onDecrement: _decrement,
      onReset: _reset,
      child: widget.child,
    );
  }
}
