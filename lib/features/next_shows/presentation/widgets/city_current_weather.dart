import 'package:flutter/material.dart';

import '../../../../common/widgets/app_text.dart';
import '../../domain/entities/city_current_weather_entity.dart';

class CityCurrentWeather extends StatelessWidget {
  final CityCurrentWeatherEntity cityCurrentWeather;

  const CityCurrentWeather({super.key, required this.cityCurrentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: cityCurrentWeather.title,
          style: AppTextStyle.titleMedium,
          margin: const EdgeInsets.only(bottom: 15.0),
        ),
        AppText(
          text: cityCurrentWeather.celsius,
          style: AppTextStyle.titleExtraLarge,
          margin: const EdgeInsets.only(bottom: 15.0),
        ),
        AppText(
          text: cityCurrentWeather.sky,
          style: AppTextStyle.titleSmall,
          maxLines: 2,
          margin: const EdgeInsets.only(bottom: 5.0),
        ),
        AppText(
          text: cityCurrentWeather.celsiusInterval,
          style: AppTextStyle.titleSmall,
        ),
      ],
    );
  }
}
