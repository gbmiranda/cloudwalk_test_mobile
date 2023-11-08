part of 'cities_shows_bloc.dart';

sealed class CitiesShowsState {}

class CitiesShowsStateLoading extends CitiesShowsState {}

class CitiesShowsStateSuccess extends CitiesShowsState {
  final List<CityCurrentWeatherEntity>? cities;
  final String? search;

  CitiesShowsStateSuccess({this.cities, this.search});
}

class CitiesShowsStateError extends CitiesShowsState {
  final String? message;
  CitiesShowsStateError({this.message});
}