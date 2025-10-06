// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DriveProviderModel _$DriveProviderModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'remote':
          return RemoteProviderModel.fromJson(
            json
          );
                case 'local':
          return LocalProviderModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DriveProviderModel',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DriveProviderModel {



  /// Serializes this DriveProviderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveProviderModel);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProviderModel()';
}


}

/// @nodoc
class $DriveProviderModelCopyWith<$Res>  {
$DriveProviderModelCopyWith(DriveProviderModel _, $Res Function(DriveProviderModel) __);
}


/// Adds pattern-matching-related methods to [DriveProviderModel].
extension DriveProviderModelPatterns on DriveProviderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoteProviderModel value)?  remote,TResult Function( LocalProviderModel value)?  local,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoteProviderModel() when remote != null:
return remote(_that);case LocalProviderModel() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoteProviderModel value)  remote,required TResult Function( LocalProviderModel value)  local,}){
final _that = this;
switch (_that) {
case RemoteProviderModel():
return remote(_that);case LocalProviderModel():
return local(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoteProviderModel value)?  remote,TResult? Function( LocalProviderModel value)?  local,}){
final _that = this;
switch (_that) {
case RemoteProviderModel() when remote != null:
return remote(_that);case LocalProviderModel() when local != null:
return local(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String remoteName,  DriveProvider provider,  DriveProviderBackend backend,  bool isRCloneBackend,  DateTime createdAt,  DateTime updatedAt)?  remote,TResult Function()?  local,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoteProviderModel() when remote != null:
return remote(_that.remoteName,_that.provider,_that.backend,_that.isRCloneBackend,_that.createdAt,_that.updatedAt);case LocalProviderModel() when local != null:
return local();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String remoteName,  DriveProvider provider,  DriveProviderBackend backend,  bool isRCloneBackend,  DateTime createdAt,  DateTime updatedAt)  remote,required TResult Function()  local,}) {final _that = this;
switch (_that) {
case RemoteProviderModel():
return remote(_that.remoteName,_that.provider,_that.backend,_that.isRCloneBackend,_that.createdAt,_that.updatedAt);case LocalProviderModel():
return local();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String remoteName,  DriveProvider provider,  DriveProviderBackend backend,  bool isRCloneBackend,  DateTime createdAt,  DateTime updatedAt)?  remote,TResult? Function()?  local,}) {final _that = this;
switch (_that) {
case RemoteProviderModel() when remote != null:
return remote(_that.remoteName,_that.provider,_that.backend,_that.isRCloneBackend,_that.createdAt,_that.updatedAt);case LocalProviderModel() when local != null:
return local();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class RemoteProviderModel implements DriveProviderModel {
  const RemoteProviderModel({required this.remoteName, required this.provider, required this.backend, required this.isRCloneBackend, required this.createdAt, required this.updatedAt, final  String? $type}): $type = $type ?? 'remote';
  factory RemoteProviderModel.fromJson(Map<String, dynamic> json) => _$RemoteProviderModelFromJson(json);

 final  String remoteName;
 final  DriveProvider provider;
 final  DriveProviderBackend backend;
 final  bool isRCloneBackend;
 final  DateTime createdAt;
 final  DateTime updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteProviderModelCopyWith<RemoteProviderModel> get copyWith => _$RemoteProviderModelCopyWithImpl<RemoteProviderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteProviderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteProviderModel&&(identical(other.remoteName, remoteName) || other.remoteName == remoteName)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.backend, backend) || other.backend == backend)&&(identical(other.isRCloneBackend, isRCloneBackend) || other.isRCloneBackend == isRCloneBackend)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,remoteName,provider,backend,isRCloneBackend,createdAt,updatedAt);

@override
String toString() {
  return 'DriveProviderModel.remote(remoteName: $remoteName, provider: $provider, backend: $backend, isRCloneBackend: $isRCloneBackend, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RemoteProviderModelCopyWith<$Res> implements $DriveProviderModelCopyWith<$Res> {
  factory $RemoteProviderModelCopyWith(RemoteProviderModel value, $Res Function(RemoteProviderModel) _then) = _$RemoteProviderModelCopyWithImpl;
@useResult
$Res call({
 String remoteName, DriveProvider provider, DriveProviderBackend backend, bool isRCloneBackend, DateTime createdAt, DateTime updatedAt
});


$DriveProviderCopyWith<$Res> get provider;$DriveProviderBackendCopyWith<$Res> get backend;

}
/// @nodoc
class _$RemoteProviderModelCopyWithImpl<$Res>
    implements $RemoteProviderModelCopyWith<$Res> {
  _$RemoteProviderModelCopyWithImpl(this._self, this._then);

  final RemoteProviderModel _self;
  final $Res Function(RemoteProviderModel) _then;

/// Create a copy of DriveProviderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteName = null,Object? provider = null,Object? backend = null,Object? isRCloneBackend = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(RemoteProviderModel(
remoteName: null == remoteName ? _self.remoteName : remoteName // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as DriveProvider,backend: null == backend ? _self.backend : backend // ignore: cast_nullable_to_non_nullable
as DriveProviderBackend,isRCloneBackend: null == isRCloneBackend ? _self.isRCloneBackend : isRCloneBackend // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
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

class LocalProviderModel implements DriveProviderModel {
  const LocalProviderModel({final  String? $type}): $type = $type ?? 'local';
  factory LocalProviderModel.fromJson(Map<String, dynamic> json) => _$LocalProviderModelFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LocalProviderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalProviderModel);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProviderModel.local()';
}


}




// dart format on
