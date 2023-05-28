// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DriveModel _$$_DriveModelFromJson(Map<String, dynamic> json) =>
    _$_DriveModel(
      models: (json['models'] as List<dynamic>)
          .map((e) => AuthProviderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      localPath: json['localPath'] as String,
    );

Map<String, dynamic> _$$_DriveModelToJson(_$_DriveModel instance) =>
    <String, dynamic>{
      'models': instance.models,
      'localPath': instance.localPath,
    };
