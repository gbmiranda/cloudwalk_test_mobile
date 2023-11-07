import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../common/models/temperature_model.dart';
import '../../../../common/models/weather_model.dart';
import '../../domain/entities/city_forecastt_weather_entity.dart';

part 'city_forecast_weather_model.g.dart';

@JsonSerializable()
class CityForecastWeatherModel extends Equatable {
  final int? id;
  final int? timezone;
  final String? name;
  final WeatherModel? weather;

  @JsonValue('dt')
  final int? dateTime;

  @JsonValue('main')
  final TemperatureModel? temperature;

  const CityForecastWeatherModel(
    this.id,
    this.timezone,
    this.name,
    this.weather,
    this.dateTime,
    this.temperature,
  );

  @override
  List<Object?> get props => [id, timezone, name, weather, dateTime, temperature];

  factory CityForecastWeatherModel.fromJson(Map<String, dynamic> json) => _$CityForecastWeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityForecastWeatherModelToJson(this);
}

extension CityForecastWeatherModelExtension on CityForecastWeatherModel {
  CityForecastWeatherEntity toEntity() {
    return CityForecastWeatherEntity(
      id,
      timezone,
      dateTime,
      name,
      weather?.toEntity(),
      temperature?.toEntity(),
    );
  }
}

extension CityForecastWeatherModelListExtension on List<CityForecastWeatherModel> {
  List<CityForecastWeatherEntity> toEntityList() => map((e) => e.toEntity()).toList();
}