import 'package:bloc/bloc.dart';

import '../../domain/entities/city_current_weather_entity.dart';
import '../../domain/use_cases/get_cities_weather_use_case.dart';

part 'cities_shows_event.dart';
part 'cities_shows_state.dart';

class CitiesShowsBloc extends Bloc<CitiesShowsEvent, CitiesShowsState> {
  final GetCitiesWeatherUseCase getCitiesWeatherUseCase;

  CitiesShowsBloc(this.getCitiesWeatherUseCase) : super(CitiesShowsStateLoading()) {
    on<FetchCitiesShowsWeatherEvent>(_onFetchCitiesShowsWeatherEvent);
  }

  void _onFetchCitiesShowsWeatherEvent(FetchCitiesShowsWeatherEvent event, Emitter<CitiesShowsState> emit) async {
    emit(CitiesShowsStateLoading());
    final result = await getCitiesWeatherUseCase();
    result.fold(
      (error) => emit(CitiesShowsStateError(message: ':(')),
      (cities) => emit(CitiesShowsStateSuccess(cities)),
    );
  }
}
