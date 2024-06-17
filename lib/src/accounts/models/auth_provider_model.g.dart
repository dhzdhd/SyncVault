// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthProviderModelImpl _$$AuthProviderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthProviderModelImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      name: json['name'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
      folderId: json['folderId'] as String,
    );

Map<String, dynamic> _$$AuthProviderModelImplToJson(
        _$AuthProviderModelImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'folderId': instance.folderId,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.oneDrive: 'oneDrive',
  AuthProviderType.dropBox: 'dropBox',
  AuthProviderType.googleDrive: 'googleDrive',
};
