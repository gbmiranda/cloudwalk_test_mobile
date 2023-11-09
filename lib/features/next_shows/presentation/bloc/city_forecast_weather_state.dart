part of 'city_forecast_weather_bloc.dart';

sealed class CityForecastWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CityForecastWeatherStateLoading extends CityForecastWeatherState {}

class CityForecastWeatherStateSuccess extends CityForecastWeatherState {
  final List<CityForecastWeatherEntity> forecast;
  CityForecastWeatherStateSuccess(this.forecast);

  @override
  List<Object?> get props => [forecast];
}

class CityForecastWeatherStateError extends CityForecastWeatherState {
  final String? message;
  CityForecastWeatherStateError({this.message});

  @override
  List<Object?> get props => [message];
}
