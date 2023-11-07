import 'package:equatable/equatable.dart';

import '../../../../common/entities/temperature_entity.dart';
import '../../../../common/entities/weather_entity.dart';

class CityForecastWeatherEntity extends Equatable {
  final int? id;
  final int? timezone;
  final int? dateTime;
  final String? name;
  final WeatherEntity? weather;
  final TemperatureEntity? temperature;

  const CityForecastWeatherEntity(this.id, this.timezone, this.dateTime, this.name, this.weather, this.temperature);

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, temperature];
}
