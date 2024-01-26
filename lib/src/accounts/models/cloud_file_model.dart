// dart run build_runner build

import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_file_model.freezed.dart';
part 'cloud_file_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class CloudFileModel with _$CloudFileModel {
  const factory CloudFileModel({
    required String id,
    required String name,
    required bool isDirectory,
    // Relative to root folder defined in FolderModel
    @UriConverter() required Uri path,
    required Option<String> parentId,
    required List<CloudFileModel> children,
  }) = _CloudFileModel;

  factory CloudFileModel.fromJson(Map<String, Object?> json) =>
      _$CloudFileModelFromJson(json);
}

class UriConverter implements JsonConverter<Uri, String> {
  const UriConverter();

  @override
  Uri fromJson(String path) {
    return Uri.file(path);
  }

  @override
  String toJson(Uri uri) {
    return uri.toFilePath();
  }
}
