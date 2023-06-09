// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
mixin _$FolderModel {
  String get email => throw _privateConstructorUsedError;
  AuthProviderType get provider => throw _privateConstructorUsedError;
  String get folderPath => throw _privateConstructorUsedError;
  String get folderName => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;
  bool get isAutoSync => throw _privateConstructorUsedError;
  bool get isDeletionEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderModelCopyWith<FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderModelCopyWith<$Res> {
  factory $FolderModelCopyWith(
          FolderModel value, $Res Function(FolderModel) then) =
      _$FolderModelCopyWithImpl<$Res, FolderModel>;
  @useResult
  $Res call(
      {String email,
      AuthProviderType provider,
      String folderPath,
      String folderName,
      String folderId,
      bool isAutoSync,
      bool isDeletionEnabled});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res, $Val extends FolderModel>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? provider = null,
    Object? folderPath = null,
    Object? folderName = null,
    Object? folderId = null,
    Object? isAutoSync = null,
    Object? isDeletionEnabled = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProviderType,
      folderPath: null == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoSync: null == isAutoSync
          ? _value.isAutoSync
          : isAutoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletionEnabled: null == isDeletionEnabled
          ? _value.isDeletionEnabled
          : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FolderModelCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$$_FolderModelCopyWith(
          _$_FolderModel value, $Res Function(_$_FolderModel) then) =
      __$$_FolderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      AuthProviderType provider,
      String folderPath,
      String folderName,
      String folderId,
      bool isAutoSync,
      bool isDeletionEnabled});
}

/// @nodoc
class __$$_FolderModelCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$_FolderModel>
    implements _$$_FolderModelCopyWith<$Res> {
  __$$_FolderModelCopyWithImpl(
      _$_FolderModel _value, $Res Function(_$_FolderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? provider = null,
    Object? folderPath = null,
    Object? folderName = null,
    Object? folderId = null,
    Object? isAutoSync = null,
    Object? isDeletionEnabled = null,
  }) {
    return _then(_$_FolderModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as AuthProviderType,
      folderPath: null == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoSync: null == isAutoSync
          ? _value.isAutoSync
          : isAutoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletionEnabled: null == isDeletionEnabled
          ? _value.isDeletionEnabled
          : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FolderModel with DiagnosticableTreeMixin implements _FolderModel {
  const _$_FolderModel(
      {required this.email,
      required this.provider,
      required this.folderPath,
      required this.folderName,
      required this.folderId,
      required this.isAutoSync,
      required this.isDeletionEnabled});

  factory _$_FolderModel.fromJson(Map<String, dynamic> json) =>
      _$$_FolderModelFromJson(json);

  @override
  final String email;
  @override
  final AuthProviderType provider;
  @override
  final String folderPath;
  @override
  final String folderName;
  @override
  final String folderId;
  @override
  final bool isAutoSync;
  @override
  final bool isDeletionEnabled;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolderModel(email: $email, provider: $provider, folderPath: $folderPath, folderName: $folderName, folderId: $folderId, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FolderModel'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('folderPath', folderPath))
      ..add(DiagnosticsProperty('folderName', folderName))
      ..add(DiagnosticsProperty('folderId', folderId))
      ..add(DiagnosticsProperty('isAutoSync', isAutoSync))
      ..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FolderModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.folderPath, folderPath) ||
                other.folderPath == folderPath) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.isAutoSync, isAutoSync) ||
                other.isAutoSync == isAutoSync) &&
            (identical(other.isDeletionEnabled, isDeletionEnabled) ||
                other.isDeletionEnabled == isDeletionEnabled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, provider, folderPath,
      folderName, folderId, isAutoSync, isDeletionEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FolderModelCopyWith<_$_FolderModel> get copyWith =>
      __$$_FolderModelCopyWithImpl<_$_FolderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderModelToJson(
      this,
    );
  }
}

abstract class _FolderModel implements FolderModel {
  const factory _FolderModel(
      {required final String email,
      required final AuthProviderType provider,
      required final String folderPath,
      required final String folderName,
      required final String folderId,
      required final bool isAutoSync,
      required final bool isDeletionEnabled}) = _$_FolderModel;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$_FolderModel.fromJson;

  @override
  String get email;
  @override
  AuthProviderType get provider;
  @override
  String get folderPath;
  @override
  String get folderName;
  @override
  String get folderId;
  @override
  bool get isAutoSync;
  @override
  bool get isDeletionEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_FolderModelCopyWith<_$_FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
