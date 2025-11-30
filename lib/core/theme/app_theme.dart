import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Dark theme colors
  static const Color spaceBlack = Color(0xFF0B0B15);
  static const Color deepSpace = Color(0xFF1A1A2E);
  static const Color neonCyan = Color(0xFF00F0FF);
  static const Color neonPink = Color(0xFFFF007F);
  static const Color starlight = Color(0xFFEAEAEA);
  static const Color glassBorder = Color(0x33FFFFFF);

  // Light theme colors
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF1A1A2E);
  static const Color accentCyan = Color(0xFF00B8D4);
  static const Color accentPink = Color(0xFFE91E63);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: spaceBlack,
      primaryColor: neonCyan,
      colorScheme: const ColorScheme.dark(
        primary: neonCyan,
        secondary: neonPink,
        surface: deepSpace,
        onSurface: starlight,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: starlight, displayColor: starlight),
      useMaterial3: true,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      primaryColor: accentCyan,
      colorScheme: const ColorScheme.light(
        primary: accentCyan,
        secondary: accentPink,
        surface: lightSurface,
        onSurface: lightText,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.light().textTheme,
      ).apply(bodyColor: lightText, displayColor: lightText),
      useMaterial3: true,
    );
  }
}
