import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder_model.freezed.dart';
part 'folder_model.g.dart';

@freezed
// TODO: Convert nullables to option when adapter is fixed
abstract class FolderModel with _$FolderModel {
  const factory FolderModel({
    required String remoteName,
    required String folderName,
    required String? parentPath,
    required String? folderId,
  }) = _FolderModel;

  factory FolderModel.fromJson(Map<String, Object?> json) =>
      _$FolderModelFromJson(json);
}
