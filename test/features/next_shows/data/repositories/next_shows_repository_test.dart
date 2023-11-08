import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/common/errors/app_exceptions.dart';
import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/data_sources/next_shows_local_data_source.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/data_sources/next_shows_remote_data_source.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/repositories/next_shows_repository_impl.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/repositories/next_shows_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNextShowsRemoteDataSource extends Mock implements NextShowsRemoteDataSource {}

class MockNextShowsLocalDataSource extends Mock implements NextShowsLocalDataSource {}

void main() {
  late MockNextShowsRemoteDataSource remoteDataSource;
  late MockNextShowsLocalDataSource localDataSource;
  late NextShowsRepository repository;

  setUp(() {
    remoteDataSource = MockNextShowsRemoteDataSource();
    localDataSource = MockNextShowsLocalDataSource();
    repository = NextShowsRepositoryImpl(remoteDataSource, localDataSource);
  });

  group('getLocationWeather tests', () {
    final json = fixture('current_weather.json');
    late CityCurrentWeatherModel model;

    setUp(() {
      model = CityCurrentWeatherModel.fromJson(jsonDecode(json));
      registerFallbackValue(model);
    });

    test('should return <CityCurrentWeatherModel> when the remoteDataSource returns correctly', () async {
      //Arrange
      when(() => remoteDataSource.getLocationWeather(any(), any())).thenAnswer((_) async => model);
      when(() => localDataSource.persistCityCurrentWeatherModel(any(), any(), any())).thenAnswer(
        (_) async => Future.value(true),
      );
      //Act
      final result = await repository.getLocationWeather('lat', 'lon');
      //Assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()), model.toEntity());
      verify(() => remoteDataSource.getLocationWeather('lat', 'lon'));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return local <CityCurrentWeatherModel> when the remoteDataSource returns NetworkException', () async {
      //Arrange
      when(() => remoteDataSource.getLocationWeather(any(), any())).thenThrow(const NetworkException());
      when(() => localDataSource.getCityCurrentWeatherModel(any(), any())).thenAnswer((_) => model);
      //Act
      final result = await repository.getLocationWeather('lat', 'lon');
      //Assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()), model.toEntity());
      verify(() => remoteDataSource.getLocationWeather('lat', 'lon'));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a NetworkFailure when the remoteDataSource throws a NetworkException', () async {
      //Arrange
      when(() => remoteDataSource.getLocationWeather(any(), any())).thenThrow(const NetworkException());
      //Act
      final result = await repository.getLocationWeather('lat', 'lon');
      //Assert
      expect(result, const Left(NetworkFailure()));
    });

    test('should return a ServerFailure when the remoteDataSource throws a ServerException', () async {
      //Arrange
      when(() => remoteDataSource.getLocationWeather(any(), any())).thenThrow(const ServerException());
      //Act
      final result = await repository.getLocationWeather('lat', 'lon');
      //Assert
      expect(result, const Left(ServerFailure()));
    });

    test('should return a StorageFailure when the remoteDataSource throws a StorageException', () async {
      //Arrange
      when(() => remoteDataSource.getLocationWeather(any(), any())).thenAnswer((_) async => model);
      when(() => localDataSource.persistCityCurrentWeatherModel(any(), any(), any())).thenThrow(
        const StorageException(),
      );
      //Act
      final result = await repository.getLocationWeather('lat', 'lon');
      //Assert
      expect(result, const Left(StorageFailure()));
    });
  });

  group('getCityForecasts tests', () {
    final json = fixture('forecast_weather.json');
    late List<CityForecastWeatherModel> models;

    setUp(() {
      final jsonMap = jsonDecode(json) as Map;
      final jsonList = jsonMap['list'] as List;
      models = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
      registerFallbackValue(models);
    });

    test('should return <List<CityForecastWeatherModel>> when the remoteDataSource returns correctly', () async {
      //Arrange
      when(() => remoteDataSource.getCityForecasts(any(), any())).thenAnswer((_) async => models);
      when(() => localDataSource.persistCityForecasts(any(), any(), any())).thenAnswer(
        (_) async => Future.value(true),
      );
      //Act
      final result = await repository.getCityForecasts('lat', 'lon');
      //Assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()), models.toEntityList());
      verify(() => remoteDataSource.getCityForecasts('lat', 'lon'));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return local <CityCurrentWeatherModel> when the remoteDataSource returns NetworkException', () async {
      //Arrange
      when(() => remoteDataSource.getCityForecasts(any(), any())).thenThrow(const NetworkException());
      when(() => localDataSource.getCityForecasts(any(), any())).thenAnswer((_) => models);
      //Act
      final result = await repository.getCityForecasts('lat', 'lon');
      //Assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => throw Exception()), models.toEntityList());
      verify(() => remoteDataSource.getCityForecasts('lat', 'lon'));
      verifyNoMoreInteractions(remoteDataSource);
    });

    test('should return a NetworkFailure when the remoteDataSource throws a NetworkException', () async {
      //Arrange
      when(() => remoteDataSource.getCityForecasts(any(), any())).thenThrow(const NetworkException());
      //Act
      final result = await repository.getCityForecasts('lat', 'lon');
      //Assert
      expect(result, const Left(NetworkFailure()));
    });

    test('should return a ServerFailure when the remoteDataSource throws a ServerException', () async {
      //Arrange
      when(() => remoteDataSource.getCityForecasts(any(), any())).thenThrow(const ServerException());
      //Act
      final result = await repository.getCityForecasts('lat', 'lon');
      //Assert
      expect(result, const Left(ServerFailure()));
    });

    test('should return a StorageFailure when the remoteDataSource throws a StorageException', () async {
      //Arrange
      when(() => remoteDataSource.getCityForecasts(any(), any())).thenAnswer((_) async => models);
      when(() => localDataSource.persistCityForecasts(any(), any(), any())).thenThrow(
        const StorageException(),
      );
      //Act
      final result = await repository.getCityForecasts('lat', 'lon');
      //Assert
      expect(result, const Left(StorageFailure()));
    });
  });
}
