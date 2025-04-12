import 'dart:io';

class GoogleUtils {
  static final clientId =
      Platform.isAndroid
          ? '844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q.apps.googleusercontent.com'
          : Platform.isIOS
          ? '844110357681-2dhkpbmddfvblqn2vfril150kpgbq2d3.apps.googleusercontent.com'
          : '844110357681-iqvtfuf7q6qvqnqksgho9o33naisedl0.apps.googleusercontent.com';
  static final callbackUrlScheme =
      Platform.isAndroid
          ? 'com.googleusercontent.apps.844110357681-4sa1ev4ep3thlfa5gq3l4pjigvv3n98q:/'
          : Platform.isIOS
          ? 'com.googleusercontent.apps.844110357681-2dhkpbmddfvblqn2vfril150kpgbq2d3:/'
          : 'http://localhost:8006';
  static const clientSecret = String.fromEnvironment('GDRIVE_SECRET');
  static const authHost = 'accounts.google.com';
  static const apiHost = 'www.googleapis.com';
  static const basePath = '/drive/v3';
  static const scopes = [
    'https://www.googleapis.com/auth/drive.file',
    'https://www.googleapis.com/auth/userinfo.profile',
    'https://www.googleapis.com/auth/userinfo.email',
  ];
  static final scopesString = scopes.join(' ');
}
