// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_backend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriveProviderBackend _$DriveProviderBackendFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'oauth2':
      return OAuth2.fromJson(json);
    case 's3':
      return S3.fromJson(json);
    case 'webdav':
      return Webdav.fromJson(json);
    case 'userPassword':
      return UserPassword.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'DriveProviderBackend',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DriveProviderBackend {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> rCloneJson,
            String accessToken, String refreshToken, String expiresIn)
        oauth2,
    required TResult Function(
            String url, String accessKeyId, String secretAccessKey)
        s3,
    required TResult Function(String url, String user, String password) webdav,
    required TResult Function(String username, String password) userPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult? Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult? Function(String url, String user, String password)? webdav,
    TResult? Function(String username, String password)? userPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult Function(String url, String user, String password)? webdav,
    TResult Function(String username, String password)? userPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2 value) oauth2,
    required TResult Function(S3 value) s3,
    required TResult Function(Webdav value) webdav,
    required TResult Function(UserPassword value) userPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2 value)? oauth2,
    TResult? Function(S3 value)? s3,
    TResult? Function(Webdav value)? webdav,
    TResult? Function(UserPassword value)? userPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2 value)? oauth2,
    TResult Function(S3 value)? s3,
    TResult Function(Webdav value)? webdav,
    TResult Function(UserPassword value)? userPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DriveProviderBackend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveProviderBackendCopyWith<$Res> {
  factory $DriveProviderBackendCopyWith(DriveProviderBackend value,
          $Res Function(DriveProviderBackend) then) =
      _$DriveProviderBackendCopyWithImpl<$Res, DriveProviderBackend>;
}

/// @nodoc
class _$DriveProviderBackendCopyWithImpl<$Res,
        $Val extends DriveProviderBackend>
    implements $DriveProviderBackendCopyWith<$Res> {
  _$DriveProviderBackendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OAuth2ImplCopyWith<$Res> {
  factory _$$OAuth2ImplCopyWith(
          _$OAuth2Impl value, $Res Function(_$OAuth2Impl) then) =
      __$$OAuth2ImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Map<String, dynamic> rCloneJson,
      String accessToken,
      String refreshToken,
      String expiresIn});
}

/// @nodoc
class __$$OAuth2ImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendCopyWithImpl<$Res, _$OAuth2Impl>
    implements _$$OAuth2ImplCopyWith<$Res> {
  __$$OAuth2ImplCopyWithImpl(
      _$OAuth2Impl _value, $Res Function(_$OAuth2Impl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rCloneJson = null,
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? expiresIn = null,
  }) {
    return _then(_$OAuth2Impl(
      rCloneJson: null == rCloneJson
          ? _value._rCloneJson
          : rCloneJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuth2Impl implements OAuth2 {
  const _$OAuth2Impl(
      {required final Map<String, dynamic> rCloneJson,
      required this.accessToken,
      required this.refreshToken,
      required this.expiresIn,
      final String? $type})
      : _rCloneJson = rCloneJson,
        $type = $type ?? 'oauth2';

  factory _$OAuth2Impl.fromJson(Map<String, dynamic> json) =>
      _$$OAuth2ImplFromJson(json);

  final Map<String, dynamic> _rCloneJson;
  @override
  Map<String, dynamic> get rCloneJson {
    if (_rCloneJson is EqualUnmodifiableMapView) return _rCloneJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_rCloneJson);
  }

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String expiresIn;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackend.oauth2(rCloneJson: $rCloneJson, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuth2Impl &&
            const DeepCollectionEquality()
                .equals(other._rCloneJson, _rCloneJson) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_rCloneJson),
      accessToken,
      refreshToken,
      expiresIn);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuth2ImplCopyWith<_$OAuth2Impl> get copyWith =>
      __$$OAuth2ImplCopyWithImpl<_$OAuth2Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> rCloneJson,
            String accessToken, String refreshToken, String expiresIn)
        oauth2,
    required TResult Function(
            String url, String accessKeyId, String secretAccessKey)
        s3,
    required TResult Function(String url, String user, String password) webdav,
    required TResult Function(String username, String password) userPassword,
  }) {
    return oauth2(rCloneJson, accessToken, refreshToken, expiresIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult? Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult? Function(String url, String user, String password)? webdav,
    TResult? Function(String username, String password)? userPassword,
  }) {
    return oauth2?.call(rCloneJson, accessToken, refreshToken, expiresIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult Function(String url, String user, String password)? webdav,
    TResult Function(String username, String password)? userPassword,
    required TResult orElse(),
  }) {
    if (oauth2 != null) {
      return oauth2(rCloneJson, accessToken, refreshToken, expiresIn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2 value) oauth2,
    required TResult Function(S3 value) s3,
    required TResult Function(Webdav value) webdav,
    required TResult Function(UserPassword value) userPassword,
  }) {
    return oauth2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2 value)? oauth2,
    TResult? Function(S3 value)? s3,
    TResult? Function(Webdav value)? webdav,
    TResult? Function(UserPassword value)? userPassword,
  }) {
    return oauth2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2 value)? oauth2,
    TResult Function(S3 value)? s3,
    TResult Function(Webdav value)? webdav,
    TResult Function(UserPassword value)? userPassword,
    required TResult orElse(),
  }) {
    if (oauth2 != null) {
      return oauth2(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuth2ImplToJson(
      this,
    );
  }
}

abstract class OAuth2 implements DriveProviderBackend {
  const factory OAuth2(
      {required final Map<String, dynamic> rCloneJson,
      required final String accessToken,
      required final String refreshToken,
      required final String expiresIn}) = _$OAuth2Impl;

  factory OAuth2.fromJson(Map<String, dynamic> json) = _$OAuth2Impl.fromJson;

  Map<String, dynamic> get rCloneJson;
  String get accessToken;
  String get refreshToken;
  String get expiresIn;

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OAuth2ImplCopyWith<_$OAuth2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$S3ImplCopyWith<$Res> {
  factory _$$S3ImplCopyWith(_$S3Impl value, $Res Function(_$S3Impl) then) =
      __$$S3ImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, String accessKeyId, String secretAccessKey});
}

