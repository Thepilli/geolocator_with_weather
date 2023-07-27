import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meteo_app/weather_model.dart';

class WeatherClient {
  Future<WeatherModel> request() async {
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=50.088&longitude=14.4208&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m';
    Response response = await Dio().get(url);
    final parsedData = jsonDecode(response.toString());
    final weather = WeatherModel.fromJson(parsedData);
    return weather;
  }
}
