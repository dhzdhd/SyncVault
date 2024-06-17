// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloud_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CloudFileModel _$CloudFileModelFromJson(Map<String, dynamic> json) {
  return _CloudFileModel.fromJson(json);
}

/// @nodoc
mixin _$CloudFileModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isDirectory =>
      throw _privateConstructorUsedError; // Relative to root folder defined in FolderModel
  @UriConverter()
  Uri get path => throw _privateConstructorUsedError;
  Option<String> get parentId => throw _privateConstructorUsedError;
  List<CloudFileModel> get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CloudFileModelCopyWith<CloudFileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudFileModelCopyWith<$Res> {
  factory $CloudFileModelCopyWith(
          CloudFileModel value, $Res Function(CloudFileModel) then) =
      _$CloudFileModelCopyWithImpl<$Res, CloudFileModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool isDirectory,
      @UriConverter() Uri path,
      Option<String> parentId,
      List<CloudFileModel> children});
}

/// @nodoc
class _$CloudFileModelCopyWithImpl<$Res, $Val extends CloudFileModel>
    implements $CloudFileModelCopyWith<$Res> {
  _$CloudFileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isDirectory = null,
    Object? path = null,
    Object? parentId = null,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDirectory: null == isDirectory
          ? _value.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as Uri,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CloudFileModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CloudFileModelImplCopyWith<$Res>
    implements $CloudFileModelCopyWith<$Res> {
  factory _$$CloudFileModelImplCopyWith(_$CloudFileModelImpl value,
          $Res Function(_$CloudFileModelImpl) then) =
      __$$CloudFileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool isDirectory,
      @UriConverter() Uri path,
      Option<String> parentId,
      List<CloudFileModel> children});
}

/// @nodoc
class __$$CloudFileModelImplCopyWithImpl<$Res>
    extends _$CloudFileModelCopyWithImpl<$Res, _$CloudFileModelImpl>
    implements _$$CloudFileModelImplCopyWith<$Res> {
  __$$CloudFileModelImplCopyWithImpl(
      _$CloudFileModelImpl _value, $Res Function(_$CloudFileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isDirectory = null,
    Object? path = null,
    Object? parentId = null,
    Object? children = null,
  }) {
    return _then(_$CloudFileModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isDirectory: null == isDirectory
          ? _value.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as Uri,
      parentId: null == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<CloudFileModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudFileModelImpl implements _CloudFileModel {
  const _$CloudFileModelImpl(
      {required this.id,
      required this.name,
      required this.isDirectory,
      @UriConverter() required this.path,
      required this.parentId,
      required this.children});

  factory _$CloudFileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudFileModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool isDirectory;
// Relative to root folder defined in FolderModel
  @override
  @UriConverter()
  final Uri path;
  @override
  final Option<String> parentId;
  @override
  final List<CloudFileModel> children;

  @override
  String toString() {
    return 'CloudFileModel(id: $id, name: $name, isDirectory: $isDirectory, path: $path, parentId: $parentId, children: $children)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudFileModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDirectory, isDirectory) ||
                other.isDirectory == isDirectory) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isDirectory, path,
      parentId, const DeepCollectionEquality().hash(children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudFileModelImplCopyWith<_$CloudFileModelImpl> get copyWith =>
      __$$CloudFileModelImplCopyWithImpl<_$CloudFileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudFileModelImplToJson(
      this,
    );
  }
}

abstract class _CloudFileModel implements CloudFileModel {
  const factory _CloudFileModel(
      {required final String id,
      required final String name,
      required final bool isDirectory,
      @UriConverter() required final Uri path,
      required final Option<String> parentId,
      required final List<CloudFileModel> children}) = _$CloudFileModelImpl;

  factory _CloudFileModel.fromJson(Map<String, dynamic> json) =
      _$CloudFileModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isDirectory;
  @override // Relative to root folder defined in FolderModel
  @UriConverter()
  Uri get path;
  @override
  Option<String> get parentId;
  @override
  List<CloudFileModel> get children;
  @override
  @JsonKey(ignore: true)
  _$$CloudFileModelImplCopyWith<_$CloudFileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
