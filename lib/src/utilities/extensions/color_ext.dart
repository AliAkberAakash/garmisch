import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Extension methods for Color
extension GColorExtensions on Color {
  /// Lighten the color by a percentage (0.0 to 1.0)
  Color lighten([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Darken the color by a percentage (0.0 to 1.0)
  Color darken([double amount = 0.1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  /// Convert to hex string (e.g., "#FF5500")
  String toHex({bool includeHash = true, bool includeAlpha = false}) {
    final hex = StringBuffer();
    if (includeHash) hex.write('#');
    if (includeAlpha) hex.write(_toHex(a.toInt()));
    hex.write(_toHex(r.toInt()));
    hex.write(_toHex(g.toInt()));
    hex.write(_toHex(b.toInt()));
    return hex.toString();
  }

  String _toHex(int value) {
    return value.toRadixString(16).padLeft(2, '0').toUpperCase();
  }

  /// Check if color is light
  bool get isLight => computeLuminance() > 0.5;

  /// Check if color is dark
  bool get isDark => !isLight;

  /// Get contrast color (black or white)
  Color get contrastColor => isLight ? Colors.black : Colors.white;

  /// Calculate contrast ratio with another color
  double contrastRatio(Color other) {
    final l1 = computeLuminance();
    final l2 = other.computeLuminance();
    final lighter = math.max(l1, l2);
    final darker = math.min(l1, l2);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Check if contrast with another color meets WCAG AA (4.5:1)
  bool meetsContrastAA(Color other) => contrastRatio(other) >= 4.5;

  /// Check if contrast with another color meets WCAG AAA (7:1)
  bool meetsContrastAAA(Color other) => contrastRatio(other) >= 7.0;

  /// Create a MaterialColor swatch from this color
  MaterialColor toMaterialColor() {
    final strengths = <double>[.05, .1, .2, .3, .4, .5, .6, .7, .8, .9];
    final swatch = <int, Color>{};

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r.toInt() + ((ds < 0 ? r : 255 - r) * ds).round(),
        g.toInt() + ((ds < 0 ? g : 255 - g) * ds).round(),
        b.toInt() + ((ds < 0 ? b : 255 - b) * ds).round(),
        1,
      );
    }

    return MaterialColor(toARGB32(), swatch);
  }

  /// Get the inverted color
  Color get inverted => Color.fromARGB(
        a.toInt(),
        255 - r.toInt(),
        255 - g.toInt(),
        255 - b.toInt(),
      );

  /// Blend with another color
  Color blend(Color other, double amount) {
    return Color.lerp(this, other, amount) ?? this;
  }
}

/// Extension methods for String to parse colors
extension GColorStringExtensions on String {
  /// Parse hex string to Color
  Color? toColor() {
    var hex = replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    if (hex.length == 8) {
      return Color(int.parse(hex, radix: 16));
    }
    return null;
  }
}

