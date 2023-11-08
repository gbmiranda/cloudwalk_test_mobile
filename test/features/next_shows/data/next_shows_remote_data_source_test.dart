import 'dart:convert';
import 'dart:io';

import 'package:cloudwalk_test_mobile_1/common/errors/app_exceptions.dart';
import 'package:cloudwalk_test_mobile_1/common/library/app_http_client.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/data_sources/next_shows_remote_data_source.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class MockAppHttpClient extends Mock implements AppHttpClient {}

class MockFirebaseRemoteConfig extends Mock implements FirebaseRemoteConfig {}

void main() {
  late MockAppHttpClient mockAppHttpClient;
  late MockFirebaseRemoteConfig mockFirebaseRemoteConfig;
  late NextShowsRemoteDataSource remoteDataSource;

  setUpAll(() {
    registerFallbackValue(Uri());
  });

  setUp(() {
    mockAppHttpClient = MockAppHttpClient();
    mockFirebaseRemoteConfig = MockFirebaseRemoteConfig();
    remoteDataSource = NextShowsRemoteDataSourceImpl(mockAppHttpClient, mockFirebaseRemoteConfig);

    when(() => mockFirebaseRemoteConfig.getString(any())).thenAnswer((_) => 'value');
  });

  group('getLocationWeather tests', () {
    final json = fixture('current_weather.json');
    late CityCurrentWeatherModel model;

    setUp(() {
      model = CityCurrentWeatherModel.fromJson(jsonDecode(json));
    });

    test('should return a <CityCurrentWeatherModel> when the client returns 200', () async {
      //Arrange
      when(() => mockAppHttpClient.get(any())).thenAnswer((_) async => Response(json, HttpStatus.ok));
      //Act
      final result = await remoteDataSource.getLocationWeather('lat', 'lon');
      //Assert
      expect(result, model);
    });

    test('should throw a ServerException when the client returns other than 200', () async {
      //Arrange
      when(() => mockAppHttpClient.get(any())).thenAnswer((_) async => Response('', HttpStatus.internalServerError));
      //Act
      //Assert
      expect(() => remoteDataSource.getLocationWeather('lat', 'lon'), throwsA(isA<ServerException>()));
    });
  });

  group('getCityForecasts tests', () {
    final json = fixture('forecast_weather.json');

    late List<CityForecastWeatherModel> models;

    setUp(() {
      final jsonMap = jsonDecode(json) as Map;
      final jsonList = jsonMap['list'] as List;
      models = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
    });

    test('should return a <List<CityForecastWeatherModel>> when the client returns 200', () async {
      //Arrange
      when(() => mockAppHttpClient.get(any())).thenAnswer((_) async => Response(json, HttpStatus.ok));
      //Act
      final result = await remoteDataSource.getCityForecasts('lat', 'lon');
      //Assert
      expect(result, models);
    });

    test('should throw a ServerException when the client returns other than 200', () async {
      //Arrange
      when(() => mockAppHttpClient.get(any())).thenAnswer((_) async => Response('', HttpStatus.internalServerError));
      //Act
      //Assert
      expect(() => remoteDataSource.getCityForecasts('lat', 'lon'), throwsA(isA<ServerException>()));
    });
  });
}
