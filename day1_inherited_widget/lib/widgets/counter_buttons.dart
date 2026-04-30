import 'package:flutter/material.dart';
import '../counter_data.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {

    final counterData = CounterData.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ActionButton(
          icon: Icons.remove_rounded,
          label: 'Decrease',
          color: Colors.redAccent,
          // Passing the callback from InheritedWidget directly
          onPressed: counterData.onDecrement,
        ),

        const SizedBox(width: 24),

        _ActionButton(
          icon: Icons.add_rounded,
          label: 'Increase',
          color: const Color(0xFF00E5C8),
          onPressed: counterData.onIncrement,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: color.withOpacity(0.35),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: color.withOpacity(0.7),
                fontSize: 10,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}