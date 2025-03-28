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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
mixin _$FolderModel {
  String get remoteName => throw _privateConstructorUsedError;
  DriveProvider get provider => throw _privateConstructorUsedError;
  String get folderPath => throw _privateConstructorUsedError;
  String get folderName => throw _privateConstructorUsedError;
  String? get remoteParentPath => throw _privateConstructorUsedError;
  bool get isAutoSync => throw _privateConstructorUsedError;
  bool get isDeletionEnabled => throw _privateConstructorUsedError;
  bool get isTwoWaySync => throw _privateConstructorUsedError;
  String? get folderId => throw _privateConstructorUsedError;
  bool get isRCloneBackend => throw _privateConstructorUsedError;

  /// Serializes this FolderModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {String remoteName,
      DriveProvider provider,
      String folderPath,
      String folderName,
      String? remoteParentPath,
      bool isAutoSync,
      bool isDeletionEnabled,
      bool isTwoWaySync,
      String? folderId,
      bool isRCloneBackend});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res, $Val extends FolderModel>
    implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? provider = null,
    Object? folderPath = null,
    Object? folderName = null,
    Object? remoteParentPath = freezed,
    Object? isAutoSync = null,
    Object? isDeletionEnabled = null,
    Object? isTwoWaySync = null,
    Object? folderId = freezed,
    Object? isRCloneBackend = null,
  }) {
    return _then(_value.copyWith(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      folderPath: null == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      remoteParentPath: freezed == remoteParentPath
          ? _value.remoteParentPath
          : remoteParentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoSync: null == isAutoSync
          ? _value.isAutoSync
          : isAutoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletionEnabled: null == isDeletionEnabled
          ? _value.isDeletionEnabled
          : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isTwoWaySync: null == isTwoWaySync
          ? _value.isTwoWaySync
          : isTwoWaySync // ignore: cast_nullable_to_non_nullable
              as bool,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      isRCloneBackend: null == isRCloneBackend
          ? _value.isRCloneBackend
          : isRCloneBackend // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {String remoteName,
      DriveProvider provider,
      String folderPath,
      String folderName,
      String? remoteParentPath,
      bool isAutoSync,
      bool isDeletionEnabled,
      bool isTwoWaySync,
      String? folderId,
      bool isRCloneBackend});
}

