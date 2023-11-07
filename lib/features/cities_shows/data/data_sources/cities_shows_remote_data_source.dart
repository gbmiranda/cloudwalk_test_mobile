import 'dart:convert';
import 'dart:io';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/library/app_http_client.dart';
import '../models/city_current_weather_model.dart';

abstract class CitiesShowsRemoteDataSource {
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon);
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
          return CityCurrentWeatherModel.fromJson(jsonDecode(response.body));
        default:
          throw const ServerException();
      }
    } catch (_) {
      throw const ServerException();
    }
  }
}
