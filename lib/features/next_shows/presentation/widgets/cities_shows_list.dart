import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/keyboard_utils.dart';
import '../../../../../common/widgets/app_form_interaction.dart';
import '../../../../../common/widgets/app_text.dart';
import '../../../../common/config/dependency_injection.dart';
import '../../../../common/router/app_router.dart';
import '../../../../common/router/app_router.gr.dart';
import '../../../../common/utils/string_utils.dart';
import '../bloc/cities_shows_bloc.dart';

class CitiesShowsList extends StatefulWidget {
  const CitiesShowsList({super.key});

  @override
  State<CitiesShowsList> createState() => _CitiesShowsListState();
}

class _CitiesShowsListState extends State<CitiesShowsList> {
  final _citiesShowsBloc = getIt<CitiesShowsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesShowsBloc, CitiesShowsState>(
      bloc: _citiesShowsBloc,
      builder: (context, state) {
        final successState = state as CitiesShowsStateSuccess;
        final filteredCities = successState.cities?.where((city) {
          if (successState.search == null) return true;
          return city.title.prepareToCompare.contains(successState.search!.prepareToCompare);
        }).toList();
        return Expanded(
          child: AppFormInteraction(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              itemCount: filteredCities?.length,
              itemBuilder: (context, index) {
                final city = filteredCities![index];
                return GestureDetector(
                  onTap: () {
                    KeyboardUtils.hideKeyboard();
                    getIt<AppRouter>().navigate(CityForecastWeatherRoute(cityCurrentWeather: city));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: city == filteredCities.last ? 0.0 : 15.0),
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
      },
    );
  }
}
