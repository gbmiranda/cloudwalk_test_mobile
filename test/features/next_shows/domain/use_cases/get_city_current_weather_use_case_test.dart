import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_current_weather_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/repositories/next_shows_repository.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_city_current_weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockNextShowsRepository extends Mock implements NextShowsRepository {}

void main() {
  late MockNextShowsRepository repository;
  late GetCityCurrentWeatherUseCase getCityCurrentWeatherUseCase;
  late CityCurrentWeatherEntity entity;

  setUp(() {
    repository = MockNextShowsRepository();
    getCityCurrentWeatherUseCase = GetCityCurrentWeatherUseCaseImpl(repository);

    final json = fixture('current_weather.json');
    final model = CityCurrentWeatherModel.fromJson(jsonDecode(json));
    entity = model.toEntity();

    registerFallbackValue(entity);
  });

  test('should return a Right<CityCurrentWeatherEntity> when the repository is called', () async {
    //Arrange
    when(() => repository.getLocationWeather(any(), any())).thenAnswer((_) async => Right(entity));
    //Act
    final result = await getCityCurrentWeatherUseCase.call('lat', 'lon');
    //Assert
    verify(() => repository.getLocationWeather('lat', 'lon'));
    expect(result, isA<Right<AppFailures, CityCurrentWeatherEntity>>());
  });

  test('should return a Left<AppFailures> when the repository throw a AppFailures', () async {
    //Arrange
    when(() => repository.getLocationWeather(any(), any())).thenAnswer((_) async => const Left(ServerFailure()));
    //Act
    final result = await getCityCurrentWeatherUseCase.call('lat', 'lon');
    //Assert
    verify(() => repository.getLocationWeather('lat', 'lon'));
    // expect(result, const Left(CustomFailure()));
    expect(result, isA<Left<AppFailures, CityCurrentWeatherEntity>>());
  });
}
