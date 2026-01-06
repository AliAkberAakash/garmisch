import 'dart:ui';

import 'colors.dart';

/// Garmisch Design System - System Colors
///
/// Brightness-agnostic color aliases that map reference colors (GColors)
/// to semantic roles. This is the middle layer in the 3-tier color architecture:
///
/// 1. Reference Colors (GColors) - Raw color primitives (untouched)
/// 2. System Colors (GSystemColors) - Semantic color aliases (this file)
/// 3. Color Scheme (GColorScheme) - Light/dark mode specific tokens
///
/// Usage:
/// ```dart
/// // Use standard system colors
/// final systemColors = GSystemColors.standard();
///
/// // Or create from JSON for dynamic theming
/// final customColors = GSystemColors.fromJson({
///   'brand': {
///     'primary': {'500': '#3B82F6', '600': '#2563EB'}
///   }
/// });
/// ```
class GSystemColors {
  const GSystemColors({
    required this.brand,
    required this.neutral,
    required this.feedback,
  });

  /// Creates the standard/default system colors mapping
  factory GSystemColors.standard() {
    return GSystemColors(
      brand: GBrandColors.standard(),
      neutral: GNeutralColors.standard(),
      feedback: GFeedbackColors.standard(),
    );
  }

  /// Creates system colors from a JSON map with partial override support.
  ///
  /// Unspecified values fall back to standard defaults.
  ///
  /// Expected JSON structure:
  /// ```json
  /// {
  ///   "brand": {
  ///     "primary": {"50": "#EFF6FF", "100": "#DBEAFE", ...},
  ///     "secondary": {"50": "#F9FAFB", ...},
  ///     "tertiary": {"50": "#F0FDFA", ...}
  ///   },
  ///   "neutral": {
  ///     "50": "#F9FAFB", "100": "#F3F4F6", ...
  ///   },
  ///   "feedback": {
  ///     "error": {"50": "#FEF2F2", ...},
  ///     "warning": {"50": "#FFFBEB", ...},
  ///     "success": {"50": "#F0FDF4", ...},
  ///     "info": {"50": "#EFF6FF", ...}
  ///   }
  /// }
  /// ```
  factory GSystemColors.fromJson(Map<String, dynamic> json) {
    final standard = GSystemColors.standard();

    return GSystemColors(
      brand: json['brand'] != null
          ? GBrandColors.fromJson(
              json['brand'] as Map<String, dynamic>,
              fallback: standard.brand,
            )
          : standard.brand,
      neutral: json['neutral'] != null
          ? GNeutralColors.fromJson(
              json['neutral'] as Map<String, dynamic>,
              fallback: standard.neutral,
            )
          : standard.neutral,
      feedback: json['feedback'] != null
          ? GFeedbackColors.fromJson(
              json['feedback'] as Map<String, dynamic>,
              fallback: standard.feedback,
            )
          : standard.feedback,
    );
  }

  /// Brand colors (primary, secondary, tertiary)
  final GBrandColors brand;

  /// Neutral colors for surfaces, backgrounds, text
  final GNeutralColors neutral;

  /// Feedback colors (error, warning, success, info)
  final GFeedbackColors feedback;

  /// Creates a copy with the given fields replaced
  GSystemColors copyWith({
    GBrandColors? brand,
    GNeutralColors? neutral,
    GFeedbackColors? feedback,
  }) {
    return GSystemColors(
      brand: brand ?? this.brand,
      neutral: neutral ?? this.neutral,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GSystemColors &&
        other.brand == brand &&
        other.neutral == neutral &&
        other.feedback == feedback;
  }

  @override
  int get hashCode => Object.hash(brand, neutral, feedback);
}

// ============================================
// Brand Colors
// ============================================

/// Brand color palettes for primary, secondary, and tertiary colors
class GBrandColors {
  const GBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  /// Creates standard brand colors
  factory GBrandColors.standard() {
    return GBrandColors(
      primary: GColorScale.blueAccent(),
      secondary: GColorScale.gray(),
      tertiary: GColorScale.teal(),
    );
  }

