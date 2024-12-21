// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_backend_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DriveProviderBackendPayload _$DriveProviderBackendPayloadFromJson(
    Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'oauth2':
      return OAuth2Payload.fromJson(json);
    case 's3':
      return S3Payload.fromJson(json);
    case 'webdav':
      return WebdavPayload.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'DriveProviderBackendPayload',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DriveProviderBackendPayload {
  String get remoteName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String remoteName) oauth2,
    required TResult Function(String remoteName) s3,
    required TResult Function(
            String remoteName, String url, String user, String password)
        webdav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String remoteName)? oauth2,
    TResult? Function(String remoteName)? s3,
    TResult? Function(
            String remoteName, String url, String user, String password)?
        webdav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String remoteName)? oauth2,
    TResult Function(String remoteName)? s3,
    TResult Function(
            String remoteName, String url, String user, String password)?
        webdav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2Payload value) oauth2,
    required TResult Function(S3Payload value) s3,
    required TResult Function(WebdavPayload value) webdav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2Payload value)? oauth2,
    TResult? Function(S3Payload value)? s3,
    TResult? Function(WebdavPayload value)? webdav,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2Payload value)? oauth2,
    TResult Function(S3Payload value)? s3,
    TResult Function(WebdavPayload value)? webdav,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this DriveProviderBackendPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriveProviderBackendPayloadCopyWith<DriveProviderBackendPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveProviderBackendPayloadCopyWith<$Res> {
  factory $DriveProviderBackendPayloadCopyWith(
          DriveProviderBackendPayload value,
          $Res Function(DriveProviderBackendPayload) then) =
      _$DriveProviderBackendPayloadCopyWithImpl<$Res,
          DriveProviderBackendPayload>;
  @useResult
  $Res call({String remoteName});
}

/// @nodoc
class _$DriveProviderBackendPayloadCopyWithImpl<$Res,
        $Val extends DriveProviderBackendPayload>
    implements $DriveProviderBackendPayloadCopyWith<$Res> {
  _$DriveProviderBackendPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
  }) {
    return _then(_value.copyWith(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OAuth2PayloadImplCopyWith<$Res>
    implements $DriveProviderBackendPayloadCopyWith<$Res> {
  factory _$$OAuth2PayloadImplCopyWith(
          _$OAuth2PayloadImpl value, $Res Function(_$OAuth2PayloadImpl) then) =
      __$$OAuth2PayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remoteName});
}

/// @nodoc
class __$$OAuth2PayloadImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendPayloadCopyWithImpl<$Res, _$OAuth2PayloadImpl>
    implements _$$OAuth2PayloadImplCopyWith<$Res> {
  __$$OAuth2PayloadImplCopyWithImpl(
      _$OAuth2PayloadImpl _value, $Res Function(_$OAuth2PayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
  }) {
    return _then(_$OAuth2PayloadImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OAuth2PayloadImpl implements OAuth2Payload {
  const _$OAuth2PayloadImpl({required this.remoteName, final String? $type})
      : $type = $type ?? 'oauth2';

  factory _$OAuth2PayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$OAuth2PayloadImplFromJson(json);

  @override
  final String remoteName;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackendPayload.oauth2(remoteName: $remoteName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OAuth2PayloadImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OAuth2PayloadImplCopyWith<_$OAuth2PayloadImpl> get copyWith =>
      __$$OAuth2PayloadImplCopyWithImpl<_$OAuth2PayloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String remoteName) oauth2,
    required TResult Function(String remoteName) s3,
    required TResult Function(
            String remoteName, String url, String user, String password)
        webdav,
  }) {
    return oauth2(remoteName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String remoteName)? oauth2,
    TResult? Function(String remoteName)? s3,
    TResult? Function(
            String remoteName, String url, String user, String password)?
        webdav,
  }) {
    return oauth2?.call(remoteName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String remoteName)? oauth2,
    TResult Function(String remoteName)? s3,
    TResult Function(
            String remoteName, String url, String user, String password)?
        webdav,
    required TResult orElse(),
  }) {
    if (oauth2 != null) {
      return oauth2(remoteName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2Payload value) oauth2,
    required TResult Function(S3Payload value) s3,
    required TResult Function(WebdavPayload value) webdav,
  }) {
    return oauth2(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2Payload value)? oauth2,
    TResult? Function(S3Payload value)? s3,
    TResult? Function(WebdavPayload value)? webdav,
  }) {
    return oauth2?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2Payload value)? oauth2,
    TResult Function(S3Payload value)? s3,
    TResult Function(WebdavPayload value)? webdav,
    required TResult orElse(),
  }) {
    if (oauth2 != null) {
      return oauth2(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OAuth2PayloadImplToJson(
      this,
    );
  }
}

abstract class OAuth2Payload implements DriveProviderBackendPayload {
  const factory OAuth2Payload({required final String remoteName}) =
      _$OAuth2PayloadImpl;

  factory OAuth2Payload.fromJson(Map<String, dynamic> json) =
      _$OAuth2PayloadImpl.fromJson;

  @override
  String get remoteName;

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OAuth2PayloadImplCopyWith<_$OAuth2PayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$S3PayloadImplCopyWith<$Res>
    implements $DriveProviderBackendPayloadCopyWith<$Res> {
  factory _$$S3PayloadImplCopyWith(
          _$S3PayloadImpl value, $Res Function(_$S3PayloadImpl) then) =
      __$$S3PayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remoteName});
}

