import 'dart:ui';

import 'color_scheme.dart';
import 'text_theme.dart';

/// Garmisch Design System Theme Data
///
/// Contains all theme configuration for the design system.
/// Usage: `GTheme.of(context)` or `context.gTheme`
class GThemeData {
  const GThemeData({
    required this.colors,
    required this.textTheme,
    this.fontFamily,
  });

  /// Creates a light theme
  factory GThemeData.light({
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
  }) {
    return GThemeData(
      colors: colors ?? GColorScheme.light(),
      textTheme: textTheme ?? GTextTheme.standard(fontFamily: fontFamily),
      fontFamily: fontFamily,
    );
  }

  /// Creates a dark theme
  factory GThemeData.dark({
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
  }) {
    return GThemeData(
      colors: colors ?? GColorScheme.dark(),
      textTheme: textTheme ?? GTextTheme.standard(fontFamily: fontFamily),
      fontFamily: fontFamily,
    );
  }

  /// Creates a theme from brightness
  factory GThemeData.fromBrightness({
    required Brightness brightness,
    GColorScheme? colors,
    GTextTheme? textTheme,
    String? fontFamily,
  }) {
    return brightness == Brightness.light
        ? GThemeData.light(
            colors: colors,
            textTheme: textTheme,
            fontFamily: fontFamily,
          )
        : GThemeData.dark(
            colors: colors,
            textTheme: textTheme,
            fontFamily: fontFamily,
          );
  }

  /// The color scheme for the theme
  final GColorScheme colors;

  /// The text theme for the theme
  final GTextTheme textTheme;

  /// The font family for the theme
  final String? fontFamily;

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
  }) {
    return GThemeData(
      colors: colors ?? this.colors,
      textTheme: textTheme ?? this.textTheme,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GThemeData &&
        other.colors == colors &&
        other.textTheme == textTheme &&
        other.fontFamily == fontFamily;
  }

  @override
  int get hashCode => Object.hash(colors, textTheme, fontFamily);
}

