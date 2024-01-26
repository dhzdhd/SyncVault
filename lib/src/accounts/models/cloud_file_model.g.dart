// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cloud_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CloudFileModelImpl _$$CloudFileModelImplFromJson(Map<String, dynamic> json) =>
    _$CloudFileModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isDirectory: json['isDirectory'] as bool,
      path: const UriConverter().fromJson(json['path'] as String),
      parentId:
          Option<String>.fromJson(json['parentId'], (value) => value as String),
      children: (json['children'] as List<dynamic>)
          .map((e) => CloudFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CloudFileModelImplToJson(
        _$CloudFileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDirectory': instance.isDirectory,
      'path': const UriConverter().toJson(instance.path),
      'parentId': instance.parentId.toJson(
        (value) => value,
      ),
      'children': instance.children,
    };
