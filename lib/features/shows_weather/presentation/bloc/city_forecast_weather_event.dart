part of 'city_forecast_weather_bloc.dart';

sealed class CityForecastWeatherEvent {}

class FetchCityForecastWeatherEvent extends CityForecastWeatherEvent {
  final CityCurrentWeatherEntity cityCurrentWeather;

  FetchCityForecastWeatherEvent(this.cityCurrentWeather);
}
