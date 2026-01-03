import 'dart:ui';

import '../foundations/colors.dart';

/// Garmisch Design System Color Scheme
///
/// Semantic color tokens for theming. Supports light and dark modes.
/// Usage: Access through `GTheme.of(context).colors`
class GColorScheme {
  const GColorScheme({
    required this.brightness,
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.surfaceContainer,
    required this.surfaceContainerLow,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.onInverseSurface,
    required this.inversePrimary,
    required this.disabled,
    required this.onDisabled,
  });

  /// Creates a light color scheme
  factory GColorScheme.light({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? disabled,
    Color? onDisabled,
  }) {
    return GColorScheme(
      brightness: Brightness.light,
      primary: primary ?? GColors.blue600,
      onPrimary: onPrimary ?? GColors.white,
      primaryContainer: primaryContainer ?? GColors.blue100,
      onPrimaryContainer: onPrimaryContainer ?? GColors.blue900,
      secondary: secondary ?? GColors.gray600,
      onSecondary: onSecondary ?? GColors.white,
      secondaryContainer: secondaryContainer ?? GColors.gray100,
      onSecondaryContainer: onSecondaryContainer ?? GColors.gray900,
      tertiary: tertiary ?? GColors.teal600,
      onTertiary: onTertiary ?? GColors.white,
      tertiaryContainer: tertiaryContainer ?? GColors.teal100,
      onTertiaryContainer: onTertiaryContainer ?? GColors.teal900,
      error: error ?? GColors.red600,
      onError: onError ?? GColors.white,
      errorContainer: errorContainer ?? GColors.red100,
      onErrorContainer: onErrorContainer ?? GColors.red900,
      warning: warning ?? GColors.amber500,
      onWarning: onWarning ?? GColors.black,
      warningContainer: warningContainer ?? GColors.amber100,
      onWarningContainer: onWarningContainer ?? GColors.amber900,
      success: success ?? GColors.green600,
      onSuccess: onSuccess ?? GColors.white,
      successContainer: successContainer ?? GColors.green100,
      onSuccessContainer: onSuccessContainer ?? GColors.green900,
      info: info ?? GColors.blue500,
      onInfo: onInfo ?? GColors.white,
      infoContainer: infoContainer ?? GColors.blue100,
      onInfoContainer: onInfoContainer ?? GColors.blue900,
      background: background ?? GColors.gray50,
      onBackground: onBackground ?? GColors.gray900,
      surface: surface ?? GColors.white,
      onSurface: onSurface ?? GColors.gray900,
      surfaceVariant: surfaceVariant ?? GColors.gray100,
      onSurfaceVariant: onSurfaceVariant ?? GColors.gray700,
      surfaceContainer: surfaceContainer ?? GColors.gray50,
      surfaceContainerLow: surfaceContainerLow ?? GColors.white,
      surfaceContainerHigh: surfaceContainerHigh ?? GColors.gray100,
      surfaceContainerHighest: surfaceContainerHighest ?? GColors.gray200,
      outline: outline ?? GColors.gray300,
      outlineVariant: outlineVariant ?? GColors.gray200,
      shadow: shadow ?? GColors.black,
      scrim: scrim ?? GColors.black,
      inverseSurface: inverseSurface ?? GColors.gray900,
      onInverseSurface: onInverseSurface ?? GColors.gray50,
      inversePrimary: inversePrimary ?? GColors.blue300,
      disabled: disabled ?? GColors.gray400,
      onDisabled: onDisabled ?? GColors.gray600,
    );
  }

