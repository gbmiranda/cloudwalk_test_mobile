import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exceptions.freezed.dart';

@freezed
class AppExceptions with _$AppExceptions implements Exception {
  const factory AppExceptions.storageException({String? message}) = StorageException;
  const factory AppExceptions.networkException({String? message}) = NetworkException;
  const factory AppExceptions.customException({String? message, Map<String, dynamic>? data}) = CustomException;
  const factory AppExceptions.serverException({String? message, Map<String, dynamic>? data}) = ServerException;
}
