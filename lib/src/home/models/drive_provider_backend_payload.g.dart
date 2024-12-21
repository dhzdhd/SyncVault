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
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$S3PayloadImplToJson(_$S3PayloadImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
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
