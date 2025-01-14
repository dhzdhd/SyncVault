// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderModelImpl _$$FolderModelImplFromJson(Map<String, dynamic> json) =>
    _$FolderModelImpl(
      remoteName: json['remoteName'] as String,
      provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
      remoteParentPath: json['remoteParentPath'] as String,
      isAutoSync: json['isAutoSync'] as bool,
      isDeletionEnabled: json['isDeletionEnabled'] as bool,
      isTwoWaySync: json['isTwoWaySync'] as bool,
      folderId:
          Option<String>.fromJson(json['folderId'], (value) => value as String),
    );

Map<String, dynamic> _$$FolderModelImplToJson(_$FolderModelImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'provider': _$DriveProviderEnumMap[instance.provider]!,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
      'remoteParentPath': instance.remoteParentPath,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
      'isTwoWaySync': instance.isTwoWaySync,
      'folderId': instance.folderId.toJson(
        (value) => value,
      ),
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
  DriveProvider.dropBox: 'dropBox',
  DriveProvider.protonDrive: 'protonDrive',
  DriveProvider.minio: 'minio',
  DriveProvider.nextCloud: 'nextCloud',
};
