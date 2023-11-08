import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/common/errors/app_exceptions.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/data_sources/next_shows_local_data_source.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late NextShowsLocalDataSource localDataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = NextShowsLocalDataSourceImpl(mockSharedPreferences);
  });

  group('cityCurrentWeather tests', () {
    final json = fixture('current_weather.json');
    late CityCurrentWeatherModel model;

    setUp(() {
      model = CityCurrentWeatherModel.fromJson(jsonDecode(json));
    });

    group('getCityCurrentWeatherModel tests', () {
      test('should return a <CityCurrentWeatherModel?> when the storage returns success', () {
        //Arrange
        when(() => mockSharedPreferences.getString(any())).thenAnswer((_) => json);
        //Act
        final result = localDataSource.getCityCurrentWeatherModel('lat', 'lon');
        //Assert
        expect(result, model);
      });

      test('should throw a StorageException when the storage throws exception', () {
        //Arrange
        when(() => mockSharedPreferences.getString(any())).thenThrow(PlatformException(code: 'code'));
        //Act
        //Assert
        expect(() => localDataSource.getCityCurrentWeatherModel('lat', 'lon'), throwsA(isA<StorageException>()));
      });
    });

    group('persistCityCurrentWeatherModel tests', () {
      const key = 'current-lat;lon';

      test('should correctly persist CityCurrentWeatherModel', () async {
        //Arrange
        when(() => mockSharedPreferences.setString(any(), any())).thenAnswer(
          (_) => Future.value(true),
        );
        //Act
        await localDataSource.persistCityCurrentWeatherModel('lat', 'lon', model);
        //Assert
        verify(
          () => mockSharedPreferences.setString(key, jsonEncode(model.toJson())),
        );
        verifyNoMoreInteractions(mockSharedPreferences);
      });

      test('should throw a StorageException when the storage throws exception', () async {
        //Arrange
        when(() => mockSharedPreferences.setString(any(), any())).thenThrow(PlatformException(code: 'code'));
        //Act
        //Assert
        expect(
          () => localDataSource.persistCityCurrentWeatherModel('lat', 'lon', model),
          throwsA(isA<StorageException>()),
        );
      });
    });
  });

  group('cityForecastsWeather tests', () {
    final json = fixture('forecast_weather.json');

    late List<CityForecastWeatherModel> models;

    setUp(() {
      final jsonMap = jsonDecode(json) as Map;
      final jsonList = jsonMap['list'] as List;
      models = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
    });

    group('getCityForecasts tests', () {
      test('should return a <List<CityForecastWeatherModel>?> when the storage returns success', () {
        //Arrange
        final jsonMap = jsonDecode(json) as Map;
        final jsonList = jsonMap['list'] as List;
        when(() => mockSharedPreferences.getString(any())).thenAnswer((_) => jsonEncode(jsonList));
        //Act
        final result = localDataSource.getCityForecasts('lat', 'lon');
        //Assert
        expect(result, models);
      });

      test('should throw a StorageException when the storage throws exception', () {
        //Arrange
        when(() => mockSharedPreferences.getString(any())).thenThrow(PlatformException(code: 'code'));
        //Act
        //Assert
        expect(() => localDataSource.getCityForecasts('lat', 'lon'), throwsA(isA<StorageException>()));
      });
    });

    group('persistCityForecasts tests', () {
      const key = 'forecast-lat;lon';

      test('should correctly persist List<CityForecastWeatherModel>', () async {
        //Arrange
        final jsonList = models.map((model) => model.toJson()).toList();
        when(() => mockSharedPreferences.setString(any(), any())).thenAnswer(
          (_) => Future.value(true),
        );
        //Act
        await localDataSource.persistCityForecasts('lat', 'lon', models);
        //Assert
        verify(
          () => mockSharedPreferences.setString(key, jsonEncode(jsonList)),
        );
        verifyNoMoreInteractions(mockSharedPreferences);
      });

      test('should throw a StorageException when the storage throws exception', () async {
        //Arrange
        when(() => mockSharedPreferences.setString(any(), any())).thenThrow(PlatformException(code: 'code'));
        //Act
        //Assert
        expect(
          () => localDataSource.persistCityForecasts('lat', 'lon', models),
          throwsA(isA<StorageException>()),
        );
      });
    });
  });
}
