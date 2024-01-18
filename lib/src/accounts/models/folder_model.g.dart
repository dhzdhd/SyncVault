// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderModelImpl _$$FolderModelImplFromJson(Map<String, dynamic> json) =>
    _$FolderModelImpl(
      email: json['email'] as String,
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
      folderId: json['folderId'] as String,
      isAutoSync: json['isAutoSync'] as bool,
      isDeletionEnabled: json['isDeletionEnabled'] as bool,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FolderModelImplToJson(_$FolderModelImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
      'folderId': instance.folderId,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
      'files': instance.files,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.oneDrive: 'oneDrive',
  AuthProviderType.dropBox: 'dropBox',
  AuthProviderType.googleDrive: 'googleDrive',
};
