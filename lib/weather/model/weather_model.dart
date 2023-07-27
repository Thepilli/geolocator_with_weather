class WeatherModel {
  final double temperatureC;
  final double temperatureF;
  final double uv;
  final double windKPH;
  final String condition;
  final String conditionIcon;
  final String location;
  final String country;
  final int isDay;

  WeatherModel({
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.uv = 0,
    this.windKPH = 0,
    this.condition = "Sunny",
    this.conditionIcon = "",
    this.location = "",
    this.country = "",
    this.isDay = 0,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      uv: json['current']['uv'],
      windKPH: json['current']['wind_kph'],
      condition: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      location: json['location']['name'],
      country: json['location']['country'],
      isDay: json['current']['is_day'],
    );
  }
}
