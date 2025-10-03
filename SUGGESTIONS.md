# SyncVault - Suggested Features and Bug Fixes

This document contains an analysis of the SyncVault codebase with suggested improvements, bug fixes, and new features.

## Critical Bug Fixes

### 1. Fix Deprecated Warning in Linux Build (linux/CMakeLists.txt:45)
**Issue:** Deprecated declarations warning is suppressed instead of fixed
```cmake
target_compile_options(${TARGET} PRIVATE -Wno-error=deprecated-declarations) # FIXME: Deprecated warning
```
**Recommendation:** Investigate and fix the deprecated declarations instead of suppressing warnings.

### 2. Fix isDirectory Flag Logic (lib/src/home/services/local.dart:103)
**Issue:** The `isDirectory` flag is hardcoded to `false` even for directories
```dart
isDirectory: false, // FIXME:
```
**Impact:** This will cause incorrect file type detection in tree views
**Fix:** Use `entity is Directory` to properly detect directories

### 3. ValidationError Missing Field Information (lib/errors.dart:53)
**Issue:** ValidationError doesn't specify which field failed validation
```dart
// TODO: Add which field failed
```
**Impact:** Makes debugging validation errors difficult
**Fix:** Add a `field` parameter to ValidationError

## Incomplete Implementations

### 4. GoogleDrive Provider Methods Not Implemented
**Location:** `lib/src/home/services/providers/google_drive.dart`
**Missing Methods:**
- `delete()` (line 96)
- `treeView()` (line 105)
- `listView()` (line 114)
**Impact:** Google Drive functionality is incomplete
**Priority:** High - affects core functionality

### 5. Google Auth Health Check Not Implemented
**Location:** `lib/src/accounts/services/providers/google_auth.dart:224`
```dart
// TODO: implement isHealthy
throw UnimplementedError();
```
**Impact:** Cannot verify if Google auth connection is healthy
**Priority:** Medium

### 6. Local Service List View Incomplete
**Location:** `lib/src/home/services/local.dart:125`
```dart
// TODO:
```
**Impact:** Local file list view may not work correctly
**Priority:** Medium

## UI/UX Improvements

### 7. Custom Progress Widget for Drive Info
**Location:** `lib/src/accounts/components/drive_info_dialog.dart:66`
**Issue:** Using standard CircularProgressIndicator instead of custom widget
**Recommendation:** Create a custom progress widget for better visual consistency

### 8. AsyncValue Exhaustiveness
**Location:** `lib/src/accounts/components/tree_view_sheet_widget.dart:48`
**Issue:** Comment suggests AsyncValue states aren't exhausting properly
**Recommendation:** Review pattern matching implementation

### 9. Drive Info for Local Folders
**Location:** `lib/src/accounts/components/account_card.dart:159`
**Suggestion:** Consider showing drive info (disk space) for local folders too

## Code Quality & Maintainability

### 10. Error Message Mapping
**Location:** `lib/src/accounts/services/rclone.dart:21`
**Issue:** Error message mapping is marked as FIXME
```dart
// FIXME:
const errorMsgMap = {...};
```
**Recommendation:** Review and improve error message handling

### 11. Remove Unnecessary Try-Catch
**Location:** `lib/src/accounts/services/rclone.dart:66`
**Issue:** Unnecessary try-catch wrapping
**Recommendation:** Simplify error handling using TaskEither properly

### 12. Use Either Instead of Option
**Location:** `lib/src/accounts/services/rclone.dart:294`
**Issue:** Using Option where Either would be more appropriate
**Recommendation:** Refactor to use Either for better error handling

### 13. GetIt Refactoring Needed
**Locations:**
- `lib/src/accounts/controllers/folder_controller.dart:24`
- `lib/src/home/controllers/connection_controller.dart:20`
**Issue:** Storage instances should be fetchable from GetIt
**Recommendation:** Register storage instances in dependency injection

## Feature Enhancements

### 14. Support for Manual Sync
**Location:** `lib/src/accounts/controllers/status_controller.dart:14`
**Suggestion:** Add manual sync trigger capability

### 15. Folder Name vs Remote Name
**Location:** `lib/src/accounts/components/new_account_dialog.dart:32`
**Suggestion:** Add folderName field that can differ from remoteName

### 16. Nullable to Option Type Conversion
**Location:** `lib/src/accounts/models/folder_model.dart:7`
**Issue:** Waiting for Hive adapter fix to convert nullables to Option types
**Recommendation:** Monitor Hive updates and refactor when possible

