import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meteo_app/weather/model/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherData(String place) async {
    try {
      final queryParams = {
        'key': '8b37c717bd48493399a130928221212',
        'q': place,
      };
      final uri = Uri.http('api.weatherapi.com', '/v1/current.json', queryParams);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Cannot get the current weather');
      }
    } catch (e) {
      rethrow;
    }
  }
}
