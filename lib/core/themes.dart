import 'package:flutter/material.dart';

// Esquema de colores claro
const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFC02229),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF685D5D),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFCFDF6),
  onBackground: Color(0xFF1A1C18),
  surface: Color(0xFFF9FAF3),
  onSurface: Color(0xFF1A1C18),
  outline: Color(0xFFC2C8BC),
);

// Esquema de colores oscuro
const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFC02229),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF685D5D),
  onSecondary: Color(0xFFFFFFFF),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xFF121212),
  onBackground: Color(0xFFFFFFFF),
  surface: Color(0xFF1A1C18),
  onSurface: Color(0xFFFFFFFF),
  outline: Color(0xFFC2C8BC),
);

// Tema claro
ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.primary,
    foregroundColor: lightColorScheme.onPrimary,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: lightColorScheme.primary,
      side: BorderSide(color: lightColorScheme.primary),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: lightColorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: lightColorScheme.primary),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: lightColorScheme.primary,
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
);

// Tema oscuro
ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColorScheme.primary,
    foregroundColor: darkColorScheme.onPrimary,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 16),
    bodySmall: TextStyle(fontSize: 14, color: Color(0xFFB3B3B3)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: darkColorScheme.onPrimary,
      side: BorderSide(color: darkColorScheme.primary),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1A1C18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: darkColorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: darkColorScheme.primary),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: darkColorScheme.primary,
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
);
