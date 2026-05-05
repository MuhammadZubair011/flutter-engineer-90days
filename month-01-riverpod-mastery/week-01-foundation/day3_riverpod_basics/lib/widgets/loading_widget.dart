import 'package:flutter/material.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        const SizedBox(
          height: 80,
          width: 80,

          child: CircularProgressIndicator(color: Color(0xFF00E5C8),
            strokeWidth: 3,),
        ),

        const SizedBox(height: 24),
        Text(
          'Fetching weather...',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 2,
          ),
        ),

        SizedBox(height: 8,),

        Text(
          'FutureProvider → AsyncLoading',
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.2),
            fontFamily: 'monospace',
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }
}
