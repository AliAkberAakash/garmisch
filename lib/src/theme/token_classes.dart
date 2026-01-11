import 'package:flutter/widgets.dart';

import '../foundations/spacing.dart';
import '../foundations/sizing.dart';
import '../foundations/border_radius.dart';
import '../foundations/border_width.dart';
import '../foundations/shadows.dart';
import '../foundations/durations.dart';
import '../foundations/easing.dart';
import '../foundations/opacity.dart';
import '../foundations/breakpoints.dart';

/// Spacing tokens accessible via theme
///
/// Usage: `context.gTheme.spacing.md`
class GSpacingTokens {
  const GSpacingTokens();

  /// No spacing (0px)
  double get none => GSpacing.none;

  /// Single pixel spacing (1px)
  double get px => GSpacing.px;

  /// 4XS spacing (2px)
  double get xs4 => GSpacing.xs4;

  /// 3XS spacing (4px)
  double get xs3 => GSpacing.xs3;

  /// 2XS spacing (6px)
  double get xs2 => GSpacing.xs2;

  /// XS spacing (8px)
  double get xs => GSpacing.xs;

  /// Small spacing (12px)
  double get sm => GSpacing.sm;

  /// Medium spacing (16px) - Default
  double get md => GSpacing.md;

  /// Large spacing (20px)
  double get lg => GSpacing.lg;

  /// XL spacing (24px)
  double get xl => GSpacing.xl;

  /// 2XL spacing (32px)
  double get xl2 => GSpacing.xl2;

  /// 3XL spacing (40px)
  double get xl3 => GSpacing.xl3;

  /// 4XL spacing (48px)
  double get xl4 => GSpacing.xl4;

  /// 5XL spacing (56px)
  double get xl5 => GSpacing.xl5;

  /// 6XL spacing (64px)
  double get xl6 => GSpacing.xl6;

  /// 7XL spacing (80px)
  double get xl7 => GSpacing.xl7;

  /// 8XL spacing (96px)
  double get xl8 => GSpacing.xl8;

  /// 9XL spacing (112px)
  double get xl9 => GSpacing.xl9;

  /// 10XL spacing (128px)
  double get xl10 => GSpacing.xl10;

  /// 11XL spacing (144px)
  double get xl11 => GSpacing.xl11;

  /// 12XL spacing (160px)
  double get xl12 => GSpacing.xl12;
}

/// Sizing tokens accessible via theme
///
/// Usage: `context.gTheme.sizing.md`
class GSizingTokens {
  const GSizingTokens();

  double get none => GSizing.none;
  double get px => GSizing.px;
  double get xs4 => GSizing.xs4;
  double get xs3 => GSizing.xs3;
  double get xs2 => GSizing.xs2;
  double get xs => GSizing.xs;
  double get sm => GSizing.sm;
  double get md => GSizing.md;
  double get lg => GSizing.lg;
  double get xl => GSizing.xl;
  double get xl2 => GSizing.xl2;
  double get xl3 => GSizing.xl3;
  double get xl4 => GSizing.xl4;
  double get xl5 => GSizing.xl5;
  double get xl6 => GSizing.xl6;
  double get xl7 => GSizing.xl7;
  double get xl8 => GSizing.xl8;
  double get xl9 => GSizing.xl9;
  double get xl10 => GSizing.xl10;
  double get xl11 => GSizing.xl11;
  double get xl12 => GSizing.xl12;
  double get xl13 => GSizing.xl13;
  double get xl14 => GSizing.xl14;
  double get xl15 => GSizing.xl15;
  double get xl16 => GSizing.xl16;
  double get xl17 => GSizing.xl17;
  double get xl18 => GSizing.xl18;
  double get xl19 => GSizing.xl19;
  double get xl20 => GSizing.xl20;
  double get xl21 => GSizing.xl21;
}

/// Border radius tokens accessible via theme
///
/// Usage: `context.gTheme.borderRadius.md`
class GBorderRadiusTokens {
  const GBorderRadiusTokens();

