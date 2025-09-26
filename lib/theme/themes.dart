import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.light(
    primary: Colors.blue.shade700,
    secondary: Colors.blueAccent,
    surface: Colors.white,
  ),
  cardTheme: CardThemeData(
    elevation: 2,
    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  ),
  useMaterial3: true,
);


final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  colorScheme: ColorScheme.dark(
    primary: Colors.indigo.shade400,
    secondary: Colors.indigoAccent,
    surface: const Color(0xFF1E1E1E),
  ),
  cardTheme: CardThemeData(
    elevation: 2,
    margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
  ),
  useMaterial3: true,
);