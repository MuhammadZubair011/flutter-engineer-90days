import 'dart:convert';

import 'package:day3_riverpod_basics/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository {
  static const String _baseUrl =
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=33.6007'
      '&longitude=73.0679'
      '&current_weather=true';


  Future<WeatherModel> getWeather() async {


    try {

      // Step 1: Make the HTTP request

      final response = await http.get(Uri.parse(_baseUrl));
      // Step 2: Check if request was successful
      // HTTP 200 = OK. Anything else = something went wrong.
      if (response.statusCode != 200) {
        throw Exception(

          'Failed to load Weather. Status ${response.statusCode}',
        );
      }

      // Step 3: Parse JSON response body

      final Map<String, dynamic> json = jsonDecode(response.body);

      // Step 4: Convert JSON to our clean WeatherModel
      // WeatherModel.fromJson handles all the messy JSON parsing
      return WeatherModel.fromJson(json);
    } on http.ClientException catch (e) {
      // Network error — no internet connection

      throw Exception('No internet connection: ${e.message}');
    } catch (e) {
      throw Exception('Something went wrong: $e');

    }
  }
}
