import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

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
  Future<Response> post(
    Uri endpoint, {
    Object body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  });
  Future<Response> patch(
    Uri endpoint, {
    Object body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  });
  Future<Response> put(
    Uri endpoint, {
    Object? body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  });
  Future<Response> delete(
    Uri endpoint, {
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  });
  Future<Response> multiPartFile(
    Uri endpoint, {
    required List<AppMultiPartFile> files,
    AppHttpMethod method = AppHttpMethod.post,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  });
  void addAppRequestInterceptorCallback(AppRequestInterceptor appRequestInterceptor);
  void addRequestHeaderCallback(AppRequestHeaderCallback requestHeaderCallback);
}

enum AppHttpMethod {
  get('GET'),
  post('POST'),
  patch('PATCH'),
  put('PUT'),
  delete('DELETE');

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

  @override
  Future<Response> delete(Uri endpoint, {Map<String, String>? headers, int? timeoutSeconds, Encoding? encoding}) async {
    return await _run(AppHttpMethod.delete, endpoint, null, headers, timeoutSeconds, encoding);
  }

  @override
  Future<Response> patch(
    Uri endpoint, {
    Object? body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  }) async {
    return await _run(AppHttpMethod.patch, endpoint, body, headers, timeoutSeconds, encoding);
  }

  @override
  Future<Response> post(
    Uri endpoint, {
    Object? body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  }) async {
    return await _run(AppHttpMethod.post, endpoint, body, headers, timeoutSeconds, encoding);
  }

  @override
  Future<Response> put(
    Uri endpoint, {
    Object? body,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  }) async {
    return await _run(AppHttpMethod.put, endpoint, body, headers, timeoutSeconds, encoding);
  }

  @override
  Future<Response> multiPartFile(
    Uri endpoint, {
    required List<AppMultiPartFile> files,
    AppHttpMethod method = AppHttpMethod.post,
    Map<String, String>? headers,
    int? timeoutSeconds,
    Encoding? encoding,
  }) async {
    final finalHeaders = await _generateHeaders(endpoint, headers);

    _appRequestInterceptor?.preRequestInterceptor.call(method, endpoint, null, finalHeaders);

    try {
      final request = MultipartRequest(method.value, endpoint);
      request.headers.addAll(finalHeaders);

      for (final file in files) {
        request.files.add(MultipartFile.fromBytes(
          file.fieldName,
          file.fileBytes,
          filename: file.fileName,
          contentType: file.mediaType,
        ));
      }

      final streamedResponse = await request.send().timeout(_timeoutDuration(timeoutSeconds));
      final response = await Response.fromStream(streamedResponse);

      if (_appRequestInterceptor != null) {
        _appRequestInterceptor!.afterRequestInterfeptor.call(null, response);
      }

      return response;
    } catch (error) {
      if (kDebugMode) {
        print('[${method.name.toUpperCase()}] ${endpoint.toString()}');
        print('[HEADER] $finalHeaders');
        print('[FILES] ${files.length}');
        print('[ERROR] $error');
      }
      rethrow;
    }
  }

  @override
  void addRequestHeaderCallback(AppRequestHeaderCallback requestHeaderCallback) {
    _appHeadersCallbacks.add(requestHeaderCallback);
  }

  @override
  void addAppRequestInterceptorCallback(AppRequestInterceptor appRequestInterceptor) {
    _appRequestInterceptor = appRequestInterceptor;
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
        case AppHttpMethod.delete:
          response = await client
              .delete(endpoint, headers: finalHeaders, encoding: encoding)
              .timeout(_timeoutDuration(timeoutSeconds));
          break;
        case AppHttpMethod.patch:
          response = await client
              .patch(endpoint, headers: finalHeaders, body: body, encoding: encoding)
              .timeout(_timeoutDuration(timeoutSeconds));
          break;
        case AppHttpMethod.post:
          response = await client
              .post(endpoint, headers: finalHeaders, body: body, encoding: encoding)
              .timeout(_timeoutDuration(timeoutSeconds));
          break;
        case AppHttpMethod.put:
          response = await client
              .put(endpoint, headers: finalHeaders, body: body, encoding: encoding)
              .timeout(_timeoutDuration(timeoutSeconds));
          break;
        case AppHttpMethod.get:
        default:
          response = await client.get(endpoint, headers: finalHeaders).timeout(_timeoutDuration(timeoutSeconds));
          break;
      }

      if (_appRequestInterceptor != null) {
        _appRequestInterceptor!.afterRequestInterfeptor.call(body, response);
      }
      return response;
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

  Duration _timeoutDuration(int? seconds) => Duration(seconds: seconds ?? 30);
}
