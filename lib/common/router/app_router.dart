import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  AppRouter({GlobalKey<NavigatorState>? navigatorKey}) : super(navigatorKey: navigatorKey);

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: CitiesShowsRoute.page, path: '/'),
    AutoRoute(page: CityForecastWeatherRoute.page, path: '/city-forecast-weather', fullscreenDialog: true),
  ];
}
