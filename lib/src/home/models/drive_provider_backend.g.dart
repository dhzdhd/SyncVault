// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_backend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OAuth2Impl _$$OAuth2ImplFromJson(Map<String, dynamic> json) => _$OAuth2Impl(
      rCloneJson: Map<String, String>.from(json['rCloneJson'] as Map),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$OAuth2ImplToJson(_$OAuth2Impl instance) =>
    <String, dynamic>{
      'rCloneJson': instance.rCloneJson,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'runtimeType': instance.$type,
    };

_$S3Impl _$$S3ImplFromJson(Map<String, dynamic> json) => _$S3Impl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$S3ImplToJson(_$S3Impl instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$WebdavImpl _$$WebdavImplFromJson(Map<String, dynamic> json) => _$WebdavImpl(
      url: json['url'] as String,
      user: json['user'] as String,
      password: json['password'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$WebdavImplToJson(_$WebdavImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'user': instance.user,
      'password': instance.password,
      'runtimeType': instance.$type,
    };
