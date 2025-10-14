// dart run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'connection_model.freezed.dart';
part 'connection_model.g.dart';

enum SyncDirection { upload, download, bidirectional }

@freezed
abstract class ConnectionModel with _$ConnectionModel {
  const factory ConnectionModel({
    required String id,
    required String title,
    required String firstFolderId,
    required String secondFolderId,
    required SyncDirection direction,
    required bool isAutoSync,
    required bool isDeletionEnabled,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ConnectionModel;

  factory ConnectionModel.fromJson(Map<String, Object?> json) =>
      _$ConnectionModelFromJson(json);

  factory ConnectionModel.forWorkflow(
    String firstFolderId,
    String secondFolderId,
    SyncDirection direction,
    bool isDeletionEnabled,
  ) => ConnectionModel(
    id: '',
    title: '',
    firstFolderId: firstFolderId,
    secondFolderId: secondFolderId,
    direction: direction,
    isAutoSync: false,
    isDeletionEnabled: isDeletionEnabled,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}
