import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/graph/models/workflow_model.dart';

part 'workflow_controller.g.dart';

final _box = GetIt.I<Box<WorkflowModel>>();

@riverpod
class Workflow extends _$Workflow {
  @override
  List<WorkflowModel> build() {
    return init();
  }

  static List<WorkflowModel> init() {
    return _box.values.toList();
  }

  Future<void> create({required WorkflowModel model}) async {
    state = [...state, model];

    await _box.add(model);
  }

  Future<()> clearCache() async {
    state = [];
    await _box.clear();
    await _box.flush();

    return ();
  }
}
