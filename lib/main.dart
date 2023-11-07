import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common/config/dependency_injection.dart';
import 'common/constants/app_consts.dart';
import 'common/router/app_router.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      await DependencyInjection.init();
      runApp(const MyApp());
    },
    (error, _) {
      if (kDebugMode) print('runZonedGuarded: $error');
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConsts.appName,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