  double get none => GBorderRadius.none;
  double get xs => GBorderRadius.xs;
  double get sm => GBorderRadius.sm;
  double get md => GBorderRadius.md;
  double get lg => GBorderRadius.lg;
  double get xl => GBorderRadius.xl;
  double get xl2 => GBorderRadius.xl2;
  double get xl3 => GBorderRadius.xl3;
  double get xl4 => GBorderRadius.xl4;
  double get full => GBorderRadius.full;

  /// Convenience: Returns BorderRadius.circular with the given value
  BorderRadius circular(double radius) => BorderRadius.circular(radius);

  /// Convenience: Returns BorderRadius.circular(none)
  BorderRadius get circularNone => BorderRadius.circular(none);

  /// Convenience: Returns BorderRadius.circular(sm)
  BorderRadius get circularSm => BorderRadius.circular(sm);

  /// Convenience: Returns BorderRadius.circular(md)
  BorderRadius get circularMd => BorderRadius.circular(md);

  /// Convenience: Returns BorderRadius.circular(lg)
  BorderRadius get circularLg => BorderRadius.circular(lg);

  /// Convenience: Returns BorderRadius.circular(xl)
  BorderRadius get circularXl => BorderRadius.circular(xl);

  /// Convenience: Returns BorderRadius.circular(full)
  BorderRadius get circularFull => BorderRadius.circular(full);
}

/// Border width tokens accessible via theme
///
/// Usage: `context.gTheme.borderWidth.thin`
class GBorderWidthTokens {
  const GBorderWidthTokens();

  double get none => GBorderWidth.none;
  double get thin => GBorderWidth.thin;
  double get medium => GBorderWidth.medium;
  double get thick => GBorderWidth.thick;
}

/// Shadow tokens accessible via theme
///
/// Usage: `context.gTheme.shadows.md`
class GShadowTokens {
  const GShadowTokens();

  List<BoxShadow> get none => GShadows.none;
  List<BoxShadow> get xs => GShadows.xs;
  List<BoxShadow> get sm => GShadows.sm;
  List<BoxShadow> get md => GShadows.md;
  List<BoxShadow> get lg => GShadows.lg;
  List<BoxShadow> get xl => GShadows.xl;
  List<BoxShadow> get xl2 => GShadows.xl2;
  List<BoxShadow> get inner => GShadows.inner;
}

/// Duration tokens accessible via theme
///
/// Usage: `context.gTheme.durations.normal`
class GDurationTokens {
  const GDurationTokens();

  Duration get instant => GDurations.instant;
  Duration get fastest => GDurations.fastest;
  Duration get faster => GDurations.faster;
  Duration get fast => GDurations.fast;
  Duration get normal => GDurations.normal;
  Duration get slow => GDurations.slow;
  Duration get slower => GDurations.slower;
  Duration get slowest => GDurations.slowest;

  // Semantic durations
  Duration get tooltip => GDurations.tooltip;
  Duration get snackbar => GDurations.snackbar;
  Duration get modal => GDurations.modal;
  Duration get pageTransition => GDurations.pageTransition;
  Duration get bottomSheet => GDurations.bottomSheet;
  Duration get drawer => GDurations.drawer;
  Duration get ripple => GDurations.ripple;
  Duration get shimmer => GDurations.shimmer;
  Duration get debounce => GDurations.debounce;
  Duration get throttle => GDurations.throttle;
}

/// Easing curve tokens accessible via theme
///
/// Usage: `context.gTheme.easing.easeOut`
class GEasingTokens {
  const GEasingTokens();

  Curve get linear => GEasing.linear;
  Curve get ease => GEasing.ease;
  Curve get easeIn => GEasing.easeIn;
  Curve get easeOut => GEasing.easeOut;
  Curve get easeInOut => GEasing.easeInOut;

  // Sine curves
  Curve get easeInSine => GEasing.easeInSine;
  Curve get easeOutSine => GEasing.easeOutSine;
  Curve get easeInOutSine => GEasing.easeInOutSine;

  // Quad curves
  Curve get easeInQuad => GEasing.easeInQuad;
  Curve get easeOutQuad => GEasing.easeOutQuad;
  Curve get easeInOutQuad => GEasing.easeInOutQuad;

  // Cubic curves
  Curve get easeInCubic => GEasing.easeInCubic;
  Curve get easeOutCubic => GEasing.easeOutCubic;
  Curve get easeInOutCubic => GEasing.easeInOutCubic;