/// @nodoc
class __$$S3ImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendCopyWithImpl<$Res, _$S3Impl>
    implements _$$S3ImplCopyWith<$Res> {
  __$$S3ImplCopyWithImpl(_$S3Impl _value, $Res Function(_$S3Impl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? accessKeyId = null,
    Object? secretAccessKey = null,
  }) {
    return _then(_$S3Impl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      accessKeyId: null == accessKeyId
          ? _value.accessKeyId
          : accessKeyId // ignore: cast_nullable_to_non_nullable
              as String,
      secretAccessKey: null == secretAccessKey
          ? _value.secretAccessKey
          : secretAccessKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$S3Impl implements S3 {
  const _$S3Impl(
      {required this.url,
      required this.accessKeyId,
      required this.secretAccessKey,
      final String? $type})
      : $type = $type ?? 's3';

  factory _$S3Impl.fromJson(Map<String, dynamic> json) =>
      _$$S3ImplFromJson(json);

  @override
  final String url;
  @override
  final String accessKeyId;
  @override
  final String secretAccessKey;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackend.s3(url: $url, accessKeyId: $accessKeyId, secretAccessKey: $secretAccessKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$S3Impl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.accessKeyId, accessKeyId) ||
                other.accessKeyId == accessKeyId) &&
            (identical(other.secretAccessKey, secretAccessKey) ||
                other.secretAccessKey == secretAccessKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, accessKeyId, secretAccessKey);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$S3ImplCopyWith<_$S3Impl> get copyWith =>
      __$$S3ImplCopyWithImpl<_$S3Impl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> rCloneJson,
            String accessToken, String refreshToken, String expiresIn)
        oauth2,
    required TResult Function(
            String url, String accessKeyId, String secretAccessKey)
        s3,
    required TResult Function(String url, String user, String password) webdav,
    required TResult Function(String username, String password) userPassword,
  }) {
    return s3(url, accessKeyId, secretAccessKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult? Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult? Function(String url, String user, String password)? webdav,
    TResult? Function(String username, String password)? userPassword,
  }) {
    return s3?.call(url, accessKeyId, secretAccessKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult Function(String url, String user, String password)? webdav,
    TResult Function(String username, String password)? userPassword,
    required TResult orElse(),
  }) {
    if (s3 != null) {
      return s3(url, accessKeyId, secretAccessKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2 value) oauth2,
    required TResult Function(S3 value) s3,
    required TResult Function(Webdav value) webdav,
    required TResult Function(UserPassword value) userPassword,
  }) {
    return s3(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2 value)? oauth2,
    TResult? Function(S3 value)? s3,
    TResult? Function(Webdav value)? webdav,
    TResult? Function(UserPassword value)? userPassword,
  }) {
    return s3?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2 value)? oauth2,
    TResult Function(S3 value)? s3,
    TResult Function(Webdav value)? webdav,
    TResult Function(UserPassword value)? userPassword,
    required TResult orElse(),
  }) {
    if (s3 != null) {
      return s3(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$S3ImplToJson(
      this,
    );
  }
}

abstract class S3 implements DriveProviderBackend {
  const factory S3(
      {required final String url,
      required final String accessKeyId,
      required final String secretAccessKey}) = _$S3Impl;

  factory S3.fromJson(Map<String, dynamic> json) = _$S3Impl.fromJson;

  String get url;
  String get accessKeyId;
  String get secretAccessKey;

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$S3ImplCopyWith<_$S3Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WebdavImplCopyWith<$Res> {
  factory _$$WebdavImplCopyWith(
          _$WebdavImpl value, $Res Function(_$WebdavImpl) then) =
      __$$WebdavImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, String user, String password});
}

