import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meteo_app/meteo/meteo_model.dart';

class MeteoClient {
  Future<MeteoModel> request() async {
    String url =
        'https://api.open-meteo.com/v1/forecast?latitude=50.088&longitude=14.4208&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m';
    Response response = await Dio().get(url);
    final parsedData = jsonDecode(response.toString());
    final weather = MeteoModel.fromJson(parsedData);
    return weather;
  }
}
