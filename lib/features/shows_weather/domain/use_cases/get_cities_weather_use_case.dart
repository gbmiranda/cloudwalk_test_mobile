import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_failures.dart';
import '../entities/city_current_weather_entity.dart';
import 'get_cities_shows_location_use_case.dart';
import 'get_city_current_weather_use_case.dart';

abstract class GetCitiesWeatherUseCase {
  Future<Either<AppFailures, List<CityCurrentWeatherEntity>>> call();
}

class GetCitiesWeatherUseCaseImpl implements GetCitiesWeatherUseCase {
  final GetCitiesShowsLocationUseCase getCitiesShowsLocationUseCase;
  final GetCityCurrentWeatherUseCase getCityCurrentWeatherUseCase;

  GetCitiesWeatherUseCaseImpl(this.getCitiesShowsLocationUseCase, this.getCityCurrentWeatherUseCase);

  @override
  Future<Either<AppFailures, List<CityCurrentWeatherEntity>>> call() async {
    final nextCities = getCitiesShowsLocationUseCase.call();

    final results = await Future.wait(nextCities.map((city) {
      return getCityCurrentWeatherUseCase.call(city.lat.toString(), city.lon.toString());
    }).toList());

    final List<CityCurrentWeatherEntity> cities = [];

    for (final city in results) {
      city.fold((l) => null, (cityWeather) => cities.add(cityWeather));
    }

    return cities.isNotEmpty ? Right(cities) : const Left(CustomFailure(message: 'Empty list...'));
  }
}
