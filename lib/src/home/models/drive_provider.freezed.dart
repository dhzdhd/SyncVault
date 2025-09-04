// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
