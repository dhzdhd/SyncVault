// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriveModel _$DriveModelFromJson(Map<String, dynamic> json) {
  return _DriveModel.fromJson(json);
}

/// @nodoc
mixin _$DriveModel {
// Can change to pointer to authProvider to remove redundancy
  List<AuthProviderModel> get models => throw _privateConstructorUsedError;
  String get localPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriveModelCopyWith<DriveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveModelCopyWith<$Res> {
  factory $DriveModelCopyWith(
          DriveModel value, $Res Function(DriveModel) then) =
      _$DriveModelCopyWithImpl<$Res, DriveModel>;
  @useResult
  $Res call({List<AuthProviderModel> models, String localPath});
}

/// @nodoc
class _$DriveModelCopyWithImpl<$Res, $Val extends DriveModel>
    implements $DriveModelCopyWith<$Res> {
  _$DriveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_DriveModelCopyWith<$Res>
    implements $DriveModelCopyWith<$Res> {
  factory _$$_DriveModelCopyWith(
          _$_DriveModel value, $Res Function(_$_DriveModel) then) =
      __$$_DriveModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AuthProviderModel> models, String localPath});
}

/// @nodoc
class __$$_DriveModelCopyWithImpl<$Res>
    extends _$DriveModelCopyWithImpl<$Res, _$_DriveModel>
    implements _$$_DriveModelCopyWith<$Res> {
  __$$_DriveModelCopyWithImpl(
      _$_DriveModel _value, $Res Function(_$_DriveModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? models = null,
    Object? localPath = null,
  }) {
    return _then(_$_DriveModel(
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
class _$_DriveModel with DiagnosticableTreeMixin implements _DriveModel {
  const _$_DriveModel(
      {required final List<AuthProviderModel> models, required this.localPath})
      : _models = models;

  factory _$_DriveModel.fromJson(Map<String, dynamic> json) =>
      _$$_DriveModelFromJson(json);

// Can change to pointer to authProvider to remove redundancy
  final List<AuthProviderModel> _models;
// Can change to pointer to authProvider to remove redundancy
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
    return 'DriveModel(models: $models, localPath: $localPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DriveModel'))
      ..add(DiagnosticsProperty('models', models))
      ..add(DiagnosticsProperty('localPath', localPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DriveModel &&
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
  _$$_DriveModelCopyWith<_$_DriveModel> get copyWith =>
      __$$_DriveModelCopyWithImpl<_$_DriveModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DriveModelToJson(
      this,
    );
  }
}

abstract class _DriveModel implements DriveModel {
  const factory _DriveModel(
      {required final List<AuthProviderModel> models,
      required final String localPath}) = _$_DriveModel;

  factory _DriveModel.fromJson(Map<String, dynamic> json) =
      _$_DriveModel.fromJson;

  @override // Can change to pointer to authProvider to remove redundancy
  List<AuthProviderModel> get models;
  @override
  String get localPath;
  @override
  @JsonKey(ignore: true)
  _$$_DriveModelCopyWith<_$_DriveModel> get copyWith =>
      throw _privateConstructorUsedError;
}
