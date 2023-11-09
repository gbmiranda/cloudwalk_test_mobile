import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/next_shows/shared/next_shows_injection.dart';
import '../../firebase_options.dart';
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
    await _injectFirebase();
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
      NextShowsInjection.inject(getIt),
    ]);
  }

  static Future<void> _injectFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final remoteConfig = FirebaseRemoteConfig.instance;
    try {
      if (remoteConfig.lastFetchTime.isBefore(DateTime.now().subtract(const Duration(hours: 12)))) {
        await remoteConfig.fetchAndActivate();
      } else {
        await remoteConfig.activate();
      }
    } catch (_) {
      await remoteConfig.activate();
    }
    await remoteConfig.ensureInitialized();
    getIt.registerLazySingleton(() => remoteConfig);
  }
}
