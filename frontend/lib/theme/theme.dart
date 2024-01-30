import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade100,
    primary: Colors.green.shade700,
    secondary: Colors.grey.shade400,
    tertiary: Colors.blue.shade600,
    
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.red.shade600,
    secondary: Colors.grey.shade700,
    tertiary: Colors.red.shade800,
  ),
);