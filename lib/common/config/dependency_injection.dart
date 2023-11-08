import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/shows_weather/shared/cities_shows_injection.dart';
import '../library/app_http_client.dart';
import '../router/app_router.dart';

final getIt = GetIt.instance;

mixin DependencyInjection {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _injectExternalLibs();
    _injectCommons();
    _injectFeatures();
  }

  static Future<void> _injectExternalLibs() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    getIt.registerLazySingleton(() => Client());
  }

  static void _injectCommons() {
    getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey<NavigatorState>());
    getIt.registerLazySingleton<AppRouter>(() => AppRouter(navigatorKey: getIt()));
    getIt.registerLazySingleton<AppHttpClient>(() => AppHttpClientImpl(getIt()));
  }

  static void _injectFeatures() {
    Future.wait([
      CitiesShowsInjection.inject(getIt),
    ]);
  }
}
