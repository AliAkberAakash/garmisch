import 'dart:ui';

import 'package:flutter/material.dart' show ColorScheme, ThemeData;
import 'package:flutter/widgets.dart';

import '../foundations/breakpoints.dart';
import 'color_scheme.dart';
import 'text_theme.dart';
import 'theme_data.dart';
import 'theme_provider.dart';
import 'token_classes.dart';

/// Extension on [BuildContext] to provide easy access to Garmisch theme
extension GThemeExtension on BuildContext {
  /// Get the current [GThemeData]
  GThemeData get gTheme => GTheme.of(this);

  /// Get the current [GColorScheme]
  GColorScheme get gColors => GTheme.of(this).colors;

  /// Get the current [GTextTheme]
  GTextTheme get gTextTheme => GTheme.of(this).textTheme;

  // ============================================
  // Token Accessors
  // ============================================

  /// Get spacing tokens
  ///
  /// Usage: `context.gSpacing.md`
  GSpacingTokens get gSpacing => GTheme.of(this).spacing;

  /// Get sizing tokens
  ///
  /// Usage: `context.gSizing.xl`
  GSizingTokens get gSizing => GTheme.of(this).sizing;

  /// Get border radius tokens
  ///
  /// Usage: `context.gBorderRadius.lg` or `context.gBorderRadius.circularLg`
  GBorderRadiusTokens get gBorderRadius => GTheme.of(this).borderRadius;

  /// Get border width tokens
  ///
  /// Usage: `context.gBorderWidth.thin`
  GBorderWidthTokens get gBorderWidth => GTheme.of(this).borderWidth;

  /// Get shadow tokens
  ///
  /// Usage: `context.gShadows.md`
  GShadowTokens get gShadows => GTheme.of(this).shadows;

  /// Get duration tokens
  ///
  /// Usage: `context.gDurations.normal`
  GDurationTokens get gDurations => GTheme.of(this).durations;

  /// Get easing curve tokens
  ///
  /// Usage: `context.gEasing.easeOut`
  GEasingTokens get gEasing => GTheme.of(this).easing;

  /// Get opacity tokens
  ///
  /// Usage: `context.gOpacity.o50`
  GOpacityTokens get gOpacity => GTheme.of(this).opacity;

  /// Get breakpoint tokens
  ///
  /// Usage: `context.gBreakpoints.md`
  GBreakpointTokens get gBreakpoints => GTheme.of(this).breakpoints;

  /// Get typography tokens
  ///
  /// Usage: `context.gTypography.fontSizeMd`
  GTypographyTokens get gTypography => GTheme.of(this).typography;

  // ============================================
  // Theme State
  // ============================================

  /// Check if the current theme is dark mode
  bool get isDarkMode => GTheme.of(this).isDark;

  /// Check if the current theme is light mode
  bool get isLightMode => GTheme.of(this).isLight;

  /// Get the screen width
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Get the screen height
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Get the screen size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get the current breakpoint
  GBreakpointToken get breakpoint => GBreakpoints.current(screenWidth);

  /// Check if screen is extra small (< 576px)
  bool get isXs => GBreakpoints.isXs(screenWidth);

  /// Check if screen is small (>= 576px and < 768px)
  bool get isSm => GBreakpoints.isSm(screenWidth);

  /// Check if screen is medium (>= 768px and < 992px)
  bool get isMd => GBreakpoints.isMd(screenWidth);

  /// Check if screen is large (>= 992px and < 1200px)
  bool get isLg => GBreakpoints.isLg(screenWidth);

  /// Check if screen is extra large (>= 1200px and < 1400px)
  bool get isXl => GBreakpoints.isXl(screenWidth);

  /// Check if screen is 2XL (>= 1400px)
  bool get isXl2 => GBreakpoints.isXl2(screenWidth);

  /// Check if screen is at least small (>= 576px)
  bool get isSmUp => GBreakpoints.isSmUp(screenWidth);

  /// Check if screen is at least medium (>= 768px)
  bool get isMdUp => GBreakpoints.isMdUp(screenWidth);

  /// Check if screen is at least large (>= 992px)
  bool get isLgUp => GBreakpoints.isLgUp(screenWidth);

  /// Check if screen is at least extra large (>= 1200px)
  bool get isXlUp => GBreakpoints.isXlUp(screenWidth);

  /// Check if screen is mobile (< 768px)
  bool get isMobile => GBreakpoints.isSmDown(screenWidth);

  /// Check if screen is tablet (>= 768px and < 992px)
  bool get isTablet => GBreakpoints.isMd(screenWidth);

  /// Check if screen is desktop (>= 992px)
  bool get isDesktop => GBreakpoints.isLgUp(screenWidth);

  /// Get the device pixel ratio
  double get devicePixelRatio => MediaQuery.devicePixelRatioOf(this);

  /// Get the text scale factor
  double get textScaleFactor =>
      MediaQuery.textScalerOf(this).scale(1.0);

  /// Get the view padding (safe area)
  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  /// Get the view insets (keyboard, etc.)
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Check if the keyboard is visible
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;

  /// Get platform brightness (light/dark from system)
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);
}

/// Extension on [GColorScheme] to convert to Flutter's [ColorScheme]
extension GColorSchemeToMaterial on GColorScheme {
  /// Converts this [GColorScheme] to a Flutter [ColorScheme]
  ///
  /// This allows seamless integration with [MaterialApp] and Material widgets.
  ///
  /// Example:
  /// ```dart
  /// MaterialApp(
  ///   theme: ThemeData(
  ///     colorScheme: GThemeData.light().colors.toColorScheme(),
  ///   ),
  /// )
  /// ```
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceContainerHighest,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: onInverseSurface,
      inversePrimary: inversePrimary,
    );
  }
}

/// Extension on [GThemeData] to convert to Flutter's [ThemeData]
extension GThemeDataToMaterial on GThemeData {
  /// Converts this [GThemeData] to a Flutter [ThemeData]
  ///
  /// This provides full Material 3 theming using Garmisch design tokens.
  ///
  /// Example:
  /// ```dart
  /// MaterialApp(
  ///   theme: GThemeData.light().toThemeData(),
  ///   darkTheme: GThemeData.dark().toThemeData(),
  /// )
  /// ```
  ThemeData toThemeData() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colors.toColorScheme(),
      fontFamily: fontFamily ?? typography.fontFamilySans,
    );
  }
}

