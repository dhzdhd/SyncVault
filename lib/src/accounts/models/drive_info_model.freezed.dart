// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DriveInfoModel {
  Option<int> get remainingStorage => throw _privateConstructorUsedError;
  Option<int> get usedStorage => throw _privateConstructorUsedError;
  Option<int> get totalStorage => throw _privateConstructorUsedError;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DriveInfoModelCopyWith<DriveInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriveInfoModelCopyWith<$Res> {
  factory $DriveInfoModelCopyWith(
          DriveInfoModel value, $Res Function(DriveInfoModel) then) =
      _$DriveInfoModelCopyWithImpl<$Res, DriveInfoModel>;
  @useResult
  $Res call(
      {Option<int> remainingStorage,
      Option<int> usedStorage,
      Option<int> totalStorage});
}

/// @nodoc
class _$DriveInfoModelCopyWithImpl<$Res, $Val extends DriveInfoModel>
    implements $DriveInfoModelCopyWith<$Res> {
  _$DriveInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
    Object? totalStorage = null,
  }) {
    return _then(_value.copyWith(
      remainingStorage: null == remainingStorage
          ? _value.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      usedStorage: null == usedStorage
          ? _value.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      totalStorage: null == totalStorage
          ? _value.totalStorage
          : totalStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriveInfoModelImplCopyWith<$Res>
    implements $DriveInfoModelCopyWith<$Res> {
  factory _$$DriveInfoModelImplCopyWith(_$DriveInfoModelImpl value,
          $Res Function(_$DriveInfoModelImpl) then) =
      __$$DriveInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<int> remainingStorage,
      Option<int> usedStorage,
      Option<int> totalStorage});
}

/// @nodoc
class __$$DriveInfoModelImplCopyWithImpl<$Res>
    extends _$DriveInfoModelCopyWithImpl<$Res, _$DriveInfoModelImpl>
    implements _$$DriveInfoModelImplCopyWith<$Res> {
  __$$DriveInfoModelImplCopyWithImpl(
      _$DriveInfoModelImpl _value, $Res Function(_$DriveInfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
    Object? totalStorage = null,
  }) {
    return _then(_$DriveInfoModelImpl(
      remainingStorage: null == remainingStorage
          ? _value.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      usedStorage: null == usedStorage
          ? _value.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      totalStorage: null == totalStorage
          ? _value.totalStorage
          : totalStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
    ));
  }
}

/// @nodoc

class _$DriveInfoModelImpl
    with DiagnosticableTreeMixin
    implements _DriveInfoModel {
  const _$DriveInfoModelImpl(
      {required this.remainingStorage,
      required this.usedStorage,
      required this.totalStorage});

  @override
  final Option<int> remainingStorage;
  @override
  final Option<int> usedStorage;
  @override
  final Option<int> totalStorage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DriveInfoModel(remainingStorage: $remainingStorage, usedStorage: $usedStorage, totalStorage: $totalStorage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DriveInfoModel'))
      ..add(DiagnosticsProperty('remainingStorage', remainingStorage))
      ..add(DiagnosticsProperty('usedStorage', usedStorage))
      ..add(DiagnosticsProperty('totalStorage', totalStorage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriveInfoModelImpl &&
            (identical(other.remainingStorage, remainingStorage) ||
                other.remainingStorage == remainingStorage) &&
            (identical(other.usedStorage, usedStorage) ||
                other.usedStorage == usedStorage) &&
            (identical(other.totalStorage, totalStorage) ||
                other.totalStorage == totalStorage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, remainingStorage, usedStorage, totalStorage);

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DriveInfoModelImplCopyWith<_$DriveInfoModelImpl> get copyWith =>
      __$$DriveInfoModelImplCopyWithImpl<_$DriveInfoModelImpl>(
          this, _$identity);
}

abstract class _DriveInfoModel implements DriveInfoModel {
  const factory _DriveInfoModel(
      {required final Option<int> remainingStorage,
      required final Option<int> usedStorage,
      required final Option<int> totalStorage}) = _$DriveInfoModelImpl;

  @override
  Option<int> get remainingStorage;
  @override
  Option<int> get usedStorage;
  @override
  Option<int> get totalStorage;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DriveInfoModelImplCopyWith<_$DriveInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
