import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/errors/app_failures.dart';
import '../../domain/entities/city_current_weather_entity.dart';
import '../../domain/entities/city_forecastt_weather_entity.dart';
import '../../domain/repositories/cities_shows_repository.dart';
import '../data_sources/cities_shows_remote_data_source.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';

class CitiesShowsRepositoryImpl extends CitiesShowsRepository {
  final CitiesShowsRemoteDataSource remoteDataSource;

  CitiesShowsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppFailures, CityCurrentWeatherEntity>> getLocationWeather(String lat, String lon) async {
    try {
      final result = await remoteDataSource.getLocationWeather(lat, lon);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure());
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<AppFailures, List<CityForecastWeatherEntity>>> getCityForecast(String lat, String lon) async {
    try {
      final result = await remoteDataSource.getCityForecast(lat, lon);
      return Right(result.toEntityList());
    } on ServerException {
      return const Left(ServerFailure());
    } catch (_) {
      return const Left(ServerFailure());
    }
  }
}
