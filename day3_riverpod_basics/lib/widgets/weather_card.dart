import 'package:day3_riverpod_basics/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(weather.city, style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
          letterSpacing: 3
        ),
        ),

        const SizedBox(height: 16),

        // ── Weather emoji ─────────────────────────────────────
        // Comes from computed property in WeatherModel

        Text(weather.emoji, style: TextStyle(fontSize: 80),),

        SizedBox(height: 16,),

        // ── Temperature ───────────────────────────────────────
        Text(
          weather.tempFormatted,
          style: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            color: Color(0xFF00E5C8),
            height: 1,
          ),
        ),


        const SizedBox(height: 8),

        // ── Description ───────────────────────────────────────
        Text(
          weather.description,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white.withOpacity(0.6),
            letterSpacing: 1,
          ),
        ),


        const SizedBox(height: 32),

        // ── Info row — wind + feels like ──────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _InfoChip(
              icon: Icons.air_rounded,
              label: 'Wind',
              value: weather.windFormatted,
            ),
            const SizedBox(width: 16),
            _InfoChip(
              icon: Icons.thermostat_rounded,
              label: 'Feels',
              value: weather.feelsLike,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // ── Day/Night indicator ───────────────────────────────
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: weather.isDay
                ? Colors.orange.withOpacity(0.1)
                : Colors.indigo.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: weather.isDay
                  ? Colors.orange.withOpacity(0.3)
                  : Colors.indigo.withOpacity(0.3),
            ),
          ),
          child: Text(
            weather.isDay ? '☀️ Daytime' : '🌙 Nighttime',
            style: TextStyle(
              fontSize: 12,
              color: weather.isDay ? Colors.orange : Colors.indigo[200],
              letterSpacing: 1,
            ),
          ),
        ),


      ],
    );
  }
}


// ── Reusable info chip ────────────────────────────────────────
class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF00E5C8), size: 20),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white38,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}