import 'dart:convert';

import 'package:cloudwalk_test_mobile_1/features/next_shows/data/models/city_current_weather_model.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/city_current_weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late CityCurrentWeatherEntity entity;

  setUp(() {
    final json = fixture('current_weather.json');
    final model = CityCurrentWeatherModel.fromJson(jsonDecode(json));
    entity = model.toEntity();
  });

  test('should verify the <CityCurrentWeatherEntity> getters values', () async {
    // Arrange
    final title = '${entity.name}, ${entity.country?.country}';
    final celsius = '${entity.temperature?.temp}º';
    final celsiusInterval = 'Max: ${entity.temperature?.tempMax}º | Min: ${entity.temperature?.tempMin}º';
    final sky = '${entity.weather?.first.description}';

    //Assert
    expect(entity.title, title);
    expect(entity.celsius, celsius);
    expect(entity.celsiusInterval, celsiusInterval);
    expect(entity.sky, sky);
  });
}
