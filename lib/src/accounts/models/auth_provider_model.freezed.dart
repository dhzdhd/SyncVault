// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthProviderModel _$AuthProviderModelFromJson(Map<String, dynamic> json) {
  return _AuthProviderModel.fromJson(json);
}

/// @nodoc
mixin _$AuthProviderModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;
  AuthProviderType get provider => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthProviderModelCopyWith<AuthProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProviderModelCopyWith<$Res> {
  factory $AuthProviderModelCopyWith(
          AuthProviderModel value, $Res Function(AuthProviderModel) then) =
      _$AuthProviderModelCopyWithImpl<$Res, AuthProviderModel>;
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      AuthProviderType provider,
      String name,
      String email,
      String createdAt,
      String folderId});
}

/// @nodoc
class _$AuthProviderModelCopyWithImpl<$Res, $Val extends AuthProviderModel>
    implements $AuthProviderModelCopyWith<$Res> {
  _$AuthProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? provider = null,
    Object? name = null,
    Object? email = null,
    Object? createdAt = null,
    Object? folderId = null,
  }) {
    return _then(_value.copyWith(
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
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProviderType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthProviderModelImplCopyWith<$Res>
    implements $AuthProviderModelCopyWith<$Res> {
  factory _$$AuthProviderModelImplCopyWith(_$AuthProviderModelImpl value,
          $Res Function(_$AuthProviderModelImpl) then) =
      __$$AuthProviderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      AuthProviderType provider,
      String name,
      String email,
      String createdAt,
      String folderId});
}

/// @nodoc
class __$$AuthProviderModelImplCopyWithImpl<$Res>
    extends _$AuthProviderModelCopyWithImpl<$Res, _$AuthProviderModelImpl>
    implements _$$AuthProviderModelImplCopyWith<$Res> {
  __$$AuthProviderModelImplCopyWithImpl(_$AuthProviderModelImpl _value,
      $Res Function(_$AuthProviderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
    Object? provider = null,
    Object? name = null,
    Object? email = null,
    Object? createdAt = null,
    Object? folderId = null,
  }) {
    return _then(_$AuthProviderModelImpl(
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
              as int,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProviderType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthProviderModelImpl
    with DiagnosticableTreeMixin
    implements _AuthProviderModel {
  const _$AuthProviderModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      required this.provider,
      required this.name,
      required this.email,
      required this.createdAt,
      required this.folderId});

  factory _$AuthProviderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthProviderModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final AuthProviderType provider;
  @override
  final String name;
  @override
  final String email;
  @override
  final String createdAt;
  @override
  final String folderId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthProviderModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, provider: $provider, name: $name, email: $email, createdAt: $createdAt, folderId: $folderId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthProviderModel'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('refreshToken', refreshToken))
      ..add(DiagnosticsProperty('expiresIn', expiresIn))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('folderId', folderId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthProviderModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken,
      expiresIn, provider, name, email, createdAt, folderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthProviderModelImplCopyWith<_$AuthProviderModelImpl> get copyWith =>
      __$$AuthProviderModelImplCopyWithImpl<_$AuthProviderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthProviderModelImplToJson(
      this,
    );
  }
}

abstract class _AuthProviderModel implements AuthProviderModel {
  const factory _AuthProviderModel(
      {required final String accessToken,
      required final String refreshToken,
      required final int expiresIn,
      required final AuthProviderType provider,
      required final String name,
      required final String email,
      required final String createdAt,
      required final String folderId}) = _$AuthProviderModelImpl;

  factory _AuthProviderModel.fromJson(Map<String, dynamic> json) =
      _$AuthProviderModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  int get expiresIn;
  @override
  AuthProviderType get provider;
  @override
  String get name;
  @override
  String get email;
  @override
  String get createdAt;
  @override
  String get folderId;
  @override
  @JsonKey(ignore: true)
  _$$AuthProviderModelImplCopyWith<_$AuthProviderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
