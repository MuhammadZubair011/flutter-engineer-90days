import 'package:flutter/material.dart';

import '../counter_data.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final counterData = CounterData.of(context);

    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${counterData.count}',
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.w900,
            color: Color(0xFF00E5C8),
            height: 1,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          counterData.count == 0
              ? 'Press + to start'
              : counterData.count == 1
              ? '${counterData.count} tap'
              : '${counterData.count} taps',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 2,
          ),
        ),

        const SizedBox(height: 12),


        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF00E5C8).withOpacity(0.08),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF00E5C8).withOpacity(0.2),
            ),
          ),
          child: const Text(
            'Data from CounterData.of(context)',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF00E5C8),
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
