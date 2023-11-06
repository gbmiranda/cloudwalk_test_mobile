import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common/config/dependency_injection.dart';
import 'common/constants/app_consts.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      await DependencyInjection.init();
      // await getIt<AppSetup>().init();
      runApp(const MyApp());
    },
    (error, stack) {
      if (kDebugMode) print('runZonedGuarded: $error');
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConsts.appName,
    );
  }
}
