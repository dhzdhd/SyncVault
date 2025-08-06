// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderModel _$FolderModelFromJson(Map<String, dynamic> json) => _FolderModel(
  remoteName: json['remoteName'] as String,
  folderName: json['folderName'] as String,
  parentPath: json['parentPath'] as String?,
  folderId: json['folderId'] as String?,
);

Map<String, dynamic> _$FolderModelToJson(_FolderModel instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'folderName': instance.folderName,
      'parentPath': instance.parentPath,
      'folderId': instance.folderId,
    };
