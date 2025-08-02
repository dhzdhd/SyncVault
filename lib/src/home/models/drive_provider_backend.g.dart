// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_backend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuth2 _$OAuth2FromJson(Map<String, dynamic> json) => OAuth2(
  authJson: json['authJson'] as Map<String, dynamic>,
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiresIn: json['expiresIn'] as String,
  parentPath: json['parentPath'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$OAuth2ToJson(OAuth2 instance) => <String, dynamic>{
  'authJson': instance.authJson,
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'expiresIn': instance.expiresIn,
  'parentPath': instance.parentPath,
  'runtimeType': instance.$type,
};

S3 _$S3FromJson(Map<String, dynamic> json) => S3(
  url: json['url'] as String,
  accessKeyId: json['accessKeyId'] as String,
  secretAccessKey: json['secretAccessKey'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$S3ToJson(S3 instance) => <String, dynamic>{
  'url': instance.url,
  'accessKeyId': instance.accessKeyId,
  'secretAccessKey': instance.secretAccessKey,
  'runtimeType': instance.$type,
};

Webdav _$WebdavFromJson(Map<String, dynamic> json) => Webdav(
  url: json['url'] as String,
  user: json['user'] as String,
  password: json['password'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$WebdavToJson(Webdav instance) => <String, dynamic>{
  'url': instance.url,
  'user': instance.user,
  'password': instance.password,
  'runtimeType': instance.$type,
};

UserPassword _$UserPasswordFromJson(Map<String, dynamic> json) => UserPassword(
  username: json['username'] as String,
  password: json['password'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$UserPasswordToJson(UserPassword instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'runtimeType': instance.$type,
    };

Local _$LocalFromJson(Map<String, dynamic> json) => Local(
  folderPath: json['folderPath'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$LocalToJson(Local instance) => <String, dynamic>{
  'folderPath': instance.folderPath,
  'runtimeType': instance.$type,
};
