import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/city_current_weather_entity.dart';
import '../../domain/entities/city_forecast_weather_entity.dart';
import '../../domain/use_cases/get_city_forecast_weather_use_case.dart';

part 'city_forecast_weather_event.dart';
part 'city_forecast_weather_state.dart';

class CityForecastWeatherBloc extends Bloc<CityForecastWeatherEvent, CityForecastWeatherState> {
  final GetCityForecastWeatherUseCase getCityForecastWeatherUseCase;

  CityForecastWeatherBloc(this.getCityForecastWeatherUseCase) : super(CityForecastWeatherStateLoading()) {
    on<FetchCityForecastWeatherEvent>(_onFetchCityForecastWeatherEvent);
  }

  void _onFetchCityForecastWeatherEvent(
    FetchCityForecastWeatherEvent event,
    Emitter<CityForecastWeatherState> emit,
  ) async {
    emit(CityForecastWeatherStateLoading());
    final location = event.cityCurrentWeather.location;
    if (location == null) {
      emit(CityForecastWeatherStateError(message: 'Invalid location...'));
      return;
    }
    final result = await getCityForecastWeatherUseCase(location.lat.toString(), location.lon.toString());
    result.fold(
      (error) => emit(CityForecastWeatherStateError(message: ':(')),
      (forecast) => emit(CityForecastWeatherStateSuccess(forecast)),
    );
  }
}
