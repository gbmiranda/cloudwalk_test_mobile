import 'dart:convert';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/library/app_http_client.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';
import '../utils/cities_shows_api_utils.dart';

abstract class NextShowsRemoteDataSource {
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon);
  Future<List<CityForecastWeatherModel>> getCityForecasts(String lat, String lon);
}

class NextShowsRemoteDataSourceImpl implements NextShowsRemoteDataSource {
  final AppHttpClient appHttpClient;
  final FirebaseRemoteConfig remoteConfig;

  NextShowsRemoteDataSourceImpl(this.appHttpClient, this.remoteConfig);

  @override
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon) async {
    try {
      final uri = _createUri(path: NextShowsApiUtils.apiCurrentWeatherPath, lat: lat, lon: lon);

      final response = await appHttpClient.get(uri);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final model = CityCurrentWeatherModel.fromJson(jsonDecode(response.body));
          return model;
        default:
          throw const ServerException();
      }
    } on NetworkException {
      rethrow;
    } catch (_) {
      throw const ServerException();
    }
  }

  @override
  Future<List<CityForecastWeatherModel>> getCityForecasts(String lat, String lon) async {
    try {
      final uri = _createUri(path: NextShowsApiUtils.apiForecastWeatherPath, lat: lat, lon: lon);

      final response = await appHttpClient.get(uri);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonMap = jsonDecode(response.body) as Map;
          final jsonList = jsonMap['list'] as List;
          return jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
        default:
          throw const ServerException();
      }
    } on NetworkException {
      rethrow;
    } catch (_) {
      throw const ServerException();
    }
  }

  Uri _createUri({required String path, required String lat, required String lon}) {
    final appid = remoteConfig.getString(NextShowsApiUtils.apiTokenKey);
    final host = remoteConfig.getString(NextShowsApiUtils.apiHostKey);
    return Uri(
      scheme: 'https',
      host: host,
      pathSegments: ['data', '2.5', path],
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'units': 'metric',
        'appid': appid,
      },
    );
  }
}
