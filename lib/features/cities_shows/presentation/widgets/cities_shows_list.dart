import 'package:flutter/material.dart';

import '../../../../common/config/dependency_injection.dart';
import '../../../../common/router/app_router.dart';
import '../../../../common/router/app_router.gr.dart';
import '../../../../common/widgets/app_text.dart';

class CitiesShowsList extends StatelessWidget {
  const CitiesShowsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          final isLast = index == 4;
          return GestureDetector(
            onTap: () => getIt<AppRouter>().navigate(const CityWeatherDetailRoute()),
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 0.0 : 15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: const IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: 'Belo Horizonte', style: AppTextStyle.titleMedium),
                        AppText(
                          text: '14:05',
                          style: AppTextStyle.bodyLarge,
                          margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                        ),
                        AppText(text: 'Predominantemente Ensolarado', style: AppTextStyle.bodySmall),
                      ],
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(text: '29º', style: AppTextStyle.titleLarge),
                        Spacer(),
                        AppText(text: 'Máx.: 29º | Mín.: 17º', style: AppTextStyle.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
