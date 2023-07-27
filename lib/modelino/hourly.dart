class Hourly {
  List<String>? time;
  List<num>? temperature2m;
  List<int>? relativehumidity2m;
  List<num>? windspeed10m;

  Hourly({
    this.time,
    this.temperature2m,
    this.relativehumidity2m,
    this.windspeed10m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json['time'] as List<String>?,
        temperature2m: json['temperature_2m'] as List<num>?,
        relativehumidity2m: json['relativehumidity_2m'] as List<int>?,
        windspeed10m: json['windspeed_10m'] as List<num>?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'temperature_2m': temperature2m,
        'relativehumidity_2m': relativehumidity2m,
        'windspeed_10m': windspeed10m,
      };
}
