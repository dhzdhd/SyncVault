// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFolderModel _$RemoteFolderModelFromJson(Map<String, dynamic> json) =>
    RemoteFolderModel(
      remoteName: json['remoteName'] as String,
      folderName: json['folderName'] as String,
      parentPath: json['parentPath'] as String?,
      folderId: json['folderId'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$RemoteFolderModelToJson(RemoteFolderModel instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'folderName': instance.folderName,
      'parentPath': instance.parentPath,
      'folderId': instance.folderId,
      'runtimeType': instance.$type,
    };

LocalFolderModel _$LocalFolderModelFromJson(Map<String, dynamic> json) =>
    LocalFolderModel(
      folderName: json['folderName'] as String,
      folderPath: json['folderPath'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$LocalFolderModelToJson(LocalFolderModel instance) =>
    <String, dynamic>{
      'folderName': instance.folderName,
      'folderPath': instance.folderPath,
      'runtimeType': instance.$type,
    };
