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

 String get title; String get firstRemote; String get secondRemote; bool get isAutoSync; bool get isDeletionEnabled; bool get isTwoWaySync; String? get folderId;
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
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstRemote', firstRemote))..add(DiagnosticsProperty('secondRemote', secondRemote))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync))..add(DiagnosticsProperty('folderId', folderId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstRemote, firstRemote) || other.firstRemote == firstRemote)&&(identical(other.secondRemote, secondRemote) || other.secondRemote == secondRemote)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync)&&(identical(other.folderId, folderId) || other.folderId == folderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstRemote,secondRemote,isAutoSync,isDeletionEnabled,isTwoWaySync,folderId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FolderModel(title: $title, firstRemote: $firstRemote, secondRemote: $secondRemote, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync, folderId: $folderId)';
}


}

/// @nodoc
abstract mixin class $FolderModelCopyWith<$Res>  {
  factory $FolderModelCopyWith(FolderModel value, $Res Function(FolderModel) _then) = _$FolderModelCopyWithImpl;
@useResult
$Res call({
 String title, String firstRemote, String secondRemote, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync, String? folderId
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
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? firstRemote = null,Object? secondRemote = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,Object? folderId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstRemote: null == firstRemote ? _self.firstRemote : firstRemote // ignore: cast_nullable_to_non_nullable
as String,secondRemote: null == secondRemote ? _self.secondRemote : secondRemote // ignore: cast_nullable_to_non_nullable
as String,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FolderModel with DiagnosticableTreeMixin implements FolderModel {
  const _FolderModel({required this.title, required this.firstRemote, required this.secondRemote, required this.isAutoSync, required this.isDeletionEnabled, required this.isTwoWaySync, required this.folderId});
  factory _FolderModel.fromJson(Map<String, dynamic> json) => _$FolderModelFromJson(json);

@override final  String title;
@override final  String firstRemote;
@override final  String secondRemote;
@override final  bool isAutoSync;
@override final  bool isDeletionEnabled;
@override final  bool isTwoWaySync;
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
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FolderModel'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstRemote', firstRemote))..add(DiagnosticsProperty('secondRemote', secondRemote))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync))..add(DiagnosticsProperty('folderId', folderId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstRemote, firstRemote) || other.firstRemote == firstRemote)&&(identical(other.secondRemote, secondRemote) || other.secondRemote == secondRemote)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync)&&(identical(other.folderId, folderId) || other.folderId == folderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstRemote,secondRemote,isAutoSync,isDeletionEnabled,isTwoWaySync,folderId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FolderModel(title: $title, firstRemote: $firstRemote, secondRemote: $secondRemote, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync, folderId: $folderId)';
}


}

/// @nodoc
abstract mixin class _$FolderModelCopyWith<$Res> implements $FolderModelCopyWith<$Res> {
  factory _$FolderModelCopyWith(_FolderModel value, $Res Function(_FolderModel) _then) = __$FolderModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String firstRemote, String secondRemote, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync, String? folderId
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
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? firstRemote = null,Object? secondRemote = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,Object? folderId = freezed,}) {
  return _then(_FolderModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstRemote: null == firstRemote ? _self.firstRemote : firstRemote // ignore: cast_nullable_to_non_nullable
as String,secondRemote: null == secondRemote ? _self.secondRemote : secondRemote // ignore: cast_nullable_to_non_nullable
as String,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,folderId: freezed == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