  /// Creates a dark color scheme
  factory GColorScheme.dark({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? disabled,
    Color? onDisabled,
  }) {
    return GColorScheme(
      brightness: Brightness.dark,
      primary: primary ?? GColors.blue400,
      onPrimary: onPrimary ?? GColors.blue950,
      primaryContainer: primaryContainer ?? GColors.blue900,
      onPrimaryContainer: onPrimaryContainer ?? GColors.blue100,
      secondary: secondary ?? GColors.gray400,
      onSecondary: onSecondary ?? GColors.gray950,
      secondaryContainer: secondaryContainer ?? GColors.gray800,
      onSecondaryContainer: onSecondaryContainer ?? GColors.gray100,
      tertiary: tertiary ?? GColors.teal400,
      onTertiary: onTertiary ?? GColors.teal950,
      tertiaryContainer: tertiaryContainer ?? GColors.teal900,
      onTertiaryContainer: onTertiaryContainer ?? GColors.teal100,
      error: error ?? GColors.red400,
      onError: onError ?? GColors.red950,
      errorContainer: errorContainer ?? GColors.red900,
      onErrorContainer: onErrorContainer ?? GColors.red100,
      warning: warning ?? GColors.amber400,
      onWarning: onWarning ?? GColors.amber950,
      warningContainer: warningContainer ?? GColors.amber900,
      onWarningContainer: onWarningContainer ?? GColors.amber100,
      success: success ?? GColors.green400,
      onSuccess: onSuccess ?? GColors.green950,
      successContainer: successContainer ?? GColors.green900,
      onSuccessContainer: onSuccessContainer ?? GColors.green100,
      info: info ?? GColors.blue400,
      onInfo: onInfo ?? GColors.blue950,
      infoContainer: infoContainer ?? GColors.blue900,
      onInfoContainer: onInfoContainer ?? GColors.blue100,
      background: background ?? GColors.gray950,
      onBackground: onBackground ?? GColors.gray50,
      surface: surface ?? GColors.gray900,
      onSurface: onSurface ?? GColors.gray50,
      surfaceVariant: surfaceVariant ?? GColors.gray800,
      onSurfaceVariant: onSurfaceVariant ?? GColors.gray300,
      surfaceContainer: surfaceContainer ?? GColors.gray900,
      surfaceContainerLow: surfaceContainerLow ?? GColors.gray950,
      surfaceContainerHigh: surfaceContainerHigh ?? GColors.gray800,
      surfaceContainerHighest: surfaceContainerHighest ?? GColors.gray700,
      outline: outline ?? GColors.gray600,
      outlineVariant: outlineVariant ?? GColors.gray700,
      shadow: shadow ?? GColors.black,
      scrim: scrim ?? GColors.black,
      inverseSurface: inverseSurface ?? GColors.gray50,
      onInverseSurface: onInverseSurface ?? GColors.gray900,
      inversePrimary: inversePrimary ?? GColors.blue600,
      disabled: disabled ?? GColors.gray600,
      onDisabled: onDisabled ?? GColors.gray400,
    );
  }

  /// The brightness of the color scheme (light or dark)
  final Brightness brightness;

  // ============================================
  // Primary Colors
  // ============================================

  /// Primary brand color
  final Color primary;

  /// Color for text/icons on primary color
  final Color onPrimary;

  /// Container color using primary
  final Color primaryContainer;

  /// Color for text/icons on primary container
  final Color onPrimaryContainer;

  // ============================================
  // Secondary Colors
  // ============================================

  /// Secondary brand color
  final Color secondary;

  /// Color for text/icons on secondary color
  final Color onSecondary;

  /// Container color using secondary
  final Color secondaryContainer;

  /// Color for text/icons on secondary container
  final Color onSecondaryContainer;

  // ============================================
  // Tertiary Colors
  // ============================================

  /// Tertiary accent color
  final Color tertiary;

  /// Color for text/icons on tertiary color
  final Color onTertiary;

  /// Container color using tertiary
  final Color tertiaryContainer;

  /// Color for text/icons on tertiary container
  final Color onTertiaryContainer;

  // ============================================
  // Semantic Colors - Error
  // ============================================

  /// Error color for destructive actions
  final Color error;

  /// Color for text/icons on error color
  final Color onError;

  /// Container color for error states
  final Color errorContainer;

  /// Color for text/icons on error container
  final Color onErrorContainer;

  // ============================================
  // Semantic Colors - Warning
  // ============================================

  /// Warning color for caution states
  final Color warning;

  /// Color for text/icons on warning color
  final Color onWarning;

  /// Container color for warning states
  final Color warningContainer;

  /// Color for text/icons on warning container
  final Color onWarningContainer;

  // ============================================
  // Semantic Colors - Success
  // ============================================

  /// Success color for positive states
  final Color success;

  /// Color for text/icons on success color
  final Color onSuccess;

  /// Container color for success states
  final Color successContainer;

  /// Color for text/icons on success container
  final Color onSuccessContainer;

  // ============================================
  // Semantic Colors - Info
  // ============================================

  /// Info color for informational states
  final Color info;

  /// Color for text/icons on info color
  final Color onInfo;

  /// Container color for info states
  final Color infoContainer;

  /// Color for text/icons on info container
  final Color onInfoContainer;

  // ============================================
  // Surface Colors
  // ============================================

  /// Background color for the app
  final Color background;

  /// Color for text/icons on background
  final Color onBackground;

  /// Surface color for cards, sheets, etc.
  final Color surface;

  /// Color for text/icons on surface
  final Color onSurface;

  /// Variant surface color for differentiation
  final Color surfaceVariant;

  /// Color for text/icons on surface variant
  final Color onSurfaceVariant;

  /// Container surface color
  final Color surfaceContainer;

  /// Low emphasis surface container
  final Color surfaceContainerLow;

  /// High emphasis surface container
  final Color surfaceContainerHigh;

  /// Highest emphasis surface container
  final Color surfaceContainerHighest;

