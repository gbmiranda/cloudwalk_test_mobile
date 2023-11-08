part of 'city_forecast_weather_bloc.dart';

sealed class CityForecastWeatherState {}

class CityForecastWeatherStateLoading extends CityForecastWeatherState {}

class CityForecastWeatherStateSuccess extends CityForecastWeatherState {
  final List<CityForecastWeatherEntity> forecast;
  CityForecastWeatherStateSuccess(this.forecast);
}

class CityForecastWeatherStateError extends CityForecastWeatherState {
  final String? message;
  CityForecastWeatherStateError({this.message});
}
