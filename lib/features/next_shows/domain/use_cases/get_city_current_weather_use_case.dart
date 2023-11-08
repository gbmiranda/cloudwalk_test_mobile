import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_failures.dart';
import '../entities/city_current_weather_entity.dart';
import '../repositories/next_shows_repository.dart';

abstract class GetCityCurrentWeatherUseCase {
  Future<Either<AppFailures, CityCurrentWeatherEntity>> call(String lat, String lon);
}

class GetCityCurrentWeatherUseCaseImpl implements GetCityCurrentWeatherUseCase {
  final NextShowsRepository repository;

  GetCityCurrentWeatherUseCaseImpl(this.repository);

  @override
  Future<Either<AppFailures, CityCurrentWeatherEntity>> call(String lat, String lon) async {
    return repository.getLocationWeather(lat, lon);
  }
}
