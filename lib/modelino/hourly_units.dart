class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativehumidity2m;
  String? windspeed10m;

  HourlyUnits({
    this.time,
    this.temperature2m,
    this.relativehumidity2m,
    this.windspeed10m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json['time'] as String?,
        temperature2m: json['temperature_2m'] as String?,
        relativehumidity2m: json['relativehumidity_2m'] as String?,
        windspeed10m: json['windspeed_10m'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'temperature_2m': temperature2m,
        'relativehumidity_2m': relativehumidity2m,
        'windspeed_10m': windspeed10m,
      };
}
