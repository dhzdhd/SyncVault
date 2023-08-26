// dart run build_runner build

import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileModel with _$FileModel {
  const factory FileModel({
    required Option<String> id,
    required String name,
    required String path,
    required bool isDir,
    required String parentPath,
    required Option<String> child,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, Object?> json) =>
      _$FileModelFromJson(json);
}
