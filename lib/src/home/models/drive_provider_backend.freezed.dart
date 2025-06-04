// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_backend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DriveProviderBackend _$DriveProviderBackendFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'oauth2':
          return OAuth2.fromJson(
            json
          );
                case 's3':
          return S3.fromJson(
            json
          );
                case 'webdav':
          return Webdav.fromJson(
            json
          );
                case 'userPassword':
          return UserPassword.fromJson(
            json
          );
                case 'local':
          return Local.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DriveProviderBackend',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DriveProviderBackend {



  /// Serializes this DriveProviderBackend to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveProviderBackend);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProviderBackend()';
}


}

/// @nodoc
class $DriveProviderBackendCopyWith<$Res>  {
$DriveProviderBackendCopyWith(DriveProviderBackend _, $Res Function(DriveProviderBackend) __);
}


/// @nodoc
@JsonSerializable()

class OAuth2 implements DriveProviderBackend {
  const OAuth2({required final  Map<String, dynamic> authJson, required this.accessToken, required this.refreshToken, required this.expiresIn, final  String? $type}): _authJson = authJson,$type = $type ?? 'oauth2';
  factory OAuth2.fromJson(Map<String, dynamic> json) => _$OAuth2FromJson(json);

 final  Map<String, dynamic> _authJson;
 Map<String, dynamic> get authJson {
  if (_authJson is EqualUnmodifiableMapView) return _authJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_authJson);
}

 final  String accessToken;
 final  String refreshToken;
 final  String expiresIn;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OAuth2CopyWith<OAuth2> get copyWith => _$OAuth2CopyWithImpl<OAuth2>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OAuth2ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OAuth2&&const DeepCollectionEquality().equals(other._authJson, _authJson)&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_authJson),accessToken,refreshToken,expiresIn);

