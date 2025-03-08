// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkflowModel _$WorkflowModelFromJson(Map<String, dynamic> json) {
  return _WorkflowModel.fromJson(json);
}

/// @nodoc
mixin _$WorkflowModel {
  String get name => throw _privateConstructorUsedError;
  String? get workflowJson => throw _privateConstructorUsedError;

  /// Serializes this WorkflowModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkflowModelCopyWith<WorkflowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkflowModelCopyWith<$Res> {
  factory $WorkflowModelCopyWith(
          WorkflowModel value, $Res Function(WorkflowModel) then) =
      _$WorkflowModelCopyWithImpl<$Res, WorkflowModel>;
  @useResult
  $Res call({String name, String? workflowJson});
}

/// @nodoc
class _$WorkflowModelCopyWithImpl<$Res, $Val extends WorkflowModel>
    implements $WorkflowModelCopyWith<$Res> {
  _$WorkflowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workflowJson = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workflowJson: freezed == workflowJson
          ? _value.workflowJson
          : workflowJson // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkflowModelImplCopyWith<$Res>
    implements $WorkflowModelCopyWith<$Res> {
  factory _$$WorkflowModelImplCopyWith(
          _$WorkflowModelImpl value, $Res Function(_$WorkflowModelImpl) then) =
      __$$WorkflowModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? workflowJson});
}

/// @nodoc
class __$$WorkflowModelImplCopyWithImpl<$Res>
    extends _$WorkflowModelCopyWithImpl<$Res, _$WorkflowModelImpl>
    implements _$$WorkflowModelImplCopyWith<$Res> {
  __$$WorkflowModelImplCopyWithImpl(
      _$WorkflowModelImpl _value, $Res Function(_$WorkflowModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workflowJson = freezed,
  }) {
    return _then(_$WorkflowModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workflowJson: freezed == workflowJson
          ? _value.workflowJson
          : workflowJson // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkflowModelImpl implements _WorkflowModel {
  const _$WorkflowModelImpl({required this.name, required this.workflowJson});

  factory _$WorkflowModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkflowModelImplFromJson(json);

  @override
  final String name;
  @override
  final String? workflowJson;

  @override
  String toString() {
    return 'WorkflowModel(name: $name, workflowJson: $workflowJson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkflowModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workflowJson, workflowJson) ||
                other.workflowJson == workflowJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, workflowJson);

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkflowModelImplCopyWith<_$WorkflowModelImpl> get copyWith =>
      __$$WorkflowModelImplCopyWithImpl<_$WorkflowModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkflowModelImplToJson(
      this,
    );
  }
}

abstract class _WorkflowModel implements WorkflowModel {
  const factory _WorkflowModel(
      {required final String name,
      required final String? workflowJson}) = _$WorkflowModelImpl;

  factory _WorkflowModel.fromJson(Map<String, dynamic> json) =
      _$WorkflowModelImpl.fromJson;

  @override
  String get name;
  @override
  String? get workflowJson;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkflowModelImplCopyWith<_$WorkflowModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
