// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FolderModel _$FolderModelFromJson(Map<String, dynamic> json) => _FolderModel(
  title: json['title'] as String,
  firstRemote: json['firstRemote'] as String,
  secondRemote: json['secondRemote'] as String,
  isAutoSync: json['isAutoSync'] as bool,
  isDeletionEnabled: json['isDeletionEnabled'] as bool,
  isTwoWaySync: json['isTwoWaySync'] as bool,
  folderId: json['folderId'] as String?,
);

Map<String, dynamic> _$FolderModelToJson(_FolderModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'firstRemote': instance.firstRemote,
      'secondRemote': instance.secondRemote,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
      'isTwoWaySync': instance.isTwoWaySync,
      'folderId': instance.folderId,
    };
