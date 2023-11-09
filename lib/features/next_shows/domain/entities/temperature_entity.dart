import 'package:equatable/equatable.dart';

class TemperatureEntity extends Equatable {
  final double? temp;
  final double? pressure;
  final double? humidity;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;

  const TemperatureEntity(this.temp, this.pressure, this.humidity, this.feelsLike, this.tempMin, this.tempMax);

  @override
  List<Object?> get props => [temp, pressure, humidity, feelsLike, tempMin, tempMax];
}
