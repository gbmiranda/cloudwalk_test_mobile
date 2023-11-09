// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppExceptions {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageException,
    required TResult Function(String? message) networkException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageException,
    TResult? Function(String? message)? networkException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageException,
    TResult Function(String? message)? networkException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageException value) storageException,
    required TResult Function(NetworkException value) networkException,
    required TResult Function(CustomException value) customException,
    required TResult Function(ServerException value) serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageException value)? storageException,
    TResult? Function(NetworkException value)? networkException,
    TResult? Function(CustomException value)? customException,
    TResult? Function(ServerException value)? serverException,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageException value)? storageException,
    TResult Function(NetworkException value)? networkException,
    TResult Function(CustomException value)? customException,
    TResult Function(ServerException value)? serverException,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppExceptionsCopyWith<AppExceptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionsCopyWith<$Res> {
  factory $AppExceptionsCopyWith(
          AppExceptions value, $Res Function(AppExceptions) then) =
      _$AppExceptionsCopyWithImpl<$Res, AppExceptions>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppExceptionsCopyWithImpl<$Res, $Val extends AppExceptions>
    implements $AppExceptionsCopyWith<$Res> {
  _$AppExceptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageExceptionImplCopyWith<$Res>
    implements $AppExceptionsCopyWith<$Res> {
  factory _$$StorageExceptionImplCopyWith(_$StorageExceptionImpl value,
          $Res Function(_$StorageExceptionImpl) then) =
      __$$StorageExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$StorageExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$StorageExceptionImpl>
    implements _$$StorageExceptionImplCopyWith<$Res> {
  __$$StorageExceptionImplCopyWithImpl(_$StorageExceptionImpl _value,
      $Res Function(_$StorageExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$StorageExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StorageExceptionImpl implements StorageException {
  const _$StorageExceptionImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AppExceptions.storageException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageExceptionImplCopyWith<_$StorageExceptionImpl> get copyWith =>
      __$$StorageExceptionImplCopyWithImpl<_$StorageExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageException,
    required TResult Function(String? message) networkException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverException,
  }) {
    return storageException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageException,
    TResult? Function(String? message)? networkException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverException,
  }) {
    return storageException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageException,
    TResult Function(String? message)? networkException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverException,
    required TResult orElse(),
  }) {
    if (storageException != null) {
      return storageException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageException value) storageException,
    required TResult Function(NetworkException value) networkException,
    required TResult Function(CustomException value) customException,
    required TResult Function(ServerException value) serverException,
  }) {
    return storageException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageException value)? storageException,
    TResult? Function(NetworkException value)? networkException,
    TResult? Function(CustomException value)? customException,
    TResult? Function(ServerException value)? serverException,
  }) {
    return storageException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageException value)? storageException,
    TResult Function(NetworkException value)? networkException,
    TResult Function(CustomException value)? customException,
    TResult Function(ServerException value)? serverException,
    required TResult orElse(),
  }) {
    if (storageException != null) {
      return storageException(this);
    }
    return orElse();
  }
}

abstract class StorageException implements AppExceptions {
  const factory StorageException({final String? message}) =
      _$StorageExceptionImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$StorageExceptionImplCopyWith<_$StorageExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkExceptionImplCopyWith<$Res>
    implements $AppExceptionsCopyWith<$Res> {
  factory _$$NetworkExceptionImplCopyWith(_$NetworkExceptionImpl value,
          $Res Function(_$NetworkExceptionImpl) then) =
      __$$NetworkExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$NetworkExceptionImpl>
    implements _$$NetworkExceptionImplCopyWith<$Res> {
  __$$NetworkExceptionImplCopyWithImpl(_$NetworkExceptionImpl _value,
      $Res Function(_$NetworkExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkExceptionImpl implements NetworkException {
  const _$NetworkExceptionImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AppExceptions.networkException(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkExceptionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      __$$NetworkExceptionImplCopyWithImpl<_$NetworkExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageException,
    required TResult Function(String? message) networkException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverException,
  }) {
    return networkException(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageException,
    TResult? Function(String? message)? networkException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverException,
  }) {
    return networkException?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageException,
    TResult Function(String? message)? networkException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverException,
    required TResult orElse(),
  }) {
    if (networkException != null) {
      return networkException(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageException value) storageException,
    required TResult Function(NetworkException value) networkException,
    required TResult Function(CustomException value) customException,
    required TResult Function(ServerException value) serverException,
  }) {
    return networkException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageException value)? storageException,
    TResult? Function(NetworkException value)? networkException,
    TResult? Function(CustomException value)? customException,
    TResult? Function(ServerException value)? serverException,
  }) {
    return networkException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageException value)? storageException,
    TResult Function(NetworkException value)? networkException,
    TResult Function(CustomException value)? customException,
    TResult Function(ServerException value)? serverException,
    required TResult orElse(),
  }) {
    if (networkException != null) {
      return networkException(this);
    }
    return orElse();
  }
}

