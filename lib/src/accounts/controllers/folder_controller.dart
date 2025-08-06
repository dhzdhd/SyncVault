import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:syncvault/src/accounts/models/folder_model.dart';

part 'folder_controller.g.dart';

@riverpod
class Folder extends _$Folder {
  @override
  Future<List<FolderModel>> build() async {
    // state = AsyncData(_box.values.toList());
    return init();
  }

  static Future<List<FolderModel>> init() async {
    return [];
  }
}
