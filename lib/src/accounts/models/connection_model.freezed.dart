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

 String get title; String get firstRemote; String get secondRemote; bool get isAutoSync; bool get isDeletionEnabled; bool get isTwoWaySync;
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
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstRemote', firstRemote))..add(DiagnosticsProperty('secondRemote', secondRemote))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstRemote, firstRemote) || other.firstRemote == firstRemote)&&(identical(other.secondRemote, secondRemote) || other.secondRemote == secondRemote)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstRemote,secondRemote,isAutoSync,isDeletionEnabled,isTwoWaySync);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(title: $title, firstRemote: $firstRemote, secondRemote: $secondRemote, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync)';
}


}

/// @nodoc
abstract mixin class $ConnectionModelCopyWith<$Res>  {
  factory $ConnectionModelCopyWith(ConnectionModel value, $Res Function(ConnectionModel) _then) = _$ConnectionModelCopyWithImpl;
@useResult
$Res call({
 String title, String firstRemote, String secondRemote, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync
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
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? firstRemote = null,Object? secondRemote = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstRemote: null == firstRemote ? _self.firstRemote : firstRemote // ignore: cast_nullable_to_non_nullable
as String,secondRemote: null == secondRemote ? _self.secondRemote : secondRemote // ignore: cast_nullable_to_non_nullable
as String,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ConnectionModel with DiagnosticableTreeMixin implements ConnectionModel {
  const _ConnectionModel({required this.title, required this.firstRemote, required this.secondRemote, required this.isAutoSync, required this.isDeletionEnabled, required this.isTwoWaySync});
  factory _ConnectionModel.fromJson(Map<String, dynamic> json) => _$ConnectionModelFromJson(json);

@override final  String title;
@override final  String firstRemote;
@override final  String secondRemote;
@override final  bool isAutoSync;
@override final  bool isDeletionEnabled;
@override final  bool isTwoWaySync;

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
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstRemote', firstRemote))..add(DiagnosticsProperty('secondRemote', secondRemote))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.firstRemote, firstRemote) || other.firstRemote == firstRemote)&&(identical(other.secondRemote, secondRemote) || other.secondRemote == secondRemote)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.isTwoWaySync, isTwoWaySync) || other.isTwoWaySync == isTwoWaySync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,firstRemote,secondRemote,isAutoSync,isDeletionEnabled,isTwoWaySync);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(title: $title, firstRemote: $firstRemote, secondRemote: $secondRemote, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync)';
}


}

/// @nodoc
abstract mixin class _$ConnectionModelCopyWith<$Res> implements $ConnectionModelCopyWith<$Res> {
  factory _$ConnectionModelCopyWith(_ConnectionModel value, $Res Function(_ConnectionModel) _then) = __$ConnectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String firstRemote, String secondRemote, bool isAutoSync, bool isDeletionEnabled, bool isTwoWaySync
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
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? firstRemote = null,Object? secondRemote = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? isTwoWaySync = null,}) {
  return _then(_ConnectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstRemote: null == firstRemote ? _self.firstRemote : firstRemote // ignore: cast_nullable_to_non_nullable
as String,secondRemote: null == secondRemote ? _self.secondRemote : secondRemote // ignore: cast_nullable_to_non_nullable
as String,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,isTwoWaySync: null == isTwoWaySync ? _self.isTwoWaySync : isTwoWaySync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
