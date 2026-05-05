import 'package:day3_riverpod_basics/models/weather_model.dart';
import 'package:day3_riverpod_basics/repositories/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherRepositoryProvider = Provider<WeatherRepository>((ref){
  return WeatherRepository();
});


final weatherProvider = FutureProvider<WeatherModel>((ref) async{
  final repository = ref.watch(weatherRepositoryProvider);

  return repository.getWeather();
});