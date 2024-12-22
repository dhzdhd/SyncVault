import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncvault/src/home/components/snackbar_widget.dart';

extension StringExtension on String {
  String capitalize() {
    if (isNotEmpty) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
    return '';
  }

  String format(Map<String, String> mappedValues) {
    return replaceAllMapped(RegExp(r'{(.*?)}'), (match) {
      final mapped = mappedValues[match[1]];
      if (mapped == null) {
        throw ArgumentError(
            '$mappedValues does not contain the key "${match[1]}"');
      }
      return mapped;
    });
  }
}

class PlatformExtension {
  static bool get isDesktop =>
      Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  static bool get isMobile => Platform.isAndroid || Platform.isIOS;
}

extension SnackBarExtension on BuildContext {
  void showSuccessSnackBar({required String content, SnackBarAction? action}) {
    ScaffoldMessenger.of(this).showSnackBar(snackBarWidget(
      content: content,
      state: SnackBarState.success,
      action: action,
    ));
  }

  void showErrorSnackBar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(snackBarWidget(
      content: content,
      state: SnackBarState.error,
    ));
  }

  void showWarningSnackBar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(snackBarWidget(
      content: content,
      state: SnackBarState.warning,
    ));
  }
}