  // ============================================
  // Outline Colors
  // ============================================

  /// Border/outline color
  final Color outline;

  /// Subtle outline/divider color
  final Color outlineVariant;

  // ============================================
  // Utility Colors
  // ============================================

  /// Shadow color
  final Color shadow;

  /// Scrim/overlay color
  final Color scrim;

  /// Inverse surface for contrast
  final Color inverseSurface;

  /// Color for text/icons on inverse surface
  final Color onInverseSurface;

  /// Inverse primary color
  final Color inversePrimary;

  // ============================================
  // State Colors
  // ============================================

  /// Disabled state color
  final Color disabled;

  /// Color for text/icons on disabled elements
  final Color onDisabled;

  /// Whether this is a light color scheme
  bool get isLight => brightness == Brightness.light;

  /// Whether this is a dark color scheme
  bool get isDark => brightness == Brightness.dark;

  /// Creates a copy of this color scheme with the given fields replaced
  GColorScheme copyWith({
    Brightness? brightness,
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? surfaceContainer,
    Color? surfaceContainerLow,
    Color? surfaceContainerHigh,
    Color? surfaceContainerHighest,
    Color? outline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? onInverseSurface,
    Color? inversePrimary,
    Color? disabled,
    Color? onDisabled,
  }) {
    return GColorScheme(
      brightness: brightness ?? this.brightness,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      outline: outline ?? this.outline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      onInverseSurface: onInverseSurface ?? this.onInverseSurface,
      inversePrimary: inversePrimary ?? this.inversePrimary,
      disabled: disabled ?? this.disabled,
      onDisabled: onDisabled ?? this.onDisabled,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GColorScheme &&
        other.brightness == brightness &&
        other.primary == primary &&
        other.onPrimary == onPrimary &&
        other.primaryContainer == primaryContainer &&
        other.onPrimaryContainer == onPrimaryContainer &&
        other.secondary == secondary &&
        other.onSecondary == onSecondary &&
        other.secondaryContainer == secondaryContainer &&
        other.onSecondaryContainer == onSecondaryContainer &&
        other.tertiary == tertiary &&
        other.onTertiary == onTertiary &&
        other.tertiaryContainer == tertiaryContainer &&
        other.onTertiaryContainer == onTertiaryContainer &&
        other.error == error &&
        other.onError == onError &&
        other.errorContainer == errorContainer &&
        other.onErrorContainer == onErrorContainer &&
        other.warning == warning &&
        other.onWarning == onWarning &&
        other.warningContainer == warningContainer &&
        other.onWarningContainer == onWarningContainer &&
        other.success == success &&
        other.onSuccess == onSuccess &&
        other.successContainer == successContainer &&
        other.onSuccessContainer == onSuccessContainer &&
        other.info == info &&
        other.onInfo == onInfo &&
        other.infoContainer == infoContainer &&
        other.onInfoContainer == onInfoContainer &&
        other.background == background &&
        other.onBackground == onBackground &&
        other.surface == surface &&
        other.onSurface == onSurface &&
        other.surfaceVariant == surfaceVariant &&
        other.onSurfaceVariant == onSurfaceVariant &&
        other.surfaceContainer == surfaceContainer &&
        other.surfaceContainerLow == surfaceContainerLow &&
        other.surfaceContainerHigh == surfaceContainerHigh &&
        other.surfaceContainerHighest == surfaceContainerHighest &&
        other.outline == outline &&
        other.outlineVariant == outlineVariant &&
        other.shadow == shadow &&
        other.scrim == scrim &&
        other.inverseSurface == inverseSurface &&
        other.onInverseSurface == onInverseSurface &&
        other.inversePrimary == inversePrimary &&
        other.disabled == disabled &&
        other.onDisabled == onDisabled;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      brightness,
      primary,
      onPrimary,
      primaryContainer,
      onPrimaryContainer,
      secondary,
      onSecondary,
      secondaryContainer,
      onSecondaryContainer,
      tertiary,
      onTertiary,
      tertiaryContainer,
      onTertiaryContainer,
      error,
      onError,
      errorContainer,
      onErrorContainer,
      warning,
      onWarning,
      warningContainer,
      onWarningContainer,
      success,
      onSuccess,
      successContainer,
      onSuccessContainer,
      info,
      onInfo,
      infoContainer,
      onInfoContainer,
      background,
      onBackground,
      surface,
      onSurface,
      surfaceVariant,
      onSurfaceVariant,
      surfaceContainer,
      surfaceContainerLow,
      surfaceContainerHigh,
      surfaceContainerHighest,
      outline,
      outlineVariant,
      shadow,
      scrim,
      inverseSurface,
      onInverseSurface,
      inversePrimary,
      disabled,
      onDisabled,
    ]);
  }
}

