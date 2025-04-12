// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileModel implements DiagnosticableTreeMixin {
  String get name;
  String get size;
  @FileSystemEntityConverter()
  FileSystemEntity get file;
  @DirectoryConverter()
  Directory get parent;
  List<FileModel> get children;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<FileModel> get copyWith =>
      _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);

  /// Serializes this FileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FileModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('parent', parent))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(other.children, children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, size, file, parent,
      const DeepCollectionEquality().hash(children));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FileModel(name: $name, size: $size, file: $file, parent: $parent, children: $children)';
  }
}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) =
      _$FileModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String size,
      @FileSystemEntityConverter() FileSystemEntity file,
      @DirectoryConverter() Directory parent,
      List<FileModel> children});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res> implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? file = null,
    Object? parent = null,
    Object? children = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      parent: null == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Directory,
      children: null == children
          ? _self.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FileModel with DiagnosticableTreeMixin implements FileModel {
  const _FileModel(
      {required this.name,
      required this.size,
      @FileSystemEntityConverter() required this.file,
      @DirectoryConverter() required this.parent,
      required final List<FileModel> children})
      : _children = children;
  factory _FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  @override
  final String name;
  @override
  final String size;
  @override
  @FileSystemEntityConverter()
  final FileSystemEntity file;
  @override
  @DirectoryConverter()
  final Directory parent;
  final List<FileModel> _children;
  @override
  List<FileModel> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileModelCopyWith<_FileModel> get copyWith =>
      __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FileModelToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'FileModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('size', size))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('parent', parent))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, size, file, parent,
      const DeepCollectionEquality().hash(_children));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FileModel(name: $name, size: $size, file: $file, parent: $parent, children: $children)';
  }
}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res>
    implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(
          _FileModel value, $Res Function(_FileModel) _then) =
      __$FileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String size,
      @FileSystemEntityConverter() FileSystemEntity file,
      @DirectoryConverter() Directory parent,
      List<FileModel> children});
}

/// @nodoc
class __$FileModelCopyWithImpl<$Res> implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? file = null,
    Object? parent = null,
    Object? children = null,
  }) {
    return _then(_FileModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      parent: null == parent
          ? _self.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as Directory,
      children: null == children
          ? _self._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
    ));
  }
}

// dart format on
