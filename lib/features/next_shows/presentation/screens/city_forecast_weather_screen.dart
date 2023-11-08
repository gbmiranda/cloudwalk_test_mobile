import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../common/config/dependency_injection.dart';
import '../../../../common/widgets/app_navigation_bar.dart';
import '../../domain/entities/city_current_weather_entity.dart';
import '../bloc/city_forecast_weather_bloc.dart';
import '../widgets/city_current_weather.dart';
import '../widgets/city_forecast_weather.dart';

@RoutePage()
class CityForecastWeatherScreen extends StatefulWidget {
  final CityCurrentWeatherEntity cityCurrentWeather;

  const CityForecastWeatherScreen({super.key, required this.cityCurrentWeather});

  @override
  State<CityForecastWeatherScreen> createState() => _CityForecastWeatherScreenState();
}

class _CityForecastWeatherScreenState extends State<CityForecastWeatherScreen> {
  final _cityForecastBloc = getIt<CityForecastWeatherBloc>();

  @override
  void initState() {
    _cityForecastBloc.add(FetchCityForecastWeatherEvent(widget.cityCurrentWeather));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppNavigationBar(title: 'Forecast'),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CityCurrentWeather(cityCurrentWeather: widget.cityCurrentWeather),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25.0),
              child: Divider(color: Colors.white.withOpacity(0.5)),
            ),
            const CityForecastWeather(),
          ],
        ),
      ),
    );
  }
}
