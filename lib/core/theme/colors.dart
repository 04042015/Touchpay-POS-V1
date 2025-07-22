import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF42A5F5);
  
  // Secondary Colors
  static const Color secondary = Color(0xFF388E3C);
  static const Color secondaryDark = Color(0xFF2E7D32);
  static const Color secondaryLight = Color(0xFF66BB6A);
  
  // Error Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color errorDark = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFEF5350);
  
  // Warning Colors
  static const Color warning = Color(0xFFF57C00);
  static const Color warningDark = Color(0xFFEF6C00);
  static const Color warningLight = Color(0xFFFFB74D);
  
  // Success Colors
  static const Color success = Color(0xFF388E3C);
  static const Color successDark = Color(0xFF2E7D32);
  static const Color successLight = Color(0xFF66BB6A);
  
  // Neutral Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF616161);
  static const Color greyLight = Color(0xFFE0E0E0);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Card Colors
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF2C2C2C);
  
  // POS Specific Colors
  static const Color cashColor = Color(0xFF4CAF50);
  static const Color cardPaymentColor = Color(0xFF2196F3);
  static const Color digitalPaymentColor = Color(0xFF9C27B0);
  
  // Table Status Colors
  static const Color tableAvailable = Color(0xFF4CAF50);
  static const Color tableOccupied = Color(0xFFF44336);
  static const Color tableReserved = Color(0xFFFF9800);
  
  // Order Status Colors
  static const Color orderPending = Color(0xFFFF9800);
  static const Color orderCompleted = Color(0xFF4CAF50);
  static const Color orderCancelled = Color(0xFFF44336);
  
  // Light Theme Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    secondary: secondary,
    onSecondary: white,
    error: error,
    onError: white,
    surface: surfaceLight,
    onSurface: textPrimary,
    background: backgroundLight,
    onBackground: textPrimary,
  );
  
  // Dark Theme Color Scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryLight,
    onPrimary: black,
    secondary: secondaryLight,
    onSecondary: black,
    error: errorLight,
    onError: black,
    surface: surfaceDark,
    onSurface: white,
    background: backgroundDark,
    onBackground: white,
  );
}