  /// Creates brand colors from JSON with fallback support
  factory GBrandColors.fromJson(
    Map<String, dynamic> json, {
    required GBrandColors fallback,
  }) {
    return GBrandColors(
      primary: json['primary'] != null
          ? GColorScale.fromJson(
              json['primary'] as Map<String, dynamic>,
              fallback: fallback.primary,
            )
          : fallback.primary,
      secondary: json['secondary'] != null
          ? GColorScale.fromJson(
              json['secondary'] as Map<String, dynamic>,
              fallback: fallback.secondary,
            )
          : fallback.secondary,
      tertiary: json['tertiary'] != null
          ? GColorScale.fromJson(
              json['tertiary'] as Map<String, dynamic>,
              fallback: fallback.tertiary,
            )
          : fallback.tertiary,
    );
  }

  /// Primary brand color palette
  final GColorScale primary;

  /// Secondary brand color palette
  final GColorScale secondary;

  /// Tertiary/accent brand color palette
  final GColorScale tertiary;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GBrandColors &&
        other.primary == primary &&
        other.secondary == secondary &&
        other.tertiary == tertiary;
  }

  @override
  int get hashCode => Object.hash(primary, secondary, tertiary);
}

// ============================================
// Neutral Colors
// ============================================

/// Neutral color palette for surfaces, backgrounds, and text
class GNeutralColors {
  const GNeutralColors({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// Creates standard neutral colors from gray scale
  factory GNeutralColors.standard() {
    return const GNeutralColors(
      shade50: GColors.gray50,
      shade100: GColors.gray100,
      shade200: GColors.gray200,
      shade300: GColors.gray300,
      shade400: GColors.gray400,
      shade500: GColors.gray500,
      shade600: GColors.gray600,
      shade700: GColors.gray700,
      shade800: GColors.gray800,
      shade900: GColors.gray900,
      shade950: GColors.gray950,
    );
  }

  /// Creates neutral colors from JSON with fallback support
  factory GNeutralColors.fromJson(
    Map<String, dynamic> json, {
    required GNeutralColors fallback,
  }) {
    return GNeutralColors(
      shade50: _parseColor(json['50']) ?? fallback.shade50,
      shade100: _parseColor(json['100']) ?? fallback.shade100,
      shade200: _parseColor(json['200']) ?? fallback.shade200,
      shade300: _parseColor(json['300']) ?? fallback.shade300,
      shade400: _parseColor(json['400']) ?? fallback.shade400,
      shade500: _parseColor(json['500']) ?? fallback.shade500,
      shade600: _parseColor(json['600']) ?? fallback.shade600,
      shade700: _parseColor(json['700']) ?? fallback.shade700,
      shade800: _parseColor(json['800']) ?? fallback.shade800,
      shade900: _parseColor(json['900']) ?? fallback.shade900,
      shade950: _parseColor(json['950']) ?? fallback.shade950,
    );
  }

  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GNeutralColors &&
        other.shade50 == shade50 &&
        other.shade100 == shade100 &&
        other.shade200 == shade200 &&
        other.shade300 == shade300 &&
        other.shade400 == shade400 &&
        other.shade500 == shade500 &&
        other.shade600 == shade600 &&
        other.shade700 == shade700 &&
        other.shade800 == shade800 &&
        other.shade900 == shade900 &&
        other.shade950 == shade950;
  }

  @override
  int get hashCode => Object.hashAll([
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ]);
}

// ============================================
// Feedback Colors
// ============================================

/// Feedback color palettes for semantic states
class GFeedbackColors {
  const GFeedbackColors({
    required this.error,
    required this.warning,
    required this.success,
    required this.info,
  });

  /// Creates standard feedback colors
  factory GFeedbackColors.standard() {
    return GFeedbackColors(
      error: GColorScale.red(),
      warning: GColorScale.amber(),
      success: GColorScale.green(),
      info: GColorScale.blue(),
    );
  }

