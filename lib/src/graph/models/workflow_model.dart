import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_model.freezed.dart';
part 'workflow_model.g.dart';

@freezed
abstract class WorkflowModel with _$WorkflowModel {
  const factory WorkflowModel({
    required String name,
    required String? workflowJson,
  }) = _WorkflowModel;

  factory WorkflowModel.fromJson(Map<String, Object?> json) =>
      _$WorkflowModelFromJson(json);
}
