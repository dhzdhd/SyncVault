// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workflow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkflowModel {
  String get name;
  String? get workflowJson;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkflowModelCopyWith<WorkflowModel> get copyWith =>
      _$WorkflowModelCopyWithImpl<WorkflowModel>(
          this as WorkflowModel, _$identity);

  /// Serializes this WorkflowModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkflowModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workflowJson, workflowJson) ||
                other.workflowJson == workflowJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, workflowJson);

  @override
  String toString() {
    return 'WorkflowModel(name: $name, workflowJson: $workflowJson)';
  }
}

/// @nodoc
abstract mixin class $WorkflowModelCopyWith<$Res> {
  factory $WorkflowModelCopyWith(
          WorkflowModel value, $Res Function(WorkflowModel) _then) =
      _$WorkflowModelCopyWithImpl;
  @useResult
  $Res call({String name, String? workflowJson});
}

/// @nodoc
class _$WorkflowModelCopyWithImpl<$Res>
    implements $WorkflowModelCopyWith<$Res> {
  _$WorkflowModelCopyWithImpl(this._self, this._then);

  final WorkflowModel _self;
  final $Res Function(WorkflowModel) _then;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? workflowJson = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workflowJson: freezed == workflowJson
          ? _self.workflowJson
          : workflowJson // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkflowModel implements WorkflowModel {
  const _WorkflowModel({required this.name, required this.workflowJson});
  factory _WorkflowModel.fromJson(Map<String, dynamic> json) =>
      _$WorkflowModelFromJson(json);

  @override
  final String name;
  @override
  final String? workflowJson;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkflowModelCopyWith<_WorkflowModel> get copyWith =>
      __$WorkflowModelCopyWithImpl<_WorkflowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkflowModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkflowModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.workflowJson, workflowJson) ||
                other.workflowJson == workflowJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, workflowJson);

  @override
  String toString() {
    return 'WorkflowModel(name: $name, workflowJson: $workflowJson)';
  }
}

/// @nodoc
abstract mixin class _$WorkflowModelCopyWith<$Res>
    implements $WorkflowModelCopyWith<$Res> {
  factory _$WorkflowModelCopyWith(
          _WorkflowModel value, $Res Function(_WorkflowModel) _then) =
      __$WorkflowModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String? workflowJson});
}

/// @nodoc
class __$WorkflowModelCopyWithImpl<$Res>
    implements _$WorkflowModelCopyWith<$Res> {
  __$WorkflowModelCopyWithImpl(this._self, this._then);

  final _WorkflowModel _self;
  final $Res Function(_WorkflowModel) _then;

  /// Create a copy of WorkflowModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? workflowJson = freezed,
  }) {
    return _then(_WorkflowModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      workflowJson: freezed == workflowJson
          ? _self.workflowJson
          : workflowJson // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
