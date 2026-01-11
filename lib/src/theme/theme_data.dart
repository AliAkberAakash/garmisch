import 'dart:ui';

import 'color_scheme.dart';
import 'text_theme.dart';
import 'token_classes.dart';

/// Garmisch Design System Theme Data
///
/// Contains all theme configuration for the design system.
/// Usage: `GTheme.of(context)` or `context.gTheme`
///
/// Includes all design tokens:
/// - `colors` — Color scheme (light/dark aware)
/// - `textTheme` — Text styles
/// - `spacing` — Spacing tokens
/// - `sizing` — Sizing tokens
/// - `borderRadius` — Border radius tokens
/// - `borderWidth` — Border width tokens
/// - `shadows` — Shadow tokens
/// - `durations` — Animation duration tokens
/// - `easing` — Animation curve tokens
/// - `opacity` — Opacity tokens
/// - `breakpoints` — Responsive breakpoint tokens
class GThemeData {
  const GThemeData({
    required this.colors,
    required this.textTheme,
    this.fontFamily,
    this.spacing = const GSpacingTokens(),
    this.sizing = const GSizingTokens(),
    this.borderRadius = const GBorderRadiusTokens(),
    this.borderWidth = const GBorderWidthTokens(),
    this.shadows = const GShadowTokens(),
    this.durations = const GDurationTokens(),
    this.easing = const GEasingTokens(),
    this.opacity = const GOpacityTokens(),
    this.breakpoints = const GBreakpointTokens(),
    this.typography = const GTypographyTokens(),
  });

  /// Creates a light theme with default foundation tokens
  factory GThemeData.light({
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
    GSpacingTokens? spacing,
    GSizingTokens? sizing,
    GBorderRadiusTokens? borderRadius,
    GBorderWidthTokens? borderWidth,
    GShadowTokens? shadows,
    GDurationTokens? durations,
    GEasingTokens? easing,
    GOpacityTokens? opacity,
    GBreakpointTokens? breakpoints,
    GTypographyTokens? typography,
  }) {
    return GThemeData(
      colors: colors ?? GColorScheme.light(),
      textTheme: textTheme ?? GTextTheme.standard(fontFamily: fontFamily),
      fontFamily: fontFamily,
      spacing: spacing ?? const GSpacingTokens(),
      sizing: sizing ?? const GSizingTokens(),
      borderRadius: borderRadius ?? const GBorderRadiusTokens(),
      borderWidth: borderWidth ?? const GBorderWidthTokens(),
      shadows: shadows ?? const GShadowTokens(),
      durations: durations ?? const GDurationTokens(),
      easing: easing ?? const GEasingTokens(),
      opacity: opacity ?? const GOpacityTokens(),
      breakpoints: breakpoints ?? const GBreakpointTokens(),
      typography: typography ?? const GTypographyTokens(),
    );
  }

  /// Creates a dark theme with default foundation tokens
  factory GThemeData.dark({
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
    GSpacingTokens? spacing,
    GSizingTokens? sizing,
    GBorderRadiusTokens? borderRadius,
    GBorderWidthTokens? borderWidth,
    GShadowTokens? shadows,
    GDurationTokens? durations,
    GEasingTokens? easing,
    GOpacityTokens? opacity,
    GBreakpointTokens? breakpoints,
    GTypographyTokens? typography,
  }) {
    return GThemeData(
      colors: colors ?? GColorScheme.dark(),
      textTheme: textTheme ?? GTextTheme.standard(fontFamily: fontFamily),
      fontFamily: fontFamily,
      spacing: spacing ?? const GSpacingTokens(),
      sizing: sizing ?? const GSizingTokens(),
      borderRadius: borderRadius ?? const GBorderRadiusTokens(),
      borderWidth: borderWidth ?? const GBorderWidthTokens(),
      shadows: shadows ?? const GShadowTokens(),
      durations: durations ?? const GDurationTokens(),
      easing: easing ?? const GEasingTokens(),
      opacity: opacity ?? const GOpacityTokens(),
      breakpoints: breakpoints ?? const GBreakpointTokens(),
      typography: typography ?? const GTypographyTokens(),
    );
  }