  // Back curves
  Curve get easeInBack => GEasing.easeInBack;
  Curve get easeOutBack => GEasing.easeOutBack;
  Curve get easeInOutBack => GEasing.easeInOutBack;

  // Spring
  Curve get spring => GEasing.spring;
}

/// Opacity tokens accessible via theme
///
/// Usage: `context.gTheme.opacity.o50`
class GOpacityTokens {
  const GOpacityTokens();

  double get transparent => GOpacity.transparent;
  double get o5 => GOpacity.o5;
  double get o10 => GOpacity.o10;
  double get o20 => GOpacity.o20;
  double get o25 => GOpacity.o25;
  double get o30 => GOpacity.o30;
  double get o40 => GOpacity.o40;
  double get o50 => GOpacity.o50;
  double get o60 => GOpacity.o60;
  double get o70 => GOpacity.o70;
  double get o75 => GOpacity.o75;
  double get o80 => GOpacity.o80;
  double get o90 => GOpacity.o90;
  double get o95 => GOpacity.o95;
  double get opaque => GOpacity.opaque;

  // Semantic
  double get disabled => GOpacity.disabled;
  double get hover => GOpacity.hover;
  double get focus => GOpacity.focus;
  double get pressed => GOpacity.pressed;
  double get dragged => GOpacity.dragged;
}

/// Breakpoint tokens accessible via theme
///
/// Usage: `context.gTheme.breakpoints.md`
class GBreakpointTokens {
  const GBreakpointTokens();

  double get xs => GBreakpoints.xs;
  double get sm => GBreakpoints.sm;
  double get md => GBreakpoints.md;
  double get lg => GBreakpoints.lg;
  double get xl => GBreakpoints.xl;
  double get xl2 => GBreakpoints.xl2;

  // Max widths
  double get maxWidthSm => GBreakpoints.maxWidthSm;
  double get maxWidthMd => GBreakpoints.maxWidthMd;
  double get maxWidthLg => GBreakpoints.maxWidthLg;
  double get maxWidthXl => GBreakpoints.maxWidthXl;
  double get maxWidthXl2 => GBreakpoints.maxWidthXl2;

  // Helper methods
  bool isXs(double width) => GBreakpoints.isXs(width);
  bool isSm(double width) => GBreakpoints.isSm(width);
  bool isMd(double width) => GBreakpoints.isMd(width);
  bool isLg(double width) => GBreakpoints.isLg(width);
  bool isXl(double width) => GBreakpoints.isXl(width);
  bool isXl2(double width) => GBreakpoints.isXl2(width);

  // Semantic helpers
  bool isMobileWidth(double width) => GBreakpoints.isSmDown(width);
  bool isTabletWidth(double width) => GBreakpoints.isMd(width);
  bool isDesktopWidth(double width) => GBreakpoints.isLgUp(width);

  // Up/Down helpers
  bool isSmUp(double width) => GBreakpoints.isSmUp(width);
  bool isMdUp(double width) => GBreakpoints.isMdUp(width);
  bool isLgUp(double width) => GBreakpoints.isLgUp(width);
  bool isXlUp(double width) => GBreakpoints.isXlUp(width);
  bool isSmDown(double width) => GBreakpoints.isSmDown(width);
  bool isMdDown(double width) => GBreakpoints.isMdDown(width);
  bool isLgDown(double width) => GBreakpoints.isLgDown(width);
  bool isXlDown(double width) => GBreakpoints.isXlDown(width);

  /// Get the current breakpoint token for a given width
  GBreakpointToken current(double width) => GBreakpoints.current(width);

  /// Get the max width constraint for the current breakpoint
  double? maxWidthFor(double width) => GBreakpoints.maxWidthFor(width);
}

/// Default token instances using foundation values
class GTokenDefaults {
  const GTokenDefaults._();

  static const spacing = GSpacingTokens();
  static const sizing = GSizingTokens();
  static const borderRadius = GBorderRadiusTokens();
  static const borderWidth = GBorderWidthTokens();
  static const shadows = GShadowTokens();
  static const durations = GDurationTokens();
  static const easing = GEasingTokens();
  static const opacity = GOpacityTokens();
  static const breakpoints = GBreakpointTokens();
}