/// @nodoc
class __$$S3PayloadImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendPayloadCopyWithImpl<$Res, _$S3PayloadImpl>
    implements _$$S3PayloadImplCopyWith<$Res> {
  __$$S3PayloadImplCopyWithImpl(
      _$S3PayloadImpl _value, $Res Function(_$S3PayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
  }) {
    return _then(_$S3PayloadImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$S3PayloadImpl implements S3Payload {
  const _$S3PayloadImpl({required this.remoteName, final String? $type})
      : $type = $type ?? 's3';

  factory _$S3PayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$S3PayloadImplFromJson(json);

  @override
  final String remoteName;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DriveProviderBackendPayload.s3(remoteName: $remoteName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$S3PayloadImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$S3PayloadImplCopyWith<_$S3PayloadImpl> get copyWith =>
      __$$S3PayloadImplCopyWithImpl<_$S3PayloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String remoteName) oauth2,
    required TResult Function(String remoteName) s3,
    required TResult Function(
            String remoteName, String url, String user, String password)
        webdav,
  }) {
    return s3(remoteName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String remoteName)? oauth2,
    TResult? Function(String remoteName)? s3,
    TResult? Function(
            String remoteName, String url, String user, String password)?
        webdav,
  }) {
    return s3?.call(remoteName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String remoteName)? oauth2,
    TResult Function(String remoteName)? s3,
    TResult Function(
            String remoteName, String url, String user, String password)?
        webdav,
    required TResult orElse(),
  }) {
    if (s3 != null) {
      return s3(remoteName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2Payload value) oauth2,
    required TResult Function(S3Payload value) s3,
    required TResult Function(WebdavPayload value) webdav,
  }) {
    return s3(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2Payload value)? oauth2,
    TResult? Function(S3Payload value)? s3,
    TResult? Function(WebdavPayload value)? webdav,
  }) {
    return s3?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2Payload value)? oauth2,
    TResult Function(S3Payload value)? s3,
    TResult Function(WebdavPayload value)? webdav,
    required TResult orElse(),
  }) {
    if (s3 != null) {
      return s3(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$S3PayloadImplToJson(
      this,
    );
  }
}

abstract class S3Payload implements DriveProviderBackendPayload {
  const factory S3Payload({required final String remoteName}) = _$S3PayloadImpl;

  factory S3Payload.fromJson(Map<String, dynamic> json) =
      _$S3PayloadImpl.fromJson;

  @override
  String get remoteName;

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$S3PayloadImplCopyWith<_$S3PayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WebdavPayloadImplCopyWith<$Res>
    implements $DriveProviderBackendPayloadCopyWith<$Res> {
  factory _$$WebdavPayloadImplCopyWith(
          _$WebdavPayloadImpl value, $Res Function(_$WebdavPayloadImpl) then) =
      __$$WebdavPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remoteName, String url, String user, String password});
}

/// @nodoc
class __$$WebdavPayloadImplCopyWithImpl<$Res>
    extends _$DriveProviderBackendPayloadCopyWithImpl<$Res, _$WebdavPayloadImpl>
    implements _$$WebdavPayloadImplCopyWith<$Res> {
  __$$WebdavPayloadImplCopyWithImpl(
      _$WebdavPayloadImpl _value, $Res Function(_$WebdavPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? url = null,
    Object? user = null,
    Object? password = null,
  }) {
    return _then(_$WebdavPayloadImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$WebdavPayloadImpl implements WebdavPayload {
  const _$WebdavPayloadImpl(
      {required this.remoteName,
      required this.url,
      required this.user,
      required this.password,
      final String? $type})
      : $type = $type ?? 'webdav';

  factory _$WebdavPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebdavPayloadImplFromJson(json);

  @override
  final String remoteName;
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
    return 'DriveProviderBackendPayload.webdav(remoteName: $remoteName, url: $url, user: $user, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebdavPayloadImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName, url, user, password);

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebdavPayloadImplCopyWith<_$WebdavPayloadImpl> get copyWith =>
      __$$WebdavPayloadImplCopyWithImpl<_$WebdavPayloadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String remoteName) oauth2,
    required TResult Function(String remoteName) s3,
    required TResult Function(
            String remoteName, String url, String user, String password)
        webdav,
  }) {
    return webdav(remoteName, url, user, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String remoteName)? oauth2,
    TResult? Function(String remoteName)? s3,
    TResult? Function(
            String remoteName, String url, String user, String password)?
        webdav,
  }) {
    return webdav?.call(remoteName, url, user, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String remoteName)? oauth2,
    TResult Function(String remoteName)? s3,
    TResult Function(
            String remoteName, String url, String user, String password)?
        webdav,
    required TResult orElse(),
  }) {
    if (webdav != null) {
      return webdav(remoteName, url, user, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OAuth2Payload value) oauth2,
    required TResult Function(S3Payload value) s3,
    required TResult Function(WebdavPayload value) webdav,
  }) {
    return webdav(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OAuth2Payload value)? oauth2,
    TResult? Function(S3Payload value)? s3,
    TResult? Function(WebdavPayload value)? webdav,
  }) {
    return webdav?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OAuth2Payload value)? oauth2,
    TResult Function(S3Payload value)? s3,
    TResult Function(WebdavPayload value)? webdav,
    required TResult orElse(),
  }) {
    if (webdav != null) {
      return webdav(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WebdavPayloadImplToJson(
      this,
    );
  }
}

abstract class WebdavPayload implements DriveProviderBackendPayload {
  const factory WebdavPayload(
      {required final String remoteName,
      required final String url,
      required final String user,
      required final String password}) = _$WebdavPayloadImpl;

  factory WebdavPayload.fromJson(Map<String, dynamic> json) =
      _$WebdavPayloadImpl.fromJson;

  @override
  String get remoteName;
  String get url;
  String get user;
  String get password;

  /// Create a copy of DriveProviderBackendPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebdavPayloadImplCopyWith<_$WebdavPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
