import 'dart:convert';
import 'dart:io';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/library/app_http_client.dart';
import '../models/city_forecast_weather_model.dart';

abstract class CitiesWeatherDetailRemoteDataSource {
  Future<List<CityForecastWeatherModel>> getCityForecast(String lat, String lon);
}

class CitiesWeatherDetailRemoteDataSourceImpl implements CitiesWeatherDetailRemoteDataSource {
  final AppHttpClient appHttpClient;

  CitiesWeatherDetailRemoteDataSourceImpl(this.appHttpClient);

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
