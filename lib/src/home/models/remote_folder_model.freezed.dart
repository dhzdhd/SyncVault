// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteFolderModel _$RemoteFolderModelFromJson(Map<String, dynamic> json) {
  return _RemoteFolderModel.fromJson(json);
}

/// @nodoc
mixin _$RemoteFolderModel {
// required String email,
  DriveProvider get provider => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoteFolderModelCopyWith<RemoteFolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteFolderModelCopyWith<$Res> {
  factory $RemoteFolderModelCopyWith(
          RemoteFolderModel value, $Res Function(RemoteFolderModel) then) =
      _$RemoteFolderModelCopyWithImpl<$Res, RemoteFolderModel>;
  @useResult
  $Res call({DriveProvider provider});
}

/// @nodoc
class _$RemoteFolderModelCopyWithImpl<$Res, $Val extends RemoteFolderModel>
    implements $RemoteFolderModelCopyWith<$Res> {
  _$RemoteFolderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteFolderModelImplCopyWith<$Res>
    implements $RemoteFolderModelCopyWith<$Res> {
  factory _$$RemoteFolderModelImplCopyWith(_$RemoteFolderModelImpl value,
          $Res Function(_$RemoteFolderModelImpl) then) =
      __$$RemoteFolderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DriveProvider provider});
}

/// @nodoc
class __$$RemoteFolderModelImplCopyWithImpl<$Res>
    extends _$RemoteFolderModelCopyWithImpl<$Res, _$RemoteFolderModelImpl>
    implements _$$RemoteFolderModelImplCopyWith<$Res> {
  __$$RemoteFolderModelImplCopyWithImpl(_$RemoteFolderModelImpl _value,
      $Res Function(_$RemoteFolderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
  }) {
    return _then(_$RemoteFolderModelImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteFolderModelImpl implements _RemoteFolderModel {
  const _$RemoteFolderModelImpl({required this.provider});

  factory _$RemoteFolderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteFolderModelImplFromJson(json);

// required String email,
  @override
  final DriveProvider provider;

  @override
  String toString() {
    return 'RemoteFolderModel(provider: $provider)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteFolderModelImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, provider);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteFolderModelImplCopyWith<_$RemoteFolderModelImpl> get copyWith =>
      __$$RemoteFolderModelImplCopyWithImpl<_$RemoteFolderModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteFolderModelImplToJson(
      this,
    );
  }
}

abstract class _RemoteFolderModel implements RemoteFolderModel {
  const factory _RemoteFolderModel({required final DriveProvider provider}) =
      _$RemoteFolderModelImpl;

  factory _RemoteFolderModel.fromJson(Map<String, dynamic> json) =
      _$RemoteFolderModelImpl.fromJson;

  @override // required String email,
  DriveProvider get provider;
  @override
  @JsonKey(ignore: true)
  _$$RemoteFolderModelImplCopyWith<_$RemoteFolderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