/// @nodoc
class __$$FolderModelImplCopyWithImpl<$Res>
    extends _$FolderModelCopyWithImpl<$Res, _$FolderModelImpl>
    implements _$$FolderModelImplCopyWith<$Res> {
  __$$FolderModelImplCopyWithImpl(
      _$FolderModelImpl _value, $Res Function(_$FolderModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteName = null,
    Object? provider = null,
    Object? folderPath = null,
    Object? folderName = null,
    Object? remoteParentPath = freezed,
    Object? isAutoSync = null,
    Object? isDeletionEnabled = null,
    Object? isTwoWaySync = null,
    Object? folderId = freezed,
    Object? isRCloneBackend = null,
  }) {
    return _then(_$FolderModelImpl(
      remoteName: null == remoteName
          ? _value.remoteName
          : remoteName // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as DriveProvider,
      folderPath: null == folderPath
          ? _value.folderPath
          : folderPath // ignore: cast_nullable_to_non_nullable
              as String,
      folderName: null == folderName
          ? _value.folderName
          : folderName // ignore: cast_nullable_to_non_nullable
              as String,
      remoteParentPath: freezed == remoteParentPath
          ? _value.remoteParentPath
          : remoteParentPath // ignore: cast_nullable_to_non_nullable
              as String?,
      isAutoSync: null == isAutoSync
          ? _value.isAutoSync
          : isAutoSync // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeletionEnabled: null == isDeletionEnabled
          ? _value.isDeletionEnabled
          : isDeletionEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isTwoWaySync: null == isTwoWaySync
          ? _value.isTwoWaySync
          : isTwoWaySync // ignore: cast_nullable_to_non_nullable
              as bool,
      folderId: freezed == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String?,
      isRCloneBackend: null == isRCloneBackend
          ? _value.isRCloneBackend
          : isRCloneBackend // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolderModelImpl with DiagnosticableTreeMixin implements _FolderModel {
  const _$FolderModelImpl(
      {required this.remoteName,
      required this.provider,
      required this.folderPath,
      required this.folderName,
      required this.remoteParentPath,
      required this.isAutoSync,
      required this.isDeletionEnabled,
      required this.isTwoWaySync,
      required this.folderId,
      required this.isRCloneBackend});

  factory _$FolderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolderModelImplFromJson(json);

  @override
  final String remoteName;
  @override
  final DriveProvider provider;
  @override
  final String folderPath;
  @override
  final String folderName;
  @override
  final String? remoteParentPath;
  @override
  final bool isAutoSync;
  @override
  final bool isDeletionEnabled;
  @override
  final bool isTwoWaySync;
  @override
  final String? folderId;
  @override
  final bool isRCloneBackend;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolderModel(remoteName: $remoteName, provider: $provider, folderPath: $folderPath, folderName: $folderName, remoteParentPath: $remoteParentPath, isAutoSync: $isAutoSync, isDeletionEnabled: $isDeletionEnabled, isTwoWaySync: $isTwoWaySync, folderId: $folderId, isRCloneBackend: $isRCloneBackend)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FolderModel'))
      ..add(DiagnosticsProperty('remoteName', remoteName))
      ..add(DiagnosticsProperty('provider', provider))
      ..add(DiagnosticsProperty('folderPath', folderPath))
      ..add(DiagnosticsProperty('folderName', folderName))
      ..add(DiagnosticsProperty('remoteParentPath', remoteParentPath))
      ..add(DiagnosticsProperty('isAutoSync', isAutoSync))
      ..add(DiagnosticsProperty('isDeletionEnabled', isDeletionEnabled))
      ..add(DiagnosticsProperty('isTwoWaySync', isTwoWaySync))
      ..add(DiagnosticsProperty('folderId', folderId))
      ..add(DiagnosticsProperty('isRCloneBackend', isRCloneBackend));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FolderModelImpl &&
            (identical(other.remoteName, remoteName) ||
                other.remoteName == remoteName) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.folderPath, folderPath) ||
                other.folderPath == folderPath) &&
            (identical(other.folderName, folderName) ||
                other.folderName == folderName) &&
            (identical(other.remoteParentPath, remoteParentPath) ||
                other.remoteParentPath == remoteParentPath) &&
            (identical(other.isAutoSync, isAutoSync) ||
                other.isAutoSync == isAutoSync) &&
            (identical(other.isDeletionEnabled, isDeletionEnabled) ||
                other.isDeletionEnabled == isDeletionEnabled) &&
            (identical(other.isTwoWaySync, isTwoWaySync) ||
                other.isTwoWaySync == isTwoWaySync) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.isRCloneBackend, isRCloneBackend) ||
                other.isRCloneBackend == isRCloneBackend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      remoteName,
      provider,
      folderPath,
      folderName,
      remoteParentPath,
      isAutoSync,
      isDeletionEnabled,
      isTwoWaySync,
      folderId,
      isRCloneBackend);

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String remoteName,
      required final DriveProvider provider,
      required final String folderPath,
      required final String folderName,
      required final String? remoteParentPath,
      required final bool isAutoSync,
      required final bool isDeletionEnabled,
      required final bool isTwoWaySync,
      required final String? folderId,
      required final bool isRCloneBackend}) = _$FolderModelImpl;

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$FolderModelImpl.fromJson;

  @override
  String get remoteName;
  @override
  DriveProvider get provider;
  @override
  String get folderPath;
  @override
  String get folderName;
  @override
  String? get remoteParentPath;
  @override
  bool get isAutoSync;
  @override
  bool get isDeletionEnabled;
  @override
  bool get isTwoWaySync;
  @override
  String? get folderId;
  @override
  bool get isRCloneBackend;

  /// Create a copy of FolderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FolderModelImplCopyWith<_$FolderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
