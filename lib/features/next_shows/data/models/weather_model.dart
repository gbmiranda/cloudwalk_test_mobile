import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherModel(this.id, this.main, this.description, this.icon);

  @override
  List<Object?> get props => [id, main, description, icon];

  factory WeatherModel.fromJson(Map<String, dynamic> json) => _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

extension WeatherModelExtension on WeatherModel {
  WeatherEntity toEntity() {
    return WeatherEntity(id, main, description, icon);
  }
}
