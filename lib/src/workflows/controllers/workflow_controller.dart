import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';

part 'workflow_controller.g.dart';

final _box = GetIt.I<Box<WorkflowModel>>();
final _storage = HiveStorage<WorkflowModel>(_box);

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

    await _storage.addSingle(model);
  }

  Future<void> updateJson({required WorkflowModel model}) async {
    state = [
      ...state
        ..removeWhere((oldModel) => oldModel.id == model.id)
        ..add(model),
    ];

    await _storage.update(state);
  }

  Future<()> clearCache() async {
    state = [];
    await _storage.clear();

    return ();
  }
}
