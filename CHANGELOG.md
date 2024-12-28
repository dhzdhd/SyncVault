# Changelog

All notable changes to this project will be documented in this file.
For currently known issues, check the [GitHub issues tab](https://github.com/dhzdhd/SyncVault/issues?q=is%3Aopen+is%3Aissue+label%3Abug)

## 0.5.2 | 28-12-2024 (Prerelease)

### Additions

- Added RClone as the primary backend and deprecated the old implementation.
- Added new introduction screen to setup permissions (Android) or download RClone (Windows).
- Added new providers - Minio, NextCloud, ProtonDrive.
- Added hide and exit options to system tray on Windows.
- Added reset settings and clear local storage buttons to settings.
- (Dev only) Added Docker compose files to quickly spin up Nextcloud and Minio instances for testing.

### Fixes / Improvements

- Improved tree view implementation; moved it from folder card to a bottom sheet (UI still needs improvement).
- Moved all hive box files (.lock & .hive files) from Documents to the SyncVault folder in Documents to avoid clutter.
- Improved padding of list views in both the home page and accounts page to avoid UI blocking by floating button.
- Improved the drive provider names.

### Temporary removals (due to new backend)

- Drive information dialog does not work.
- RClone download in settings page does not work.
- Minio folder creation does not work as intended (as it does support nested file paths, only buckets).
- None of the switches in the expanded cards in home page work (auto sync, two way sync, delete on sync).
- Folder deletion does not work as intended.
- New accounts (remotes) are not yet automatically detected by supplied rclone config file.

## 0.4.0 | 18-06-2024 (Prerelease)

### Note

- OneDrive & Google Drive will be given the most importance from this build onwards to finalize the workflow.

### Additions

- Added tree view per folder.
- Added two way sync option per folder (Not yet implemented).
- Added logo and icons
- Added clear local folder cache to settings (Use for debugging purposes only)
- Added account information to each folder card

### Fixes / Improvements

- Improved error handling and UI.
- Improved global theme.
- Improved app loading states.
- Improved drive information and account delete dialog UI.

## 0.3.0 | 05-07-2023 (Prerelease)

### Additions

- Added auto sync to Android.
- Added Google Drive support to Windows and Android (cannot upload files yet).

### Fixes / Improvements

- Fixed redundant account instances.
- Fixed creation of duplicate `SyncVault` folders in Google Drive
- Improved drive information UI and added total storage information.
- Migrated dropdown widget to Material 3.
- Added auth provider to dropdown in new folder dialog.

### Deletions

## 0.2.0 | 28-06-2023 (Prerelease)

### Additions

- Added optional Sentry app monitoring (disabled by default).
- Added `Auto sync` & `Delete on sync` switches per folder.
- Added DropBox (currently unusable).

### Fixes / Improvements

- Added tooltips to buttons and text for better accessibility.
- Added `Open folder` button per folder to open the path in the file explorer (currently only works on Windows).
- Redesigned drive usage percentage indicator (currently does not work).
- Added support for non media file types in Android.

### Deletions

- Removed GoogleDrive support due to infeasiblity in complying to registered developer rules.

## 0.1.1 | 07-06-2023 (Prerelease hotfix)

### Fixes / Improvements

- Fixed app crashing on creating a new folder.
- Added android support.
- Improved UI on smaller screens.
- Fixed theme inconsistencies.

### Known issues

- Same as before except for the broken theme.

## 0.1.0 | 06-06-2023 (Prerelease)

### Additions

- Added initial release for Windows.
- Added OneDrive support.
- Added one way sync support (local to cloud).
- Added automatic background sync.
- Added support to minimize app to system tray
- Added themes.

### Known issues

- Google Drive not supported yet and choosing it in the new account dialog does not do anything.
- Light theme is broken in the home route (folder route).
- Supports file uploads of upto 60MB per file only
- Does not check drive size while uploading
- Does not check for invalid file names
