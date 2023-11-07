import 'package:flutter/material.dart';

import '../../../../common/widgets/app_text.dart';

class CityCurrentWeather extends StatelessWidget {
  const CityCurrentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppText(
          text: 'Belo Horizonte',
          style: AppTextStyle.titleMedium,
          margin: EdgeInsets.only(bottom: 15.0),
        ),
        AppText(
          text: '29º',
          style: AppTextStyle.titleExtraLarge,
          margin: EdgeInsets.only(bottom: 15.0),
        ),
        AppText(
          text: 'Predominantemente Ensolarado',
          style: AppTextStyle.titleSmall,
          maxLines: 2,
          margin: EdgeInsets.only(bottom: 5.0),
        ),
        AppText(
          text: 'Máx.: 29º | Mín.: 17º',
          style: AppTextStyle.titleSmall,
        ),
      ],
    );
  }
}
