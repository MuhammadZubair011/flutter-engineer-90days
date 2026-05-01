import 'package:day2_provider_migration/notifiers/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CounterNotifier>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${notifier.count}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 100,
            color: Color(0xFF7B61FF),
            height: 1,
          ),
        ),

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFF7B61FF).withOpacity(0.08),
            border: Border.all(color: Color(0xFF7B61FF).withOpacity(0.25)),
            borderRadius: BorderRadius.circular(20),
          ),

          child: const Text(
            'context.watch<CounterNotifier>()',
            style: TextStyle(
              fontSize: 10,
              color: Color(0xFF7B61FF),
              letterSpacing: 1,
              fontFamily: 'monospace',
            ),
          ),
        ),
      ],
    );
  }
}
