// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 String get id; String get title; String get firstFolderId; String get secondFolderId; SyncDirection get direction; bool get isAutoSync; bool get isDeletionEnabled; DateTime get createdAt; DateTime get updatedAt;
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
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstFolderId', firstFolderId))..add(DiagnosticsProperty('secondFolderId', secondFolderId))..add(DiagnosticsProperty('direction', direction))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.firstFolderId, firstFolderId) || other.firstFolderId == firstFolderId)&&(identical(other.secondFolderId, secondFolderId) || other.secondFolderId == secondFolderId)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,firstFolderId,secondFolderId,direction,isAutoSync,isDeletionEnabled,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(id: $id, title: $title, firstFolderId: $firstFolderId, secondFolderId: $secondFolderId, direction: $direction, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ConnectionModelCopyWith<$Res>  {
  factory $ConnectionModelCopyWith(ConnectionModel value, $Res Function(ConnectionModel) _then) = _$ConnectionModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String firstFolderId, String secondFolderId, SyncDirection direction, bool isAutoSync, bool isDeletionEnabled, DateTime createdAt, DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? firstFolderId = null,Object? secondFolderId = null,Object? direction = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstFolderId: null == firstFolderId ? _self.firstFolderId : firstFolderId // ignore: cast_nullable_to_non_nullable
as String,secondFolderId: null == secondFolderId ? _self.secondFolderId : secondFolderId // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as SyncDirection,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ConnectionModel].
extension ConnectionModelPatterns on ConnectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConnectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConnectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConnectionModel value)  $default,){
final _that = this;
switch (_that) {
case _ConnectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConnectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConnectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String firstFolderId,  String secondFolderId,  SyncDirection direction,  bool isAutoSync,  bool isDeletionEnabled,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConnectionModel() when $default != null:
return $default(_that.id,_that.title,_that.firstFolderId,_that.secondFolderId,_that.direction,_that.isAutoSync,_that.isDeletionEnabled,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String firstFolderId,  String secondFolderId,  SyncDirection direction,  bool isAutoSync,  bool isDeletionEnabled,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ConnectionModel():
return $default(_that.id,_that.title,_that.firstFolderId,_that.secondFolderId,_that.direction,_that.isAutoSync,_that.isDeletionEnabled,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String firstFolderId,  String secondFolderId,  SyncDirection direction,  bool isAutoSync,  bool isDeletionEnabled,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ConnectionModel() when $default != null:
return $default(_that.id,_that.title,_that.firstFolderId,_that.secondFolderId,_that.direction,_that.isAutoSync,_that.isDeletionEnabled,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConnectionModel with DiagnosticableTreeMixin implements ConnectionModel {
  const _ConnectionModel({required this.id, required this.title, required this.firstFolderId, required this.secondFolderId, required this.direction, required this.isAutoSync, required this.isDeletionEnabled, required this.createdAt, required this.updatedAt});
  factory _ConnectionModel.fromJson(Map<String, dynamic> json) => _$ConnectionModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String firstFolderId;
@override final  String secondFolderId;
@override final  SyncDirection direction;
@override final  bool isAutoSync;
@override final  bool isDeletionEnabled;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

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
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('firstFolderId', firstFolderId))..add(DiagnosticsProperty('secondFolderId', secondFolderId))..add(DiagnosticsProperty('direction', direction))..add(DiagnosticsProperty('isAutoSync', isAutoSync))..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('updatedAt', updatedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConnectionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.firstFolderId, firstFolderId) || other.firstFolderId == firstFolderId)&&(identical(other.secondFolderId, secondFolderId) || other.secondFolderId == secondFolderId)&&(identical(other.direction, direction) || other.direction == direction)&&(identical(other.isAutoSync, isAutoSync) || other.isAutoSync == isAutoSync)&&(identical(other.isDeletionEnabled, isDeletionEnabled) || other.isDeletionEnabled == isDeletionEnabled)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,firstFolderId,secondFolderId,direction,isAutoSync,isDeletionEnabled,createdAt,updatedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConnectionModel(id: $id, title: $title, firstFolderId: $firstFolderId, secondFolderId: $secondFolderId, direction: $direction, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ConnectionModelCopyWith<$Res> implements $ConnectionModelCopyWith<$Res> {
  factory _$ConnectionModelCopyWith(_ConnectionModel value, $Res Function(_ConnectionModel) _then) = __$ConnectionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String firstFolderId, String secondFolderId, SyncDirection direction, bool isAutoSync, bool isDeletionEnabled, DateTime createdAt, DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? firstFolderId = null,Object? secondFolderId = null,Object? direction = null,Object? isAutoSync = null,Object? isDeletionEnabled = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ConnectionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,firstFolderId: null == firstFolderId ? _self.firstFolderId : firstFolderId // ignore: cast_nullable_to_non_nullable
as String,secondFolderId: null == secondFolderId ? _self.secondFolderId : secondFolderId // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as SyncDirection,isAutoSync: null == isAutoSync ? _self.isAutoSync : isAutoSync // ignore: cast_nullable_to_non_nullable
as bool,isDeletionEnabled: null == isDeletionEnabled ? _self.isDeletionEnabled : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
