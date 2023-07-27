import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/weather/model/weather_model.dart';
import 'package:meteo_app/weather/service/weather_service.dart';

class HomePageWeather extends StatefulWidget {
  const HomePageWeather({super.key});

  @override
  State<HomePageWeather> createState() => _HomePageWeatherState();
}

class _HomePageWeatherState extends State<HomePageWeather> {
  WeatherService weatherService = WeatherService();
  WeatherModel weather = WeatherModel();

  double temperatureC = 0;
  double temperatureF = 0;
  double uv = 0;
  double windKPH = 0;
  String currentWeather = '';
  String currentWeatherIcon = '';
  String locationName = '';
  String locationCountry = '';
  int isDay = 0;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    getWeather();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  void getWeather() async {
    weather = await weatherService.getWeatherData('Prague');

    setState(() {
      temperatureC = weather.temperatureC;
      temperatureF = weather.temperatureF;
      uv = weather.uv;
      windKPH = weather.windKPH;
      currentWeather = weather.condition;
      currentWeatherIcon = weather.conditionIcon;
      locationName = weather.location;
      locationCountry = weather.country;
      isDay = weather.isDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    isDay == 1 ? 'assets/images/day.jpg' : 'assets/images/night.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Text(
                    currentWeather,
                    style: GoogleFonts.poppins(height: 1, color: Colors.white, fontSize: width / 10, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https:$currentWeatherIcon',
                        scale: .6,
                      ),
                      Text('${temperatureC.toString()} ℃',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: width / 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('$locationName, $locationCountry',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: width / 15, fontWeight: FontWeight.w200)),
                  const Spacer(),
                  Text(
                    '${uv.toString()} UV | ${windKPH.toString()} KPH',
                    style: GoogleFonts.poppins(color: Colors.white, fontSize: width / 14, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    DateFormat('EEE, dd MMM').format(now),
                    style: GoogleFonts.poppins(height: 1, color: Colors.white, fontSize: width / 10, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DateFormat('HH:mm:ss').format(now),
                    style: GoogleFonts.poppins(height: 1, color: Colors.white, fontSize: width / 10, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
