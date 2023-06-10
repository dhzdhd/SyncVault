// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthProviderModel _$$_AuthProviderModelFromJson(Map<String, dynamic> json) =>
    _$_AuthProviderModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as int,
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
      remainingStorage: json['remainingStorage'] as int,
      usedStorage: json['usedStorage'] as int,
      folderId: json['folderId'] as String,
    );

Map<String, dynamic> _$$_AuthProviderModelToJson(
        _$_AuthProviderModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'remainingStorage': instance.remainingStorage,
      'usedStorage': instance.usedStorage,
      'folderId': instance.folderId,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.oneDrive: 'oneDrive',
  AuthProviderType.dropBox: 'googleDrive',
};
