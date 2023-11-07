import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/country_entity.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends Equatable {
  final String? country;

  const CountryModel(this.country);

  @override
  List<Object?> get props => [country];

  factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}

extension CountryModelExtension on CountryModel {
  CountryEntity toEntity() {
    return CountryEntity(country);
  }
}
