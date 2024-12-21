import 'package:syncvault/src/home/services/rclone.dart';

const providerTemplate = {
  DriveProvider.oneDrive: '''[{remoteName}]
type = onedrive
token = {rCloneJson}
drive_id =
drive_type = personal''',
  DriveProvider.googleDrive: '''[{remoteName}]
type = drive
token = {rCloneJson}
team_drive =
''',
  DriveProvider.dropBox: '''[{remoteName}]
type = dropbox
token = {rCloneJson}''',
  DriveProvider.nextCloud: '''[{remoteName}]
type = webdav
url = {url}
vendor = nextcloud
user = {email}
pass = {password}
'''
};
