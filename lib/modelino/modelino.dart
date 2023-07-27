import 'current_weather.dart';
import 'hourly.dart';
import 'hourly_units.dart';

class Modelino {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  int? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  Modelino({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeather,
    this.hourlyUnits,
    this.hourly,
  });

  factory Modelino.fromJson(Map<String, dynamic> json) => Modelino(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
        utcOffsetSeconds: json['utc_offset_seconds'] as int?,
        timezone: json['timezone'] as String?,
        timezoneAbbreviation: json['timezone_abbreviation'] as String?,
        elevation: json['elevation'] as int?,
        currentWeather: json['current_weather'] == null
            ? null
            : CurrentWeather.fromJson(
                json['current_weather'] as Map<String, dynamic>),
        hourlyUnits: json['hourly_units'] == null
            ? null
            : HourlyUnits.fromJson(
                json['hourly_units'] as Map<String, dynamic>),
        hourly: json['hourly'] == null
            ? null
            : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'generationtime_ms': generationtimeMs,
        'utc_offset_seconds': utcOffsetSeconds,
        'timezone': timezone,
        'timezone_abbreviation': timezoneAbbreviation,
        'elevation': elevation,
        'current_weather': currentWeather?.toJson(),
        'hourly_units': hourlyUnits?.toJson(),
        'hourly': hourly?.toJson(),
      };
}
