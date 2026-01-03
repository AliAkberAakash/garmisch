import 'package:flutter/widgets.dart';

import '../foundations/typography.dart';

/// Garmisch Design System Text Theme
///
/// Defines text styles for the design system following Material Design 3 type scale.
/// Usage: Access through `GTheme.of(context).textTheme`
class GTextTheme {
  const GTextTheme({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
  });

  /// Creates a default text theme
  factory GTextTheme.standard({
    String? fontFamily,
    List<String>? fontFamilyFallback,
  }) {
    final family = fontFamily ?? GTypography.fontFamilySans;
    final fallback = fontFamilyFallback ?? GTypography.fontFamilyFallback;

    return GTextTheme(
      displayLarge: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl7,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingTight,
        height: GTypography.lineHeightXl7 / GTypography.fontSizeXl7,
      ),
      displayMedium: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl6,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingTight,
        height: GTypography.lineHeightXl6 / GTypography.fontSizeXl6,
      ),
      displaySmall: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl5,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXl5 / GTypography.fontSizeXl5,
      ),
      headlineLarge: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl4,
        fontWeight: GTypography.fontWeightSemiBold,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXl4 / GTypography.fontSizeXl4,
      ),
      headlineMedium: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl3,
        fontWeight: GTypography.fontWeightSemiBold,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXl3 / GTypography.fontSizeXl3,
      ),
      headlineSmall: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl2,
        fontWeight: GTypography.fontWeightSemiBold,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXl2 / GTypography.fontSizeXl2,
      ),
      titleLarge: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXl,
        fontWeight: GTypography.fontWeightMedium,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXl / GTypography.fontSizeXl,
      ),
      titleMedium: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeBase,
        fontWeight: GTypography.fontWeightMedium,
        letterSpacing: GTypography.letterSpacingWide,
        height: GTypography.lineHeightBase / GTypography.fontSizeBase,
      ),
      titleSmall: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeSm,
        fontWeight: GTypography.fontWeightMedium,
        letterSpacing: GTypography.letterSpacingWide,
        height: GTypography.lineHeightSm / GTypography.fontSizeSm,
      ),
      labelLarge: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeSm,
        fontWeight: GTypography.fontWeightSemiBold,
        letterSpacing: GTypography.letterSpacingWide,
        height: GTypography.lineHeightSm / GTypography.fontSizeSm,
      ),
      labelMedium: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXs,
        fontWeight: GTypography.fontWeightSemiBold,
        letterSpacing: GTypography.letterSpacingWider,
        height: GTypography.lineHeightXs / GTypography.fontSizeXs,
      ),
      labelSmall: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXs,
        fontWeight: GTypography.fontWeightMedium,
        letterSpacing: GTypography.letterSpacingWider,
        height: GTypography.lineHeightXs / GTypography.fontSizeXs,
      ),
      bodyLarge: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeBase,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightBase / GTypography.fontSizeBase,
      ),
      bodyMedium: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeSm,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightSm / GTypography.fontSizeSm,
      ),
      bodySmall: TextStyle(
        fontFamily: family,
        fontFamilyFallback: fallback,
        fontSize: GTypography.fontSizeXs,
        fontWeight: GTypography.fontWeightRegular,
        letterSpacing: GTypography.letterSpacingNormal,
        height: GTypography.lineHeightXs / GTypography.fontSizeXs,
      ),
    );
  }

  // ============================================
  // Display Styles (Large headlines, hero text)
  // ============================================

  /// Display Large - 72px, regular weight
  /// Use for hero text and large headlines
  final TextStyle displayLarge;

  /// Display Medium - 60px, regular weight
  /// Use for large headlines
  final TextStyle displayMedium;

  /// Display Small - 48px, regular weight
  /// Use for section headers
  final TextStyle displaySmall;

  // ============================================
  // Headline Styles (Page and section titles)
  // ============================================

  /// Headline Large - 36px, semi-bold weight
  /// Use for page titles
  final TextStyle headlineLarge;

  /// Headline Medium - 30px, semi-bold weight
  /// Use for section titles
  final TextStyle headlineMedium;

  /// Headline Small - 24px, semi-bold weight
  /// Use for card titles
  final TextStyle headlineSmall;

  // ============================================
  // Title Styles (Subtitles and list titles)
  // ============================================

  /// Title Large - 20px, medium weight
  /// Use for list titles
  final TextStyle titleLarge;

  /// Title Medium - 16px, medium weight
  /// Use for subtitles
  final TextStyle titleMedium;

  /// Title Small - 14px, medium weight
  /// Use for small titles
  final TextStyle titleSmall;

  // ============================================
  // Label Styles (Buttons, badges, captions)
  // ============================================

  /// Label Large - 14px, semi-bold weight
  /// Use for button labels
  final TextStyle labelLarge;

  /// Label Medium - 12px, semi-bold weight
  /// Use for tags and badges
  final TextStyle labelMedium;

  /// Label Small - 12px, medium weight
  /// Use for captions
  final TextStyle labelSmall;

  // ============================================
  // Body Styles (Paragraphs and content)
  // ============================================

  /// Body Large - 16px, regular weight
  /// Use for primary body text
  final TextStyle bodyLarge;

  /// Body Medium - 14px, regular weight
  /// Use for secondary body text
  final TextStyle bodyMedium;

  /// Body Small - 12px, regular weight
  /// Use for tertiary body text
  final TextStyle bodySmall;

  /// Apply a color to all text styles
  GTextTheme apply({Color? color, Color? decorationColor}) {
    return GTextTheme(
      displayLarge: displayLarge.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      displayMedium: displayMedium.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      displaySmall: displaySmall.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      headlineLarge: headlineLarge.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      headlineMedium: headlineMedium.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      headlineSmall: headlineSmall.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      titleLarge: titleLarge.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      titleMedium: titleMedium.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      titleSmall: titleSmall.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      labelLarge: labelLarge.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      labelMedium: labelMedium.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      labelSmall: labelSmall.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      bodyLarge: bodyLarge.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      bodyMedium: bodyMedium.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
      bodySmall: bodySmall.copyWith(
        color: color,
        decorationColor: decorationColor,
      ),
    );
  }

  /// Creates a copy of this text theme with the given fields replaced
  GTextTheme copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
  }) {
    return GTextTheme(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GTextTheme &&
        other.displayLarge == displayLarge &&
        other.displayMedium == displayMedium &&
        other.displaySmall == displaySmall &&
        other.headlineLarge == headlineLarge &&
        other.headlineMedium == headlineMedium &&
        other.headlineSmall == headlineSmall &&
        other.titleLarge == titleLarge &&
        other.titleMedium == titleMedium &&
        other.titleSmall == titleSmall &&
        other.labelLarge == labelLarge &&
        other.labelMedium == labelMedium &&
        other.labelSmall == labelSmall &&
        other.bodyLarge == bodyLarge &&
        other.bodyMedium == bodyMedium &&
        other.bodySmall == bodySmall;
  }

  @override
  int get hashCode {
    return Object.hash(
      displayLarge,
      displayMedium,
      displaySmall,
      headlineLarge,
      headlineMedium,
      headlineSmall,
      titleLarge,
      titleMedium,
      titleSmall,
      labelLarge,
      labelMedium,
      labelSmall,
      bodyLarge,
      bodyMedium,
      bodySmall,
    );
  }
}