  /// Creates a theme from brightness with default foundation tokens
  factory GThemeData.fromBrightness({
    required Brightness brightness,
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
    GSpacingTokens? spacing,
    GSizingTokens? sizing,
    GBorderRadiusTokens? borderRadius,
    GBorderWidthTokens? borderWidth,
    GShadowTokens? shadows,
    GDurationTokens? durations,
    GEasingTokens? easing,
    GOpacityTokens? opacity,
    GBreakpointTokens? breakpoints,
    GTypographyTokens? typography,
  }) {
    return brightness == Brightness.light
        ? GThemeData.light(
            colors: colors,
            textTheme: textTheme,
            fontFamily: fontFamily,
            spacing: spacing,
            sizing: sizing,
            borderRadius: borderRadius,
            borderWidth: borderWidth,
            shadows: shadows,
            durations: durations,
            easing: easing,
            opacity: opacity,
            breakpoints: breakpoints,
            typography: typography,
          )
        : GThemeData.dark(
            colors: colors,
            textTheme: textTheme,
            fontFamily: fontFamily,
            spacing: spacing,
            sizing: sizing,
            borderRadius: borderRadius,
            borderWidth: borderWidth,
            shadows: shadows,
            durations: durations,
            easing: easing,
            opacity: opacity,
            breakpoints: breakpoints,
            typography: typography,
          );
  }

  /// The color scheme for the theme
  final GColorScheme colors;

  /// The text theme for the theme
  final GTextTheme textTheme;

  /// The font family for the theme
  final String? fontFamily;

  /// Spacing tokens (margins, paddings, gaps)
  final GSpacingTokens spacing;

  /// Sizing tokens (widths, heights, dimensions)
  final GSizingTokens sizing;

  /// Border radius tokens
  final GBorderRadiusTokens borderRadius;

  /// Border width tokens
  final GBorderWidthTokens borderWidth;

  /// Shadow tokens
  final GShadowTokens shadows;

  /// Animation duration tokens
  final GDurationTokens durations;

  /// Animation easing curve tokens
  final GEasingTokens easing;

  /// Opacity tokens
  final GOpacityTokens opacity;

  /// Responsive breakpoint tokens
  final GBreakpointTokens breakpoints;

  /// Typography tokens (font sizes, weights, line heights, letter spacing)
  final GTypographyTokens typography;

  /// Whether this is a light theme
  bool get isLight => colors.isLight;

  /// Whether this is a dark theme
  bool get isDark => colors.isDark;

  /// The brightness of the theme
  Brightness get brightness => colors.brightness;

  /// Creates a copy of this theme with the given fields replaced
  GThemeData copyWith({
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
    GSpacingTokens? spacing,
    GSizingTokens? sizing,
    GBorderRadiusTokens? borderRadius,
    GBorderWidthTokens? borderWidth,
    GShadowTokens? shadows,
    GDurationTokens? durations,
    GEasingTokens? easing,
    GOpacityTokens? opacity,
    GBreakpointTokens? breakpoints,
    GTypographyTokens? typography,
  }) {
    return GThemeData(
      colors: colors ?? this.colors,
      textTheme: textTheme ?? this.textTheme,
      fontFamily: fontFamily ?? this.fontFamily,
      spacing: spacing ?? this.spacing,
      sizing: sizing ?? this.sizing,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      shadows: shadows ?? this.shadows,
      durations: durations ?? this.durations,
      easing: easing ?? this.easing,
      opacity: opacity ?? this.opacity,
      breakpoints: breakpoints ?? this.breakpoints,
      typography: typography ?? this.typography,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GThemeData &&
        other.colors == colors &&
        other.textTheme == textTheme &&
        other.fontFamily == fontFamily &&
        other.spacing == spacing &&
        other.sizing == sizing &&
        other.borderRadius == borderRadius &&
        other.borderWidth == borderWidth &&
        other.shadows == shadows &&
        other.durations == durations &&
        other.easing == easing &&
        other.opacity == opacity &&
        other.breakpoints == breakpoints &&
        other.typography == typography;
  }

  @override
  int get hashCode => Object.hash(
        colors,
        textTheme,
        fontFamily,
        spacing,
        sizing,
        borderRadius,
        borderWidth,
        shadows,
        durations,
        easing,
        opacity,
        breakpoints,
        typography,
      );
}

