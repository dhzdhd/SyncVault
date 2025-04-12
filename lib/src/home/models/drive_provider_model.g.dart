// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriveProviderModel _$DriveProviderModelFromJson(Map<String, dynamic> json) =>
    _DriveProviderModel(
      remoteName: json['remoteName'] as String,
      provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
      backend: DriveProviderBackend.fromJson(
        json['backend'] as Map<String, dynamic>,
      ),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isRCloneBackend: json['isRCloneBackend'] as bool,
    );

Map<String, dynamic> _$DriveProviderModelToJson(_DriveProviderModel instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'backend': instance.backend,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRCloneBackend': instance.isRCloneBackend,
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
  DriveProvider.dropBox: 'dropBox',
  DriveProvider.protonDrive: 'protonDrive',
  DriveProvider.minio: 'minio',
  DriveProvider.nextCloud: 'nextCloud',
};
