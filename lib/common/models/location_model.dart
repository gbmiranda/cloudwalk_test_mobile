import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../entities/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable {
  final double? lon;
  final double? lat;

  const LocationModel(this.lon, this.lat);

  @override
  List<Object?> get props => [lon, lat];

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

extension LocationModelExtension on LocationModel {
  LocationEntity toEntity() {
    return LocationEntity(lon, lat);
  }
}
