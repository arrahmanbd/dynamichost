import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

import '../colors/app_color.dart';


class AppTheme {
  AppTheme._();

  static final _colorScheme = ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: AppColors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSurface: AppColors.textPrimary,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    
    colorScheme: _colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Inter',

    // =========================
    // TYPOGRAPHY
    // =========================
    textTheme: TextTheme(
      displayLarge: _textStyle(32, FontWeight.w600),
      displayMedium: _textStyle(28, FontWeight.w600),
      titleLarge: _textStyle(20, FontWeight.w600),
      titleMedium: _textStyle(18, FontWeight.w500),
      bodyLarge: _textStyle(16, FontWeight.w400),
      bodyMedium: _textStyle(14, FontWeight.w400),
      bodySmall: _textStyle(12, FontWeight.w400,
          color: AppColors.textSecondary),
      labelLarge: _textStyle(14, FontWeight.w600),
    ),

    // =========================
    // APP BAR
    // =========================
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      titleTextStyle: _textStyle(
        18,
        FontWeight.w600,
        color: Colors.white,
      ),
    ),

    // =========================
    // CARD
    // =========================
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      margin: EdgeInsets.zero,
    ),

    // =========================
    // INPUT
    // =========================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 14.h,
      ),
      hintStyle: _textStyle(
        14,
        FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(
        color: AppColors.primary,
        width: 1.5,
      ),
      errorBorder: _inputBorder(color: Colors.red),
      focusedErrorBorder: _inputBorder(
        color: Colors.red,
        width: 1.5,
      ),
    ),

    // =========================
    // ELEVATED BUTTON
    // =========================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: Size(double.infinity, 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        textStyle: _textStyle(16, FontWeight.w600,
            color: Colors.white),
      ),
    ),

    // =========================
    // OUTLINED BUTTON
    // =========================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(color: AppColors.primary),
        minimumSize: Size(double.infinity, 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
        textStyle: _textStyle(15, FontWeight.w600),
      ),
    ),

    // =========================
    // TEXT BUTTON
    // =========================
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: _textStyle(14, FontWeight.w600),
      ),
    ),

    // =========================
    // CHECKBOX
    // =========================
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.primary
            : Colors.transparent,
      ),
      side: BorderSide(color: AppColors.border),
    ),

    // =========================
    // DIVIDER
    // =========================
    dividerTheme: DividerThemeData(
      color: AppColors.border,
      thickness: 1,
      space: 24.h,
    ),

    // =========================
    // BOTTOM NAV
    // =========================
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          _textStyle(12, FontWeight.w600),
      unselectedLabelStyle:
          _textStyle(12, FontWeight.w400),
    ),
  );

  // =========================
  // PRIVATE HELPERS
  // =========================

  static TextStyle _textStyle(
    double size,
    FontWeight weight, {
    Color? color,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: size.sp,
      fontWeight: weight,
      color: color ?? AppColors.textPrimary,
      fontFamilyFallback: const ['HindSiliguri'],
    );
  }

  static OutlineInputBorder _inputBorder({
    Color? color,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: color ?? AppColors.border,
        width: width,
      ),
    );
  }
}