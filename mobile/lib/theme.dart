import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Workshop / diagnostic visual language: graphite + signal teal + amber fault.
class AppTheme {
  static const accent = Color(0xFF1AA6A6);
  static const accentDeep = Color(0xFF0B6E75);
  static const accentSoft = Color(0x261AA6A6);
  static const ink = Color(0xFF0E1418);
  static const muted = Color(0xFF5C6B73);
  static const canvas = Color(0xFFE8EEF0);
  static const surface = Color(0xFFF7FAFB);
  static const danger = Color(0xFFD64545);
  static const warning = Color(0xFFE0A106);
  static const success = Color(0xFF2F9E6F);
  static const fault = Color(0xFFFF6B2C);

  static TextStyle display({
    double size = 32,
    FontWeight weight = FontWeight.w700,
    Color color = ink,
    double height = 1.1,
  }) {
    return GoogleFonts.syne(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      letterSpacing: -0.6,
    );
  }

  static TextStyle body({
    double size = 15,
    FontWeight weight = FontWeight.w400,
    Color color = ink,
    double height = 1.45,
  }) {
    return GoogleFonts.manrope(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
    );
  }

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: canvas,
      colorScheme: const ColorScheme.light(
        primary: accentDeep,
        secondary: accent,
        surface: surface,
        error: danger,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: ink,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme).apply(
        bodyColor: ink,
        displayColor: ink,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: display(size: 22),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ink.withValues(alpha: 0.08)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ink.withValues(alpha: 0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accentDeep, width: 1.5),
        ),
        labelStyle: body(size: 13, color: muted, weight: FontWeight.w600),
        hintStyle: body(size: 14, color: muted.withValues(alpha: 0.7)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: accentDeep,
          foregroundColor: Colors.white,
          textStyle: body(size: 16, weight: FontWeight.w700, color: Colors.white),
          minimumSize: const Size.fromHeight(54),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: accentSoft,
        labelTextStyle: WidgetStatePropertyAll(body(size: 11, weight: FontWeight.w700)),
        iconTheme: const WidgetStatePropertyAll(IconThemeData(size: 22)),
        elevation: 0,
        height: 68,
      ),
    );
  }
}
