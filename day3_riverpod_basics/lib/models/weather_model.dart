class WeatherModel {
  final double temperature;
  final double windSpeed;
  final int weatherCode;
  final bool isDay;
  final String city;

  const WeatherModel({
    required this.temperature,
    required this.windSpeed,
    required this.weatherCode,
    required this.isDay,
    required this.city,
  });

  // ── Factory constructor — JSON → WeatherModel ──────────────
  // Takes raw API response and maps it to our clean model.
  // 'factory' keyword means it returns an instance of this class.

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    // Get the current_weather nested map
    final current = json['current_weather'] as Map<String, dynamic>;

    return WeatherModel(
      temperature: double.tryParse(current['temperature'].toString()) ?? 0.0,
      windSpeed: double.tryParse(current['windSpeed'].toString()) ?? 0.0,
      weatherCode: int.tryParse(current['weatherCode'].toString()) ?? 0,
      isDay: current['is_day'] == 1,
      city: 'Rawalpindi',
    );
  }

  // ── Computed properties ────────────────────────────────────
  // ALL business logic lives here — not in the UI widgets.
  // Widgets just READ these properties and display them.
  // This is why models should be rich, not just data bags.

  String get emoji {
    if (weatherCode == 0) return isDay ? '☀️' : '🌙';
    if (weatherCode <= 3) return '⛅';
    if (weatherCode <= 48) return '🌫️';
    if (weatherCode <= 67) return '🌧️';
    if (weatherCode <= 77) return '❄️';
    if (weatherCode <= 82) return '🌦️';
    if (weatherCode <= 99) return '⛈️';
    return '🌡️';
  }

  String get description {
    if (weatherCode == 0) return 'Clear Sky';
    if (weatherCode <= 3) return 'Partly Cloudy';
    if (weatherCode <= 48) return 'Foggy';
    if (weatherCode <= 67) return 'Rainy';
    if (weatherCode <= 77) return 'Snowy';
    if (weatherCode <= 82) return 'Showers';
    if (weatherCode <= 99) return 'Thunderstorm';
    return 'Unknown';
  }

  String get feelsLike {
    if (temperature >= 35) return 'Very Hot 🥵';
    if (temperature >= 25) return 'Warm 😊';
    if (temperature >= 15) return 'Cool 🙂';
    return 'Cold 🥶';
  }

  String get tempFormatted => '${temperature.toStringAsFixed(1)}°C';

  String get windFormatted => '${windSpeed.toStringAsFixed(1)}km/h';
}
