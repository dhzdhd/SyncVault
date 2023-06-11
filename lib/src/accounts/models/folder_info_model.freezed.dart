// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FolderInfoModel _$FolderInfoModelFromJson(Map<String, dynamic> json) {
  return _FolderInfoModel.fromJson(json);
}

/// @nodoc
mixin _$FolderInfoModel {
  int get remainingStorage => throw _privateConstructorUsedError;
  int get usedStorage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderInfoModelCopyWith<FolderInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderInfoModelCopyWith<$Res> {
  factory $FolderInfoModelCopyWith(
          FolderInfoModel value, $Res Function(FolderInfoModel) then) =
      _$FolderInfoModelCopyWithImpl<$Res, FolderInfoModel>;
  @useResult
  $Res call({int remainingStorage, int usedStorage});
}

/// @nodoc
class _$FolderInfoModelCopyWithImpl<$Res, $Val extends FolderInfoModel>
    implements $FolderInfoModelCopyWith<$Res> {
  _$FolderInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
  }) {
    return _then(_value.copyWith(
      remainingStorage: null == remainingStorage
          ? _value.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as int,
      usedStorage: null == usedStorage
          ? _value.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FolderInfoModelCopyWith<$Res>
    implements $FolderInfoModelCopyWith<$Res> {
  factory _$$_FolderInfoModelCopyWith(
          _$_FolderInfoModel value, $Res Function(_$_FolderInfoModel) then) =
      __$$_FolderInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int remainingStorage, int usedStorage});
}

/// @nodoc
class __$$_FolderInfoModelCopyWithImpl<$Res>
    extends _$FolderInfoModelCopyWithImpl<$Res, _$_FolderInfoModel>
    implements _$$_FolderInfoModelCopyWith<$Res> {
  __$$_FolderInfoModelCopyWithImpl(
      _$_FolderInfoModel _value, $Res Function(_$_FolderInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remainingStorage = null,
    Object? usedStorage = null,
  }) {
    return _then(_$_FolderInfoModel(
      remainingStorage: null == remainingStorage
          ? _value.remainingStorage
          : remainingStorage // ignore: cast_nullable_to_non_nullable
              as int,
      usedStorage: null == usedStorage
          ? _value.usedStorage
          : usedStorage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FolderInfoModel
    with DiagnosticableTreeMixin
    implements _FolderInfoModel {
  const _$_FolderInfoModel(
      {required this.remainingStorage, required this.usedStorage});

  factory _$_FolderInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_FolderInfoModelFromJson(json);

  @override
  final int remainingStorage;
  @override
  final int usedStorage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolderInfoModel(remainingStorage: $remainingStorage, usedStorage: $usedStorage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FolderInfoModel'))
      ..add(DiagnosticsProperty('remainingStorage', remainingStorage))
      ..add(DiagnosticsProperty('usedStorage', usedStorage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FolderInfoModel &&
            (identical(other.remainingStorage, remainingStorage) ||
                other.remainingStorage == remainingStorage) &&
            (identical(other.usedStorage, usedStorage) ||
                other.usedStorage == usedStorage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, remainingStorage, usedStorage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FolderInfoModelCopyWith<_$_FolderInfoModel> get copyWith =>
      __$$_FolderInfoModelCopyWithImpl<_$_FolderInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderInfoModelToJson(
      this,
    );
  }
}

abstract class _FolderInfoModel implements FolderInfoModel {
  const factory _FolderInfoModel(
      {required final int remainingStorage,
      required final int usedStorage}) = _$_FolderInfoModel;

  factory _FolderInfoModel.fromJson(Map<String, dynamic> json) =
      _$_FolderInfoModel.fromJson;

  @override
  int get remainingStorage;
  @override
  int get usedStorage;
  @override
  @JsonKey(ignore: true)
  _$$_FolderInfoModelCopyWith<_$_FolderInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
