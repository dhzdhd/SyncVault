// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriveProviderModelImpl _$$DriveProviderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DriveProviderModelImpl(
      remoteName: json['remoteName'] as String,
      provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'] as String,
      rCloneJson: json['rCloneJson'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$DriveProviderModelImplToJson(
        _$DriveProviderModelImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'rCloneJson': instance.rCloneJson,
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
  DriveProvider.dropBox: 'dropBox',
};
