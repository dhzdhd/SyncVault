// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderModel _$FolderModelFromJson(Map<String, dynamic> json) => _FolderModel(
  remoteName: json['remoteName'] as String,
  provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
  folderPath: json['folderPath'] as String,
  folderName: json['folderName'] as String,
  remoteParentPath: json['remoteParentPath'] as String?,
  isAutoSync: json['isAutoSync'] as bool,
  isDeletionEnabled: json['isDeletionEnabled'] as bool,
  isTwoWaySync: json['isTwoWaySync'] as bool,
  folderId: json['folderId'] as String?,
  isRCloneBackend: json['isRCloneBackend'] as bool,
);

Map<String, dynamic> _$FolderModelToJson(_FolderModel instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
      'remoteParentPath': instance.remoteParentPath,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
      'isTwoWaySync': instance.isTwoWaySync,
      'folderId': instance.folderId,
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
