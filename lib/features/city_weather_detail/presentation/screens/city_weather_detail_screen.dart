import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CityWeatherDetailScreen extends StatefulWidget {
  const CityWeatherDetailScreen({super.key});

  @override
  State<CityWeatherDetailScreen> createState() => _CityWeatherDetailScreenState();
}

class _CityWeatherDetailScreenState extends State<CityWeatherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
