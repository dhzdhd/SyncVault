// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConnectionModel implements DiagnosticableTreeMixin {

 String get title; String get firstFolderId; String get secondFolderId; SyncDirection get direction; bool get isAutoSync; bool get isDeletionEnabled;
/// Create a copy of ConnectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectionModelCopyWith<ConnectionModel> get copyWith => _$ConnectionModelCopyWithImpl<ConnectionModel>(this as ConnectionModel, _$identity);

  /// Serializes this ConnectionModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionModel'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstFolderId', firstFolderId))..add(DiagnosticsProperty('secondFolderId', secondFolderId))..add(DiagnosticsProperty('direction', direction))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstFolderId, firstFolderId) || other.firstFolderId == firstFolderId)&&(identical(other.secondFolderId, secondFolderId) || other.secondFolderId == secondFolderId)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstFolderId,secondFolderId,direction,isAutoSync,isDeletionEnabled);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(title: $title, firstFolderId: $firstFolderId, secondFolderId: $secondFolderId, direction: $direction, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled)';
}


}

/// @nodoc
abstract mixin class $ConnectionModelCopyWith<$Res>  {
  factory $ConnectionModelCopyWith(ConnectionModel value, $Res Function(ConnectionModel) _then) = _$ConnectionModelCopyWithImpl;
@useResult
$Res call({
 String title, String firstFolderId, String secondFolderId, SyncDirection direction, bool isAutoSync, bool isDeletionEnabled
});




}
/// @nodoc
class _$ConnectionModelCopyWithImpl<$Res>
    implements $ConnectionModelCopyWith<$Res> {
  _$ConnectionModelCopyWithImpl(this._self, this._then);

  final ConnectionModel _self;
  final $Res Function(ConnectionModel) _then;

/// Create a copy of ConnectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? firstFolderId = null,Object? secondFolderId = null,Object? direction = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstFolderId: null == firstFolderId ? _self.firstFolderId : firstFolderId // ignore: cast_nullable_to_non_nullable
as String,secondFolderId: null == secondFolderId ? _self.secondFolderId : secondFolderId // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as SyncDirection,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConnectionModel with DiagnosticableTreeMixin implements ConnectionModel {
  const _ConnectionModel({required this.title, required this.firstFolderId, required this.secondFolderId, required this.direction, required this.isAutoSync, required this.isDeletionEnabled});
  factory _ConnectionModel.fromJson(Map<String, dynamic> json) => _$ConnectionModelFromJson(json);

@override final  String title;
@override final  String firstFolderId;
@override final  String secondFolderId;
@override final  SyncDirection direction;
@override final  bool isAutoSync;
@override final  bool isDeletionEnabled;

/// Create a copy of ConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionModelCopyWith<_ConnectionModel> get copyWith => __$ConnectionModelCopyWithImpl<_ConnectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectionModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ConnectionModel'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstFolderId', firstFolderId))..add(DiagnosticsProperty('secondFolderId', secondFolderId))..add(DiagnosticsProperty('direction', direction))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstFolderId, firstFolderId) || other.firstFolderId == firstFolderId)&&(identical(other.secondFolderId, secondFolderId) || other.secondFolderId == secondFolderId)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstFolderId,secondFolderId,direction,isAutoSync,isDeletionEnabled);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(title: $title, firstFolderId: $firstFolderId, secondFolderId: $secondFolderId, direction: $direction, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled)';
}


}

/// @nodoc
abstract mixin class _$ConnectionModelCopyWith<$Res> implements $ConnectionModelCopyWith<$Res> {
  factory _$ConnectionModelCopyWith(_ConnectionModel value, $Res Function(_ConnectionModel) _then) = __$ConnectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String firstFolderId, String secondFolderId, SyncDirection direction, bool isAutoSync, bool isDeletionEnabled
});




}
/// @nodoc
class __$ConnectionModelCopyWithImpl<$Res>
    implements _$ConnectionModelCopyWith<$Res> {
  __$ConnectionModelCopyWithImpl(this._self, this._then);

  final _ConnectionModel _self;
  final $Res Function(_ConnectionModel) _then;

/// Create a copy of ConnectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? firstFolderId = null,Object? secondFolderId = null,Object? direction = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,}) {
  return _then(_ConnectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstFolderId: null == firstFolderId ? _self.firstFolderId : firstFolderId // ignore: cast_nullable_to_non_nullable
as String,secondFolderId: null == secondFolderId ? _self.secondFolderId : secondFolderId // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as SyncDirection,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
