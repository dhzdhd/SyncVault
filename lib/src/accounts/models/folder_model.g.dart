// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FolderModel _$$_FolderModelFromJson(Map<String, dynamic> json) =>
    _$_FolderModel(
      models: (json['models'] as List<dynamic>)
          .map((e) => AuthProviderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      localPath: json['localPath'] as String,
    );

Map<String, dynamic> _$$_FolderModelToJson(_$_FolderModel instance) =>
    <String, dynamic>{
      'models': instance.models,
      'localPath': instance.localPath,
    };
