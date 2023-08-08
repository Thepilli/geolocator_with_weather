import 'dart:async';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meteo_app/constants/applystyle.dart';
import 'package:meteo_app/constants/colors.dart';
import 'package:meteo_app/weather/glass_box.dart';
import 'package:meteo_app/weather/model/weather_forecast_model.dart';
import 'package:meteo_app/weather/service/weather_service.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  WeatherService weatherService = WeatherService();
  WeatherForecast forecast = WeatherForecast();
  bool isDataLoaded = false;

  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    getForecast();
    Future.delayed(const Duration(seconds: 2), () => isDataLoaded = true);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        now = DateTime.now();
      });
    });
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat.yMMMMd('en_US');
    return formatter.format(date);
  }

  void getForecast() async {
    forecast = await weatherService.getForecastData('Prague');
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
                    forecast.current?.isDay == 1 ? 'assets/images/day.jpg' : 'assets/images/night.jpg',
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
                    (forecast.current?.condition?.text).toString(),
                    style: appstyle(40, AppColors.whiteColor, FontWeight.w200),
                  ),
                  SizedBox(
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isDataLoaded
                            ? CachedNetworkImage(
                                imageUrl: 'https:${forecast.current?.condition?.icon}',
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : const CircularProgressIndicator(),
                        Text(
                          '${forecast.current?.tempC} ℃',
                          style: appstyle(50, AppColors.whiteColor, FontWeight.w200),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${forecast.location?.name}, ${forecast.location?.country}',
                    style: appstyle(12, AppColors.whiteColor, FontWeight.w200),
                  ),
                  const Spacer(),
                  isDataLoaded
                      ? SizedBox(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: forecast.forecast?.forecastday?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: GlassBox(
                                  height: 200.0.h,
                                  width: 110.0.w,
                                  child: Center(
                                    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                                      const SizedBox(height: 10),
                                      Text(
                                        DateFormat.E().format(DateTime.fromMillisecondsSinceEpoch(
                                            (forecast.forecast?.forecastday?[index].dateEpoch)! * 1000)),
                                        style: appstyle(20, AppColors.whiteColor, FontWeight.w200),
                                      ),
                                      CachedNetworkImage(
                                          imageUrl: 'https:${forecast.forecast?.forecastday?[index].day?.condition?.icon}'),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Highs: ${forecast.forecast?.forecastday?[index].day?.maxtempC}',
                                        style: appstyle(12, AppColors.whiteColor, FontWeight.w200),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Lows: ${forecast.forecast?.forecastday?[index].day?.mintempC}',
                                        style: appstyle(12, AppColors.whiteColor, FontWeight.w200),
                                      ),
                                    ]),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const CircularProgressIndicator(),
                  Text(
                    '${forecast.current?.uv} UV | ${forecast.current?.windKph} KPH',
                    style: appstyle(25, AppColors.whiteColor, FontWeight.w200),
                  ),
                  Text(
                    DateFormat('EEE, dd MMM').format(now),
                    style: appstyle(25, AppColors.whiteColor, FontWeight.w200),
                  ),
                  Text(
                    DateFormat('HH:mm:ss').format(now),
                    style: appstyle(25, AppColors.whiteColor, FontWeight.w200),
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
