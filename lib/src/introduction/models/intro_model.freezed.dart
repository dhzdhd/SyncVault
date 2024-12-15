// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IntroSettingsModel _$IntroSettingsModelFromJson(Map<String, dynamic> json) {
  return _IntroSettingsModel.fromJson(json);
}

/// @nodoc
mixin _$IntroSettingsModel {
  bool get alreadyViewed => throw _privateConstructorUsedError;

  /// Serializes this IntroSettingsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IntroSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IntroSettingsModelCopyWith<IntroSettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroSettingsModelCopyWith<$Res> {
  factory $IntroSettingsModelCopyWith(
          IntroSettingsModel value, $Res Function(IntroSettingsModel) then) =
      _$IntroSettingsModelCopyWithImpl<$Res, IntroSettingsModel>;
  @useResult
  $Res call({bool alreadyViewed});
}

/// @nodoc
class _$IntroSettingsModelCopyWithImpl<$Res, $Val extends IntroSettingsModel>
    implements $IntroSettingsModelCopyWith<$Res> {
  _$IntroSettingsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IntroSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alreadyViewed = null,
  }) {
    return _then(_value.copyWith(
      alreadyViewed: null == alreadyViewed
          ? _value.alreadyViewed
          : alreadyViewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntroSettingsModelImplCopyWith<$Res>
    implements $IntroSettingsModelCopyWith<$Res> {
  factory _$$IntroSettingsModelImplCopyWith(_$IntroSettingsModelImpl value,
          $Res Function(_$IntroSettingsModelImpl) then) =
      __$$IntroSettingsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool alreadyViewed});
}

/// @nodoc
class __$$IntroSettingsModelImplCopyWithImpl<$Res>
    extends _$IntroSettingsModelCopyWithImpl<$Res, _$IntroSettingsModelImpl>
    implements _$$IntroSettingsModelImplCopyWith<$Res> {
  __$$IntroSettingsModelImplCopyWithImpl(_$IntroSettingsModelImpl _value,
      $Res Function(_$IntroSettingsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IntroSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alreadyViewed = null,
  }) {
    return _then(_$IntroSettingsModelImpl(
      alreadyViewed: null == alreadyViewed
          ? _value.alreadyViewed
          : alreadyViewed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntroSettingsModelImpl implements _IntroSettingsModel {
  const _$IntroSettingsModelImpl({required this.alreadyViewed});

  factory _$IntroSettingsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntroSettingsModelImplFromJson(json);

  @override
  final bool alreadyViewed;

  @override
  String toString() {
    return 'IntroSettingsModel(alreadyViewed: $alreadyViewed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntroSettingsModelImpl &&
            (identical(other.alreadyViewed, alreadyViewed) ||
                other.alreadyViewed == alreadyViewed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, alreadyViewed);

  /// Create a copy of IntroSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IntroSettingsModelImplCopyWith<_$IntroSettingsModelImpl> get copyWith =>
      __$$IntroSettingsModelImplCopyWithImpl<_$IntroSettingsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntroSettingsModelImplToJson(
      this,
    );
  }
}

abstract class _IntroSettingsModel implements IntroSettingsModel {
  const factory _IntroSettingsModel({required final bool alreadyViewed}) =
      _$IntroSettingsModelImpl;

  factory _IntroSettingsModel.fromJson(Map<String, dynamic> json) =
      _$IntroSettingsModelImpl.fromJson;

  @override
  bool get alreadyViewed;

  /// Create a copy of IntroSettingsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IntroSettingsModelImplCopyWith<_$IntroSettingsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
