import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_forecast_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_forecast_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late CityForecastWeatherEntity entity;

  setUp(() {
    final json = fixture('forecast_weather.json');
    final jsonMap = jsonDecode(json) as Map;
    final jsonList = jsonMap['list'] as List;
    final models = jsonList.map((json) => CityForecastWeatherModel.fromJson(json)).toList();
    entity = models.toEntityList().first;
  });

  test('should verify the <CityForecastWeatherEntity> getters values', () async {
    // Arrange
    final date = DateTime.fromMillisecondsSinceEpoch(entity.dateTime! * 1000, isUtc: true).toLocal();
    final weekDay = DateFormat('EEEE').format(date);
    final dateStr = DateFormat('dd/MM').format(date);
    final timeStr = DateFormat('HH:mm').format(date);
    final celsiusInterval = 'Max: ${entity.temperature?.tempMax}º | Min: ${entity.temperature?.tempMin}º';
    final sky = '${entity.weather?.first.description}';

    //Assert
    expect(entity.weekDay, weekDay);
    expect(entity.dateStr, dateStr);
    expect(entity.timeStr, timeStr);
    expect(entity.celsiusInterval, celsiusInterval);
    expect(entity.sky, sky);
  });
}
