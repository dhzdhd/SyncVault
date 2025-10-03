# Sync Vault

## About

A cross-platform (Windows, Android, MacOS and Linux) app to sync your local files in the background with the drive of your choice using [RClone](https://rclone.org/).

SyncVault provides a user-friendly interface for managing file synchronization across multiple cloud storage providers, with support for automated background syncing and flexible configuration options.

## Features

- 🔄 **Automatic Background Sync**: Set up folders to sync automatically in the background
- 🌐 **Multiple Cloud Providers**: Support for OneDrive, Google Drive, Dropbox, Minio, Nextcloud, and Proton Drive
- 📁 **Flexible Folder Management**: Organize and manage multiple sync connections
- 🔐 **Secure Authentication**: OAuth2 support for secure cloud provider authentication
- 🌳 **Tree View**: Visualize your file structure before syncing
- ⚙️ **Customizable Settings**: Configure sync behavior per folder
- 🖥️ **System Tray Integration**: Run in the background on desktop platforms

## Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| Windows | ✅ Supported | Full feature support |
| Linux | ✅ Supported | Full feature support |
| MacOS | ✅ Supported | Full feature support |
| Android | ✅ Supported | Background sync with WorkManager (15-min minimum interval) |
| iOS | ❌ Not yet | Planned for future release |

### Supported Cloud Providers

- **OneDrive** - Full support
- **Google Drive** - Full support
- **Dropbox** - Full support
- **Minio** - Full support
- **Nextcloud** - Full support
- **Proton Drive** - Full support

## Getting Started

### Prerequisites

- Flutter SDK >= 3.35.0
- Dart SDK >= 3.9.0
- RClone binary (automatically downloaded on first run for supported platforms)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/dhzdhd/SyncVault.git
cd SyncVault
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Building from Source

#### Desktop (Windows/Linux/MacOS)
```bash
flutter build windows  # For Windows
flutter build linux    # For Linux
flutter build macos    # For MacOS
```

#### Android
```bash
flutter build apk      # For APK
flutter build appbundle # For Play Store
```

## Usage

1. **Add a Cloud Account**: Navigate to the Accounts section and add your cloud storage provider
2. **Create a Connection**: Set up a sync connection between a local folder and cloud folder
3. **Configure Sync**: Choose sync direction (upload/download/bidirectional) and enable auto-sync if desired
4. **Monitor Progress**: View sync status and logs in the main dashboard

## Development

### Project Structure

```
lib/
├── src/
│   ├── accounts/       # Account and provider management
│   ├── common/         # Shared utilities and widgets
│   ├── home/           # Main dashboard and connections
│   ├── introduction/   # Onboarding screens
│   ├── settings/       # App settings
│   └── workflows/      # Sync pipeline editor
├── errors.dart         # Error handling
├── main.dart           # App entry point
└── ...
```

### Running Tests

```bash
flutter test
```

### Code Generation

This project uses code generation for various features. Run the following when needed:

```bash
# Generate all code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Known Issues & TODOs

See [SUGGESTIONS.md](SUGGESTIONS.md) for a comprehensive list of known issues, planned improvements, and feature suggestions.

## Status

Currently in prerelease (v0.9.2). The app is functional but still under active development. Expect regular updates and improvements.

## License

See [LICENSE.md](LICENSE.md) for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

## Support

For issues and feature requests, please use the [GitHub Issues](https://github.com/dhzdhd/SyncVault/issues) page.