/// Text style enum for type-safe access
enum GTextStyleToken {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall;

  /// Get the TextStyle from a GTextTheme
  TextStyle of(GTextTheme theme) {
    switch (this) {
      case GTextStyleToken.displayLarge:
        return theme.displayLarge;
      case GTextStyleToken.displayMedium:
        return theme.displayMedium;
      case GTextStyleToken.displaySmall:
        return theme.displaySmall;
      case GTextStyleToken.headlineLarge:
        return theme.headlineLarge;
      case GTextStyleToken.headlineMedium:
        return theme.headlineMedium;
      case GTextStyleToken.headlineSmall:
        return theme.headlineSmall;
      case GTextStyleToken.titleLarge:
        return theme.titleLarge;
      case GTextStyleToken.titleMedium:
        return theme.titleMedium;
      case GTextStyleToken.titleSmall:
        return theme.titleSmall;
      case GTextStyleToken.labelLarge:
        return theme.labelLarge;
      case GTextStyleToken.labelMedium:
        return theme.labelMedium;
      case GTextStyleToken.labelSmall:
        return theme.labelSmall;
      case GTextStyleToken.bodyLarge:
        return theme.bodyLarge;
      case GTextStyleToken.bodyMedium:
        return theme.bodyMedium;
      case GTextStyleToken.bodySmall:
        return theme.bodySmall;
    }
  }
}

