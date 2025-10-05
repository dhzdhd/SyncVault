# SyncVault

## About

A cross-platform (Windows, Android, MacOS and Linux) app to sync your local files in the background with the drive of your choice using [RClone](https://rclone.org/).

The project is currently in the Alpha Release state. The app is functional but still under active development. Expect regular updates and improvements.

## Features

- **Automatic Background Sync**: Set up folders to sync automatically in the background
- **Multiple Cloud Providers**: Support for OneDrive, Google Drive, Dropbox, Minio, Nextcloud, and Proton Drive

## Platform Support

| Platform | Released | RClone Support | Notes |
|----------|--------|-------|-------|
| Windows | ✅ | ✅ | Full feature support with real-time syncing |
| Linux | ✅ | ✅ | Full feature support with real-time syncing |
| MacOS | ✅ | ✅ | Full feature support with real-time syncing |
| Android | ✅ | ✅ | Background sync with WorkManager (15-min minimum interval) |
| iOS | ❌ | ❌ | Planned for future release |

## Supported Cloud Providers

| Provider | RClone Support | Manual Support |
|----------|--------|-------|
| OneDrive | ✅ | ❌ | 
| Google Drive | ✅ | ✅ |  
| Dropbox | ✅ | ❌ | 
| Minio | ⚠️ | ❌ | 
| Nextcloud | ⚠️ | ❌ | 
| Proton Drive | ⚠️ | ❌ | 

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

## Support

For known/new issues and feature requests, please use the [GitHub Issues](https://github.com/dhzdhd/SyncVault/issues) page.