### 17. Delete Folders Functionality
**Location:** `lib/src/accounts/controllers/auth_controller.dart:144`
**TODO:** Add functionality to delete folders when deleting accounts

## Testing Improvements

### 18. Expand Test Coverage
**Current State:** Only basic placeholder tests exist
**Files:**
- `test/widget_test.dart` - basic widget test
- `test/unit_test.dart` - basic arithmetic test

**Recommendations:**
- Add integration tests for sync operations
- Add unit tests for error handling
- Add tests for RClone service interactions
- Add tests for storage operations
- Add widget tests for main UI components

### 19. Test File Comparer and Hash Logic
**Location:** Multiple references to hash comparison in codebase
**Recommendation:** Add specific tests for hash calculation and comparison logic

## Documentation Improvements

### 20. API Documentation
**Recommendation:** Add comprehensive dartdoc comments to public APIs

### 21. Architecture Documentation
**Recommendation:** Document the overall architecture, especially:
- How RClone integration works
- The relationship between providers, folders, and connections
- Background sync mechanism

## Performance Optimizations

### 22. Background Sync Frequency
**Location:** `lib/main.dart:109`
**Current:** 15-minute minimum (Android WorkManager limitation)
**Consideration:** Document this limitation in user-facing documentation

### 23. File Processing
**Location:** `lib/src/common/services/rclone.dart:80`
**Issue:** Reading file contents instead of passing them
```dart
// TODO: Pass file contents instead of reading
```
**Impact:** Performance overhead
**Recommendation:** Refactor to accept file contents as parameter

## Configuration & Settings

### 24. File Logger Issues
**Location:** `lib/src/settings/controllers/settings_controller.dart:54`
```dart
// TODO: Fix file logger
```
**Impact:** Logging may not work correctly
**Priority:** Medium

### 25. Refactor Config Handling
**Locations:**
- `lib/src/accounts/controllers/auth_controller.dart:151`
- `lib/src/accounts/services/rclone.dart:332`
**Issue:** Multiple TODOs to refactor to getIniConfig
**Recommendation:** Consolidate config file handling

## Platform-Specific Issues

### 26. iOS Support
**Status:** Not yet implemented
**Multiple locations throw UnimplementedError for iOS
**Recommendation:** Document iOS as unsupported or implement support

### 27. Open Folder Feature
**Location:** CHANGELOG mentions it only works on Windows (v0.2.0)
**Recommendation:** Implement for other platforms or document limitation

## Security Considerations

### 28. Port Conflict Handling
**Location:** `lib/src/accounts/services/rclone.dart:80`
**Current:** Kills processes on port 53682
**Recommendation:** Add better port conflict detection and user notification

### 29. Sentry Integration
**Location:** `lib/main.dart` and settings
**Status:** Optional, disabled by default
**Recommendation:** Document privacy implications clearly

## Known Historical Issues (from CHANGELOG)

### 30. File Size Limitation
**Issue:** Supports file uploads of up to 60MB per file only
**Status:** Unknown if still present
**Recommendation:** Test and document current limitations

### 31. Drive Size Checking
**Issue:** Does not check drive size while uploading
**Status:** Unknown if fixed
**Recommendation:** Implement pre-upload drive space validation

## Recommended Priority Order

### High Priority (Core Functionality)
1. Fix isDirectory flag (Bug #2)
2. Implement GoogleDrive provider methods (Bug #4)
3. Add field to ValidationError (Bug #3)
4. Fix file logger (Bug #24)

### Medium Priority (Stability & UX)
5. Implement isHealthy for Google auth (Bug #5)
6. Complete local service list view (Bug #6)
7. Expand test coverage (Bug #18)
8. Fix deprecated warnings (Bug #1)

### Low Priority (Enhancements)
9. Custom progress widget (Bug #7)
10. Refactor GetIt usage (Bug #13)
11. Improve error handling (Bug #10, #11, #12)
12. Add comprehensive documentation (Bug #20, #21)

## Conclusion

SyncVault is a well-structured Flutter application with good use of modern patterns (Riverpod, fpdart, freezed). The main areas for improvement are:
- Completing incomplete implementations (especially GoogleDrive)
- Fixing FIXME items that affect functionality
- Expanding test coverage
- Improving error handling and debugging information
- Better documentation

The codebase shows active development with regular improvements based on the CHANGELOG.
