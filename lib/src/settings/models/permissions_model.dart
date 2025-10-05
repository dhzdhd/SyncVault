import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permissions_model.freezed.dart';

@freezed
abstract class PermissionsModel with _$PermissionsModel {
  const factory PermissionsModel({
    required PermissionStatus notifications,
    required PermissionStatus batteryOptimization,
    required PermissionStatus fileAccess,
  }) = _PermissionsModel;
}
