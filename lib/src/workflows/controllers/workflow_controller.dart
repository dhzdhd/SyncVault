import 'dart:convert';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/log.dart';
import 'package:syncvault/src/accounts/controllers/auth_controller.dart';
import 'package:syncvault/src/accounts/controllers/folder_controller.dart';
import 'package:syncvault/src/common/services/hive_storage.dart';
import 'package:syncvault/src/common/utils/associations.dart';
import 'package:syncvault/src/home/models/drive_provider_model.dart';
import 'package:syncvault/src/workflows/components/data_handlers.dart';
import 'package:syncvault/src/workflows/components/nodes.dart';
import 'package:syncvault/src/workflows/models/workflow_model.dart';

part 'workflow_controller.g.dart';

final _box = GetIt.I<Box<WorkflowModel>>();
final _storage = HiveStorage<WorkflowModel>(_box);

@riverpod
class WorkflowController extends _$WorkflowController {
  @override
  FutureOr<void> build() {}

  Future<void> run({
    required WorkflowModel workflow,
    required BuildContext ctx,
  }) async {
    final workflowNotifier = ref.read(workflowProvider.notifier);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => workflowNotifier.run(workflow: workflow, ctx: ctx),
    );
  }
}

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

  Future<void> delete({required WorkflowModel workflow}) async {
    state = [...state..removeWhere((item) => item.id == workflow.id)];

    await _storage.update(state);
  }

  Future<void> run({
    required WorkflowModel workflow,
    required BuildContext ctx,
  }) async {
    // Encode and decode necessary to ensure resulting type is Map<String, dynamic>
    try {
      final json = jsonDecode(jsonEncode(workflow.workflowJson));

      final controller = FlNodeEditorController();

      final providers = ref.watch(authProvider).value;
      final folders = ref.watch(folderProvider);
      final Map<String, Option<DriveProviderModel>> providersMap =
          providers == null
          ? {}
          : Map.fromIterables(
              folders.map((folder) => folder.id),
              folders.map((folder) => getProviderFromFolder(providers, folder)),
            );

      registerDataHandlers(controller);
      registerNodes(ctx, controller, folders, providersMap);

      controller.project.load(data: jsonDecode(jsonEncode(json)), context: ctx);

      await controller.runner.executeGraph(context: ctx);
    } catch (err) {
      debugLogger.e(err);
    }
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
