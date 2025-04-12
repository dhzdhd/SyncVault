// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_hash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderHashModel _$FolderHashModelFromJson(Map<String, dynamic> json) =>
    _FolderHashModel(
      remoteName: json['remoteName'] as String,
      hash: const HashDigestConverter().fromJson(json['hash'] as String),
    );

Map<String, dynamic> _$FolderHashModelToJson(_FolderHashModel instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'hash': const HashDigestConverter().toJson(instance.hash),
    };
