// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriveProviderModel {

 String get remoteName; String get folderName; DriveProvider get provider; DriveProviderBackend get backend; String get createdAt; String get updatedAt; bool get isRCloneBackend;
/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriveProviderModelCopyWith<DriveProviderModel> get copyWith => _$DriveProviderModelCopyWithImpl<DriveProviderModel>(this as DriveProviderModel, _$identity);

  /// Serializes this DriveProviderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveProviderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.backend, backend) || other.backend == backend)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isRCloneBackend, isRCloneBackend) || other.isRCloneBackend == isRCloneBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,folderName,provider,backend,createdAt,updatedAt,isRCloneBackend);

@override
String toString() {
  return 'DriveProviderModel(remoteName: $remoteName, folderName: $folderName, provider: $provider, backend: $backend, createdAt: $createdAt, updatedAt: $updatedAt, isRCloneBackend: $isRCloneBackend)';
}


}

/// @nodoc
abstract mixin class $DriveProviderModelCopyWith<$Res>  {
  factory $DriveProviderModelCopyWith(DriveProviderModel value, $Res Function(DriveProviderModel) _then) = _$DriveProviderModelCopyWithImpl;
@useResult
$Res call({
 String remoteName, String folderName, DriveProvider provider, DriveProviderBackend backend, String createdAt, String updatedAt, bool isRCloneBackend
});


$DriveProviderCopyWith<$Res> get provider;$DriveProviderBackendCopyWith<$Res> get backend;

}
/// @nodoc
class _$DriveProviderModelCopyWithImpl<$Res>
    implements $DriveProviderModelCopyWith<$Res> {
  _$DriveProviderModelCopyWithImpl(this._self, this._then);

  final DriveProviderModel _self;
  final $Res Function(DriveProviderModel) _then;

/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteName = null,Object? folderName = null,Object? provider = null,Object? backend = null,Object? createdAt = null,Object? updatedAt = null,Object? isRCloneBackend = null,}) {
  return _then(_self.copyWith(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,backend: null == backend ? _self.backend : backend // ignore: cast_nullable_to_non_nullable
as DriveProviderBackend,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isRCloneBackend: null == isRCloneBackend ? _self.isRCloneBackend : isRCloneBackend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderCopyWith<$Res> get provider {
  
  return $DriveProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderBackendCopyWith<$Res> get backend {
  
  return $DriveProviderBackendCopyWith<$Res>(_self.backend, (value) {
    return _then(_self.copyWith(backend: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _DriveProviderModel implements DriveProviderModel {
  const _DriveProviderModel({required this.remoteName, required this.folderName, required this.provider, required this.backend, required this.createdAt, required this.updatedAt, required this.isRCloneBackend});
  factory _DriveProviderModel.fromJson(Map<String, dynamic> json) => _$DriveProviderModelFromJson(json);

@override final  String remoteName;
@override final  String folderName;
@override final  DriveProvider provider;
@override final  DriveProviderBackend backend;
@override final  String createdAt;
@override final  String updatedAt;
@override final  bool isRCloneBackend;

/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriveProviderModelCopyWith<_DriveProviderModel> get copyWith => __$DriveProviderModelCopyWithImpl<_DriveProviderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriveProviderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriveProviderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.folderName, folderName) || other.folderName == folderName)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.backend, backend) || other.backend == backend)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isRCloneBackend, isRCloneBackend) || other.isRCloneBackend == isRCloneBackend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,folderName,provider,backend,createdAt,updatedAt,isRCloneBackend);

@override
String toString() {
  return 'DriveProviderModel(remoteName: $remoteName, folderName: $folderName, provider: $provider, backend: $backend, createdAt: $createdAt, updatedAt: $updatedAt, isRCloneBackend: $isRCloneBackend)';
}


}

/// @nodoc
abstract mixin class _$DriveProviderModelCopyWith<$Res> implements $DriveProviderModelCopyWith<$Res> {
  factory _$DriveProviderModelCopyWith(_DriveProviderModel value, $Res Function(_DriveProviderModel) _then) = __$DriveProviderModelCopyWithImpl;
@override @useResult
$Res call({
 String remoteName, String folderName, DriveProvider provider, DriveProviderBackend backend, String createdAt, String updatedAt, bool isRCloneBackend
});


@override $DriveProviderCopyWith<$Res> get provider;@override $DriveProviderBackendCopyWith<$Res> get backend;

}
/// @nodoc
class __$DriveProviderModelCopyWithImpl<$Res>
    implements _$DriveProviderModelCopyWith<$Res> {
  __$DriveProviderModelCopyWithImpl(this._self, this._then);

  final _DriveProviderModel _self;
  final $Res Function(_DriveProviderModel) _then;

/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteName = null,Object? folderName = null,Object? provider = null,Object? backend = null,Object? createdAt = null,Object? updatedAt = null,Object? isRCloneBackend = null,}) {
  return _then(_DriveProviderModel(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,folderName: null == folderName ? _self.folderName : folderName // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,backend: null == backend ? _self.backend : backend // ignore: cast_nullable_to_non_nullable
as DriveProviderBackend,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,isRCloneBackend: null == isRCloneBackend ? _self.isRCloneBackend : isRCloneBackend // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderCopyWith<$Res> get provider {
  
  return $DriveProviderCopyWith<$Res>(_self.provider, (value) {
    return _then(_self.copyWith(provider: value));
  });
}/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriveProviderBackendCopyWith<$Res> get backend {
  
  return $DriveProviderBackendCopyWith<$Res>(_self.backend, (value) {
    return _then(_self.copyWith(backend: value));
  });
}
}

// dart format on