/// @nodoc
class __$$WebdavImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendCopyWithImpl<$Res, _$WebdavImpl>
    implements _$$WebdavImplCopyWith<$Res> {
  __$$WebdavImplCopyWithImpl(
      _$WebdavImpl _value, $Res Function(_$WebdavImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? user = null,
    Object? password = null,
  }) {
    return _then(_$WebdavImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebdavImpl implements Webdav {
  const _$WebdavImpl(
      {required this.url,
      required this.user,
      required this.password,
      final String? $type})
      : $type = $type ?? 'webdav';

  factory _$WebdavImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebdavImplFromJson(json);

  @override
  final String url;
  @override
  final String user;
  @override
  final String password;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackend.webdav(url: $url, user: $user, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebdavImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, user, password);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebdavImplCopyWith<_$WebdavImpl> get copyWith =>
      __$$WebdavImplCopyWithImpl<_$WebdavImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> rCloneJson,
            String accessToken, String refreshToken, String expiresIn)
        oauth2,
    required TResult Function(
            String url, String accessKeyId, String secretAccessKey)
        s3,
    required TResult Function(String url, String user, String password) webdav,
    required TResult Function(String username, String password) userPassword,
  }) {
    return webdav(url, user, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult? Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult? Function(String url, String user, String password)? webdav,
    TResult? Function(String username, String password)? userPassword,
  }) {
    return webdav?.call(url, user, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult Function(String url, String user, String password)? webdav,
    TResult Function(String username, String password)? userPassword,
    required TResult orElse(),
  }) {
    if (webdav != null) {
      return webdav(url, user, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2 value) oauth2,
    required TResult Function(S3 value) s3,
    required TResult Function(Webdav value) webdav,
    required TResult Function(UserPassword value) userPassword,
  }) {
    return webdav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2 value)? oauth2,
    TResult? Function(S3 value)? s3,
    TResult? Function(Webdav value)? webdav,
    TResult? Function(UserPassword value)? userPassword,
  }) {
    return webdav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2 value)? oauth2,
    TResult Function(S3 value)? s3,
    TResult Function(Webdav value)? webdav,
    TResult Function(UserPassword value)? userPassword,
    required TResult orElse(),
  }) {
    if (webdav != null) {
      return webdav(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WebdavImplToJson(
      this,
    );
  }
}

abstract class Webdav implements DriveProviderBackend {
  const factory Webdav(
      {required final String url,
      required final String user,
      required final String password}) = _$WebdavImpl;

  factory Webdav.fromJson(Map<String, dynamic> json) = _$WebdavImpl.fromJson;

  String get url;
  String get user;
  String get password;

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebdavImplCopyWith<_$WebdavImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserPasswordImplCopyWith<$Res> {
  factory _$$UserPasswordImplCopyWith(
          _$UserPasswordImpl value, $Res Function(_$UserPasswordImpl) then) =
      __$$UserPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$UserPasswordImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendCopyWithImpl<$Res, _$UserPasswordImpl>
    implements _$$UserPasswordImplCopyWith<$Res> {
  __$$UserPasswordImplCopyWithImpl(
      _$UserPasswordImpl _value, $Res Function(_$UserPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$UserPasswordImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPasswordImpl implements UserPassword {
  const _$UserPasswordImpl(
      {required this.username, required this.password, final String? $type})
      : $type = $type ?? 'userPassword';

  factory _$UserPasswordImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPasswordImplFromJson(json);

  @override
  final String username;
  @override
  final String password;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackend.userPassword(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPasswordImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPasswordImplCopyWith<_$UserPasswordImpl> get copyWith =>
      __$$UserPasswordImplCopyWithImpl<_$UserPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> rCloneJson,
            String accessToken, String refreshToken, String expiresIn)
        oauth2,
    required TResult Function(
            String url, String accessKeyId, String secretAccessKey)
        s3,
    required TResult Function(String url, String user, String password) webdav,
    required TResult Function(String username, String password) userPassword,
  }) {
    return userPassword(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult? Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult? Function(String url, String user, String password)? webdav,
    TResult? Function(String username, String password)? userPassword,
  }) {
    return userPassword?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> rCloneJson, String accessToken,
            String refreshToken, String expiresIn)?
        oauth2,
    TResult Function(String url, String accessKeyId, String secretAccessKey)?
        s3,
    TResult Function(String url, String user, String password)? webdav,
    TResult Function(String username, String password)? userPassword,
    required TResult orElse(),
  }) {
    if (userPassword != null) {
      return userPassword(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2 value) oauth2,
    required TResult Function(S3 value) s3,
    required TResult Function(Webdav value) webdav,
    required TResult Function(UserPassword value) userPassword,
  }) {
    return userPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2 value)? oauth2,
    TResult? Function(S3 value)? s3,
    TResult? Function(Webdav value)? webdav,
    TResult? Function(UserPassword value)? userPassword,
  }) {
    return userPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2 value)? oauth2,
    TResult Function(S3 value)? s3,
    TResult Function(Webdav value)? webdav,
    TResult Function(UserPassword value)? userPassword,
    required TResult orElse(),
  }) {
    if (userPassword != null) {
      return userPassword(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPasswordImplToJson(
      this,
    );
  }
}

abstract class UserPassword implements DriveProviderBackend {
  const factory UserPassword(
      {required final String username,
      required final String password}) = _$UserPasswordImpl;

  factory UserPassword.fromJson(Map<String, dynamic> json) =
      _$UserPasswordImpl.fromJson;

  String get username;
  String get password;

  /// Create a copy of DriveProviderBackend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPasswordImplCopyWith<_$UserPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
