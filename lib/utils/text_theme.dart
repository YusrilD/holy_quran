// text_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_quran/utils/app_colors.dart';

class AppTextTheme {
  static TextTheme getTextTheme() {
    return TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 36,
        color: const Color(AppColor.primary),
      ),
      titleLarge: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: const Color(AppColor.secondary),
      ),
      titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: const Color(AppColor.secondary),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: const Color(AppColor.secondary),
      ),
      bodySmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: const Color(AppColor.secondary),
      ),
    );
  }
}
