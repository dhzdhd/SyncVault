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
    @FileSystemEntityConverter() required FileSystemEntity file,
    @DirectoryConverter() required Directory parent,
    required Option<String> childPath,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, Object?> json) =>
      _$FileModelFromJson(json);
}

class DirectoryConverter implements JsonConverter<Directory, String> {
  const DirectoryConverter();

  @override
  Directory fromJson(String path) {
    return Directory(path);
  }

  @override
  String toJson(Directory dir) {
    return dir.path.toString();
  }
}

class FileSystemEntityConverter
    implements JsonConverter<FileSystemEntity, String> {
  const FileSystemEntityConverter();

  @override
  FileSystemEntity fromJson(String path) {
    return File(path);
  }

  @override
  String toJson(FileSystemEntity entity) {
    return entity.path.toString();
  }
}
