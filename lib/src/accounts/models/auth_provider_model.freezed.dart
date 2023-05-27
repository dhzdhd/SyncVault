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
  AuthProvider get provider => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

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
      AuthProvider provider,
      String name,
      String email});
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
              as AuthProvider,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthProviderModelCopyWith<$Res>
    implements $AuthProviderModelCopyWith<$Res> {
  factory _$$_AuthProviderModelCopyWith(_$_AuthProviderModel value,
          $Res Function(_$_AuthProviderModel) then) =
      __$$_AuthProviderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accessToken,
      String refreshToken,
      int expiresIn,
      AuthProvider provider,
      String name,
      String email});
}

/// @nodoc
class __$$_AuthProviderModelCopyWithImpl<$Res>
    extends _$AuthProviderModelCopyWithImpl<$Res, _$_AuthProviderModel>
    implements _$$_AuthProviderModelCopyWith<$Res> {
  __$$_AuthProviderModelCopyWithImpl(
      _$_AuthProviderModel _value, $Res Function(_$_AuthProviderModel) _then)
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
  }) {
    return _then(_$_AuthProviderModel(
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
              as AuthProvider,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthProviderModel
    with DiagnosticableTreeMixin
    implements _AuthProviderModel {
  const _$_AuthProviderModel(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      required this.provider,
      required this.name,
      required this.email});

  factory _$_AuthProviderModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthProviderModelFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final AuthProvider provider;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthProviderModel(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, provider: $provider, name: $name, email: $email)';
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
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthProviderModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, accessToken, refreshToken, expiresIn, provider, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthProviderModelCopyWith<_$_AuthProviderModel> get copyWith =>
      __$$_AuthProviderModelCopyWithImpl<_$_AuthProviderModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthProviderModelToJson(
      this,
    );
  }
}

abstract class _AuthProviderModel implements AuthProviderModel {
  const factory _AuthProviderModel(
      {required final String accessToken,
      required final String refreshToken,
      required final int expiresIn,
      required final AuthProvider provider,
      required final String name,
      required final String email}) = _$_AuthProviderModel;

  factory _AuthProviderModel.fromJson(Map<String, dynamic> json) =
      _$_AuthProviderModel.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  int get expiresIn;
  @override
  AuthProvider get provider;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_AuthProviderModelCopyWith<_$_AuthProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
