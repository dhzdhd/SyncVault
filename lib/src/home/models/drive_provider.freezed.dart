// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DriveProvider _$DriveProviderFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'oneDrive':
          return OneDriveProvider.fromJson(
            json
          );
                case 'googleDrive':
          return GoogleDriveProvider.fromJson(
            json
          );
                case 'dropBox':
          return DropBoxProvider.fromJson(
            json
          );
                case 'protonDrive':
          return ProtonDriveProvider.fromJson(
            json
          );
                case 'minio':
          return MinioProvider.fromJson(
            json
          );
                case 'nextCloud':
          return NextCloudProvider.fromJson(
            json
          );
                case 'local':
          return LocalProvider.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'DriveProvider',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$DriveProvider {



  /// Serializes this DriveProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriveProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider()';
}


}

/// @nodoc
class $DriveProviderCopyWith<$Res>  {
$DriveProviderCopyWith(DriveProvider _, $Res Function(DriveProvider) __);
}


/// Adds pattern-matching-related methods to [DriveProvider].
extension DriveProviderPatterns on DriveProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OneDriveProvider value)?  oneDrive,TResult Function( GoogleDriveProvider value)?  googleDrive,TResult Function( DropBoxProvider value)?  dropBox,TResult Function( ProtonDriveProvider value)?  protonDrive,TResult Function( MinioProvider value)?  minio,TResult Function( NextCloudProvider value)?  nextCloud,TResult Function( LocalProvider value)?  local,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OneDriveProvider() when oneDrive != null:
return oneDrive(_that);case GoogleDriveProvider() when googleDrive != null:
return googleDrive(_that);case DropBoxProvider() when dropBox != null:
return dropBox(_that);case ProtonDriveProvider() when protonDrive != null:
return protonDrive(_that);case MinioProvider() when minio != null:
return minio(_that);case NextCloudProvider() when nextCloud != null:
return nextCloud(_that);case LocalProvider() when local != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OneDriveProvider value)  oneDrive,required TResult Function( GoogleDriveProvider value)  googleDrive,required TResult Function( DropBoxProvider value)  dropBox,required TResult Function( ProtonDriveProvider value)  protonDrive,required TResult Function( MinioProvider value)  minio,required TResult Function( NextCloudProvider value)  nextCloud,required TResult Function( LocalProvider value)  local,}){
final _that = this;
switch (_that) {
case OneDriveProvider():
return oneDrive(_that);case GoogleDriveProvider():
return googleDrive(_that);case DropBoxProvider():
return dropBox(_that);case ProtonDriveProvider():
return protonDrive(_that);case MinioProvider():
return minio(_that);case NextCloudProvider():
return nextCloud(_that);case LocalProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OneDriveProvider value)?  oneDrive,TResult? Function( GoogleDriveProvider value)?  googleDrive,TResult? Function( DropBoxProvider value)?  dropBox,TResult? Function( ProtonDriveProvider value)?  protonDrive,TResult? Function( MinioProvider value)?  minio,TResult? Function( NextCloudProvider value)?  nextCloud,TResult? Function( LocalProvider value)?  local,}){
final _that = this;
switch (_that) {
case OneDriveProvider() when oneDrive != null:
return oneDrive(_that);case GoogleDriveProvider() when googleDrive != null:
return googleDrive(_that);case DropBoxProvider() when dropBox != null:
return dropBox(_that);case ProtonDriveProvider() when protonDrive != null:
return protonDrive(_that);case MinioProvider() when minio != null:
return minio(_that);case NextCloudProvider() when nextCloud != null:
return nextCloud(_that);case LocalProvider() when local != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  oneDrive,TResult Function()?  googleDrive,TResult Function()?  dropBox,TResult Function()?  protonDrive,TResult Function()?  minio,TResult Function()?  nextCloud,TResult Function()?  local,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OneDriveProvider() when oneDrive != null:
return oneDrive();case GoogleDriveProvider() when googleDrive != null:
return googleDrive();case DropBoxProvider() when dropBox != null:
return dropBox();case ProtonDriveProvider() when protonDrive != null:
return protonDrive();case MinioProvider() when minio != null:
return minio();case NextCloudProvider() when nextCloud != null:
return nextCloud();case LocalProvider() when local != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  oneDrive,required TResult Function()  googleDrive,required TResult Function()  dropBox,required TResult Function()  protonDrive,required TResult Function()  minio,required TResult Function()  nextCloud,required TResult Function()  local,}) {final _that = this;
switch (_that) {
case OneDriveProvider():
return oneDrive();case GoogleDriveProvider():
return googleDrive();case DropBoxProvider():
return dropBox();case ProtonDriveProvider():
return protonDrive();case MinioProvider():
return minio();case NextCloudProvider():
return nextCloud();case LocalProvider():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  oneDrive,TResult? Function()?  googleDrive,TResult? Function()?  dropBox,TResult? Function()?  protonDrive,TResult? Function()?  minio,TResult? Function()?  nextCloud,TResult? Function()?  local,}) {final _that = this;
switch (_that) {
case OneDriveProvider() when oneDrive != null:
return oneDrive();case GoogleDriveProvider() when googleDrive != null:
return googleDrive();case DropBoxProvider() when dropBox != null:
return dropBox();case ProtonDriveProvider() when protonDrive != null:
return protonDrive();case MinioProvider() when minio != null:
return minio();case NextCloudProvider() when nextCloud != null:
return nextCloud();case LocalProvider() when local != null:
return local();case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class OneDriveProvider extends DriveProvider {
  const OneDriveProvider({final  String? $type}): $type = $type ?? 'oneDrive',super._();
  factory OneDriveProvider.fromJson(Map<String, dynamic> json) => _$OneDriveProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$OneDriveProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OneDriveProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.oneDrive()';
}


}




/// @nodoc
@JsonSerializable()

class GoogleDriveProvider extends DriveProvider {
  const GoogleDriveProvider({final  String? $type}): $type = $type ?? 'googleDrive',super._();
  factory GoogleDriveProvider.fromJson(Map<String, dynamic> json) => _$GoogleDriveProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$GoogleDriveProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleDriveProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.googleDrive()';
}


}




