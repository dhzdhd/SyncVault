// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_backend_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OAuth2PayloadImpl _$$OAuth2PayloadImplFromJson(Map<String, dynamic> json) =>
    _$OAuth2PayloadImpl(
      remoteName: json['remoteName'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OAuth2PayloadImplToJson(_$OAuth2PayloadImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'runtimeType': instance.$type,
    };

_$S3PayloadImpl _$$S3PayloadImplFromJson(Map<String, dynamic> json) =>
    _$S3PayloadImpl(
      remoteName: json['remoteName'] as String,
      url: json['url'] as String,
      accessKeyId: json['accessKeyId'] as String,
      secretAccessKey: json['secretAccessKey'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$S3PayloadImplToJson(_$S3PayloadImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'url': instance.url,
      'accessKeyId': instance.accessKeyId,
      'secretAccessKey': instance.secretAccessKey,
      'runtimeType': instance.$type,
    };

_$UserPasswordPayloadImpl _$$UserPasswordPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPasswordPayloadImpl(
      remoteName: json['remoteName'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserPasswordPayloadImplToJson(
        _$UserPasswordPayloadImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'username': instance.username,
      'password': instance.password,
      'runtimeType': instance.$type,
    };

_$WebdavPayloadImpl _$$WebdavPayloadImplFromJson(Map<String, dynamic> json) =>
    _$WebdavPayloadImpl(
      remoteName: json['remoteName'] as String,
      url: json['url'] as String,
      user: json['user'] as String,
      password: json['password'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WebdavPayloadImplToJson(_$WebdavPayloadImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'url': instance.url,
      'user': instance.user,
      'password': instance.password,
      'runtimeType': instance.$type,
    };
