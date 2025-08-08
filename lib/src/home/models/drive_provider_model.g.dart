// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteProviderModel _$RemoteProviderModelFromJson(Map<String, dynamic> json) =>
    RemoteProviderModel(
      remoteName: json['remoteName'] as String,
      provider: DriveProvider.fromJson(
        json['provider'] as Map<String, dynamic>,
      ),
      backend: DriveProviderBackend.fromJson(
        json['backend'] as Map<String, dynamic>,
      ),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      isRCloneBackend: json['isRCloneBackend'] as bool,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoteProviderModelToJson(
  RemoteProviderModel instance,
) => <String, dynamic>{
  'remoteName': instance.remoteName,
  'provider': instance.provider,
  'backend': instance.backend,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'isRCloneBackend': instance.isRCloneBackend,
  'runtimeType': instance.$type,
};

LocalProviderModel _$LocalProviderModelFromJson(Map<String, dynamic> json) =>
    LocalProviderModel($type: json['runtimeType'] as String?);

Map<String, dynamic> _$LocalProviderModelToJson(LocalProviderModel instance) =>
    <String, dynamic>{'runtimeType': instance.$type};