  /// Creates feedback colors from JSON with fallback support
  factory GFeedbackColors.fromJson(
    Map<String, dynamic> json, {
    required GFeedbackColors fallback,
  }) {
    return GFeedbackColors(
      error: json['error'] != null
          ? GColorScale.fromJson(
              json['error'] as Map<String, dynamic>,
              fallback: fallback.error,
            )
          : fallback.error,
      warning: json['warning'] != null
          ? GColorScale.fromJson(
              json['warning'] as Map<String, dynamic>,
              fallback: fallback.warning,
            )
          : fallback.warning,
      success: json['success'] != null
          ? GColorScale.fromJson(
              json['success'] as Map<String, dynamic>,
              fallback: fallback.success,
            )
          : fallback.success,
      info: json['info'] != null
          ? GColorScale.fromJson(
              json['info'] as Map<String, dynamic>,
              fallback: fallback.info,
            )
          : fallback.info,
    );
  }

  /// Error/destructive color palette
  final GColorScale error;

  /// Warning/caution color palette
  final GColorScale warning;

  /// Success/positive color palette
  final GColorScale success;

  /// Info/informational color palette
  final GColorScale info;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GFeedbackColors &&
        other.error == error &&
        other.warning == warning &&
        other.success == success &&
        other.info == info;
  }

  @override
  int get hashCode => Object.hash(error, warning, success, info);
}

// ============================================
// Color Scale
// ============================================

