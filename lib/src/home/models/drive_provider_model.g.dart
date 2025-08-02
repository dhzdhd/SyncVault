// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriveProviderModel _$DriveProviderModelFromJson(Map<String, dynamic> json) =>
    _DriveProviderModel(
      remoteName: json['remoteName'] as String,
      folderName: json['folderName'] as String,
      provider: DriveProvider.fromJson(
        json['provider'] as Map<String, dynamic>,
      ),
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
      'folderName': instance.folderName,
      'provider': instance.provider,
      'backend': instance.backend,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isRCloneBackend': instance.isRCloneBackend,
    };
