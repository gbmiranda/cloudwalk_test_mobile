import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failures.freezed.dart';

@freezed
class AppFailures with _$AppFailures {
  const factory AppFailures.customFailure({String? message, Map<String, dynamic>? data}) = CustomFailure;
  const factory AppFailures.storageFailure() = StorageFailure;
  const factory AppFailures.serverFailure({int? statusCode, String? message, Map<String, dynamic>? data}) =
      ServerFailure;
}