abstract class NetworkException implements AppExceptions {
  const factory NetworkException({final String? message}) =
      _$NetworkExceptionImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkExceptionImplCopyWith<_$NetworkExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomExceptionImplCopyWith<$Res>
    implements $AppExceptionsCopyWith<$Res> {
  factory _$$CustomExceptionImplCopyWith(_$CustomExceptionImpl value,
          $Res Function(_$CustomExceptionImpl) then) =
      __$$CustomExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$CustomExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$CustomExceptionImpl>
    implements _$$CustomExceptionImplCopyWith<$Res> {
  __$$CustomExceptionImplCopyWithImpl(
      _$CustomExceptionImpl _value, $Res Function(_$CustomExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CustomExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$CustomExceptionImpl implements CustomException {
  const _$CustomExceptionImpl({this.message, final Map<String, dynamic>? data})
      : _data = data;

  @override
  final String? message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppExceptions.customException(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomExceptionImplCopyWith<_$CustomExceptionImpl> get copyWith =>
      __$$CustomExceptionImplCopyWithImpl<_$CustomExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageException,
    required TResult Function(String? message) networkException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverException,
  }) {
    return customException(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageException,
    TResult? Function(String? message)? networkException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverException,
  }) {
    return customException?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageException,
    TResult Function(String? message)? networkException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverException,
    required TResult orElse(),
  }) {
    if (customException != null) {
      return customException(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageException value) storageException,
    required TResult Function(NetworkException value) networkException,
    required TResult Function(CustomException value) customException,
    required TResult Function(ServerException value) serverException,
  }) {
    return customException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageException value)? storageException,
    TResult? Function(NetworkException value)? networkException,
    TResult? Function(CustomException value)? customException,
    TResult? Function(ServerException value)? serverException,
  }) {
    return customException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageException value)? storageException,
    TResult Function(NetworkException value)? networkException,
    TResult Function(CustomException value)? customException,
    TResult Function(ServerException value)? serverException,
    required TResult orElse(),
  }) {
    if (customException != null) {
      return customException(this);
    }
    return orElse();
  }
}

abstract class CustomException implements AppExceptions {
  const factory CustomException(
      {final String? message,
      final Map<String, dynamic>? data}) = _$CustomExceptionImpl;

  @override
  String? get message;
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomExceptionImplCopyWith<_$CustomExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerExceptionImplCopyWith<$Res>
    implements $AppExceptionsCopyWith<$Res> {
  factory _$$ServerExceptionImplCopyWith(_$ServerExceptionImpl value,
          $Res Function(_$ServerExceptionImpl) then) =
      __$$ServerExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$ServerExceptionImplCopyWithImpl<$Res>
    extends _$AppExceptionsCopyWithImpl<$Res, _$ServerExceptionImpl>
    implements _$$ServerExceptionImplCopyWith<$Res> {
  __$$ServerExceptionImplCopyWithImpl(
      _$ServerExceptionImpl _value, $Res Function(_$ServerExceptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ServerExceptionImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$ServerExceptionImpl implements ServerException {
  const _$ServerExceptionImpl({this.message, final Map<String, dynamic>? data})
      : _data = data;

  @override
  final String? message;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppExceptions.serverException(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerExceptionImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      __$$ServerExceptionImplCopyWithImpl<_$ServerExceptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageException,
    required TResult Function(String? message) networkException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customException,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverException,
  }) {
    return serverException(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageException,
    TResult? Function(String? message)? networkException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverException,
  }) {
    return serverException?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageException,
    TResult Function(String? message)? networkException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customException,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverException,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageException value) storageException,
    required TResult Function(NetworkException value) networkException,
    required TResult Function(CustomException value) customException,
    required TResult Function(ServerException value) serverException,
  }) {
    return serverException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageException value)? storageException,
    TResult? Function(NetworkException value)? networkException,
    TResult? Function(CustomException value)? customException,
    TResult? Function(ServerException value)? serverException,
  }) {
    return serverException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageException value)? storageException,
    TResult Function(NetworkException value)? networkException,
    TResult Function(CustomException value)? customException,
    TResult Function(ServerException value)? serverException,
    required TResult orElse(),
  }) {
    if (serverException != null) {
      return serverException(this);
    }
    return orElse();
  }
}

abstract class ServerException implements AppExceptions {
  const factory ServerException(
      {final String? message,
      final Map<String, dynamic>? data}) = _$ServerExceptionImpl;

  @override
  String? get message;
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ServerExceptionImplCopyWith<_$ServerExceptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
