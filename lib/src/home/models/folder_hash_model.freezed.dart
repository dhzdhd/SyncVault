// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_hash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FolderHashModel {

 String get id;@HashDigestConverter() HashDigest get hash;
/// Create a copy of FolderHashModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FolderHashModelCopyWith<FolderHashModel> get copyWith => _$FolderHashModelCopyWithImpl<FolderHashModel>(this as FolderHashModel, _$identity);

  /// Serializes this FolderHashModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FolderHashModel&&(identical(other.id, id) || other.id == id)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hash);

@override
String toString() {
  return 'FolderHashModel(id: $id, hash: $hash)';
}


}

/// @nodoc
abstract mixin class $FolderHashModelCopyWith<$Res>  {
  factory $FolderHashModelCopyWith(FolderHashModel value, $Res Function(FolderHashModel) _then) = _$FolderHashModelCopyWithImpl;
@useResult
$Res call({
 String id,@HashDigestConverter() HashDigest hash
});




}
/// @nodoc
class _$FolderHashModelCopyWithImpl<$Res>
    implements $FolderHashModelCopyWith<$Res> {
  _$FolderHashModelCopyWithImpl(this._self, this._then);

  final FolderHashModel _self;
  final $Res Function(FolderHashModel) _then;

/// Create a copy of FolderHashModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hash = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as HashDigest,
  ));
}

}


/// Adds pattern-matching-related methods to [FolderHashModel].
extension FolderHashModelPatterns on FolderHashModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FolderHashModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FolderHashModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FolderHashModel value)  $default,){
final _that = this;
switch (_that) {
case _FolderHashModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FolderHashModel value)?  $default,){
final _that = this;
switch (_that) {
case _FolderHashModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @HashDigestConverter()  HashDigest hash)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FolderHashModel() when $default != null:
return $default(_that.id,_that.hash);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @HashDigestConverter()  HashDigest hash)  $default,) {final _that = this;
switch (_that) {
case _FolderHashModel():
return $default(_that.id,_that.hash);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @HashDigestConverter()  HashDigest hash)?  $default,) {final _that = this;
switch (_that) {
case _FolderHashModel() when $default != null:
return $default(_that.id,_that.hash);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FolderHashModel implements FolderHashModel {
  const _FolderHashModel({required this.id, @HashDigestConverter() required this.hash});
  factory _FolderHashModel.fromJson(Map<String, dynamic> json) => _$FolderHashModelFromJson(json);

@override final  String id;
@override@HashDigestConverter() final  HashDigest hash;

/// Create a copy of FolderHashModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FolderHashModelCopyWith<_FolderHashModel> get copyWith => __$FolderHashModelCopyWithImpl<_FolderHashModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FolderHashModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FolderHashModel&&(identical(other.id, id) || other.id == id)&&(identical(other.hash, hash) || other.hash == hash));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hash);

@override
String toString() {
  return 'FolderHashModel(id: $id, hash: $hash)';
}


}

/// @nodoc
abstract mixin class _$FolderHashModelCopyWith<$Res> implements $FolderHashModelCopyWith<$Res> {
  factory _$FolderHashModelCopyWith(_FolderHashModel value, $Res Function(_FolderHashModel) _then) = __$FolderHashModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@HashDigestConverter() HashDigest hash
});




}
/// @nodoc
class __$FolderHashModelCopyWithImpl<$Res>
    implements _$FolderHashModelCopyWith<$Res> {
  __$FolderHashModelCopyWithImpl(this._self, this._then);

  final _FolderHashModel _self;
  final $Res Function(_FolderHashModel) _then;

/// Create a copy of FolderHashModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hash = null,}) {
  return _then(_FolderHashModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as HashDigest,
  ));
}


}

// dart format on
