import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_forecastt_weather_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/repositories/next_shows_repository.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_city_forecast_weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNextShowsRepository extends Mock implements NextShowsRepository {}

void main() {
  late MockNextShowsRepository repository;
  late GetCityForecastWeatherUseCase getCityForecastWeatherUseCase;
  late List<CityForecastWeatherEntity> entities;

  setUp(() {
    repository = MockNextShowsRepository();
    getCityForecastWeatherUseCase = GetCityForecastWeatherUseCaseImpl(repository);

    final json = fixture('forecast_weather.json');
    final jsonMap = jsonDecode(json) as Map;
    final jsonList = jsonMap['list'] as List;
    final models = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
    entities = models.toEntityList();

    registerFallbackValue(entities);
  });

  test('should return a Right<List<CityForecastWeatherEntity>> when the repository is called', () async {
    //Arrange
    when(() => repository.getCityForecasts(any(), any())).thenAnswer((_) async => Right(entities));
    //Act
    final result = await getCityForecastWeatherUseCase.call('lat', 'lon');
    //Assert
    verify(() => repository.getCityForecasts('lat', 'lon'));
    expect(result, isA<Right<AppFailures, List<CityForecastWeatherEntity>>>());
  });

  test('should return a Left<AppFailures> when the repository throw a AppFailures', () async {
    //Arrange
    when(() => repository.getCityForecasts(any(), any())).thenAnswer((_) async => const Left(ServerFailure()));
    //Act
    final result = await getCityForecastWeatherUseCase.call('lat', 'lon');
    //Assert
    verify(() => repository.getCityForecasts('lat', 'lon'));
    // expect(result, const Left(CustomFailure()));
    expect(result, isA<Left<AppFailures, List<CityForecastWeatherEntity>>>());
  });
}
