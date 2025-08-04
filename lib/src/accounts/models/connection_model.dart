// dart run build_runner build

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'connection_model.freezed.dart';
part 'connection_model.g.dart';

@freezed
// TODO: Convert nullables to option when adapter is fixed
abstract class ConnectionModel with _$ConnectionModel {
  const factory ConnectionModel({
    required String title,
    required String firstRemote,
    required String secondRemote,
    required bool isAutoSync,
    required bool isDeletionEnabled,
    required bool isTwoWaySync,
    required String? folderId, // TODO: Move to drive provider
  }) = _ConnectionModel;

  factory ConnectionModel.fromJson(Map<String, Object?> json) =>
      _$ConnectionModelFromJson(json);
}
