// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IntroSettingsModel {

 bool get alreadyViewed;
/// Create a copy of IntroSettingsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntroSettingsModelCopyWith<IntroSettingsModel> get copyWith => _$IntroSettingsModelCopyWithImpl<IntroSettingsModel>(this as IntroSettingsModel, _$identity);

  /// Serializes this IntroSettingsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntroSettingsModel&&(identical(other.alreadyViewed, alreadyViewed) || other.alreadyViewed == alreadyViewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alreadyViewed);

@override
String toString() {
  return 'IntroSettingsModel(alreadyViewed: $alreadyViewed)';
}


}

/// @nodoc
abstract mixin class $IntroSettingsModelCopyWith<$Res>  {
  factory $IntroSettingsModelCopyWith(IntroSettingsModel value, $Res Function(IntroSettingsModel) _then) = _$IntroSettingsModelCopyWithImpl;
@useResult
$Res call({
 bool alreadyViewed
});




}
/// @nodoc
class _$IntroSettingsModelCopyWithImpl<$Res>
    implements $IntroSettingsModelCopyWith<$Res> {
  _$IntroSettingsModelCopyWithImpl(this._self, this._then);

  final IntroSettingsModel _self;
  final $Res Function(IntroSettingsModel) _then;

/// Create a copy of IntroSettingsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alreadyViewed = null,}) {
  return _then(_self.copyWith(
alreadyViewed: null == alreadyViewed ? _self.alreadyViewed : alreadyViewed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [IntroSettingsModel].
extension IntroSettingsModelPatterns on IntroSettingsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntroSettingsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntroSettingsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntroSettingsModel value)  $default,){
final _that = this;
switch (_that) {
case _IntroSettingsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntroSettingsModel value)?  $default,){
final _that = this;
switch (_that) {
case _IntroSettingsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool alreadyViewed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntroSettingsModel() when $default != null:
return $default(_that.alreadyViewed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool alreadyViewed)  $default,) {final _that = this;
switch (_that) {
case _IntroSettingsModel():
return $default(_that.alreadyViewed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool alreadyViewed)?  $default,) {final _that = this;
switch (_that) {
case _IntroSettingsModel() when $default != null:
return $default(_that.alreadyViewed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntroSettingsModel implements IntroSettingsModel {
  const _IntroSettingsModel({required this.alreadyViewed});
  factory _IntroSettingsModel.fromJson(Map<String, dynamic> json) => _$IntroSettingsModelFromJson(json);

@override final  bool alreadyViewed;

/// Create a copy of IntroSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntroSettingsModelCopyWith<_IntroSettingsModel> get copyWith => __$IntroSettingsModelCopyWithImpl<_IntroSettingsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntroSettingsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntroSettingsModel&&(identical(other.alreadyViewed, alreadyViewed) || other.alreadyViewed == alreadyViewed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alreadyViewed);

@override
String toString() {
  return 'IntroSettingsModel(alreadyViewed: $alreadyViewed)';
}


}

/// @nodoc
abstract mixin class _$IntroSettingsModelCopyWith<$Res> implements $IntroSettingsModelCopyWith<$Res> {
  factory _$IntroSettingsModelCopyWith(_IntroSettingsModel value, $Res Function(_IntroSettingsModel) _then) = __$IntroSettingsModelCopyWithImpl;
@override @useResult
$Res call({
 bool alreadyViewed
});




}
/// @nodoc
class __$IntroSettingsModelCopyWithImpl<$Res>
    implements _$IntroSettingsModelCopyWith<$Res> {
  __$IntroSettingsModelCopyWithImpl(this._self, this._then);

  final _IntroSettingsModel _self;
  final $Res Function(_IntroSettingsModel) _then;

/// Create a copy of IntroSettingsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alreadyViewed = null,}) {
  return _then(_IntroSettingsModel(
alreadyViewed: null == alreadyViewed ? _self.alreadyViewed : alreadyViewed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
