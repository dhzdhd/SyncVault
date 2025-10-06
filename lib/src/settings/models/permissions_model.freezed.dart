// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionsModel {

 PermissionStatus get notifications; PermissionStatus get batteryOptimization; PermissionStatus get fileAccess;
/// Create a copy of PermissionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsModelCopyWith<PermissionsModel> get copyWith => _$PermissionsModelCopyWithImpl<PermissionsModel>(this as PermissionsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionsModel&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.batteryOptimization, batteryOptimization) || other.batteryOptimization == batteryOptimization)&&(identical(other.fileAccess, fileAccess) || other.fileAccess == fileAccess));
}


@override
int get hashCode => Object.hash(runtimeType,notifications,batteryOptimization,fileAccess);

@override
String toString() {
  return 'PermissionsModel(notifications: $notifications, batteryOptimization: $batteryOptimization, fileAccess: $fileAccess)';
}


}

/// @nodoc
abstract mixin class $PermissionsModelCopyWith<$Res>  {
  factory $PermissionsModelCopyWith(PermissionsModel value, $Res Function(PermissionsModel) _then) = _$PermissionsModelCopyWithImpl;
@useResult
$Res call({
 PermissionStatus notifications, PermissionStatus batteryOptimization, PermissionStatus fileAccess
});




}
/// @nodoc
class _$PermissionsModelCopyWithImpl<$Res>
    implements $PermissionsModelCopyWith<$Res> {
  _$PermissionsModelCopyWithImpl(this._self, this._then);

  final PermissionsModel _self;
  final $Res Function(PermissionsModel) _then;

/// Create a copy of PermissionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = null,Object? batteryOptimization = null,Object? fileAccess = null,}) {
  return _then(_self.copyWith(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as PermissionStatus,batteryOptimization: null == batteryOptimization ? _self.batteryOptimization : batteryOptimization // ignore: cast_nullable_to_non_nullable
as PermissionStatus,fileAccess: null == fileAccess ? _self.fileAccess : fileAccess // ignore: cast_nullable_to_non_nullable
as PermissionStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [PermissionsModel].
extension PermissionsModelPatterns on PermissionsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermissionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermissionsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermissionsModel value)  $default,){
final _that = this;
switch (_that) {
case _PermissionsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermissionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PermissionsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PermissionStatus notifications,  PermissionStatus batteryOptimization,  PermissionStatus fileAccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermissionsModel() when $default != null:
return $default(_that.notifications,_that.batteryOptimization,_that.fileAccess);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PermissionStatus notifications,  PermissionStatus batteryOptimization,  PermissionStatus fileAccess)  $default,) {final _that = this;
switch (_that) {
case _PermissionsModel():
return $default(_that.notifications,_that.batteryOptimization,_that.fileAccess);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PermissionStatus notifications,  PermissionStatus batteryOptimization,  PermissionStatus fileAccess)?  $default,) {final _that = this;
switch (_that) {
case _PermissionsModel() when $default != null:
return $default(_that.notifications,_that.batteryOptimization,_that.fileAccess);case _:
  return null;

}
}

}

/// @nodoc


class _PermissionsModel implements PermissionsModel {
  const _PermissionsModel({required this.notifications, required this.batteryOptimization, required this.fileAccess});
  

@override final  PermissionStatus notifications;
@override final  PermissionStatus batteryOptimization;
@override final  PermissionStatus fileAccess;

/// Create a copy of PermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermissionsModelCopyWith<_PermissionsModel> get copyWith => __$PermissionsModelCopyWithImpl<_PermissionsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionsModel&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.batteryOptimization, batteryOptimization) || other.batteryOptimization == batteryOptimization)&&(identical(other.fileAccess, fileAccess) || other.fileAccess == fileAccess));
}


@override
int get hashCode => Object.hash(runtimeType,notifications,batteryOptimization,fileAccess);

@override
String toString() {
  return 'PermissionsModel(notifications: $notifications, batteryOptimization: $batteryOptimization, fileAccess: $fileAccess)';
}


}

/// @nodoc
abstract mixin class _$PermissionsModelCopyWith<$Res> implements $PermissionsModelCopyWith<$Res> {
  factory _$PermissionsModelCopyWith(_PermissionsModel value, $Res Function(_PermissionsModel) _then) = __$PermissionsModelCopyWithImpl;
@override @useResult
$Res call({
 PermissionStatus notifications, PermissionStatus batteryOptimization, PermissionStatus fileAccess
});




}
/// @nodoc
class __$PermissionsModelCopyWithImpl<$Res>
    implements _$PermissionsModelCopyWith<$Res> {
  __$PermissionsModelCopyWithImpl(this._self, this._then);

  final _PermissionsModel _self;
  final $Res Function(_PermissionsModel) _then;

/// Create a copy of PermissionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = null,Object? batteryOptimization = null,Object? fileAccess = null,}) {
  return _then(_PermissionsModel(
notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as PermissionStatus,batteryOptimization: null == batteryOptimization ? _self.batteryOptimization : batteryOptimization // ignore: cast_nullable_to_non_nullable
as PermissionStatus,fileAccess: null == fileAccess ? _self.fileAccess : fileAccess // ignore: cast_nullable_to_non_nullable
as PermissionStatus,
  ));
}


}

// dart format on
