import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/weather_provider.dart';

class WeatherErrorWidget extends ConsumerWidget {
  final Object error;
  const WeatherErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('⚠️', style: TextStyle(fontSize: 60)),

        const SizedBox(height: 16),

        const Text(
          'Something went wrong',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
          ),
        ),

        const SizedBox(height: 8),

        // Show the actual error message
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.4),
              height: 1.6,
            ),
          ),
        ),

        const SizedBox(height: 8),

        // Shows what AsyncValue state we are in
        Text(
          'FutureProvider → AsyncError',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.2),
            fontFamily: 'monospace',
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 32),

        ElevatedButton.icon(
          onPressed: () => ref.refresh(weatherProvider),
          icon: const Icon(Icons.refresh_rounded),
          label: const Text('Try Again'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00E5C8),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(
                horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
