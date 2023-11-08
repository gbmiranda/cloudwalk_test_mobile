import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failures.freezed.dart';

@freezed
class AppFailures with _$AppFailures {
  const factory AppFailures.storageFailure({String? message}) = StorageFailure;
  const factory AppFailures.networkFailure({String? message}) = NetworkFailure;
  const factory AppFailures.customFailure({String? message, Map<String, dynamic>? data}) = CustomFailure;
  const factory AppFailures.serverFailure({String? message, Map<String, dynamic>? data}) = ServerFailure;
}
