// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderModelImpl _$$FolderModelImplFromJson(Map<String, dynamic> json) =>
    _$FolderModelImpl(
      email: json['email'] as String,
      provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
      folderId: json['folderId'] as String,
      isAutoSync: json['isAutoSync'] as bool,
      isDeletionEnabled: json['isDeletionEnabled'] as bool,
      isTwoWaySync: json['isTwoWaySync'] as bool,
      files: (json['files'] as List<dynamic>)
          .map((e) => CloudFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FolderModelImplToJson(_$FolderModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
      'folderId': instance.folderId,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
      'isTwoWaySync': instance.isTwoWaySync,
      'files': instance.files,
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
  DriveProvider.dropBox: 'dropBox',
  DriveProvider.minio: 'minio',
  DriveProvider.nextCloud: 'nextCloud',
};
