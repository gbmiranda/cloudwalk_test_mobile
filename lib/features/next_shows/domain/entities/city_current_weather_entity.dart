import 'package:equatable/equatable.dart';

import 'country_entity.dart';
import 'location_entity.dart';
import 'temperature_entity.dart';
import 'weather_entity.dart';

class CityCurrentWeatherEntity extends Equatable {
  final String? name;
  final int? id;
  final int? timezone;
  final int? dateTime;
  final List<WeatherEntity>? weather;
  final LocationEntity? location;
  final TemperatureEntity? temperature;
  final CountryEntity? country;

  const CityCurrentWeatherEntity(
    this.name,
    this.id,
    this.timezone,
    this.dateTime,
    this.weather,
    this.location,
    this.temperature,
    this.country,
  );

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, location, temperature, country];

  String get title => '$name, ${country?.country}';
  String get celsius => '${temperature?.temp}º';
  String get celsiusInterval => 'Max: ${temperature?.tempMax}º | Min: ${temperature?.tempMin}º';
  String get sky => '${weather?.first.description}';
}
