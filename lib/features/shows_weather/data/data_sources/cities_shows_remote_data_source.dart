import 'dart:convert';
import 'dart:io';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/library/app_http_client.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';

abstract class CitiesShowsRemoteDataSource {
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon);
  Future<List<CityForecastWeatherModel>> getCityForecast(String lat, String lon);
}

class CitiesShowsRemoteDataSourceImpl implements CitiesShowsRemoteDataSource {
  final AppHttpClient appHttpClient;

  CitiesShowsRemoteDataSourceImpl(this.appHttpClient);

  @override
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        pathSegments: ['data', '2.5', 'weather'],
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': '0255820733c4496d3f0e801c575d76cc',
        },
      );
      final response = await appHttpClient.get(uri);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final model = CityCurrentWeatherModel.fromJson(jsonDecode(response.body));
          return model;
        default:
          throw const ServerException();
      }
    } catch (_) {
      throw const ServerException();
    }
  }

  @override
  Future<List<CityForecastWeatherModel>> getCityForecast(String lat, String lon) async {
    try {
      final uri = Uri(
        scheme: 'https',
        host: 'api.openweathermap.org',
        pathSegments: ['data', '2.5', 'weather'],
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': '0255820733c4496d3f0e801c575d76cc',
        },
      );
      final response = await appHttpClient.get(uri);
      switch (response.statusCode) {
        case HttpStatus.ok:
          final jsonList = jsonDecode(response.body) as List;
          return jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
        default:
          throw const ServerException();
      }
    } catch (_) {
      throw const ServerException();
    }
  }
}
