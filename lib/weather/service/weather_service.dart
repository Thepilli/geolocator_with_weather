import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meteo_app/weather/model/weather_forecast_model.dart';

class WeatherService {
  Future<WeatherForecast> getForecastData(String place) async {
    try {
      final queryParams = {
        'key': '8b37c717bd48493399a130928221212',
        'q': place,
        'days': '3',
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/forecast.json', queryParams);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return WeatherForecast.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Cannot get the forecast weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
