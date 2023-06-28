# Changelog

All notable changes to this project will be documented in this file.
For currently known issues, check the [GitHub issues tab](https://github.com/dhzdhd/SyncVault/issues?q=is%3Aopen+is%3Aissue+label%3Abug)

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
