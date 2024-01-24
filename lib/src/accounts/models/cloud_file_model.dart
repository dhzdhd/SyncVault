// dart run build_runner build

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_file_model.freezed.dart';
part 'cloud_file_model.g.dart';

@freezed
class CloudFileModel with _$CloudFileModel {
  const factory CloudFileModel({
    required String id,
    required String name,
    required bool isDirectory,
  }) = _CloudFileModel;

  factory CloudFileModel.fromJson(Map<String, Object?> json) =>
      _$CloudFileModelFromJson(json);
}
