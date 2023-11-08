import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final double? lat;
  final double? lon;

  const LocationEntity(this.lat, this.lon);

  @override
  List<Object?> get props => [lat, lon];
}
