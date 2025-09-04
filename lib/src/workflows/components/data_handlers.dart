import 'dart:convert';

import 'package:fl_nodes/fl_nodes.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';
import 'package:syncvault/src/home/models/connection_model.dart';

void registerDataHandlers(FlNodeEditorController controller) {
  controller.project.registerDataHandler<SyncDirection>(
    toJson: (data) => data.toString().split('.').last,
    fromJson: (json) => SyncDirection.values.firstWhere(
      (e) => e.toString().split('.').last == json,
    ),
  );

  controller.project.registerDataHandler<FolderModel>(
    toJson: (data) => jsonEncode((data as FolderModel).toJson()),
    fromJson: (json) => FolderModel.fromJson(jsonDecode(json)),
  );
}
