class CurrentWeather {
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? weathercode;
  int? isDay;
  String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.isDay,
    this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: (json['temperature'] as num?)?.toDouble(),
      windspeed: (json['windspeed'] as num?)?.toDouble(),
      winddirection: json['winddirection'] as int?,
      weathercode: json['weathercode'] as int?,
      isDay: json['is_day'] as int?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'temperature': temperature,
        'windspeed': windspeed,
        'winddirection': winddirection,
        'weathercode': weathercode,
        'is_day': isDay,
        'time': time,
      };
}
