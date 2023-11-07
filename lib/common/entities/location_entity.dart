import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double? lon;
  final double? lat;

  const LocationEntity(this.lon, this.lat);

  @override
  List<Object?> get props => [lon, lat];
}
