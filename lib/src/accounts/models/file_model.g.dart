// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      id: Option<String>.fromJson(json['id'], (value) => value as String),
      name: json['name'] as String,
      path: json['path'] as String,
      isDir: json['isDir'] as bool,
      parentPath: json['parentPath'] as String,
      child: Option<String>.fromJson(json['child'], (value) => value as String),
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'id': instance.id.toJson(
        (value) => value,
      ),
      'name': instance.name,
      'path': instance.path,
      'isDir': instance.isDir,
      'parentPath': instance.parentPath,
      'child': instance.child.toJson(
        (value) => value,
      ),
    };
