// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drive_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriveInfoModel implements DiagnosticableTreeMixin {
  Option<int> get remainingStorage;
  Option<int> get usedStorage;
  Option<int> get totalStorage;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DriveInfoModelCopyWith<DriveInfoModel> get copyWith =>
      _$DriveInfoModelCopyWithImpl<DriveInfoModel>(
          this as DriveInfoModel, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is DriveInfoModel &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DriveInfoModel(remainingStorage: $remainingStorage, usedStorage: $usedStorage, totalStorage: $totalStorage)';
  }
}

/// @nodoc
abstract mixin class $DriveInfoModelCopyWith<$Res> {
  factory $DriveInfoModelCopyWith(
          DriveInfoModel value, $Res Function(DriveInfoModel) _then) =
      _$DriveInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {Option<int> remainingStorage,
      Option<int> usedStorage,
      Option<int> totalStorage});
}

/// @nodoc
class _$DriveInfoModelCopyWithImpl<$Res>
    implements $DriveInfoModelCopyWith<$Res> {
  _$DriveInfoModelCopyWithImpl(this._self, this._then);

  final DriveInfoModel _self;
  final $Res Function(DriveInfoModel) _then;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
    Object? totalStorage = null,
  }) {
    return _then(_self.copyWith(
      remainingStorage: null == remainingStorage
          ? _self.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      usedStorage: null == usedStorage
          ? _self.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      totalStorage: null == totalStorage
          ? _self.totalStorage
          : totalStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
    ));
  }
}

/// @nodoc

class _DriveInfoModel with DiagnosticableTreeMixin implements DriveInfoModel {
  const _DriveInfoModel(
      {required this.remainingStorage,
      required this.usedStorage,
      required this.totalStorage});

  @override
  final Option<int> remainingStorage;
  @override
  final Option<int> usedStorage;
  @override
  final Option<int> totalStorage;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DriveInfoModelCopyWith<_DriveInfoModel> get copyWith =>
      __$DriveInfoModelCopyWithImpl<_DriveInfoModel>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _DriveInfoModel &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DriveInfoModel(remainingStorage: $remainingStorage, usedStorage: $usedStorage, totalStorage: $totalStorage)';
  }
}

/// @nodoc
abstract mixin class _$DriveInfoModelCopyWith<$Res>
    implements $DriveInfoModelCopyWith<$Res> {
  factory _$DriveInfoModelCopyWith(
          _DriveInfoModel value, $Res Function(_DriveInfoModel) _then) =
      __$DriveInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Option<int> remainingStorage,
      Option<int> usedStorage,
      Option<int> totalStorage});
}

/// @nodoc
class __$DriveInfoModelCopyWithImpl<$Res>
    implements _$DriveInfoModelCopyWith<$Res> {
  __$DriveInfoModelCopyWithImpl(this._self, this._then);

  final _DriveInfoModel _self;
  final $Res Function(_DriveInfoModel) _then;

  /// Create a copy of DriveInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
    Object? totalStorage = null,
  }) {
    return _then(_DriveInfoModel(
      remainingStorage: null == remainingStorage
          ? _self.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      usedStorage: null == usedStorage
          ? _self.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      totalStorage: null == totalStorage
          ? _self.totalStorage
          : totalStorage // ignore: cast_nullable_to_non_nullable
              as Option<int>,
    ));
  }
}

// dart format on
