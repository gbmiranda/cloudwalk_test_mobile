import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../library/app_http_client.dart';

class AppHttpInterceptor {
  final AppHttpClient httpClient;

  AppHttpInterceptor(this.httpClient);

  Future<void> init() async {
    httpClient.addRequestHeaderCallback((uri, headers) async {
      final Map<String, String> authorizationHeader = {};

      authorizationHeader['Authorization'] =
          'Bearer ei6pI6WkAfNfdvPSbu7jOUGuf5ZKP4UkSdGu+WKbGH/LL1M2CWSlvn+U3AV87LGmPvdweYJJwIjT0JXDOcSH1ISawgAldkvxHSUrjlXOQq0Qu6BXPbnII1k8rraff8JSHhxc+c+iRtW3q2p0IXDKZg0tYh0/lrlCCIrYTqBTUDRvKgGhjl4D8VGj6qNGWTmeyqUH6a82r/QhpWcME4yG71Vv4KspwbbZHn2jjMRH1C2ACo/EWRa5ZUkb5y2oencW';

      return authorizationHeader;
    });

    httpClient.addAppRequestInterceptorCallback(
      AppRequestInterceptor(
        preRequestInterceptor: _preRequestCallback,
        afterRequestInterfeptor: _afterRequestCallback,
      ),
    );
  }

  void _preRequestCallback(AppHttpMethod method, Uri endpoint, Object? body, Map<String, String>? headers) {}

  void _afterRequestCallback(Object? requestBody, Response response) async {
    _apiLog(requestBody, response);
  }

  void _apiLog(Object? requestBody, Response response) {
    if (kDebugMode) {
      final request = response.request;
      print('[${request?.method.toUpperCase()}] ${request?.url}');
      print('[HEADER] ${response.request?.headers}');

      if (requestBody != null) {
        print('[BODY] $requestBody');
      }

      print('[${response.statusCode}] -> ${response.body}');
    }
  }
}
