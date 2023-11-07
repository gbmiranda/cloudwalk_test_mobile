import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'temperature_model.g.dart';

@JsonSerializable()
class TemperatureModel extends Equatable {
  final double? temp;
  final double? pressure;
  final double? humidity;

  @JsonValue('feels_like')
  final double? feelsLike;

  @JsonValue('temp_min')
  final double? tempMin;

  @JsonValue('temp_max')
  final double? tempMax;

  const TemperatureModel(this.temp, this.pressure, this.humidity, this.feelsLike, this.tempMin, this.tempMax);

  @override
  List<Object?> get props => [temp, pressure, humidity, feelsLike, tempMin, tempMax];

  factory TemperatureModel.fromJson(Map<String, dynamic> json) => _$TemperatureModelFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureModelToJson(this);
}
