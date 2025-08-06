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
mixin _$FolderModel {

 String get remoteName; String get folderName; String? get parentPath; String? get folderId;
/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderModelCopyWith<FolderModel> get copyWith => _$FolderModelCopyWithImpl<FolderModel>(this as FolderModel, _$identity);

  /// Serializes this FolderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath)&&(identical(other.folderId, folderId) || other.folderId == folderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,folderName,parentPath,folderId);

@override
String toString() {
  return 'FolderModel(remoteName: $remoteName, folderName: $folderName, parentPath: $parentPath, folderId: $folderId)';
}


}

/// @nodoc
abstract mixin class $FolderModelCopyWith<$Res>  {
  factory $FolderModelCopyWith(FolderModel value, $Res Function(FolderModel) _then) = _$FolderModelCopyWithImpl;
@useResult
$Res call({
 String remoteName, String folderName, String? parentPath, String? folderId
});




}
/// @nodoc
class _$FolderModelCopyWithImpl<$Res>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._self, this._then);

  final FolderModel _self;
  final $Res Function(FolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteName = null,Object? folderName = null,Object? parentPath = freezed,Object? folderId = freezed,}) {
  return _then(_self.copyWith(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as String?,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FolderModel implements FolderModel {
  const _FolderModel({required this.remoteName, required this.folderName, required this.parentPath, required this.folderId});
  factory _FolderModel.fromJson(Map<String, dynamic> json) => _$FolderModelFromJson(json);

@override final  String remoteName;
@override final  String folderName;
@override final  String? parentPath;
@override final  String? folderId;

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
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath)&&(identical(other.folderId, folderId) || other.folderId == folderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,folderName,parentPath,folderId);

@override
String toString() {
  return 'FolderModel(remoteName: $remoteName, folderName: $folderName, parentPath: $parentPath, folderId: $folderId)';
}


}

/// @nodoc
abstract mixin class _$FolderModelCopyWith<$Res> implements $FolderModelCopyWith<$Res> {
  factory _$FolderModelCopyWith(_FolderModel value, $Res Function(_FolderModel) _then) = __$FolderModelCopyWithImpl;
@override @useResult
$Res call({
 String remoteName, String folderName, String? parentPath, String? folderId
});




}
/// @nodoc
class __$FolderModelCopyWithImpl<$Res>
    implements _$FolderModelCopyWith<$Res> {
  __$FolderModelCopyWithImpl(this._self, this._then);

  final _FolderModel _self;
  final $Res Function(_FolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteName = null,Object? folderName = null,Object? parentPath = freezed,Object? folderId = freezed,}) {
  return _then(_FolderModel(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,parentPath: freezed == parentPath ? _self.parentPath : parentPath // ignore: cast_nullable_to_non_nullable
as String?,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
