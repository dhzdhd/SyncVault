// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_hash_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FolderHashModel {
  String get remoteName;
  @HashDigestConverter()
  HashDigest get hash;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FolderHashModelCopyWith<FolderHashModel> get copyWith =>
      _$FolderHashModelCopyWithImpl<FolderHashModel>(
          this as FolderHashModel, _$identity);

  /// Serializes this FolderHashModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FolderHashModel &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName, hash);

  @override
  String toString() {
    return 'FolderHashModel(remoteName: $remoteName, hash: $hash)';
  }
}

/// @nodoc
abstract mixin class $FolderHashModelCopyWith<$Res> {
  factory $FolderHashModelCopyWith(
          FolderHashModel value, $Res Function(FolderHashModel) _then) =
      _$FolderHashModelCopyWithImpl;
  @useResult
  $Res call({String remoteName, @HashDigestConverter() HashDigest hash});
}

/// @nodoc
class _$FolderHashModelCopyWithImpl<$Res>
    implements $FolderHashModelCopyWith<$Res> {
  _$FolderHashModelCopyWithImpl(this._self, this._then);

  final FolderHashModel _self;
  final $Res Function(FolderHashModel) _then;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? hash = null,
  }) {
    return _then(_self.copyWith(
      remoteName: null == remoteName
          ? _self.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as HashDigest,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FolderHashModel implements FolderHashModel {
  const _FolderHashModel(
      {required this.remoteName, @HashDigestConverter() required this.hash});
  factory _FolderHashModel.fromJson(Map<String, dynamic> json) =>
      _$FolderHashModelFromJson(json);

  @override
  final String remoteName;
  @override
  @HashDigestConverter()
  final HashDigest hash;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FolderHashModelCopyWith<_FolderHashModel> get copyWith =>
      __$FolderHashModelCopyWithImpl<_FolderHashModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FolderHashModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FolderHashModel &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.hash, hash) || other.hash == hash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, remoteName, hash);

  @override
  String toString() {
    return 'FolderHashModel(remoteName: $remoteName, hash: $hash)';
  }
}

/// @nodoc
abstract mixin class _$FolderHashModelCopyWith<$Res>
    implements $FolderHashModelCopyWith<$Res> {
  factory _$FolderHashModelCopyWith(
          _FolderHashModel value, $Res Function(_FolderHashModel) _then) =
      __$FolderHashModelCopyWithImpl;
  @override
  @useResult
  $Res call({String remoteName, @HashDigestConverter() HashDigest hash});
}

/// @nodoc
class __$FolderHashModelCopyWithImpl<$Res>
    implements _$FolderHashModelCopyWith<$Res> {
  __$FolderHashModelCopyWithImpl(this._self, this._then);

  final _FolderHashModel _self;
  final $Res Function(_FolderHashModel) _then;

  /// Create a copy of FolderHashModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? remoteName = null,
    Object? hash = null,
  }) {
    return _then(_FolderHashModel(
      remoteName: null == remoteName
          ? _self.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      hash: null == hash
          ? _self.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as HashDigest,
    ));
  }
}

// dart format on
