import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppTheme {
  static ThemeData get etherealFlowTheme {
    return ThemeData(
      // The Ethereal Flow relies on modern Material 3 conventions configured for "High-End Editorial".
      useMaterial3: true,
      fontFamily: AppTypography.primaryFont,
      scaffoldBackgroundColor: AppColors.surface,
      
      // Color Tonal Depth
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryContainer,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryContainer,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        outlineVariant: AppColors.outlineVariant,
      ),
      
      // Typography: Editorial Authority
      textTheme: const TextTheme(
        // The Display Scale for arrival screens / Magazine feel
        displayLarge: TextStyle(
          fontSize: 56.0, // 3.5rem
          fontWeight: FontWeight.w300, 
          letterSpacing: -1.0,
          color: AppColors.onSurface,
        ),
        // Headline to establish a calm authority
        headlineMedium: TextStyle(
          fontSize: 28.0, // 1.75rem
          fontWeight: FontWeight.w500,
          color: AppColors.onSurface,
        ),
        // Body text ensuring the spiritual content remains readable and peaceful
        bodyLarge: TextStyle(
          fontSize: 16.0, // 1rem
          height: 1.6, // Generous line-height
          color: AppColors.onSurface,
        ),
      ),
      
      // Cards & Lists
      cardTheme: CardThemeData(
        color: AppColors.surfaceContainerLow,
        elevation: 0, // Depth is achieved through the Layering Principle or ambientShadow
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0), // lg (1rem) corner radius
        ),
      ),
      
      // Buttons & Interaction
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryContainer, // Expected to be overridden by gradient container often
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0), // xl (1.5rem) radius for primary action
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryContainer,
          backgroundColor: AppColors.surfaceContainerHighest, // Secondary Action background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceContainerLow,
        selectedColor: AppColors.secondaryContainer.withValues(alpha: 0.5), // "secondary_fixed_dim" analogue
        labelStyle: const TextStyle(color: AppColors.onSurface),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // md (0.75rem)
        ),
        side: BorderSide.none,
      ),
      
      // The "No-Line" Rule - Forbid external dividers
      dividerTheme: const DividerThemeData(
        color: Colors.transparent, 
        thickness: 0,
        space: 27.0, // spacing-5 (1.7rem) for lists
      ),
    );
  }
}
