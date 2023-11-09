import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import '../errors/app_exceptions.dart';

typedef PreRequestInterceptor = void Function(
  AppHttpMethod method,
  Uri endpoint,
  Object? body,
  Map<String, String>? headers,
);
typedef AfterRequestInterceptor = void Function(Object? requestBody, Response response);
typedef AppRequestHeaderCallback = Future<Map<String, String>> Function(Uri endpoint, Map<String, String> headers);

class AppRequestInterceptor {
  final PreRequestInterceptor preRequestInterceptor;
  final AfterRequestInterceptor afterRequestInterfeptor;

  AppRequestInterceptor({required this.preRequestInterceptor, required this.afterRequestInterfeptor});
}

class AppMultiPartFile {
  final String fieldName;
  final String? fileName;
  final Uint8List fileBytes;
  final MediaType? mediaType;

  AppMultiPartFile({required this.fieldName, this.fileName, required this.fileBytes, this.mediaType});
}

abstract class AppHttpClient {
  Future<Response> get(Uri endpoint, {Map<String, String>? headers, int? timeoutSeconds});
}

enum AppHttpMethod {
  get('GET');

  const AppHttpMethod(this.value);
  final String value;
}

class AppHttpClientImpl implements AppHttpClient {
  final Client client;

  final _appHeadersCallbacks = <AppRequestHeaderCallback>[];
  AppRequestInterceptor? _appRequestInterceptor;

  AppHttpClientImpl(this.client);

  @override
  Future<Response> get(Uri endpoint, {Map<String, String>? headers, int? timeoutSeconds}) async {
    return await _run(AppHttpMethod.get, endpoint, null, headers, timeoutSeconds, null);
  }

  Future<Response> _run(
    AppHttpMethod method,
    Uri endpoint,
    Object? body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  ) async {
    final finalHeaders = await _generateHeaders(endpoint, headers);

    _appRequestInterceptor?.preRequestInterceptor.call(method, endpoint, body, finalHeaders);

    Response response;

    try {
      switch (method) {
        case AppHttpMethod.get:
        default:
          response = await client.get(endpoint, headers: finalHeaders).timeout(const Duration(seconds: 5));
          break;
      }

      if (_appRequestInterceptor != null) {
        _appRequestInterceptor!.afterRequestInterfeptor.call(body, response);
      }
      return response;
    } on ClientException {
      throw const NetworkException();
    } on TimeoutException {
      throw const NetworkException();
    } catch (error) {
      if (kDebugMode) {
        print('[${method.name.toUpperCase()}] ${endpoint.toString()}');
        print('[HEADER] $finalHeaders');
        if (body != null) {
          print('[BODY] $body');
        }
        print('[ERROR] $error');
      }
      rethrow;
    }
  }

  Future<Map<String, String>> _generateHeaders(Uri endpoint, Map<String, String>? headers) async {
    final finalHeaders = {'Accept': 'application/json; charset=UTF-8'};

    if (headers != null) {
      finalHeaders.addAll(headers);
    }

    if (finalHeaders.containsKey('Content-Type') == false) {
      finalHeaders['Content-Type'] = 'application/json; charset=UTF-8';
    }

    for (final addHeader in _appHeadersCallbacks) {
      finalHeaders.addAll(await addHeader.call(endpoint, finalHeaders));
    }

    return finalHeaders;
  }
}
