// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressModel {

 int get percentage; Duration get eta; double get speed; double get completedSize; double get totalSize;
/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressModelCopyWith<ProgressModel> get copyWith => _$ProgressModelCopyWithImpl<ProgressModel>(this as ProgressModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressModel&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.completedSize, completedSize) || other.completedSize == completedSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize));
}


@override
int get hashCode => Object.hash(runtimeType,percentage,eta,speed,completedSize,totalSize);

@override
String toString() {
  return 'ProgressModel(percentage: $percentage, eta: $eta, speed: $speed, completedSize: $completedSize, totalSize: $totalSize)';
}


}

/// @nodoc
abstract mixin class $ProgressModelCopyWith<$Res>  {
  factory $ProgressModelCopyWith(ProgressModel value, $Res Function(ProgressModel) _then) = _$ProgressModelCopyWithImpl;
@useResult
$Res call({
 int percentage, Duration eta, double speed, double completedSize, double totalSize
});




}
/// @nodoc
class _$ProgressModelCopyWithImpl<$Res>
    implements $ProgressModelCopyWith<$Res> {
  _$ProgressModelCopyWithImpl(this._self, this._then);

  final ProgressModel _self;
  final $Res Function(ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? percentage = null,Object? eta = null,Object? speed = null,Object? completedSize = null,Object? totalSize = null,}) {
  return _then(_self.copyWith(
percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,completedSize: null == completedSize ? _self.completedSize : completedSize // ignore: cast_nullable_to_non_nullable
as double,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _ProgressModel implements ProgressModel {
  const _ProgressModel({required this.percentage, required this.eta, required this.speed, required this.completedSize, required this.totalSize});
  

@override final  int percentage;
@override final  Duration eta;
@override final  double speed;
@override final  double completedSize;
@override final  double totalSize;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressModelCopyWith<_ProgressModel> get copyWith => __$ProgressModelCopyWithImpl<_ProgressModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressModel&&(identical(other.percentage, percentage) || other.percentage == percentage)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.completedSize, completedSize) || other.completedSize == completedSize)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize));
}


@override
int get hashCode => Object.hash(runtimeType,percentage,eta,speed,completedSize,totalSize);

@override
String toString() {
  return 'ProgressModel(percentage: $percentage, eta: $eta, speed: $speed, completedSize: $completedSize, totalSize: $totalSize)';
}


}

/// @nodoc
abstract mixin class _$ProgressModelCopyWith<$Res> implements $ProgressModelCopyWith<$Res> {
  factory _$ProgressModelCopyWith(_ProgressModel value, $Res Function(_ProgressModel) _then) = __$ProgressModelCopyWithImpl;
@override @useResult
$Res call({
 int percentage, Duration eta, double speed, double completedSize, double totalSize
});




}
/// @nodoc
class __$ProgressModelCopyWithImpl<$Res>
    implements _$ProgressModelCopyWith<$Res> {
  __$ProgressModelCopyWithImpl(this._self, this._then);

  final _ProgressModel _self;
  final $Res Function(_ProgressModel) _then;

/// Create a copy of ProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? percentage = null,Object? eta = null,Object? speed = null,Object? completedSize = null,Object? totalSize = null,}) {
  return _then(_ProgressModel(
percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,eta: null == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as Duration,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,completedSize: null == completedSize ? _self.completedSize : completedSize // ignore: cast_nullable_to_non_nullable
as double,totalSize: null == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
