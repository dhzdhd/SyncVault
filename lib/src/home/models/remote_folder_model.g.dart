// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteFolderModelImpl _$$RemoteFolderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteFolderModelImpl(
      provider:
          DriveProviderModel.fromJson(json['provider'] as Map<String, dynamic>),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
    );

Map<String, dynamic> _$$RemoteFolderModelImplToJson(
        _$RemoteFolderModelImpl instance) =>
    <String, dynamic>{
      'provider': instance.provider,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
    };
