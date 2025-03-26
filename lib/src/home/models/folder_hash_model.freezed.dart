// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_hash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderHashModel _$FolderHashModelFromJson(Map<String, dynamic> json) {
  return _FolderHashModel.fromJson(json);
}

/// @nodoc
mixin _$FolderHashModel {
  String get remoteName => throw _privateConstructorUsedError;
  @HashDigestConverter()
  HashDigest get hash => throw _privateConstructorUsedError;

  /// Serializes this FolderHashModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FolderHashModelCopyWith<FolderHashModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderHashModelCopyWith<$Res> {
  factory $FolderHashModelCopyWith(
          FolderHashModel value, $Res Function(FolderHashModel) then) =
      _$FolderHashModelCopyWithImpl<$Res, FolderHashModel>;
  @useResult
  $Res call({String remoteName, @HashDigestConverter() HashDigest hash});
}

/// @nodoc
class _$FolderHashModelCopyWithImpl<$Res, $Val extends FolderHashModel>
    implements $FolderHashModelCopyWith<$Res> {
  _$FolderHashModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? hash = null,
  }) {
    return _then(_value.copyWith(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as HashDigest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderHashModelImplCopyWith<$Res>
    implements $FolderHashModelCopyWith<$Res> {
  factory _$$FolderHashModelImplCopyWith(_$FolderHashModelImpl value,
          $Res Function(_$FolderHashModelImpl) then) =
      __$$FolderHashModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String remoteName, @HashDigestConverter() HashDigest hash});
}

/// @nodoc
class __$$FolderHashModelImplCopyWithImpl<$Res>
    extends _$FolderHashModelCopyWithImpl<$Res, _$FolderHashModelImpl>
    implements _$$FolderHashModelImplCopyWith<$Res> {
  __$$FolderHashModelImplCopyWithImpl(
      _$FolderHashModelImpl _value, $Res Function(_$FolderHashModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? hash = null,
  }) {
    return _then(_$FolderHashModelImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as HashDigest,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderHashModelImpl implements _FolderHashModel {
  const _$FolderHashModelImpl(
      {required this.remoteName, @HashDigestConverter() required this.hash});

  factory _$FolderHashModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderHashModelImplFromJson(json);

  @override
  final String remoteName;
  @override
  @HashDigestConverter()
  final HashDigest hash;

  @override
  String toString() {
    return 'FolderHashModel(remoteName: $remoteName, hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderHashModelImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName, hash);

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderHashModelImplCopyWith<_$FolderHashModelImpl> get copyWith =>
      __$$FolderHashModelImplCopyWithImpl<_$FolderHashModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderHashModelImplToJson(
      this,
    );
  }
}

abstract class _FolderHashModel implements FolderHashModel {
  const factory _FolderHashModel(
          {required final String remoteName,
          @HashDigestConverter() required final HashDigest hash}) =
      _$FolderHashModelImpl;

  factory _FolderHashModel.fromJson(Map<String, dynamic> json) =
      _$FolderHashModelImpl.fromJson;

  @override
  String get remoteName;
  @override
  @HashDigestConverter()
  HashDigest get hash;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderHashModelImplCopyWith<_$FolderHashModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
