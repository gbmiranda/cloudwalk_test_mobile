import 'dart:convert';
import 'dart:io';

import '../../../../common/errors/app_exceptions.dart';
import '../../../../common/library/app_http_client.dart';
import '../models/city_current_weather_model.dart';
import '../models/city_forecast_weather_model.dart';

abstract class CitiesShowsRemoteDataSource {
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon);
  Future<List<CityForecastWeatherModel>> getCityForecasts(String lat, String lon);
}

class CitiesShowsRemoteDataSourceImpl implements CitiesShowsRemoteDataSource {
  final AppHttpClient appHttpClient;

  CitiesShowsRemoteDataSourceImpl(this.appHttpClient);

  @override
  Future<CityCurrentWeatherModel> getLocationWeather(String lat, String lon) async {
    try {
      final uri = _createUri(path: 'weather', lat: lat, lon: lon);

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
      final uri = _createUri(path: 'forecast', lat: lat, lon: lon);

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
    const appid = '0255820733c4496d3f0e801c575d76cc'; // TODO: remoteConfig
    const host = 'api.openweathermap.org'; // TODO: remoteConfig
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
