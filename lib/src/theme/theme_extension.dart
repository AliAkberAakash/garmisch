import 'dart:ui';

import 'package:flutter/widgets.dart';

import '../foundations/breakpoints.dart';
import 'color_scheme.dart';
import 'text_theme.dart';
import 'theme_data.dart';
import 'theme_provider.dart';

/// Extension on [BuildContext] to provide easy access to Garmisch theme
extension GThemeExtension on BuildContext {
  /// Get the current [GThemeData]
  GThemeData get gTheme => GTheme.of(this);

  /// Get the current [GColorScheme]
  GColorScheme get gColors => GTheme.of(this).colors;

  /// Get the current [GTextTheme]
  GTextTheme get gTextTheme => GTheme.of(this).textTheme;

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

