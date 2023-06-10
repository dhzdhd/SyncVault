// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FolderModel _$$_FolderModelFromJson(Map<String, dynamic> json) =>
    _$_FolderModel(
      email: json['email'] as String,
      provider: $enumDecode(_$AuthProviderTypeEnumMap, json['provider']),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
      folderId: json['folderId'] as String,
      isAutoSync: json['isAutoSync'] as bool,
      isDeletionEnabled: json['isDeletionEnabled'] as bool,
    );

Map<String, dynamic> _$$_FolderModelToJson(_$_FolderModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'provider': _$AuthProviderTypeEnumMap[instance.provider]!,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
      'folderId': instance.folderId,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
    };

const _$AuthProviderTypeEnumMap = {
  AuthProviderType.oneDrive: 'oneDrive',
  AuthProviderType.dropBox: 'googleDrive',
};
