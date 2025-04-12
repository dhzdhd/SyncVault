import 'package:flutter/material.dart';

enum SnackBarState { success, error, warning }

SnackBar snackBarWidget({
  required String content,
  required SnackBarState state,
  SnackBarAction? action,
}) {
  return SnackBar(
    content: Text(
      content,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    duration: const Duration(seconds: 3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
    behavior: SnackBarBehavior.floating,
    backgroundColor:
        state == SnackBarState.success
            ? Colors.greenAccent
            : state == SnackBarState.error
            ? Colors.redAccent
            : Colors.amberAccent,
    action: action,
  );
}
