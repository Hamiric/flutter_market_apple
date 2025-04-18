import 'package:flutter/material.dart';

final lightTheme = _theme(Brightness.light);
final darkTheme = _theme(Brightness.dark);

ThemeData _theme(Brightness brightness) => ThemeData(
  brightness: brightness,
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, brightness: brightness),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.grey[300],
  )
);