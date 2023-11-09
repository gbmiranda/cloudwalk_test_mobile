import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/config/dependency_injection.dart';
import '../../../../common/widgets/app_loading.dart';
import '../../../../common/widgets/app_text.dart';
import '../../domain/entities/city_forecast_weather_entity.dart';
import '../bloc/city_forecast_weather_bloc.dart';

class CityForecastWeather extends StatefulWidget {
  const CityForecastWeather({super.key});

  @override
  State<CityForecastWeather> createState() => _CityForecastWeatherState();
}

class _CityForecastWeatherState extends State<CityForecastWeather> {
  final _cityForecastBloc = getIt<CityForecastWeatherBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityForecastWeatherBloc, CityForecastWeatherState>(
      bloc: _cityForecastBloc,
      builder: (context, state) {
        if (state is CityForecastWeatherStateLoading) {
          return const AppLoading(isCenter: true);
        }
        if (state is CityForecastWeatherStateError) {
          return const Center(child: AppText(text: ':(', style: AppTextStyle.titleMedium));
        }
        final successState = state as CityForecastWeatherStateSuccess;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppText(
              text: 'Next days',
              style: AppTextStyle.titleSmall,
              margin: EdgeInsets.only(bottom: 15.0),
            ),
            ..._diffDays(successState.forecast).map((weekDay) {
              final isLast = weekDay == _diffDays(successState.forecast).last;
              final forecasts = successState.forecast.where((forecast) => forecast.weekDay == weekDay).toList();
              return Container(
                margin: EdgeInsets.only(bottom: isLast ? 0.0 : 15.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: weekDay,
                          style: AppTextStyle.titleMedium,
                          margin: const EdgeInsets.only(bottom: 5.0),
                        ),
                        AppText(
                          text: forecasts.first.dateStr,
                          style: AppTextStyle.bodyLarge,
                          margin: const EdgeInsets.only(bottom: 5.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    ...forecasts.map((forecast) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppText(text: forecast.timeStr, style: AppTextStyle.bodyMedium),
                                    AppText(
                                      text: '• ${forecast.sky}',
                                      style: AppTextStyle.bodyMedium,
                                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                      expanded: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AppText(
                              text: forecast.celsiusInterval,
                              style: AppTextStyle.bodyMedium,
                              expanded: true,
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              );
            })
          ],
        );
      },
    );
  }

  List<String> _diffDays(List<CityForecastWeatherEntity> forecasts) {
    return forecasts.map((forecast) => forecast.weekDay).toSet().toList();
  }
}
