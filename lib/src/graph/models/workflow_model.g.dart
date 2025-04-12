// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) =>
    _WorkflowModel(
      name: json['name'] as String,
      workflowJson: json['workflowJson'] as String?,
    );

Map<String, dynamic> _$WorkflowModelToJson(_WorkflowModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workflowJson': instance.workflowJson,
    };