/// @nodoc
@JsonSerializable()

class DropBoxProvider extends DriveProvider {
  const DropBoxProvider({final  String? $type}): $type = $type ?? 'dropBox',super._();
  factory DropBoxProvider.fromJson(Map<String, dynamic> json) => _$DropBoxProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$DropBoxProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DropBoxProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.dropBox()';
}


}




/// @nodoc
@JsonSerializable()

class ProtonDriveProvider extends DriveProvider {
  const ProtonDriveProvider({final  String? $type}): $type = $type ?? 'protonDrive',super._();
  factory ProtonDriveProvider.fromJson(Map<String, dynamic> json) => _$ProtonDriveProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$ProtonDriveProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProtonDriveProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.protonDrive()';
}


}




/// @nodoc
@JsonSerializable()

class MinioProvider extends DriveProvider {
  const MinioProvider({final  String? $type}): $type = $type ?? 'minio',super._();
  factory MinioProvider.fromJson(Map<String, dynamic> json) => _$MinioProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$MinioProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinioProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.minio()';
}


}




/// @nodoc
@JsonSerializable()

class NextCloudProvider extends DriveProvider {
  const NextCloudProvider({final  String? $type}): $type = $type ?? 'nextCloud',super._();
  factory NextCloudProvider.fromJson(Map<String, dynamic> json) => _$NextCloudProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NextCloudProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextCloudProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.nextCloud()';
}


}




/// @nodoc
@JsonSerializable()

class LocalProvider extends DriveProvider {
  const LocalProvider({final  String? $type}): $type = $type ?? 'local',super._();
  factory LocalProvider.fromJson(Map<String, dynamic> json) => _$LocalProviderFromJson(json);



@JsonKey(name: 'runtimeType')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$LocalProviderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalProvider);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DriveProvider.local()';
}


}




// dart format on
