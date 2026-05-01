import 'package:day2_provider_migration/notifiers/counter_notifier.dart';
import 'package:day2_provider_migration/widgets/counter_button.dart';
import 'package:day2_provider_migration/widgets/counter_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF06060E),
        elevation: 0,
        title: Text(
          'Day2 _ Provider',
          style: TextStyle(
            color: Color(0xFF7B61FF),
            letterSpacing: 1,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterNotifier>().reset();
            },
            icon: const Icon(Icons.refresh_rounded, color: Colors.white38),
            tooltip: 'Reset',
          ),
        ],
      ),

      body: Column(
        children: [
          const CounterDisplay(),

          const Spacer(),

          const CounterButton(),

          const SizedBox(height: 60),

        ],
      ),
    );
  }
}