/// A complete color scale with shades from 50 to 950
class GColorScale {
  const GColorScale({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// Creates a gray color scale
  factory GColorScale.gray() {
    return const GColorScale(
      shade50: GColors.gray50,
      shade100: GColors.gray100,
      shade200: GColors.gray200,
      shade300: GColors.gray300,
      shade400: GColors.gray400,
      shade500: GColors.gray500,
      shade600: GColors.gray600,
      shade700: GColors.gray700,
      shade800: GColors.gray800,
      shade900: GColors.gray900,
      shade950: GColors.gray950,
    );
  }

  /// Creates a blue color scale
  factory GColorScale.blue() {
    return const GColorScale(
      shade50: GColors.blue50,
      shade100: GColors.blue100,
      shade200: GColors.blue200,
      shade300: GColors.blue300,
      shade400: GColors.blue400,
      shade500: GColors.blue500,
      shade600: GColors.blue600,
      shade700: GColors.blue700,
      shade800: GColors.blue800,
      shade900: GColors.blue900,
      shade950: GColors.blue950,
    );
  }

  /// Creates a blue accent color scale (matches Flutter's blueAccent)
  ///
  /// Maps Flutter's 4-shade accent scale to 11-shade scale:
  /// - shade50 is a light tint
  /// - shade100/200 use blueAccent100
  /// - shade300/400/500 interpolate between blueAccent100 and blueAccent200
  /// - shade600 uses blueAccent200 (primary accent - Flutter's default)
  /// - shade700 uses blueAccent400
  /// - shade800/900 use blueAccent700
  /// - shade950 is a darker shade
  factory GColorScale.blueAccent() {
    return const GColorScale(
      shade50: Color(0xFFE3F2FD), // Light tint
      shade100: GColors.blueAccent100,
      shade200: GColors.blueAccent100,
      shade300: Color(0xFF6B9EFF), // Interpolated
      shade400: Color(0xFF5794FF), // Interpolated
      shade500: GColors.blueAccent200,
      shade600: GColors.blueAccent200, // Primary accent (Flutter's default)
      shade700: GColors.blueAccent400,
      shade800: GColors.blueAccent700,
      shade900: Color(0xFF1A47CC), // Darker shade
      shade950: Color(0xFF0D2466), // Darkest shade
    );
  }

  /// Creates a red color scale
  factory GColorScale.red() {
    return const GColorScale(
      shade50: GColors.red50,
      shade100: GColors.red100,
      shade200: GColors.red200,
      shade300: GColors.red300,
      shade400: GColors.red400,
      shade500: GColors.red500,
      shade600: GColors.red600,
      shade700: GColors.red700,
      shade800: GColors.red800,
      shade900: GColors.red900,
      shade950: GColors.red950,
    );
  }

  /// Creates an amber color scale
  factory GColorScale.amber() {
    return const GColorScale(
      shade50: GColors.amber50,
      shade100: GColors.amber100,
      shade200: GColors.amber200,
      shade300: GColors.amber300,
      shade400: GColors.amber400,
      shade500: GColors.amber500,
      shade600: GColors.amber600,
      shade700: GColors.amber700,
      shade800: GColors.amber800,
      shade900: GColors.amber900,
      shade950: GColors.amber950,
    );
  }

  /// Creates a green color scale
  factory GColorScale.green() {
    return const GColorScale(
      shade50: GColors.green50,
      shade100: GColors.green100,
      shade200: GColors.green200,
      shade300: GColors.green300,
      shade400: GColors.green400,
      shade500: GColors.green500,
      shade600: GColors.green600,
      shade700: GColors.green700,
      shade800: GColors.green800,
      shade900: GColors.green900,
      shade950: GColors.green950,
    );
  }

  /// Creates a teal color scale
  factory GColorScale.teal() {
    return const GColorScale(
      shade50: GColors.teal50,
      shade100: GColors.teal100,
      shade200: GColors.teal200,
      shade300: GColors.teal300,
      shade400: GColors.teal400,
      shade500: GColors.teal500,
      shade600: GColors.teal600,
      shade700: GColors.teal700,
      shade800: GColors.teal800,
      shade900: GColors.teal900,
      shade950: GColors.teal950,
    );
  }

  /// Creates an indigo color scale
  factory GColorScale.indigo() {
    return const GColorScale(
      shade50: GColors.indigo50,
      shade100: GColors.indigo100,
      shade200: GColors.indigo200,
      shade300: GColors.indigo300,
      shade400: GColors.indigo400,
      shade500: GColors.indigo500,
      shade600: GColors.indigo600,
      shade700: GColors.indigo700,
      shade800: GColors.indigo800,
      shade900: GColors.indigo900,
      shade950: GColors.indigo950,
    );
  }

  /// Creates a violet color scale
  factory GColorScale.violet() {
    return const GColorScale(
      shade50: GColors.violet50,
      shade100: GColors.violet100,
      shade200: GColors.violet200,
      shade300: GColors.violet300,
      shade400: GColors.violet400,
      shade500: GColors.violet500,
      shade600: GColors.violet600,
      shade700: GColors.violet700,
      shade800: GColors.violet800,
      shade900: GColors.violet900,
      shade950: GColors.violet950,
    );
  }

  /// Creates a purple color scale
  factory GColorScale.purple() {
    return const GColorScale(
      shade50: GColors.purple50,
      shade100: GColors.purple100,
      shade200: GColors.purple200,
      shade300: GColors.purple300,
      shade400: GColors.purple400,
      shade500: GColors.purple500,
      shade600: GColors.purple600,
      shade700: GColors.purple700,
      shade800: GColors.purple800,
      shade900: GColors.purple900,
      shade950: GColors.purple950,
    );
  }

  /// Creates an orange color scale
  factory GColorScale.orange() {
    return const GColorScale(
      shade50: GColors.orange50,
      shade100: GColors.orange100,
      shade200: GColors.orange200,
      shade300: GColors.orange300,
      shade400: GColors.orange400,
      shade500: GColors.orange500,
      shade600: GColors.orange600,
      shade700: GColors.orange700,
      shade800: GColors.orange800,
      shade900: GColors.orange900,
      shade950: GColors.orange950,
    );
  }

  /// Creates a rose color scale
  factory GColorScale.rose() {
    return const GColorScale(
      shade50: GColors.rose50,
      shade100: GColors.rose100,
      shade200: GColors.rose200,
      shade300: GColors.rose300,
      shade400: GColors.rose400,
      shade500: GColors.rose500,
      shade600: GColors.rose600,
      shade700: GColors.rose700,
      shade800: GColors.rose800,
      shade900: GColors.rose900,
      shade950: GColors.rose950,
    );
  }

  /// Creates an emerald color scale
  factory GColorScale.emerald() {
    return const GColorScale(
      shade50: GColors.emerald50,
      shade100: GColors.emerald100,
      shade200: GColors.emerald200,
      shade300: GColors.emerald300,
      shade400: GColors.emerald400,
      shade500: GColors.emerald500,
      shade600: GColors.emerald600,
      shade700: GColors.emerald700,
      shade800: GColors.emerald800,
      shade900: GColors.emerald900,
      shade950: GColors.emerald950,
    );
  }

  /// Creates a cyan color scale
  factory GColorScale.cyan() {
    return const GColorScale(
      shade50: GColors.cyan50,
      shade100: GColors.cyan100,
      shade200: GColors.cyan200,
      shade300: GColors.cyan300,
      shade400: GColors.cyan400,
      shade500: GColors.cyan500,
      shade600: GColors.cyan600,
      shade700: GColors.cyan700,
      shade800: GColors.cyan800,
      shade900: GColors.cyan900,
      shade950: GColors.cyan950,
    );
  }

  /// Creates a sky color scale
  factory GColorScale.sky() {
    return const GColorScale(
      shade50: GColors.sky50,
      shade100: GColors.sky100,
      shade200: GColors.sky200,
      shade300: GColors.sky300,
      shade400: GColors.sky400,
      shade500: GColors.sky500,
      shade600: GColors.sky600,
      shade700: GColors.sky700,
      shade800: GColors.sky800,
      shade900: GColors.sky900,
      shade950: GColors.sky950,
    );
  }

  /// Creates a color scale from JSON with fallback support
  factory GColorScale.fromJson(
    Map<String, dynamic> json, {
    required GColorScale fallback,
  }) {
    return GColorScale(
      shade50: _parseColor(json['50']) ?? fallback.shade50,
      shade100: _parseColor(json['100']) ?? fallback.shade100,
      shade200: _parseColor(json['200']) ?? fallback.shade200,
      shade300: _parseColor(json['300']) ?? fallback.shade300,
      shade400: _parseColor(json['400']) ?? fallback.shade400,
      shade500: _parseColor(json['500']) ?? fallback.shade500,
      shade600: _parseColor(json['600']) ?? fallback.shade600,
      shade700: _parseColor(json['700']) ?? fallback.shade700,
      shade800: _parseColor(json['800']) ?? fallback.shade800,
      shade900: _parseColor(json['900']) ?? fallback.shade900,
      shade950: _parseColor(json['950']) ?? fallback.shade950,
    );
  }

  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GColorScale &&
        other.shade50 == shade50 &&
        other.shade100 == shade100 &&
        other.shade200 == shade200 &&
        other.shade300 == shade300 &&
        other.shade400 == shade400 &&
        other.shade500 == shade500 &&
        other.shade600 == shade600 &&
        other.shade700 == shade700 &&
        other.shade800 == shade800 &&
        other.shade900 == shade900 &&
        other.shade950 == shade950;
  }

  @override
  int get hashCode => Object.hashAll([
        shade50,
        shade100,
        shade200,
        shade300,
        shade400,
        shade500,
        shade600,
        shade700,
        shade800,
        shade900,
        shade950,
      ]);
}

// ============================================
// Helper Functions
// ============================================

/// Parses a color from a hex string (e.g., "#3B82F6" or "3B82F6")
Color? _parseColor(dynamic value) {
  if (value == null) return null;
  if (value is! String) return null;

  String hex = value.trim();

  // Remove # prefix if present
  if (hex.startsWith('#')) {
    hex = hex.substring(1);
  }

  // Handle 6-digit hex (RGB)
  if (hex.length == 6) {
    final intValue = int.tryParse(hex, radix: 16);
    if (intValue == null) return null;
    return Color(0xFF000000 | intValue);
  }

  // Handle 8-digit hex (ARGB)
  if (hex.length == 8) {
    final intValue = int.tryParse(hex, radix: 16);
    if (intValue == null) return null;
    return Color(intValue);
  }

  return null;
}

