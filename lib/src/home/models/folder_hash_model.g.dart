// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_hash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolderHashModelImpl _$$FolderHashModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FolderHashModelImpl(
      remoteName: json['remoteName'] as String,
      hash: const HashDigestConverter().fromJson(json['hash'] as String),
    );

Map<String, dynamic> _$$FolderHashModelImplToJson(
        _$FolderHashModelImpl instance) =>
    <String, dynamic>{
      'remoteName': instance.remoteName,
      'hash': const HashDigestConverter().toJson(instance.hash),
    };
