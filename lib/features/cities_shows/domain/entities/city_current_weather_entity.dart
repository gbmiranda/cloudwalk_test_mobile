import 'package:equatable/equatable.dart';

import '../../../../common/entities/location_entity.dart';
import '../../../../common/entities/temperature_entity.dart';
import '../../../../common/entities/weather_entity.dart';

class CityCurrentWeatherEntity extends Equatable {
  final String? name;
  final int? id;
  final int? timezone;
  final int? dateTime;
  final WeatherEntity? weather;
  final LocationEntity? location;
  final TemperatureEntity? temperature;

  const CityCurrentWeatherEntity(
    this.name,
    this.id,
    this.timezone,
    this.dateTime,
    this.weather,
    this.location,
    this.temperature,
  );

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, location, temperature];
}
