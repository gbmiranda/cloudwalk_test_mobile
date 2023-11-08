import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/errors/app_exceptions.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';

abstract class CitiesShowsLocalDataSource {
  CityCurrentWeatherModel? getCityCurrentWeatherModel(String lat, String lon);
  List<CityForecastWeatherModel>? getCityForecasts(String lat, String lon);
  Future<bool> persistCityCurrentWeatherModel(String lat, String lon, CityCurrentWeatherModel model);
  Future<bool> persistCityForecasts(String lat, String lon, List<CityForecastWeatherModel> models);
}

class CitiesShowsLocalDataSourceImpl implements CitiesShowsLocalDataSource {
  static const _currentKeyPrefix = 'current';
  static const _forecastKeyPrefix = 'forecast';

  final SharedPreferences sharedPreferences;

  CitiesShowsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<bool> persistCityCurrentWeatherModel(String lat, String lon, CityCurrentWeatherModel model) {
    try {
      return sharedPreferences.setString(_key(_currentKeyPrefix, lat, lon), jsonEncode(model.toJson()));
    } catch (_) {
      throw const StorageException();
    }
  }

  @override
  CityCurrentWeatherModel? getCityCurrentWeatherModel(String lat, String lon) {
    try {
      final json = sharedPreferences.getString(_key(_currentKeyPrefix, lat, lon));
      if (json == null) return null;
      return CityCurrentWeatherModel.fromJson(jsonDecode(json));
    } catch (_) {
      throw const StorageException();
    }
  }

  @override
  Future<bool> persistCityForecasts(String lat, String lon, List<CityForecastWeatherModel> models) {
    try {
      final jsonList = models.map((model) => model.toJson()).toList();
      return sharedPreferences.setString(_key(_forecastKeyPrefix, lat, lon), jsonEncode(jsonList));
    } catch (_) {
      throw const StorageException();
    }
  }

  @override
  List<CityForecastWeatherModel>? getCityForecasts(String lat, String lon) {
    try {
      final json = sharedPreferences.getString(_key(_forecastKeyPrefix, lat, lon));
      if (json == null) return null;
      final jsonList = jsonDecode(json) as List;
      return jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
    } catch (_) {
      throw const StorageException();
    }
  }

  String _key(String prefix, String lat, String lon) => '$prefix-$lat;$lon';
}
