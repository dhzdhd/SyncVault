// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) =>
    _WorkflowModel(
      name: json['name'] as String,
      workflowJson: json['workflowJson'] as String?,
      nodeType: $enumDecode(_$WorkflowNodeTypeEnumMap, json['nodeType']),
      linkType: $enumDecode(_$WorkflowLinkTypeEnumMap, json['linkType']),
    );

Map<String, dynamic> _$WorkflowModelToJson(_WorkflowModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workflowJson': instance.workflowJson,
      'nodeType': _$WorkflowNodeTypeEnumMap[instance.nodeType]!,
      'linkType': _$WorkflowLinkTypeEnumMap[instance.linkType]!,
    };

const _$WorkflowNodeTypeEnumMap = {
  WorkflowNodeType.remote: 'remote',
  WorkflowNodeType.local: 'local',
};

const _$WorkflowLinkTypeEnumMap = {
  WorkflowLinkType.upload: 'upload',
  WorkflowLinkType.download: 'download',
  WorkflowLinkType.bisync: 'bisync',
  WorkflowLinkType.delete: 'delete',
  WorkflowLinkType.move: 'move',
};
