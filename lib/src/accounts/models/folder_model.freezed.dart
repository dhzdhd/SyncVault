// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FolderModel implements DiagnosticableTreeMixin {

 String get remoteName; DriveProvider get provider; String get folderPath; String get folderName; String? get remoteParentPath; bool get isAutoSync; bool get isDeletionEnabled; bool get isTwoWaySync; String? get folderId; bool get isRCloneBackend;
/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderModelCopyWith<FolderModel> get copyWith => _$FolderModelCopyWithImpl<FolderModel>(this as FolderModel, _$identity);

  /// Serializes this FolderModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FolderModel'))
    ..add(DiagnosticsProperty('remoteName', remoteName))..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('folderPath', folderPath))..add(DiagnosticsProperty('folderName', folderName))..add(DiagnosticsProperty('remoteParentPath', remoteParentPath))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync))..add(DiagnosticsProperty('folderId', folderId))..add(DiagnosticsProperty('isRCloneBackend', isRCloneBackend));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.folderPath, folderPath) || other.folderPath == folderPath)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.remoteParentPath, remoteParentPath) || other.remoteParentPath == remoteParentPath)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.isRCloneBackend, isRCloneBackend) || other.isRCloneBackend == isRCloneBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,provider,folderPath,folderName,remoteParentPath,isAutoSync,isDeletionEnabled,isTwoWaySync,folderId,isRCloneBackend);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FolderModel(remoteName: $remoteName, provider: $provider, folderPath: $folderPath, folderName: $folderName, remoteParentPath: $remoteParentPath, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync, folderId: $folderId, isRCloneBackend: $isRCloneBackend)';
}


}

/// @nodoc
abstract mixin class $FolderModelCopyWith<$Res>  {
  factory $FolderModelCopyWith(FolderModel value, $Res Function(FolderModel) _then) = _$FolderModelCopyWithImpl;
@useResult
$Res call({
 String remoteName, DriveProvider provider, String folderPath, String folderName, String? remoteParentPath, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync, String? folderId, bool isRCloneBackend
});


$DriveProviderCopyWith<$Res> get provider;

}
/// @nodoc
class _$FolderModelCopyWithImpl<$Res>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._self, this._then);

  final FolderModel _self;
  final $Res Function(FolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteName = null,Object? provider = null,Object? folderPath = null,Object? folderName = null,Object? remoteParentPath = freezed,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,Object? folderId = freezed,Object? isRCloneBackend = null,}) {
  return _then(_self.copyWith(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,folderPath: null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,remoteParentPath: freezed == remoteParentPath ? _self.remoteParentPath : remoteParentPath // ignore: cast_nullable_to_non_nullable
as String?,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,isRCloneBackend: null == isRCloneBackend ? _self.isRCloneBackend : isRCloneBackend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderCopyWith<$Res> get provider {
  
  return $DriveProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _FolderModel with DiagnosticableTreeMixin implements FolderModel {
  const _FolderModel({required this.remoteName, required this.provider, required this.folderPath, required this.folderName, required this.remoteParentPath, required this.isAutoSync, required this.isDeletionEnabled, required this.isTwoWaySync, required this.folderId, required this.isRCloneBackend});
  factory _FolderModel.fromJson(Map<String, dynamic> json) => _$FolderModelFromJson(json);

@override final  String remoteName;
@override final  DriveProvider provider;
@override final  String folderPath;
@override final  String folderName;
@override final  String? remoteParentPath;
@override final  bool isAutoSync;
@override final  bool isDeletionEnabled;
@override final  bool isTwoWaySync;
@override final  String? folderId;
@override final  bool isRCloneBackend;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderModelCopyWith<_FolderModel> get copyWith => __$FolderModelCopyWithImpl<_FolderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FolderModel'))
    ..add(DiagnosticsProperty('remoteName', remoteName))..add(DiagnosticsProperty('provider', provider))..add(DiagnosticsProperty('folderPath', folderPath))..add(DiagnosticsProperty('folderName', folderName))..add(DiagnosticsProperty('remoteParentPath', remoteParentPath))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync))..add(DiagnosticsProperty('folderId', folderId))..add(DiagnosticsProperty('isRCloneBackend', isRCloneBackend));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.folderPath, folderPath) || other.folderPath == folderPath)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.remoteParentPath, remoteParentPath) || other.remoteParentPath == remoteParentPath)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.isRCloneBackend, isRCloneBackend) || other.isRCloneBackend == isRCloneBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,provider,folderPath,folderName,remoteParentPath,isAutoSync,isDeletionEnabled,isTwoWaySync,folderId,isRCloneBackend);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FolderModel(remoteName: $remoteName, provider: $provider, folderPath: $folderPath, folderName: $folderName, remoteParentPath: $remoteParentPath, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync, folderId: $folderId, isRCloneBackend: $isRCloneBackend)';
}


}

/// @nodoc
abstract mixin class _$FolderModelCopyWith<$Res> implements $FolderModelCopyWith<$Res> {
  factory _$FolderModelCopyWith(_FolderModel value, $Res Function(_FolderModel) _then) = __$FolderModelCopyWithImpl;
@override @useResult
$Res call({
 String remoteName, DriveProvider provider, String folderPath, String folderName, String? remoteParentPath, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync, String? folderId, bool isRCloneBackend
});


@override $DriveProviderCopyWith<$Res> get provider;

}
/// @nodoc
class __$FolderModelCopyWithImpl<$Res>
    implements _$FolderModelCopyWith<$Res> {
  __$FolderModelCopyWithImpl(this._self, this._then);

  final _FolderModel _self;
  final $Res Function(_FolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteName = null,Object? provider = null,Object? folderPath = null,Object? folderName = null,Object? remoteParentPath = freezed,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,Object? folderId = freezed,Object? isRCloneBackend = null,}) {
  return _then(_FolderModel(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,folderPath: null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,remoteParentPath: freezed == remoteParentPath ? _self.remoteParentPath : remoteParentPath // ignore: cast_nullable_to_non_nullable
as String?,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,isRCloneBackend: null == isRCloneBackend ? _self.isRCloneBackend : isRCloneBackend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderCopyWith<$Res> get provider {
  
  return $DriveProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}
}

// dart format on
