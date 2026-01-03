import 'dart:ui';

import 'package:flutter/widgets.dart';

import 'theme_data.dart';

/// Garmisch Design System Theme Provider
///
/// An InheritedWidget that provides [GThemeData] to the widget tree.
/// Wrap your app with [GTheme] to enable theming.
///
/// ```dart
/// GTheme(
///   data: GThemeData.light(),
///   child: MyApp(),
/// )
/// ```
class GTheme extends InheritedWidget {
  const GTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The theme data to provide to descendants
  final GThemeData data;

  /// Get the current [GThemeData] from the context
  ///
  /// Throws an error if no [GTheme] is found in the widget tree.
  static GThemeData of(BuildContext context) {
    final theme = maybeOf(context);
    assert(theme != null, 'No GTheme found in context');
    return theme!;
  }

  /// Get the current [GThemeData] from the context, or null if not found
  static GThemeData? maybeOf(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<GTheme>();
    return widget?.data;
  }

  @override
  bool updateShouldNotify(GTheme oldWidget) {
    return data != oldWidget.data;
  }
}

/// A widget that automatically provides light or dark theme based on platform brightness
class GThemeMode extends StatelessWidget {
  const GThemeMode({
    super.key,
    this.lightTheme,
    this.darkTheme,
    required this.child,
  });

  /// The light theme to use when platform brightness is light
  final GThemeData? lightTheme;

  /// The dark theme to use when platform brightness is dark
  final GThemeData? darkTheme;

  /// The child widget
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final theme = brightness == Brightness.dark
        ? (darkTheme ?? GThemeData.dark())
        : (lightTheme ?? GThemeData.light());

    return GTheme(
      data: theme,
      child: child,
    );
  }
}

/// A builder widget that provides the current theme to its builder function
class GThemeBuilder extends StatelessWidget {
  const GThemeBuilder({
    super.key,
    required this.builder,
  });

  /// Builder function that receives the current theme
  final Widget Function(BuildContext context, GThemeData theme) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, GTheme.of(context));
  }
}

