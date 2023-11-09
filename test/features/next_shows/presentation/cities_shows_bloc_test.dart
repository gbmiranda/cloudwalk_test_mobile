import 'package:bloc_test/bloc_test.dart';
import 'package:cloudwalk_test_mobile_1/common/errors/app_failures.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_cities_weather_use_case.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/presentation/bloc/cities_shows_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCitiesWeatherUseCase extends Mock implements GetCitiesWeatherUseCase {}

void main() {
  late MockGetCitiesWeatherUseCase mockGetCitiesWeatherUseCase;
  late CitiesShowsBloc citiesShowsBloc;

  setUp(() {
    mockGetCitiesWeatherUseCase = MockGetCitiesWeatherUseCase();
    citiesShowsBloc = CitiesShowsBloc(mockGetCitiesWeatherUseCase);
  });

  group('on FetchCitiesShowsWeatherEvent tests', () {
    blocTest(
      'should emit [CitiesShowsStateLoading, CitiesShowsStateSuccess] when [GetCitiesWeatherUseCase] return a [Right]',
      setUp: () {
        when(() => mockGetCitiesWeatherUseCase.call()).thenAnswer((_) async => const Right([]));
      },
      build: () => citiesShowsBloc,
      act: (CitiesShowsBloc bloc) => bloc.add(FetchCitiesShowsWeatherEvent()),
      expect: () => [CitiesShowsStateLoading(), CitiesShowsStateSuccess()],
    );

    blocTest(
      'should emit [CitiesShowsStateLoading, CitiesShowsStateError] when [GetCitiesWeatherUseCase] return a [Left]',
      setUp: () {
        when(() => mockGetCitiesWeatherUseCase.call()).thenAnswer((_) async => const Left(ServerFailure()));
      },
      build: () => citiesShowsBloc,
      act: (CitiesShowsBloc bloc) => bloc.add(FetchCitiesShowsWeatherEvent()),
      expect: () => [CitiesShowsStateLoading(), CitiesShowsStateError()],
    );
  });

  group('on SearchCitiesShowsWeatherEvent tests', () {
    blocTest(
      'should emit [CitiesShowsStateSuccess] when actual state is [CitiesShowsStateSuccess]',
      build: () => citiesShowsBloc,
      act: (CitiesShowsBloc bloc) {
        bloc.emit(CitiesShowsStateSuccess(cities: const []));
        bloc.add(SearchCitiesShowsWeatherEvent('search'));
      },
      expect: () => [CitiesShowsStateSuccess(cities: const [], search: 'search')],
    );
  });
}
