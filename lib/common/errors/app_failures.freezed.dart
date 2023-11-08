// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppFailures {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageFailure,
    required TResult Function(String? message) networkFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageFailure,
    TResult? Function(String? message)? networkFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageFailure,
    TResult Function(String? message)? networkFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageFailure value) storageFailure,
    required TResult Function(NetworkFailure value) networkFailure,
    required TResult Function(CustomFailure value) customFailure,
    required TResult Function(ServerFailure value) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageFailure value)? storageFailure,
    TResult? Function(NetworkFailure value)? networkFailure,
    TResult? Function(CustomFailure value)? customFailure,
    TResult? Function(ServerFailure value)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageFailure value)? storageFailure,
    TResult Function(NetworkFailure value)? networkFailure,
    TResult Function(CustomFailure value)? customFailure,
    TResult Function(ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppFailuresCopyWith<AppFailures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppFailuresCopyWith<$Res> {
  factory $AppFailuresCopyWith(
          AppFailures value, $Res Function(AppFailures) then) =
      _$AppFailuresCopyWithImpl<$Res, AppFailures>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppFailuresCopyWithImpl<$Res, $Val extends AppFailures>
    implements $AppFailuresCopyWith<$Res> {
  _$AppFailuresCopyWithImpl(this._value, this._then);

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
abstract class _$$StorageFailureImplCopyWith<$Res>
    implements $AppFailuresCopyWith<$Res> {
  factory _$$StorageFailureImplCopyWith(_$StorageFailureImpl value,
          $Res Function(_$StorageFailureImpl) then) =
      __$$StorageFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$StorageFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$StorageFailureImpl>
    implements _$$StorageFailureImplCopyWith<$Res> {
  __$$StorageFailureImplCopyWithImpl(
      _$StorageFailureImpl _value, $Res Function(_$StorageFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$StorageFailureImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StorageFailureImpl implements StorageFailure {
  const _$StorageFailureImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailures.storageFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      __$$StorageFailureImplCopyWithImpl<_$StorageFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageFailure,
    required TResult Function(String? message) networkFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverFailure,
  }) {
    return storageFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageFailure,
    TResult? Function(String? message)? networkFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
  }) {
    return storageFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageFailure,
    TResult Function(String? message)? networkFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
    required TResult orElse(),
  }) {
    if (storageFailure != null) {
      return storageFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageFailure value) storageFailure,
    required TResult Function(NetworkFailure value) networkFailure,
    required TResult Function(CustomFailure value) customFailure,
    required TResult Function(ServerFailure value) serverFailure,
  }) {
    return storageFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageFailure value)? storageFailure,
    TResult? Function(NetworkFailure value)? networkFailure,
    TResult? Function(CustomFailure value)? customFailure,
    TResult? Function(ServerFailure value)? serverFailure,
  }) {
    return storageFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageFailure value)? storageFailure,
    TResult Function(NetworkFailure value)? networkFailure,
    TResult Function(CustomFailure value)? customFailure,
    TResult Function(ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (storageFailure != null) {
      return storageFailure(this);
    }
    return orElse();
  }
}

