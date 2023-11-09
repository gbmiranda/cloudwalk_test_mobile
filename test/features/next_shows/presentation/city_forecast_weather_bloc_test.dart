import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_current_weather_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_city_forecast_weather_use_case.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/presentation/bloc/city_forecast_weather_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class MockGetCityForecastWeatherUseCase extends Mock implements GetCityForecastWeatherUseCase {}

void main() {
  late MockGetCityForecastWeatherUseCase mockGetCityForecastWeatherUseCase;

  late CityForecastWeatherBloc cityForecastWeatherBloc;

  late CityCurrentWeatherEntity entity;

  setUp(() {
    mockGetCityForecastWeatherUseCase = MockGetCityForecastWeatherUseCase();
    cityForecastWeatherBloc = CityForecastWeatherBloc(mockGetCityForecastWeatherUseCase);

    final json = fixture('current_weather.json');
    entity = CityCurrentWeatherModel.fromJson(jsonDecode(json)).toEntity();

    registerFallbackValue(entity);
  });

  group('on FetchCityForecastWeatherEvent tests', () {
    blocTest(
      'should emit [CityForecastWeatherStateLoading, CityForecastWeatherStateError] when event location is null',
      build: () => cityForecastWeatherBloc,
      act: (CityForecastWeatherBloc bloc) => bloc.add(
        FetchCityForecastWeatherEvent(
          const CityCurrentWeatherEntity(null, null, null, null, null, null, null, null),
        ),
      ),
      expect: () => [CityForecastWeatherStateLoading(), CityForecastWeatherStateError()],
    );

    blocTest(
      'should emit [CityForecastWeatherStateLoading, CityForecastWeatherStateError] when [GetCityForecastWeatherUseCase] return a [Left]',
      build: () => cityForecastWeatherBloc,
      setUp: () {
        when(() => mockGetCityForecastWeatherUseCase.call(any(), any())).thenAnswer(
          (_) async => const Left(ServerFailure()),
        );
      },
      act: (CityForecastWeatherBloc bloc) => bloc.add(FetchCityForecastWeatherEvent(entity)),
      expect: () => [CityForecastWeatherStateLoading(), CityForecastWeatherStateError()],
    );

    blocTest(
      'should emit [CityForecastWeatherStateLoading, CityForecastWeatherStateSuccess] when [GetCityForecastWeatherUseCase] return a [Right]',
      build: () => cityForecastWeatherBloc,
      setUp: () {
        when(() => mockGetCityForecastWeatherUseCase.call(any(), any())).thenAnswer((_) async => const Right([]));
      },
      act: (CityForecastWeatherBloc bloc) => bloc.add(FetchCityForecastWeatherEvent(entity)),
      expect: () => [CityForecastWeatherStateLoading(), CityForecastWeatherStateSuccess(const [])],
    );
  });
}
