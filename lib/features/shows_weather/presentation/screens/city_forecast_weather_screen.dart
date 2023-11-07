import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_navigation_bar.dart';
import '../widgets/city_current_weather.dart';
import '../widgets/city_forecast_weather.dart';

@RoutePage()
class CityForecastWeatherScreen extends StatefulWidget {
  final CityCurrentWeather cityCurrentWeather;
  final List<CityForecastWeather> cityForecastWeather;

  const CityForecastWeatherScreen({super.key, required this.cityCurrentWeather, required this.cityForecastWeather});

  @override
  State<CityForecastWeatherScreen> createState() => _CityForecastWeatherScreenState();
}

class _CityForecastWeatherScreenState extends State<CityForecastWeatherScreen> {
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
