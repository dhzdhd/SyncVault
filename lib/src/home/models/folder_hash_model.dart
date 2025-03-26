import 'dart:convert';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hashlib/hashlib.dart';

part 'folder_hash_model.freezed.dart';
part 'folder_hash_model.g.dart';

@freezed
class FolderHashModel with _$FolderHashModel {
  const factory FolderHashModel({
    required String remoteName,
    @HashDigestConverter() required HashDigest hash,
  }) = _FolderHashModel;

  factory FolderHashModel.fromJson(Map<String, Object?> json) =>
      _$FolderHashModelFromJson(json);
}

class HashDigestConverter implements JsonConverter<HashDigest, String> {
  const HashDigestConverter();

  @override
  HashDigest fromJson(String str) {
    final Uint8List bytes = jsonDecode(str);
    return HashDigest(bytes);
  }

  @override
  String toJson(HashDigest digest) {
    return jsonEncode(digest.bytes);
  }
}
