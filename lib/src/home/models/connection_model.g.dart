// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) =>
    _ConnectionModel(
      id: json['id'] as String,
      title: json['title'] as String,
      firstFolderId: json['firstFolderId'] as String,
      secondFolderId: json['secondFolderId'] as String,
      direction: $enumDecode(_$SyncDirectionEnumMap, json['direction']),
      isAutoSync: json['isAutoSync'] as bool,
      isDeletionEnabled: json['isDeletionEnabled'] as bool,
    );

Map<String, dynamic> _$ConnectionModelToJson(_ConnectionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstFolderId': instance.firstFolderId,
      'secondFolderId': instance.secondFolderId,
      'direction': _$SyncDirectionEnumMap[instance.direction]!,
      'isAutoSync': instance.isAutoSync,
      'isDeletionEnabled': instance.isDeletionEnabled,
    };

const _$SyncDirectionEnumMap = {
  SyncDirection.upload: 'upload',
  SyncDirection.download: 'download',
  SyncDirection.bidirectional: 'bidirectional',
};
