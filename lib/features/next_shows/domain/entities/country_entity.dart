import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String? country;

  const CountryEntity(this.country);

  @override
  List<Object?> get props => [country];
}