abstract class StorageFailure implements AppFailures {
  const factory StorageFailure({final String? message}) = _$StorageFailureImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$StorageFailureImplCopyWith<_$StorageFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res>
    implements $AppFailuresCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkFailureImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AppFailures.networkFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageFailure,
    required TResult Function(String? message) networkFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverFailure,
  }) {
    return networkFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageFailure,
    TResult? Function(String? message)? networkFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
  }) {
    return networkFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageFailure,
    TResult Function(String? message)? networkFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageFailure value) storageFailure,
    required TResult Function(NetworkFailure value) networkFailure,
    required TResult Function(CustomFailure value) customFailure,
    required TResult Function(ServerFailure value) serverFailure,
  }) {
    return networkFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageFailure value)? storageFailure,
    TResult? Function(NetworkFailure value)? networkFailure,
    TResult? Function(CustomFailure value)? customFailure,
    TResult? Function(ServerFailure value)? serverFailure,
  }) {
    return networkFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageFailure value)? storageFailure,
    TResult Function(NetworkFailure value)? networkFailure,
    TResult Function(CustomFailure value)? customFailure,
    TResult Function(ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements AppFailures {
  const factory NetworkFailure({final String? message}) = _$NetworkFailureImpl;

  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CustomFailureImplCopyWith<$Res>
    implements $AppFailuresCopyWith<$Res> {
  factory _$$CustomFailureImplCopyWith(
          _$CustomFailureImpl value, $Res Function(_$CustomFailureImpl) then) =
      __$$CustomFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$CustomFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$CustomFailureImpl>
    implements _$$CustomFailureImplCopyWith<$Res> {
  __$$CustomFailureImplCopyWithImpl(
      _$CustomFailureImpl _value, $Res Function(_$CustomFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CustomFailureImpl(
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

class _$CustomFailureImpl implements CustomFailure {
  const _$CustomFailureImpl({this.message, final Map<String, dynamic>? data})
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
    return 'AppFailures.customFailure(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFailureImplCopyWith<_$CustomFailureImpl> get copyWith =>
      __$$CustomFailureImplCopyWithImpl<_$CustomFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageFailure,
    required TResult Function(String? message) networkFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverFailure,
  }) {
    return customFailure(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageFailure,
    TResult? Function(String? message)? networkFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
  }) {
    return customFailure?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageFailure,
    TResult Function(String? message)? networkFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
    required TResult orElse(),
  }) {
    if (customFailure != null) {
      return customFailure(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageFailure value) storageFailure,
    required TResult Function(NetworkFailure value) networkFailure,
    required TResult Function(CustomFailure value) customFailure,
    required TResult Function(ServerFailure value) serverFailure,
  }) {
    return customFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageFailure value)? storageFailure,
    TResult? Function(NetworkFailure value)? networkFailure,
    TResult? Function(CustomFailure value)? customFailure,
    TResult? Function(ServerFailure value)? serverFailure,
  }) {
    return customFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageFailure value)? storageFailure,
    TResult Function(NetworkFailure value)? networkFailure,
    TResult Function(CustomFailure value)? customFailure,
    TResult Function(ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (customFailure != null) {
      return customFailure(this);
    }
    return orElse();
  }
}

abstract class CustomFailure implements AppFailures {
  const factory CustomFailure(
      {final String? message,
      final Map<String, dynamic>? data}) = _$CustomFailureImpl;

  @override
  String? get message;
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CustomFailureImplCopyWith<_$CustomFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $AppFailuresCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, Map<String, dynamic>? data});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$AppFailuresCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ServerFailureImpl(
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

class _$ServerFailureImpl implements ServerFailure {
  const _$ServerFailureImpl({this.message, final Map<String, dynamic>? data})
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
    return 'AppFailures.serverFailure(message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) storageFailure,
    required TResult Function(String? message) networkFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        customFailure,
    required TResult Function(String? message, Map<String, dynamic>? data)
        serverFailure,
  }) {
    return serverFailure(message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? storageFailure,
    TResult? Function(String? message)? networkFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult? Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
  }) {
    return serverFailure?.call(message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? storageFailure,
    TResult Function(String? message)? networkFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        customFailure,
    TResult Function(String? message, Map<String, dynamic>? data)?
        serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StorageFailure value) storageFailure,
    required TResult Function(NetworkFailure value) networkFailure,
    required TResult Function(CustomFailure value) customFailure,
    required TResult Function(ServerFailure value) serverFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StorageFailure value)? storageFailure,
    TResult? Function(NetworkFailure value)? networkFailure,
    TResult? Function(CustomFailure value)? customFailure,
    TResult? Function(ServerFailure value)? serverFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StorageFailure value)? storageFailure,
    TResult Function(NetworkFailure value)? networkFailure,
    TResult Function(CustomFailure value)? customFailure,
    TResult Function(ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class ServerFailure implements AppFailures {
  const factory ServerFailure(
      {final String? message,
      final Map<String, dynamic>? data}) = _$ServerFailureImpl;

  @override
  String? get message;
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
