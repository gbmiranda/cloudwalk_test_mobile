import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_failures.dart';
import '../entities/city_current_weather_entity.dart';
import '../entities/city_forecast_weather_entity.dart';

abstract class NextShowsRepository {
  Future<Either<AppFailures, CityCurrentWeatherEntity>> getLocationWeather(String lat, String lon);
  Future<Either<AppFailures, List<CityForecastWeatherEntity>>> getCityForecasts(String lat, String lon);
}
