import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/city_current_weather_entity.dart';
import 'country_model.dart';
import 'location_model.dart';
import 'temperature_model.dart';
import 'weather_model.dart';

part 'city_current_weather_model.g.dart';

@JsonSerializable()
class CityCurrentWeatherModel extends Equatable {
  final int? id;
  final int? timezone;
  final String? name;
  final List<WeatherModel>? weather;

  @JsonKey(name: 'dt')
  final int? dateTime;

  @JsonKey(name: 'coord')
  final LocationModel? location;

  @JsonKey(name: 'main')
  final TemperatureModel? temperature;

  @JsonKey(name: 'sys')
  final CountryModel? country;

  const CityCurrentWeatherModel(
    this.id,
    this.timezone,
    this.name,
    this.weather,
    this.dateTime,
    this.location,
    this.temperature,
    this.country,
  );

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, location, temperature, country];

  factory CityCurrentWeatherModel.fromJson(Map<String, dynamic> json) => _$CityCurrentWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityCurrentWeatherModelToJson(this);
}

extension CityCurrentWeatherModelExtension on CityCurrentWeatherModel {
  CityCurrentWeatherEntity toEntity() {
    return CityCurrentWeatherEntity(
      name,
      id,
      timezone,
      dateTime,
      weather?.map((item) => item.toEntity()).toList(),
      location?.toEntity(),
      temperature?.toEntity(),
      country?.toEntity(),
    );
  }
}
