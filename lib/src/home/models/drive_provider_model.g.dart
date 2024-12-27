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
      backend: DriveProviderBackend.fromJson(
          json['backend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DriveProviderModelImplToJson(
        _$DriveProviderModelImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'backend': instance.backend,
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
  DriveProvider.dropBox: 'dropBox',
  DriveProvider.protonDrive: 'protonDrive',
  DriveProvider.minio: 'minio',
  DriveProvider.nextCloud: 'nextCloud',
};
