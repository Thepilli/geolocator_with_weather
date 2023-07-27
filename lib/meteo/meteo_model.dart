class MeteoModel {
  final currentWeather;
  final hourly;

  MeteoModel({required this.currentWeather, required this.hourly});
  factory MeteoModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data["current_weather"] as Map<String, dynamic>;
    final hourly = data["hourly"] as Map<String, dynamic>;
    return MeteoModel(currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  final double temperature;
  final double windspeed;
  final double winddirection;
  final int weathercode;
  final int isDay;
  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.isDay,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> data) {
    final temperature = data["temperature"] as double;
    final windspeed = data["windspeed"] as double;
    final winddirection = data["winddirection"] as double;
    final weathercode = data["weathercode"] as int;
    final isDay = data["isDay"] as int;
    return CurrentWeather(
      temperature: temperature,
      windspeed: windspeed,
      winddirection: winddirection,
      weathercode: weathercode,
      isDay: isDay,
    );
  }
}

class HourlyCast {
  final List<String> time;
  final List<double> temperatures;

  HourlyCast({required this.time, required this.temperatures});

  factory HourlyCast.fromJson(Map<String, dynamic> data) {
    final List<String> time = data["time"] as List<String>;
    final List<double> temperatures = data["temperature_2m"] as List<double>;
    return HourlyCast(time: time, temperatures: temperatures);
  }
}
