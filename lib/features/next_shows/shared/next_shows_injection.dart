import 'package:get_it/get_it.dart';

import '../data/data_sources/next_shows_local_data_source.dart';
import '../data/data_sources/next_shows_remote_data_source.dart';
import '../data/repositories/next_shows_repository_impl.dart';
import '../domain/repositories/next_shows_repository.dart';
import '../domain/use_cases/get_cities_shows_location_use_case.dart';
import '../domain/use_cases/get_cities_weather_use_case.dart';
import '../domain/use_cases/get_city_current_weather_use_case.dart';
import '../domain/use_cases/get_city_forecast_weather_use_case.dart';
import '../presentation/bloc/cities_shows_bloc.dart';
import '../presentation/bloc/city_forecast_weather_bloc.dart';

mixin NextShowsInjection {
  static Future<void> inject(GetIt getIt) async {
    // Presentation
    getIt.registerLazySingleton<CitiesShowsBloc>(() => CitiesShowsBloc(getIt()));
    getIt.registerLazySingleton<CityForecastWeatherBloc>(() => CityForecastWeatherBloc(getIt()));

    // Domain
    getIt.registerLazySingleton<NextShowsRepository>(() => NextShowsRepositoryImpl(getIt(), getIt()));
    getIt.registerLazySingleton<GetCitiesShowsLocationUseCase>(() => GetCitiesShowsLocationUseCaseImpl());
    getIt.registerLazySingleton<GetCityCurrentWeatherUseCase>(() => GetCityCurrentWeatherUseCaseImpl(getIt()));
    getIt.registerLazySingleton<GetCitiesWeatherUseCase>(() => GetCitiesWeatherUseCaseImpl(getIt(), getIt(), getIt()));
    getIt.registerLazySingleton<GetCityForecastWeatherUseCase>(() => GetCityForecastWeatherUseCaseImpl(getIt()));

    // Data
    getIt.registerLazySingleton<NextShowsRemoteDataSource>(() => NextShowsRemoteDataSourceImpl(getIt()));
    getIt.registerLazySingleton<NextShowsLocalDataSource>(() => NextShowsLocalDataSourceImpl(getIt()));
  }
}
