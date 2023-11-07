import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppExceptions with _$AppExceptions implements Exception {
  const factory AppExceptions.customException({String? message, Map<String, dynamic>? data}) = CustomException;
  const factory AppExceptions.storageException() = StorageException;
  const factory AppExceptions.serverException({int? statusCode, String? message, Map<String, dynamic>? data}) =
      ServerException;
}
