import 'package:syncvault/src/home/services/rclone.dart';

const providerTemplate = {
  DriveProvider.oneDrive: '''[{remoteName}]
type = onedrive
token = {rCloneJson}
drive_id =
drive_type = personal''',
};
