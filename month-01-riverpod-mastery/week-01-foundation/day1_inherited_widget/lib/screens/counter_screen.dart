import 'package:flutter/material.dart';

import '../counter_data.dart';
import '../widgets/counter_buttons.dart';
import '../widgets/counter_display.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterData = CounterData.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF06060E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09091A),
        elevation: 0,
        title: const Text(
          'Day 1 - InheritedWidget',
          style: TextStyle(
            color: Color(0xFF00E5C8),
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        actions: [
          IconButton(
            onPressed: counterData.onReset,
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white38,
            ),
            tooltip: 'Reset to 0',
          ),
        ],
      ),

      body: Column(
        children: [

          const Spacer(),

          const CounterDisplay(),

          const Spacer(),

          const CounterButtons(),

          const SizedBox(height: 60),
        ],
      )

    );
  }
}