@override
String toString() {
  return 'DriveProviderBackend.oauth2(authJson: $authJson, accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $OAuth2CopyWith<$Res> implements $DriveProviderBackendCopyWith<$Res> {
  factory $OAuth2CopyWith(OAuth2 value, $Res Function(OAuth2) _then) = _$OAuth2CopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> authJson, String accessToken, String refreshToken, String expiresIn
});




}
/// @nodoc
class _$OAuth2CopyWithImpl<$Res>
    implements $OAuth2CopyWith<$Res> {
  _$OAuth2CopyWithImpl(this._self, this._then);

  final OAuth2 _self;
  final $Res Function(OAuth2) _then;

/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? authJson = null,Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,}) {
  return _then(OAuth2(
authJson: null == authJson ? _self._authJson : authJson // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class S3 implements DriveProviderBackend {
  const S3({required this.url, required this.accessKeyId, required this.secretAccessKey, final  String? $type}): $type = $type ?? 's3';
  factory S3.fromJson(Map<String, dynamic> json) => _$S3FromJson(json);

 final  String url;
 final  String accessKeyId;
 final  String secretAccessKey;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$S3CopyWith<S3> get copyWith => _$S3CopyWithImpl<S3>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$S3ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is S3&&(identical(other.url, url) || other.url == url)&&(identical(other.accessKeyId, accessKeyId) || other.accessKeyId == accessKeyId)&&(identical(other.secretAccessKey, secretAccessKey) || other.secretAccessKey == secretAccessKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,accessKeyId,secretAccessKey);

@override
String toString() {
  return 'DriveProviderBackend.s3(url: $url, accessKeyId: $accessKeyId, secretAccessKey: $secretAccessKey)';
}


}

/// @nodoc
abstract mixin class $S3CopyWith<$Res> implements $DriveProviderBackendCopyWith<$Res> {
  factory $S3CopyWith(S3 value, $Res Function(S3) _then) = _$S3CopyWithImpl;
@useResult
$Res call({
 String url, String accessKeyId, String secretAccessKey
});




}
/// @nodoc
class _$S3CopyWithImpl<$Res>
    implements $S3CopyWith<$Res> {
  _$S3CopyWithImpl(this._self, this._then);

  final S3 _self;
  final $Res Function(S3) _then;

/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,Object? accessKeyId = null,Object? secretAccessKey = null,}) {
  return _then(S3(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,accessKeyId: null == accessKeyId ? _self.accessKeyId : accessKeyId // ignore: cast_nullable_to_non_nullable
as String,secretAccessKey: null == secretAccessKey ? _self.secretAccessKey : secretAccessKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Webdav implements DriveProviderBackend {
  const Webdav({required this.url, required this.user, required this.password, final  String? $type}): $type = $type ?? 'webdav';
  factory Webdav.fromJson(Map<String, dynamic> json) => _$WebdavFromJson(json);

 final  String url;
 final  String user;
 final  String password;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WebdavCopyWith<Webdav> get copyWith => _$WebdavCopyWithImpl<Webdav>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WebdavToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Webdav&&(identical(other.url, url) || other.url == url)&&(identical(other.user, user) || other.user == user)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,user,password);

@override
String toString() {
  return 'DriveProviderBackend.webdav(url: $url, user: $user, password: $password)';
}


}

/// @nodoc
abstract mixin class $WebdavCopyWith<$Res> implements $DriveProviderBackendCopyWith<$Res> {
  factory $WebdavCopyWith(Webdav value, $Res Function(Webdav) _then) = _$WebdavCopyWithImpl;
@useResult
$Res call({
 String url, String user, String password
});




}
/// @nodoc
class _$WebdavCopyWithImpl<$Res>
    implements $WebdavCopyWith<$Res> {
  _$WebdavCopyWithImpl(this._self, this._then);

  final Webdav _self;
  final $Res Function(Webdav) _then;

/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,Object? user = null,Object? password = null,}) {
  return _then(Webdav(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UserPassword implements DriveProviderBackend {
  const UserPassword({required this.username, required this.password, final  String? $type}): $type = $type ?? 'userPassword';
  factory UserPassword.fromJson(Map<String, dynamic> json) => _$UserPasswordFromJson(json);

 final  String username;
 final  String password;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPasswordCopyWith<UserPassword> get copyWith => _$UserPasswordCopyWithImpl<UserPassword>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPasswordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPassword&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,password);

@override
String toString() {
  return 'DriveProviderBackend.userPassword(username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $UserPasswordCopyWith<$Res> implements $DriveProviderBackendCopyWith<$Res> {
  factory $UserPasswordCopyWith(UserPassword value, $Res Function(UserPassword) _then) = _$UserPasswordCopyWithImpl;
@useResult
$Res call({
 String username, String password
});




}
/// @nodoc
class _$UserPasswordCopyWithImpl<$Res>
    implements $UserPasswordCopyWith<$Res> {
  _$UserPasswordCopyWithImpl(this._self, this._then);

  final UserPassword _self;
  final $Res Function(UserPassword) _then;

/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? username = null,Object? password = null,}) {
  return _then(UserPassword(
username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Local implements DriveProviderBackend {
  const Local({required this.folderPath, final  String? $type}): $type = $type ?? 'local';
  factory Local.fromJson(Map<String, dynamic> json) => _$LocalFromJson(json);

 final  String folderPath;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalCopyWith<Local> get copyWith => _$LocalCopyWithImpl<Local>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Local&&(identical(other.folderPath, folderPath) || other.folderPath == folderPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folderPath);

@override
String toString() {
  return 'DriveProviderBackend.local(folderPath: $folderPath)';
}


}

/// @nodoc
abstract mixin class $LocalCopyWith<$Res> implements $DriveProviderBackendCopyWith<$Res> {
  factory $LocalCopyWith(Local value, $Res Function(Local) _then) = _$LocalCopyWithImpl;
@useResult
$Res call({
 String folderPath
});




}
/// @nodoc
class _$LocalCopyWithImpl<$Res>
    implements $LocalCopyWith<$Res> {
  _$LocalCopyWithImpl(this._self, this._then);

  final Local _self;
  final $Res Function(Local) _then;

/// Create a copy of DriveProviderBackend
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? folderPath = null,}) {
  return _then(Local(
folderPath: null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
