import 'package:flutter/material.dart';

import '../../../../common/widgets/app_text.dart';

class CityForecastWeather extends StatelessWidget {
  const CityForecastWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AppText(
          text: 'Forecast for 5 days',
          style: AppTextStyle.titleSmall,
          margin: EdgeInsets.only(bottom: 15.0),
        ),
        ...List.generate(5, (index) {
          final isLast = index == 4;
          return Container(
            margin: EdgeInsets.only(bottom: isLast ? 0.0 : 15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(text: 'Qua.', style: AppTextStyle.titleMedium),
                AppText(text: 'Sol', style: AppTextStyle.titleMedium),
                AppText(text: 'Máx.: 29º | Mín.: 17º', style: AppTextStyle.bodyMedium),
              ],
            ),
          );
        })
      ],
    );
  }
}
