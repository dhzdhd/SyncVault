// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FileModelImpl _$$FileModelImplFromJson(Map<String, dynamic> json) =>
    _$FileModelImpl(
      name: json['name'] as String,
      size: json['size'] as String,
      file: const FileSystemEntityConverter().fromJson(json['file'] as String),
      parent: const DirectoryConverter().fromJson(json['parent'] as String),
      children: (json['children'] as List<dynamic>)
          .map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FileModelImplToJson(_$FileModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'file': const FileSystemEntityConverter().toJson(instance.file),
      'parent': const DirectoryConverter().toJson(instance.parent),
      'children': instance.children,
    };
