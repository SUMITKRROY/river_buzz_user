import 'package:flutter/material.dart';

class AppColors {
  // Primary (Deep River Blue)
  static const Color primaryContainer = Color(0xFF0A3D62);

  // Secondary (Sunrise Orange)
  static const Color secondary = Color(0xFF865300);
  static const Color secondaryContainer = Color(0xFFFEA520);

  // Accent (Aarti Flame Red) for high-spiritual moments
  static const Color tertiary = Color(0xFFE63946); // Aarti Flame
  static const Color tertiaryContainer = Color(
    0xFFD90429,
  ); // High contract Aarti Red

  // Surface (Soft White) - The Canvas
  static const Color surface = Color(0xFFF8F9FA);
  static const Color surfaceContainerLow = Color(0xFFF1F3F4); // Nested sections
  static const Color surfaceContainerHighest = Color(
    0xFFE2E4E6,
  ); // Interactive elements
  static const Color surfaceBright = Color(0xFFFFFFFF);

  static const Color onSurface = Color(
    0xFF191C1D,
  ); // Used instead of pure black

  // Ghost Borders
  static const Color outlineVariant = Color(
    0x26191C1D,
  ); // 15% opacity of on_surface
}

class AppTypography {
  static const String primaryFont = 'Inter';
  static const String secondaryFont = 'NotoSansDevanagari'; // Bilingual Harmony
}

class AppStyles {
  // Ambient Shadows: For floating elements
  static final List<BoxShadow> ambientShadow = [
    BoxShadow(
      color: AppColors.onSurface.withValues(alpha: 0.06),
      blurRadius: 32.0,
      spreadRadius: 0.0,
      offset: const Offset(0, 8),
    ),
  ];

  // Signature Texture (Gradient): Use exclusively for Hero backgrounds & high-intent CTAs
  static const LinearGradient signatureGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.primaryContainer, AppColors.secondaryContainer],
  );
}
