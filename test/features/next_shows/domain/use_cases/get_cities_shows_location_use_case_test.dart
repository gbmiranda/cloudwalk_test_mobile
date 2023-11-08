import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/entities/location_entity.dart';
import 'package:cloudwalk_test_mobile_1/features/next_shows/domain/use_cases/get_cities_shows_location_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late GetCitiesShowsLocationUseCase getCitiesShowsLocationUseCase;
  late List<LocationEntity> entities;

  setUp(() {
    getCitiesShowsLocationUseCase = GetCitiesShowsLocationUseCaseImpl();

    entities = [
      const LocationEntity(52.090, -1.032), // Silverstone, UK
      const LocationEntity(-23.547, -46.636), // São Paulo, Brazil
      const LocationEntity(-37.814, 144.963), // Melbourne, Australia
      const LocationEntity(43.737, 7.404), // Monte Carlo, Monaco
    ];

    registerFallbackValue(entities);
  });

  test('should return a <List<LocationEntity>> when the useCase is called', () async {
    //Arrange
    //Act
    final result = getCitiesShowsLocationUseCase.call();
    //Assert
    expect(result, entities);
  });
}
