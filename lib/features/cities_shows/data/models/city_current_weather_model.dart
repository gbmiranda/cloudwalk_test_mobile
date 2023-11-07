import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/models/location_model.dart';
import '../../../../common/models/temperature_model.dart';
import '../../../../common/models/weather_model.dart';
import '../../domain/entities/city_current_weather_entity.dart';

part 'city_current_weather_model.g.dart';

@JsonSerializable()
class CityCurrentWeatherModel extends Equatable {
  final int? id;
  final int? timezone;
  final String? name;
  final WeatherModel? weather;

  @JsonValue('dt')
  final int? dateTime;

  @JsonValue('coord')
  final LocationModel? location;

  @JsonValue('main')
  final TemperatureModel? temperature;

  const CityCurrentWeatherModel(
    this.id,
    this.timezone,
    this.name,
    this.weather,
    this.dateTime,
    this.location,
    this.temperature,
  );

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, location, temperature];

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
      weather?.toEntity(),
      location?.toEntity(),
      temperature?.toEntity(),
    );
  }
}
