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
  DriveProvider get provider => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String get expiresIn => throw _privateConstructorUsedError;
  Map<dynamic, dynamic> get rCloneJson => throw _privateConstructorUsedError;

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
      {DriveProvider provider,
      String accessToken,
      String refreshToken,
      String expiresIn,
      Map<dynamic, dynamic> rCloneJson});
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
    Object? provider = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? rCloneJson = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
      rCloneJson: null == rCloneJson
          ? _value.rCloneJson
          : rCloneJson // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ) as $Val);
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
      {DriveProvider provider,
      String accessToken,
      String refreshToken,
      String expiresIn,
      Map<dynamic, dynamic> rCloneJson});
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
    Object? provider = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? rCloneJson = null,
  }) {
    return _then(_$DriveProviderModelImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as String,
      rCloneJson: null == rCloneJson
          ? _value._rCloneJson
          : rCloneJson // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriveProviderModelImpl implements _DriveProviderModel {
  const _$DriveProviderModelImpl(
      {required this.provider,
      required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      required final Map<dynamic, dynamic> rCloneJson})
      : _rCloneJson = rCloneJson;

  factory _$DriveProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriveProviderModelImplFromJson(json);

  @override
  final DriveProvider provider;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String expiresIn;
  final Map<dynamic, dynamic> _rCloneJson;
  @override
  Map<dynamic, dynamic> get rCloneJson {
    if (_rCloneJson is EqualUnmodifiableMapView) return _rCloneJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rCloneJson);
  }

  @override
  String toString() {
    return 'DriveProviderModel(provider: $provider, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, rCloneJson: $rCloneJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveProviderModelImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            const DeepCollectionEquality()
                .equals(other._rCloneJson, _rCloneJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      provider,
      accessToken,
      refreshToken,
      expiresIn,
      const DeepCollectionEquality().hash(_rCloneJson));

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
          {required final DriveProvider provider,
          required final String accessToken,
          required final String refreshToken,
          required final String expiresIn,
          required final Map<dynamic, dynamic> rCloneJson}) =
      _$DriveProviderModelImpl;

  factory _DriveProviderModel.fromJson(Map<String, dynamic> json) =
      _$DriveProviderModelImpl.fromJson;

  @override
  DriveProvider get provider;
  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  String get expiresIn;
  @override
  Map<dynamic, dynamic> get rCloneJson;

  /// Create a copy of DriveProviderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriveProviderModelImplCopyWith<_$DriveProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
