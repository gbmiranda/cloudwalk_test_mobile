import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_navigation_bar.dart';
import '../widgets/city_current_weather.dart';
import '../widgets/city_forecast_weather.dart';

@RoutePage()
class CityWeatherDetailScreen extends StatefulWidget {
  const CityWeatherDetailScreen({super.key});

  @override
  State<CityWeatherDetailScreen> createState() => _CityWeatherDetailScreenState();
}

class _CityWeatherDetailScreenState extends State<CityWeatherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CityCurrentWeather(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(color: Colors.white.withOpacity(0.5)),
            ),
            const CityForecastWeather(),
          ],
        ),
      ),
    );
  }
}
