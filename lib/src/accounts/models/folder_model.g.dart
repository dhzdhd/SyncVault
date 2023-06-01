// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FolderModel _$$_FolderModelFromJson(Map<String, dynamic> json) =>
    _$_FolderModel(
      model: AuthProviderModel.fromJson(json['model'] as Map<String, dynamic>),
      folderPath: json['folderPath'] as String,
      folderName: json['folderName'] as String,
    );

Map<String, dynamic> _$$_FolderModelToJson(_$_FolderModel instance) =>
    <String, dynamic>{
      'model': instance.model,
      'folderPath': instance.folderPath,
      'folderName': instance.folderName,
    };
