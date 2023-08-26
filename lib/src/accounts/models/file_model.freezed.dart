// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
mixin _$FileModel {
  Option<String> get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  bool get isDir => throw _privateConstructorUsedError;
  String get parentPath => throw _privateConstructorUsedError;
  Option<String> get child => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res, FileModel>;
  @useResult
  $Res call(
      {Option<String> id,
      String name,
      String path,
      bool isDir,
      String parentPath,
      Option<String> child});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res, $Val extends FileModel>
    implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? isDir = null,
    Object? parentPath = null,
    Object? child = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      isDir: null == isDir
          ? _value.isDir
          : isDir // ignore: cast_nullable_to_non_nullable
              as bool,
      parentPath: null == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$$_FileModelCopyWith(
          _$_FileModel value, $Res Function(_$_FileModel) then) =
      __$$_FileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<String> id,
      String name,
      String path,
      bool isDir,
      String parentPath,
      Option<String> child});
}

/// @nodoc
class __$$_FileModelCopyWithImpl<$Res>
    extends _$FileModelCopyWithImpl<$Res, _$_FileModel>
    implements _$$_FileModelCopyWith<$Res> {
  __$$_FileModelCopyWithImpl(
      _$_FileModel _value, $Res Function(_$_FileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? isDir = null,
    Object? parentPath = null,
    Object? child = null,
  }) {
    return _then(_$_FileModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as Option<String>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      isDir: null == isDir
          ? _value.isDir
          : isDir // ignore: cast_nullable_to_non_nullable
              as bool,
      parentPath: null == parentPath
          ? _value.parentPath
          : parentPath // ignore: cast_nullable_to_non_nullable
              as String,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Option<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileModel with DiagnosticableTreeMixin implements _FileModel {
  const _$_FileModel(
      {required this.id,
      required this.name,
      required this.path,
      required this.isDir,
      required this.parentPath,
      required this.child});

  factory _$_FileModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileModelFromJson(json);

  @override
  final Option<String> id;
  @override
  final String name;
  @override
  final String path;
  @override
  final bool isDir;
  @override
  final String parentPath;
  @override
  final Option<String> child;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FileModel(id: $id, name: $name, path: $path, isDir: $isDir, parentPath: $parentPath, child: $child)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FileModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('path', path))
      ..add(DiagnosticsProperty('isDir', isDir))
      ..add(DiagnosticsProperty('parentPath', parentPath))
      ..add(DiagnosticsProperty('child', child));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.isDir, isDir) || other.isDir == isDir) &&
            (identical(other.parentPath, parentPath) ||
                other.parentPath == parentPath) &&
            (identical(other.child, child) || other.child == child));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, path, isDir, parentPath, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileModelCopyWith<_$_FileModel> get copyWith =>
      __$$_FileModelCopyWithImpl<_$_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileModelToJson(
      this,
    );
  }
}

abstract class _FileModel implements FileModel {
  const factory _FileModel(
      {required final Option<String> id,
      required final String name,
      required final String path,
      required final bool isDir,
      required final String parentPath,
      required final Option<String> child}) = _$_FileModel;

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$_FileModel.fromJson;

  @override
  Option<String> get id;
  @override
  String get name;
  @override
  String get path;
  @override
  bool get isDir;
  @override
  String get parentPath;
  @override
  Option<String> get child;
  @override
  @JsonKey(ignore: true)
  _$$_FileModelCopyWith<_$_FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
