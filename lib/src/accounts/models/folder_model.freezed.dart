// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
mixin _$FolderModel {
  List<AuthProviderModel> get models => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderModelCopyWith<FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderModelCopyWith<$Res> {
  factory $FolderModelCopyWith(
          FolderModel value, $Res Function(FolderModel) then) =
      _$FolderModelCopyWithImpl<$Res, FolderModel>;
  @useResult
  $Res call({List<AuthProviderModel> models, String localPath});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res, $Val extends FolderModel>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? localPath = null,
  }) {
    return _then(_value.copyWith(
      models: null == models
          ? _value.models
          : models // ignore: cast_nullable_to_non_nullable
              as List<AuthProviderModel>,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FolderModelCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$$_FolderModelCopyWith(
          _$_FolderModel value, $Res Function(_$_FolderModel) then) =
      __$$_FolderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AuthProviderModel> models, String localPath});
}

/// @nodoc
class __$$_FolderModelCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$_FolderModel>
    implements _$$_FolderModelCopyWith<$Res> {
  __$$_FolderModelCopyWithImpl(
      _$_FolderModel _value, $Res Function(_$_FolderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? localPath = null,
  }) {
    return _then(_$_FolderModel(
      models: null == models
          ? _value._models
          : models // ignore: cast_nullable_to_non_nullable
              as List<AuthProviderModel>,
      localPath: null == localPath
          ? _value.localPath
          : localPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FolderModel with DiagnosticableTreeMixin implements _FolderModel {
  const _$_FolderModel(
      {required final List<AuthProviderModel> models, required this.localPath})
      : _models = models;

  factory _$_FolderModel.fromJson(Map<String, dynamic> json) =>
      _$$_FolderModelFromJson(json);

  final List<AuthProviderModel> _models;
  @override
  List<AuthProviderModel> get models {
    if (_models is EqualUnmodifiableListView) return _models;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_models);
  }

  @override
  final String localPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolderModel(models: $models, localPath: $localPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FolderModel'))
      ..add(DiagnosticsProperty('models', models))
      ..add(DiagnosticsProperty('localPath', localPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FolderModel &&
            const DeepCollectionEquality().equals(other._models, _models) &&
            (identical(other.localPath, localPath) ||
                other.localPath == localPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_models), localPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FolderModelCopyWith<_$_FolderModel> get copyWith =>
      __$$_FolderModelCopyWithImpl<_$_FolderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderModelToJson(
      this,
    );
  }
}

abstract class _FolderModel implements FolderModel {
  const factory _FolderModel(
      {required final List<AuthProviderModel> models,
      required final String localPath}) = _$_FolderModel;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$_FolderModel.fromJson;

  @override
  List<AuthProviderModel> get models;
  @override
  String get localPath;
  @override
  @JsonKey(ignore: true)
  _$$_FolderModelCopyWith<_$_FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
