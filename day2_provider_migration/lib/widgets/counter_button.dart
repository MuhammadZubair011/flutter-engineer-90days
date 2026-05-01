import 'package:day2_provider_migration/notifiers/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<CounterNotifier>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ActionButton(
          icon: Icons.remove_rounded,
          color: Colors.redAccent,
          label: 'Decrease',
          onPressed: notifier.isZero
              ? null
              : () => context.read<CounterNotifier>().decrement(),
        ),

        SizedBox(width: 24),

        _ActionButton(
          icon: Icons.refresh_rounded,
          color: Colors.white38,
          label: 'Reset',
          onPressed: notifier.isZero
              ? null
              : () => context.read<CounterNotifier>().reset(),
        ),

        SizedBox(width: 24),

        _ActionButton(
          icon: Icons.add_rounded,
          color: Color(0xFF7B61FF),
          label: 'Increase',
          onPressed: notifier.isMax
              ? null
              : () => context.read<CounterNotifier>().increment(),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;

  const _ActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    return GestureDetector(
      onTap:  onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isDisabled
              ? Colors.white.withOpacity(0.03)
              : color.withOpacity(0.1),

          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDisabled ? Colors.white12 : color.withOpacity(0.4),

            width: 1.5,
          ),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),

            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: isDisabled ? Colors.white24 : color.withOpacity(0.7),
                fontWeight: FontWeight.w600,
                fontSize: 9,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
