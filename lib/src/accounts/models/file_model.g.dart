// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      id: Option<String>.fromJson(json['id'], (value) => value as String),
      name: json['name'] as String,
      file: const FileSystemEntityConverter().fromJson(json['file'] as String),
      parent: const DirectoryConverter().fromJson(json['parent'] as String),
      childPath: Option<String>.fromJson(
          json['childPath'], (value) => value as String),
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id.toJson(
        (value) => value,
      ),
      'name': instance.name,
      'file': const FileSystemEntityConverter().toJson(instance.file),
      'parent': const DirectoryConverter().toJson(instance.parent),
      'childPath': instance.childPath.toJson(
        (value) => value,
      ),
    };
