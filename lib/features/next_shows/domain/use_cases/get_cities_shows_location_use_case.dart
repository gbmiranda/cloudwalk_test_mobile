import '../entities/location_entity.dart';

abstract class GetCitiesShowsLocationUseCase {
  List<LocationEntity> call();
}

class GetCitiesShowsLocationUseCaseImpl implements GetCitiesShowsLocationUseCase {
  ///
  /// In a real scenario, this useCase would access an internal API to return the locations of next shows.
  ///
  @override
  List<LocationEntity> call() {
    return [
      const LocationEntity(52.090, -1.032), // Silverstone, UK
      const LocationEntity(-23.547, -46.636), // São Paulo, Brazil
      const LocationEntity(-37.814, 144.963), // Melbourne, Australia
      const LocationEntity(43.737, 7.404), // Monte Carlo, Monaco
    ];
  }
}
