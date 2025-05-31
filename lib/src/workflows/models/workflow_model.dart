import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syncvault/src/workflows/models/workflow_type.dart';

part 'workflow_model.freezed.dart';
part 'workflow_model.g.dart';

@freezed
abstract class WorkflowModel with _$WorkflowModel {
  const factory WorkflowModel({
    required String name,
    required String? workflowJson,
    required WorkflowNodeType nodeType,
    required WorkflowLinkType linkType,
  }) = _WorkflowModel;

  factory WorkflowModel.fromJson(Map<String, Object?> json) =>
      _$WorkflowModelFromJson(json);
}
