// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_provider_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthProviderModel _$AuthProviderModelFromJson(Map<String, dynamic> json) {
  return _AuthProviderModel.fromJson(json);
}

/// @nodoc
mixin _$AuthProviderModel {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthProviderModelCopyWith<AuthProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProviderModelCopyWith<$Res> {
  factory $AuthProviderModelCopyWith(
          AuthProviderModel value, $Res Function(AuthProviderModel) then) =
      _$AuthProviderModelCopyWithImpl<$Res, AuthProviderModel>;
  @useResult
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class _$AuthProviderModelCopyWithImpl<$Res, $Val extends AuthProviderModel>
    implements $AuthProviderModelCopyWith<$Res> {
  _$AuthProviderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthProviderModelCopyWith<$Res>
    implements $AuthProviderModelCopyWith<$Res> {
  factory _$$_AuthProviderModelCopyWith(_$_AuthProviderModel value,
          $Res Function(_$_AuthProviderModel) then) =
      __$$_AuthProviderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String firstName, String lastName, int age});
}

/// @nodoc
class __$$_AuthProviderModelCopyWithImpl<$Res>
    extends _$AuthProviderModelCopyWithImpl<$Res, _$_AuthProviderModel>
    implements _$$_AuthProviderModelCopyWith<$Res> {
  __$$_AuthProviderModelCopyWithImpl(
      _$_AuthProviderModel _value, $Res Function(_$_AuthProviderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? age = null,
  }) {
    return _then(_$_AuthProviderModel(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthProviderModel
    with DiagnosticableTreeMixin
    implements _AuthProviderModel {
  const _$_AuthProviderModel(
      {required this.firstName, required this.lastName, required this.age});

  factory _$_AuthProviderModel.fromJson(Map<String, dynamic> json) =>
      _$$_AuthProviderModelFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final int age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthProviderModel(firstName: $firstName, lastName: $lastName, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthProviderModel'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthProviderModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.age, age) || other.age == age));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, age);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthProviderModelCopyWith<_$_AuthProviderModel> get copyWith =>
      __$$_AuthProviderModelCopyWithImpl<_$_AuthProviderModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthProviderModelToJson(
      this,
    );
  }
}

abstract class _AuthProviderModel implements AuthProviderModel {
  const factory _AuthProviderModel(
      {required final String firstName,
      required final String lastName,
      required final int age}) = _$_AuthProviderModel;

  factory _AuthProviderModel.fromJson(Map<String, dynamic> json) =
      _$_AuthProviderModel.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  int get age;
  @override
  @JsonKey(ignore: true)
  _$$_AuthProviderModelCopyWith<_$_AuthProviderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
