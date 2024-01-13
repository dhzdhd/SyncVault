import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.light,
  ),
  // cardColor: lightColorScheme.onSecondary,
  // cardTheme: CardTheme(color: lightColorScheme.onSecondary),
  textTheme: const TextTheme(),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 0, 76, 109),
    brightness: Brightness.dark,
  ),
  // cardColor: darkColorScheme.onSecondary,
  // cardTheme: CardTheme(color: darkColorScheme.onSecondary),
  textTheme: const TextTheme(),
);
