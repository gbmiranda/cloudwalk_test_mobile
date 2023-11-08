import 'package:dartz/dartz.dart';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/errors/app_failures.dart';
import '../../domain/entities/city_current_weather_entity.dart';
import '../../domain/entities/city_forecastt_weather_entity.dart';
import '../../domain/repositories/next_shows_repository.dart';
import '../data_sources/next_shows_local_data_source.dart';
import '../data_sources/next_shows_remote_data_source.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';

class NextShowsRepositoryImpl extends NextShowsRepository {
  final NextShowsRemoteDataSource remoteDataSource;
  final NextShowsLocalDataSource localDataSource;

  NextShowsRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<AppFailures, CityCurrentWeatherEntity>> getLocationWeather(String lat, String lon) async {
    try {
      final result = await remoteDataSource.getLocationWeather(lat, lon);
      localDataSource.persistCityCurrentWeatherModel(lat, lon, result);
      return Right(result.toEntity());
    } on NetworkException {
      final localResult = localDataSource.getCityCurrentWeatherModel(lat, lon);
      if (localResult != null) {
        return Right(localResult.toEntity());
      }
      return const Left(NetworkFailure());
    } on ServerException {
      return const Left(ServerFailure());
    } on StorageException {
      return const Left(StorageFailure());
    } catch (_) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<AppFailures, List<CityForecastWeatherEntity>>> getCityForecasts(String lat, String lon) async {
    try {
      final result = await remoteDataSource.getCityForecasts(lat, lon);
      localDataSource.persistCityForecasts(lat, lon, result);
      return Right(result.toEntityList());
    } on NetworkException {
      final localResult = localDataSource.getCityForecasts(lat, lon);
      if (localResult != null) {
        return Right(localResult.toEntityList());
      }
      return const Left(NetworkFailure());
    } on ServerException {
      return const Left(ServerFailure());
    } on StorageException {
      return const Left(StorageFailure());
    } catch (_) {
      return const Left(ServerFailure());
    }
  }
}
