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
  List<FileModel> get files => throw _privateConstructorUsedError;

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
      bool isDeletionEnabled,
      List<FileModel> files});
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
    Object? files = null,
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
      files: null == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolderModelImplCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$$FolderModelImplCopyWith(
          _$FolderModelImpl value, $Res Function(_$FolderModelImpl) then) =
      __$$FolderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      AuthProviderType provider,
      String folderPath,
      String folderName,
      String folderId,
      bool isAutoSync,
      bool isDeletionEnabled,
      List<FileModel> files});
}

/// @nodoc
class __$$FolderModelImplCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$FolderModelImpl>
    implements _$$FolderModelImplCopyWith<$Res> {
  __$$FolderModelImplCopyWithImpl(
      _$FolderModelImpl _value, $Res Function(_$FolderModelImpl) _then)
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
    Object? files = null,
  }) {
    return _then(_$FolderModelImpl(
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
      files: null == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderModelImpl with DiagnosticableTreeMixin implements _FolderModel {
  const _$FolderModelImpl(
      {required this.email,
      required this.provider,
      required this.folderPath,
      required this.folderName,
      required this.folderId,
      required this.isAutoSync,
      required this.isDeletionEnabled,
      required final List<FileModel> files})
      : _files = files;

  factory _$FolderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderModelImplFromJson(json);

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
  final List<FileModel> _files;
  @override
  List<FileModel> get files {
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_files);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolderModel(email: $email, provider: $provider, folderPath: $folderPath, folderName: $folderName, folderId: $folderId, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, files: $files)';
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
      ..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))
      ..add(DiagnosticsProperty('files', files));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderModelImpl &&
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
                other.isDeletionEnabled == isDeletionEnabled) &&
            const DeepCollectionEquality().equals(other._files, _files));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      provider,
      folderPath,
      folderName,
      folderId,
      isAutoSync,
      isDeletionEnabled,
      const DeepCollectionEquality().hash(_files));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      __$$FolderModelImplCopyWithImpl<_$FolderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolderModelImplToJson(
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
      required final bool isDeletionEnabled,
      required final List<FileModel> files}) = _$FolderModelImpl;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$FolderModelImpl.fromJson;

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
  List<FileModel> get files;
  @override
  @JsonKey(ignore: true)
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
