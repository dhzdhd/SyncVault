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
    );

Map<String, dynamic> _$$CloudFileModelImplToJson(
        _$CloudFileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isDirectory': instance.isDirectory,
    };
