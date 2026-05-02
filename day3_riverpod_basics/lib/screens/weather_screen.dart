import 'package:day3_riverpod_basics/providers/weather_provider.dart';
import 'package:day3_riverpod_basics/widgets/error_widget.dart';
import 'package:day3_riverpod_basics/widgets/loading_widget.dart';
import 'package:day3_riverpod_basics/widgets/weather_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsync = ref.watch(weatherProvider);
    return Scaffold(
      backgroundColor: const Color(0xFF06060E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF09091A),
        elevation: 0,
        title: const Text(
          'Day 3_Riverpod FutureProvider',
          style: TextStyle(
            color: Color(0xFF00E5C8),
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        actions: [
          IconButton(
            onPressed: () => ref.refresh(weatherProvider),
            icon: const Icon(Icons.refresh_rounded, color: Colors.white54),
            tooltip: 'Refresh weather',
          ),
        ],
      ),

      body: Center(
        child: Padding(padding: EdgeInsets.all(24),
          child: weatherAsync.when(data: (weather)=> WeatherCard(weather: weather,), error: (error, stackTrace)=> WeatherErrorWidget(error: error,) , loading: ()=> WeatherLoadingWidget()),
        ),
      ),

      bottomNavigationBar: Container(
        color: const Color(0xFF09091A),
        padding: const EdgeInsets.all(12),
        child: Text(
          'AsyncValue: ${weatherAsync.runtimeType}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.2),
            fontFamily: 'monospace',
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
