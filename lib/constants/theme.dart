import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Màu chủ đạo pastel
  static const Color primaryColor = Color(0xFFB5EAD7); // Xanh mint pastel
  static const Color secondaryColor = Color(0xFFFFC8DD); // Hồng pastel
  static const Color accentColor = Color(0xFFC7CEEA); // Xanh dương pastel
  static const Color backgroundColor = Color(0xFFFFF8F0); // Kem nhạt
  static const Color textColor = Color(0xFF4A4A4A); // Xám đậm
  static const Color lightTextColor = Color(0xFF7A7A7A); // Xám nhạt
  static const Color highlightColor = Color(0xFFFFD6BA); // Cam pastel
  static const Color cardColor = Color(0xFFFFFFFF); // Trắng

  // Các màu pastel phụ
  static const Color pastelYellow = Color(0xFFFFEAD1);
  static const Color pastelPurple = Color(0xFFE2D1F9);
  static const Color pastelGreen = Color(0xFFCBF0F8);

  // Box shadow cho card
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      spreadRadius: 0,
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // Border radius
  static const double borderRadius = 16.0;
  static const double buttonRadius = 24.0;

  // Định nghĩa theme chung
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: GoogleFonts.poppins().fontFamily,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.poppins(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: GoogleFonts.poppins(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(color: textColor, fontSize: 16),
      bodyMedium: GoogleFonts.poppins(color: lightTextColor, fontSize: 14),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      background: backgroundColor,
    ),
    useMaterial3: true,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
        ),
        elevation: 0,
      ),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    ),
  );
}

// Animation duration
const Duration kButtonAnimationDuration = Duration(milliseconds: 300);
const Duration kCardAnimationDuration = Duration(milliseconds: 500);
const Duration kPageTransitionDuration = Duration(milliseconds: 400);
