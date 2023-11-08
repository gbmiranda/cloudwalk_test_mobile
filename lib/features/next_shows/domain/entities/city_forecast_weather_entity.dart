import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'temperature_entity.dart';
import 'weather_entity.dart';

class CityForecastWeatherEntity extends Equatable {
  final int? id;
  final int? timezone;
  final int? dateTime;
  final String? name;
  final List<WeatherEntity>? weather;
  final TemperatureEntity? temperature;

  const CityForecastWeatherEntity(this.id, this.timezone, this.dateTime, this.name, this.weather, this.temperature);

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, temperature];

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(dateTime! * 1000, isUtc: true).toLocal();
  String get weekDay => DateFormat('EEEE').format(date);
  String get dateStr => DateFormat('dd/MM').format(date);
  String get timeStr => DateFormat('HH:mm').format(date);
  String get celsiusInterval => 'Max: ${temperature?.tempMax}º | Min: ${temperature?.tempMin}º';
  String get sky => '${weather?.first.description}';
}
