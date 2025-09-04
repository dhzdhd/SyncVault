// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsModel {

 bool get isSentryEnabled; bool get isHideOnStartup; bool get isLaunchOnStartup; ThemeMode get themeMode;
/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsModelCopyWith<SettingsModel> get copyWith => _$SettingsModelCopyWithImpl<SettingsModel>(this as SettingsModel, _$identity);

  /// Serializes this SettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsModel&&(identical(other.isSentryEnabled, isSentryEnabled) || other.isSentryEnabled == isSentryEnabled)&&(identical(other.isHideOnStartup, isHideOnStartup) || other.isHideOnStartup == isHideOnStartup)&&(identical(other.isLaunchOnStartup, isLaunchOnStartup) || other.isLaunchOnStartup == isLaunchOnStartup)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSentryEnabled,isHideOnStartup,isLaunchOnStartup,themeMode);

@override
String toString() {
  return 'SettingsModel(isSentryEnabled: $isSentryEnabled, isHideOnStartup: $isHideOnStartup, isLaunchOnStartup: $isLaunchOnStartup, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class $SettingsModelCopyWith<$Res>  {
  factory $SettingsModelCopyWith(SettingsModel value, $Res Function(SettingsModel) _then) = _$SettingsModelCopyWithImpl;
@useResult
$Res call({
 bool isSentryEnabled, bool isHideOnStartup, bool isLaunchOnStartup, ThemeMode themeMode
});




}
/// @nodoc
class _$SettingsModelCopyWithImpl<$Res>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._self, this._then);

  final SettingsModel _self;
  final $Res Function(SettingsModel) _then;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSentryEnabled = null,Object? isHideOnStartup = null,Object? isLaunchOnStartup = null,Object? themeMode = null,}) {
  return _then(_self.copyWith(
isSentryEnabled: null == isSentryEnabled ? _self.isSentryEnabled : isSentryEnabled // ignore: cast_nullable_to_non_nullable
as bool,isHideOnStartup: null == isHideOnStartup ? _self.isHideOnStartup : isHideOnStartup // ignore: cast_nullable_to_non_nullable
as bool,isLaunchOnStartup: null == isLaunchOnStartup ? _self.isLaunchOnStartup : isLaunchOnStartup // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SettingsModel implements SettingsModel {
  const _SettingsModel({required this.isSentryEnabled, required this.isHideOnStartup, required this.isLaunchOnStartup, required this.themeMode});
  factory _SettingsModel.fromJson(Map<String, dynamic> json) => _$SettingsModelFromJson(json);

@override final  bool isSentryEnabled;
@override final  bool isHideOnStartup;
@override final  bool isLaunchOnStartup;
@override final  ThemeMode themeMode;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsModelCopyWith<_SettingsModel> get copyWith => __$SettingsModelCopyWithImpl<_SettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsModel&&(identical(other.isSentryEnabled, isSentryEnabled) || other.isSentryEnabled == isSentryEnabled)&&(identical(other.isHideOnStartup, isHideOnStartup) || other.isHideOnStartup == isHideOnStartup)&&(identical(other.isLaunchOnStartup, isLaunchOnStartup) || other.isLaunchOnStartup == isLaunchOnStartup)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSentryEnabled,isHideOnStartup,isLaunchOnStartup,themeMode);

@override
String toString() {
  return 'SettingsModel(isSentryEnabled: $isSentryEnabled, isHideOnStartup: $isHideOnStartup, isLaunchOnStartup: $isLaunchOnStartup, themeMode: $themeMode)';
}


}

/// @nodoc
abstract mixin class _$SettingsModelCopyWith<$Res> implements $SettingsModelCopyWith<$Res> {
  factory _$SettingsModelCopyWith(_SettingsModel value, $Res Function(_SettingsModel) _then) = __$SettingsModelCopyWithImpl;
@override @useResult
$Res call({
 bool isSentryEnabled, bool isHideOnStartup, bool isLaunchOnStartup, ThemeMode themeMode
});




}
/// @nodoc
class __$SettingsModelCopyWithImpl<$Res>
    implements _$SettingsModelCopyWith<$Res> {
  __$SettingsModelCopyWithImpl(this._self, this._then);

  final _SettingsModel _self;
  final $Res Function(_SettingsModel) _then;

/// Create a copy of SettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSentryEnabled = null,Object? isHideOnStartup = null,Object? isLaunchOnStartup = null,Object? themeMode = null,}) {
  return _then(_SettingsModel(
isSentryEnabled: null == isSentryEnabled ? _self.isSentryEnabled : isSentryEnabled // ignore: cast_nullable_to_non_nullable
as bool,isHideOnStartup: null == isHideOnStartup ? _self.isHideOnStartup : isHideOnStartup // ignore: cast_nullable_to_non_nullable
as bool,isLaunchOnStartup: null == isLaunchOnStartup ? _self.isLaunchOnStartup : isLaunchOnStartup // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,
  ));
}


}

// dart format on
