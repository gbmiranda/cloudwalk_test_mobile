import 'package:get_it/get_it.dart';

import '../data/data_sources/cities_shows_remote_data_source.dart';
import '../data/repositories/cities_shows_repository_impl.dart';
import '../domain/repositories/cities_shows_repository.dart';
import '../domain/use_cases/get_cities_shows_location_use_case.dart';
import '../domain/use_cases/get_cities_weather_use_case.dart';
import '../domain/use_cases/get_city_current_weather_use_case.dart';
import '../presentation/bloc/cities_shows_bloc.dart';

mixin CitiesShowsInjection {
  static Future<void> inject(GetIt getIt) async {
    // Presentation
    getIt.registerLazySingleton<CitiesShowsBloc>(() => CitiesShowsBloc(getIt()));

    // Domain
    getIt.registerLazySingleton<CitiesShowsRepository>(() => CitiesShowsRepositoryImpl(getIt()));
    getIt.registerLazySingleton<GetCitiesShowsLocationUseCase>(() => GetCitiesShowsLocationUseCaseImpl());
    getIt.registerLazySingleton<GetCityCurrentWeatherUseCase>(() => GetCityCurrentWeatherUseCaseImpl(getIt()));
    getIt.registerLazySingleton<GetCitiesWeatherUseCase>(() => GetCitiesWeatherUseCaseImpl(getIt(), getIt()));

    // Data
    getIt.registerLazySingleton<CitiesShowsRemoteDataSource>(() => CitiesShowsRemoteDataSourceImpl(getIt()));
  }
}
