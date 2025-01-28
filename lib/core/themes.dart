import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

const colors = {
  "primary": Color.fromARGB(255, 255, 255, 255),
  "onPrimary": Color.fromARGB(255, 161, 127, 255),
  "secondary": Color.fromARGB(255, 189, 117, 249),
  "onSecondary": Color.fromARGB(255, 196, 174, 255),
  "surface": Color.fromARGB(255, 161, 127, 255),
  "onSurface": Color.fromARGB(255, 255, 255, 255),
  "success": Colors.greenAccent,
  "error": Colors.red,
  "onError": Colors.white,
};

const darkColors = {
  "primary": Color.fromARGB(229, 196, 177, 240),
  "onPrimary": Color.fromARGB(255, 38, 22, 70),
  "secondary": Colors.deepPurple,
  "onSecondary": Color.fromARGB(255, 241, 241, 241),
  "surface": Color.fromARGB(255, 38, 22, 70),
  "onSurface": Color.fromARGB(255, 245, 245, 245),
  "success": Colors.green,
  "error": Colors.red,
  "onError": Colors.white,
};
final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: colors["primary"]!,
    onPrimary: colors["onPrimary"]!,
    secondary: colors["secondary"]!,
    onSecondary: colors["onSecondary"]!,
    error: colors["error"]!,
    onError: colors["onError"]!,
    surface: colors["surface"]!,
    onSurface: colors["onSurface"]!,
  ),
  textTheme: TextTheme(bodyMedium: GoogleFonts.aclonica()),
);
final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: darkColors["primary"]!,
      onPrimary: darkColors["onPrimary"]!,
      secondary: darkColors["secondary"]!,
      onSecondary: darkColors["onSecondary"]!,
      error: darkColors["error"]!,
      onError: darkColors["onError"]!,
      surface: darkColors["surface"]!,
      onSurface: darkColors["onSurface"]!,
    ));
