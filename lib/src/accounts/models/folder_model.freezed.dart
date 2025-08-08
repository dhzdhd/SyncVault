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
FolderModel _$FolderModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'remote':
          return RemoteFolderModel.fromJson(
            json
          );
                case 'local':
          return LocalFolderModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'FolderModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$FolderModel {

 String get folderName;
/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderModelCopyWith<FolderModel> get copyWith => _$FolderModelCopyWithImpl<FolderModel>(this as FolderModel, _$identity);

  /// Serializes this FolderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderModel&&(identical(other.folderName, folderName) || other.folderName == folderName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folderName);

@override
String toString() {
  return 'FolderModel(folderName: $folderName)';
}


}

/// @nodoc
abstract mixin class $FolderModelCopyWith<$Res>  {
  factory $FolderModelCopyWith(FolderModel value, $Res Function(FolderModel) _then) = _$FolderModelCopyWithImpl;
@useResult
$Res call({
 String folderName
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
@pragma('vm:prefer-inline') @override $Res call({Object? folderName = null,}) {
  return _then(_self.copyWith(
folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class RemoteFolderModel implements FolderModel {
  const RemoteFolderModel({required this.remoteName, required this.folderName, required this.parentPath, required this.folderId, final  String? $type}): $type = $type ?? 'remote';
  factory RemoteFolderModel.fromJson(Map<String, dynamic> json) => _$RemoteFolderModelFromJson(json);

 final  String remoteName;
@override final  String folderName;
 final  String? parentPath;
 final  String? folderId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteFolderModelCopyWith<RemoteFolderModel> get copyWith => _$RemoteFolderModelCopyWithImpl<RemoteFolderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteFolderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteFolderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.parentPath, parentPath) || other.parentPath == parentPath)&&(identical(other.folderId, folderId) || other.folderId == folderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,folderName,parentPath,folderId);

@override
String toString() {
  return 'FolderModel.remote(remoteName: $remoteName, folderName: $folderName, parentPath: $parentPath, folderId: $folderId)';
}


}

/// @nodoc
abstract mixin class $RemoteFolderModelCopyWith<$Res> implements $FolderModelCopyWith<$Res> {
  factory $RemoteFolderModelCopyWith(RemoteFolderModel value, $Res Function(RemoteFolderModel) _then) = _$RemoteFolderModelCopyWithImpl;
@override @useResult
$Res call({
 String remoteName, String folderName, String? parentPath, String? folderId
});




}
/// @nodoc
class _$RemoteFolderModelCopyWithImpl<$Res>
    implements $RemoteFolderModelCopyWith<$Res> {
  _$RemoteFolderModelCopyWithImpl(this._self, this._then);

  final RemoteFolderModel _self;
  final $Res Function(RemoteFolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteName = null,Object? folderName = null,Object? parentPath = freezed,Object? folderId = freezed,}) {
  return _then(RemoteFolderModel(
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

class LocalFolderModel implements FolderModel {
  const LocalFolderModel({required this.folderName, required this.folderPath, final  String? $type}): $type = $type ?? 'local';
  factory LocalFolderModel.fromJson(Map<String, dynamic> json) => _$LocalFolderModelFromJson(json);

@override final  String folderName;
 final  String folderPath;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalFolderModelCopyWith<LocalFolderModel> get copyWith => _$LocalFolderModelCopyWithImpl<LocalFolderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalFolderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalFolderModel&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.folderPath, folderPath) || other.folderPath == folderPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,folderName,folderPath);

@override
String toString() {
  return 'FolderModel.local(folderName: $folderName, folderPath: $folderPath)';
}


}

/// @nodoc
abstract mixin class $LocalFolderModelCopyWith<$Res> implements $FolderModelCopyWith<$Res> {
  factory $LocalFolderModelCopyWith(LocalFolderModel value, $Res Function(LocalFolderModel) _then) = _$LocalFolderModelCopyWithImpl;
@override @useResult
$Res call({
 String folderName, String folderPath
});




}
/// @nodoc
class _$LocalFolderModelCopyWithImpl<$Res>
    implements $LocalFolderModelCopyWith<$Res> {
  _$LocalFolderModelCopyWithImpl(this._self, this._then);

  final LocalFolderModel _self;
  final $Res Function(LocalFolderModel) _then;

/// Create a copy of FolderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? folderName = null,Object? folderPath = null,}) {
  return _then(LocalFolderModel(
folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,folderPath: null == folderPath ? _self.folderPath : folderPath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
