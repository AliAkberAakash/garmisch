import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Extension methods for BuildContext
extension GContextExtensions on BuildContext {
  /// Get the current GThemeData
  GThemeData get gtheme => GTheme.of(this);

  /// Get the current GColorScheme
  GColorScheme get gcolors => GTheme.of(this).colors;

  /// Get the current GTextTheme
  GTextTheme get gtextTheme => GTheme.of(this).textTheme;

  /// Check if dark mode is active
  bool get isDarkMode => GTheme.of(this).brightness == Brightness.dark;

  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get safe area padding
  EdgeInsets get safeAreaPadding => MediaQuery.of(this).padding;

  /// Check if extra small screen (< 576px)
  bool get isXs => screenWidth < GBreakpoints.sm;

  /// Check if small screen (576px - 768px)
  bool get isSm => screenWidth >= GBreakpoints.sm && screenWidth < GBreakpoints.md;

  /// Check if medium screen (768px - 992px)
  bool get isMd => screenWidth >= GBreakpoints.md && screenWidth < GBreakpoints.lg;

  /// Check if large screen (992px - 1200px)
  bool get isLg => screenWidth >= GBreakpoints.lg && screenWidth < GBreakpoints.xl;

  /// Check if extra large screen (>= 1200px)
  bool get isXl => screenWidth >= GBreakpoints.xl;

  /// Check if mobile (xs or sm)
  bool get isMobile => isXs || isSm;

  /// Check if tablet (md)
  bool get isTablet => isMd;

  /// Check if desktop (lg or xl)
  bool get isDesktop => isLg || isXl;

  /// Show a snackbar
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Hide current snackbar
  void hideSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }

  /// Pop the current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Push a new route
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Push and replace current route
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.of(this).pushReplacement<T, void>(
      MaterialPageRoute(builder: (_) => page),
    );
  }
}

