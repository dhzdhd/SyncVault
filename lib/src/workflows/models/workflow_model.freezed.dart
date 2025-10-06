// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkflowModel {

 String get id; String get name; Map<String, Object>? get workflowJson; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of WorkflowModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkflowModelCopyWith<WorkflowModel> get copyWith => _$WorkflowModelCopyWithImpl<WorkflowModel>(this as WorkflowModel, _$identity);

  /// Serializes this WorkflowModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkflowModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.workflowJson, workflowJson)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(workflowJson),createdAt,updatedAt);

@override
String toString() {
  return 'WorkflowModel(id: $id, name: $name, workflowJson: $workflowJson, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WorkflowModelCopyWith<$Res>  {
  factory $WorkflowModelCopyWith(WorkflowModel value, $Res Function(WorkflowModel) _then) = _$WorkflowModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, Map<String, Object>? workflowJson, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WorkflowModelCopyWithImpl<$Res>
    implements $WorkflowModelCopyWith<$Res> {
  _$WorkflowModelCopyWithImpl(this._self, this._then);

  final WorkflowModel _self;
  final $Res Function(WorkflowModel) _then;

/// Create a copy of WorkflowModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? workflowJson = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workflowJson: freezed == workflowJson ? _self.workflowJson : workflowJson // ignore: cast_nullable_to_non_nullable
as Map<String, Object>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkflowModel].
extension WorkflowModelPatterns on WorkflowModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkflowModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkflowModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkflowModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkflowModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkflowModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkflowModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, Object>? workflowJson,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkflowModel() when $default != null:
return $default(_that.id,_that.name,_that.workflowJson,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Map<String, Object>? workflowJson,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkflowModel():
return $default(_that.id,_that.name,_that.workflowJson,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Map<String, Object>? workflowJson,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkflowModel() when $default != null:
return $default(_that.id,_that.name,_that.workflowJson,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkflowModel implements WorkflowModel {
  const _WorkflowModel({required this.id, required this.name, required final  Map<String, Object>? workflowJson, required this.createdAt, required this.updatedAt}): _workflowJson = workflowJson;
  factory _WorkflowModel.fromJson(Map<String, dynamic> json) => _$WorkflowModelFromJson(json);

@override final  String id;
@override final  String name;
 final  Map<String, Object>? _workflowJson;
@override Map<String, Object>? get workflowJson {
  final value = _workflowJson;
  if (value == null) return null;
  if (_workflowJson is EqualUnmodifiableMapView) return _workflowJson;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of WorkflowModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkflowModelCopyWith<_WorkflowModel> get copyWith => __$WorkflowModelCopyWithImpl<_WorkflowModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkflowModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkflowModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._workflowJson, _workflowJson)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_workflowJson),createdAt,updatedAt);

@override
String toString() {
  return 'WorkflowModel(id: $id, name: $name, workflowJson: $workflowJson, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkflowModelCopyWith<$Res> implements $WorkflowModelCopyWith<$Res> {
  factory _$WorkflowModelCopyWith(_WorkflowModel value, $Res Function(_WorkflowModel) _then) = __$WorkflowModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Map<String, Object>? workflowJson, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WorkflowModelCopyWithImpl<$Res>
    implements _$WorkflowModelCopyWith<$Res> {
  __$WorkflowModelCopyWithImpl(this._self, this._then);

  final _WorkflowModel _self;
  final $Res Function(_WorkflowModel) _then;

/// Create a copy of WorkflowModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? workflowJson = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WorkflowModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,workflowJson: freezed == workflowJson ? _self._workflowJson : workflowJson // ignore: cast_nullable_to_non_nullable
as Map<String, Object>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
