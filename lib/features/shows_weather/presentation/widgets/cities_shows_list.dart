import 'package:flutter/material.dart';

import '../../../../../common/utils/keyboard_utils.dart';
import '../../../../../common/widgets/app_form_interaction.dart';
import '../../../../../common/widgets/app_text.dart';
import '../../domain/entities/city_current_weather_entity.dart';

class CitiesShowsList extends StatefulWidget {
  final List<CityCurrentWeatherEntity> cities;

  const CitiesShowsList({super.key, required this.cities});

  @override
  State<CitiesShowsList> createState() => _CitiesShowsListState();
}

class _CitiesShowsListState extends State<CitiesShowsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppFormInteraction(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          itemCount: widget.cities.length,
          itemBuilder: (context, index) {
            final city = widget.cities[index];
            return GestureDetector(
              onTap: () {
                KeyboardUtils.hideKeyboard();
                // getIt<AppRouter>().navigate( CityForecastWeatherRoute(cityCurrentWeather: , cityForecastWeather: ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: city == widget.cities.last ? 0.0 : 15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: city.title, style: AppTextStyle.titleMedium),
                          const Spacer(),
                          AppText(text: city.sky, style: AppTextStyle.bodyMedium),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            text: city.celsius,
                            style: AppTextStyle.titleLarge,
                            margin: const EdgeInsets.only(bottom: 5.0),
                          ),
                          AppText(text: city.celsiusInterval, style: AppTextStyle.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
