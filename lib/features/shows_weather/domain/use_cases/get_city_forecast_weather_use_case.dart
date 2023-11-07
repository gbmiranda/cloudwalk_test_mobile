import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_failures.dart';
import '../entities/city_forecastt_weather_entity.dart';
import '../repositories/cities_shows_repository.dart';

abstract class GetCityForecastWeatherUseCase {
  Future<Either<AppFailures, List<CityForecastWeatherEntity>>> call(String lat, String lon);
}

class GetCityForecastWeatherUseCaseImpl implements GetCityForecastWeatherUseCase {
  final CitiesShowsRepository repository;

  GetCityForecastWeatherUseCaseImpl(this.repository);

  @override
  Future<Either<AppFailures, List<CityForecastWeatherEntity>>> call(String lat, String lon) async {
    return repository.getCityForecast(lat, lon);
  }
}
