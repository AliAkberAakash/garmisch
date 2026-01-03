/// Garmisch Design System
///
/// A minimalistic design system based on Material Design for Flutter.
///
/// ## Getting Started
///
/// Wrap your app with [GTheme] to enable theming:
///
/// ```dart
/// import 'package:garmisch/garmisch.dart';
///
/// void main() {
///   runApp(
///     GTheme(
///       data: GThemeData.light(),
///       child: MyApp(),
///     ),
///   );
/// }
/// ```
///
/// ## Accessing Theme
///
/// Use context extensions to access theme values:
///
/// ```dart
/// // Get colors
/// final primaryColor = context.gColors.primary;
///
/// // Get text styles
/// final headlineStyle = context.gTextTheme.headlineLarge;
///
/// // Check screen size
/// if (context.isMobile) {
///   // Mobile layout
/// }
/// ```
library;

// Foundations
export 'src/foundations/foundations.dart';

// Theme
export 'src/theme/theme.dart';

// Components
export 'src/components/components.dart';

// Utilities
export 'src/utilities/utilities.dart';

