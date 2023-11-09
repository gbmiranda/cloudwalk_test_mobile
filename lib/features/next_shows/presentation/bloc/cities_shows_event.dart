part of 'cities_shows_bloc.dart';

abstract class CitiesShowsEvent {}

class FetchCitiesShowsWeatherEvent extends CitiesShowsEvent {}

class SearchCitiesShowsWeatherEvent extends CitiesShowsEvent {
  final String search;
  SearchCitiesShowsWeatherEvent(this.search);
}
