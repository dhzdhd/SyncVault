// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) =>
    _WorkflowModel(
      id: json['id'] as String,
      name: json['name'] as String,
      workflowJson: (json['workflowJson'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as Object),
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WorkflowModelToJson(_WorkflowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'workflowJson': instance.workflowJson,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
