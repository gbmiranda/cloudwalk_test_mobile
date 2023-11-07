import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
