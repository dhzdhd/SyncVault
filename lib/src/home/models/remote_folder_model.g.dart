// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_folder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteFolderModelImpl _$$RemoteFolderModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemoteFolderModelImpl(
      provider: $enumDecode(_$DriveProviderEnumMap, json['provider']),
    );

Map<String, dynamic> _$$RemoteFolderModelImplToJson(
        _$RemoteFolderModelImpl instance) =>
    <String, dynamic>{
      'provider': _$DriveProviderEnumMap[instance.provider]!,
    };

const _$DriveProviderEnumMap = {
  DriveProvider.oneDrive: 'oneDrive',
  DriveProvider.googleDrive: 'googleDrive',
};
