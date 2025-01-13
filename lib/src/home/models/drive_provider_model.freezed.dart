// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriveProviderModel _$DriveProviderModelFromJson(Map<String, dynamic> json) {
  return _DriveProviderModel.fromJson(json);
}

/// @nodoc
mixin _$DriveProviderModel {
  String get remoteName => throw _privateConstructorUsedError;
  DriveProvider get provider => throw _privateConstructorUsedError;
  DriveProviderBackend get backend => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  bool get isRCloneBackend => throw _privateConstructorUsedError;

  /// Serializes this DriveProviderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriveProviderModelCopyWith<DriveProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveProviderModelCopyWith<$Res> {
  factory $DriveProviderModelCopyWith(
          DriveProviderModel value, $Res Function(DriveProviderModel) then) =
      _$DriveProviderModelCopyWithImpl<$Res, DriveProviderModel>;
  @useResult
  $Res call(
      {String remoteName,
      DriveProvider provider,
      DriveProviderBackend backend,
      String createdAt,
      String updatedAt,
      bool isRCloneBackend});

  $DriveProviderBackendCopyWith<$Res> get backend;
}

/// @nodoc
class _$DriveProviderModelCopyWithImpl<$Res, $Val extends DriveProviderModel>
    implements $DriveProviderModelCopyWith<$Res> {
  _$DriveProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? provider = null,
    Object? backend = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isRCloneBackend = null,
  }) {
    return _then(_value.copyWith(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as DriveProviderBackend,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRCloneBackend: null == isRCloneBackend
          ? _value.isRCloneBackend
          : isRCloneBackend // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DriveProviderBackendCopyWith<$Res> get backend {
    return $DriveProviderBackendCopyWith<$Res>(_value.backend, (value) {
      return _then(_value.copyWith(backend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DriveProviderModelImplCopyWith<$Res>
    implements $DriveProviderModelCopyWith<$Res> {
  factory _$$DriveProviderModelImplCopyWith(_$DriveProviderModelImpl value,
          $Res Function(_$DriveProviderModelImpl) then) =
      __$$DriveProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String remoteName,
      DriveProvider provider,
      DriveProviderBackend backend,
      String createdAt,
      String updatedAt,
      bool isRCloneBackend});

  @override
  $DriveProviderBackendCopyWith<$Res> get backend;
}

/// @nodoc
class __$$DriveProviderModelImplCopyWithImpl<$Res>
    extends _$DriveProviderModelCopyWithImpl<$Res, _$DriveProviderModelImpl>
    implements _$$DriveProviderModelImplCopyWith<$Res> {
  __$$DriveProviderModelImplCopyWithImpl(_$DriveProviderModelImpl _value,
      $Res Function(_$DriveProviderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? provider = null,
    Object? backend = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isRCloneBackend = null,
  }) {
    return _then(_$DriveProviderModelImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      backend: null == backend
          ? _value.backend
          : backend // ignore: cast_nullable_to_non_nullable
              as DriveProviderBackend,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      isRCloneBackend: null == isRCloneBackend
          ? _value.isRCloneBackend
          : isRCloneBackend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriveProviderModelImpl implements _DriveProviderModel {
  const _$DriveProviderModelImpl(
      {required this.remoteName,
      required this.provider,
      required this.backend,
      required this.createdAt,
      required this.updatedAt,
      required this.isRCloneBackend});

  factory _$DriveProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriveProviderModelImplFromJson(json);

  @override
  final String remoteName;
  @override
  final DriveProvider provider;
  @override
  final DriveProviderBackend backend;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final bool isRCloneBackend;

  @override
  String toString() {
    return 'DriveProviderModel(remoteName: $remoteName, provider: $provider, backend: $backend, createdAt: $createdAt, updatedAt: $updatedAt, isRCloneBackend: $isRCloneBackend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveProviderModelImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.backend, backend) || other.backend == backend) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isRCloneBackend, isRCloneBackend) ||
                other.isRCloneBackend == isRCloneBackend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName, provider, backend,
      createdAt, updatedAt, isRCloneBackend);

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveProviderModelImplCopyWith<_$DriveProviderModelImpl> get copyWith =>
      __$$DriveProviderModelImplCopyWithImpl<_$DriveProviderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriveProviderModelImplToJson(
      this,
    );
  }
}

abstract class _DriveProviderModel implements DriveProviderModel {
  const factory _DriveProviderModel(
      {required final String remoteName,
      required final DriveProvider provider,
      required final DriveProviderBackend backend,
      required final String createdAt,
      required final String updatedAt,
      required final bool isRCloneBackend}) = _$DriveProviderModelImpl;

  factory _DriveProviderModel.fromJson(Map<String, dynamic> json) =
      _$DriveProviderModelImpl.fromJson;

  @override
  String get remoteName;
  @override
  DriveProvider get provider;
  @override
  DriveProviderBackend get backend;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isRCloneBackend;

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriveProviderModelImplCopyWith<_$DriveProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
