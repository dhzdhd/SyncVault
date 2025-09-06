import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_model.freezed.dart';
part 'workflow_model.g.dart';

@freezed
abstract class WorkflowModel with _$WorkflowModel {
  const factory WorkflowModel({
    required String id,
    required String name,
    required Map<String, Object>? workflowJson,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkflowModel;

  factory WorkflowModel.fromJson(Map<String, Object?> json) =>
      _$WorkflowModelFromJson(json);
}
