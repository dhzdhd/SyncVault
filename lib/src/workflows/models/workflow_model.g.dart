// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) =>
    _WorkflowModel(
      name: json['name'] as String,
      workflowJson: json['workflowJson'] as String?,
      nodeType: $enumDecode(_$WorkflowNodeEnumMap, json['nodeType']),
      linkType: $enumDecode(_$WorkflowOperationEnumMap, json['linkType']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$WorkflowModelToJson(_WorkflowModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workflowJson': instance.workflowJson,
      'nodeType': _$WorkflowNodeEnumMap[instance.nodeType]!,
      'linkType': _$WorkflowOperationEnumMap[instance.linkType]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$WorkflowNodeEnumMap = {
  WorkflowNode.remote: 'remote',
  WorkflowNode.local: 'local',
};

const _$WorkflowOperationEnumMap = {
  WorkflowOperation.upload: 'upload',
  WorkflowOperation.download: 'download',
  WorkflowOperation.bisync: 'bisync',
  WorkflowOperation.delete: 'delete',
  WorkflowOperation.move: 'move',
};
