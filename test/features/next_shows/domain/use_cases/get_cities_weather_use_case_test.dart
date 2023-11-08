import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_current_weather_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_forecast_weather_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/location_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_cities_shows_location_use_case.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_cities_weather_use_case.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_city_current_weather_use_case.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_city_forecast_weather_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockGetCitiesShowsLocationUseCase extends Mock implements GetCitiesShowsLocationUseCase {}

class MockGetCityCurrentWeatherUseCase extends Mock implements GetCityCurrentWeatherUseCase {}

class MockGetCityForecastWeatherUseCase extends Mock implements GetCityForecastWeatherUseCase {}

void main() {
  late MockGetCitiesShowsLocationUseCase mockGetCitiesShowsLocationUseCase;
  late MockGetCityCurrentWeatherUseCase mockGetCityCurrentWeatherUseCase;
  late MockGetCityForecastWeatherUseCase mockGetCityForecastWeatherUseCase;

  late GetCitiesWeatherUseCase getCitiesWeatherUseCase;

  late List<LocationEntity> locations;
  late CityCurrentWeatherEntity currentWeatherEntity;
  late List<CityForecastWeatherEntity> forecastWeatherEntities;

  setUp(() {
    mockGetCitiesShowsLocationUseCase = MockGetCitiesShowsLocationUseCase();
    mockGetCityCurrentWeatherUseCase = MockGetCityCurrentWeatherUseCase();
    mockGetCityForecastWeatherUseCase = MockGetCityForecastWeatherUseCase();

    getCitiesWeatherUseCase = GetCitiesWeatherUseCaseImpl(
      mockGetCitiesShowsLocationUseCase,
      mockGetCityCurrentWeatherUseCase,
      mockGetCityForecastWeatherUseCase,
    );

    locations = [
      const LocationEntity(52.090, -1.032), // Silverstone, UK
      const LocationEntity(-23.547, -46.636), // São Paulo, Brazil
      const LocationEntity(-37.814, 144.963), // Melbourne, Australia
      const LocationEntity(43.737, 7.404), // Monte Carlo, Monaco
    ];

    currentWeatherEntity = CityCurrentWeatherModel.fromJson(jsonDecode(fixture('current_weather.json'))).toEntity();

    final json = fixture('forecast_weather.json');
    final jsonMap = jsonDecode(json) as Map;
    final jsonList = jsonMap['list'] as List;
    forecastWeatherEntities = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList().toEntityList();
  });

  test('should return a Right<List<CityForecastWeatherEntity>> when the useCase is called', () async {
    //Arrange
    when(() => mockGetCitiesShowsLocationUseCase.call()).thenAnswer((_) => locations);
    when(() => mockGetCityCurrentWeatherUseCase.call(any(), any())).thenAnswer(
      (_) async => Right(currentWeatherEntity),
    );
    when(() => mockGetCityForecastWeatherUseCase.call(any(), any())).thenAnswer(
      (_) async => Right(forecastWeatherEntities),
    );
    //Act
    final result = await getCitiesWeatherUseCase.call();
    //Assert
    expect(result, isA<Right<AppFailures, List<CityCurrentWeatherEntity>>>());
  });

  test('should return a Left<AppFailures> when the mockGetCitiesShowsLocationUseCase return nothing', () async {
    //Arrange
    when(() => mockGetCitiesShowsLocationUseCase.call()).thenAnswer((_) => []); //Act
    final result = await getCitiesWeatherUseCase.call();
    //Assert
    expect(result, const Left(CustomFailure()));
    expect(result, isA<Left<AppFailures, List<CityCurrentWeatherEntity>>>());
  });
}
