import 'package:flutter/widgets.dart';

/// Garmisch Design System Border Radius
///
/// Border radius tokens for rounded corners.
/// Usage: `GBorderRadius.lg` or `GBorderRadius.full`
abstract final class GBorderRadius {
  GBorderRadius._();

  // ============================================
  // Radius Values (raw doubles)
  // ============================================

  /// No radius (0px)
  static const double none = 0.0;

  /// Extra small radius (2px)
  static const double xs = 2.0;

  /// Small radius (4px)
  static const double sm = 4.0;

  /// Medium radius (6px)
  static const double md = 6.0;

  /// Large radius (8px)
  static const double lg = 8.0;

  /// Extra large radius (12px)
  static const double xl = 12.0;

  /// 2XL radius (16px)
  static const double xl2 = 16.0;

  /// 3XL radius (24px)
  static const double xl3 = 24.0;

  /// 4XL radius (32px)
  static const double xl4 = 32.0;

  /// Full/pill radius (9999px)
  static const double full = 9999.0;

  // ============================================
  // BorderRadius Objects (all corners)
  // ============================================

  /// No border radius
  static const BorderRadius allNone = BorderRadius.zero;

  /// Extra small border radius all corners (2px)
  static const BorderRadius allXs = BorderRadius.all(Radius.circular(xs));

  /// Small border radius all corners (4px)
  static const BorderRadius allSm = BorderRadius.all(Radius.circular(sm));

  /// Medium border radius all corners (6px)
  static const BorderRadius allMd = BorderRadius.all(Radius.circular(md));

  /// Large border radius all corners (8px)
  static const BorderRadius allLg = BorderRadius.all(Radius.circular(lg));

  /// Extra large border radius all corners (12px)
  static const BorderRadius allXl = BorderRadius.all(Radius.circular(xl));

  /// 2XL border radius all corners (16px)
  static const BorderRadius allXl2 = BorderRadius.all(Radius.circular(xl2));

  /// 3XL border radius all corners (24px)
  static const BorderRadius allXl3 = BorderRadius.all(Radius.circular(xl3));

  /// 4XL border radius all corners (32px)
  static const BorderRadius allXl4 = BorderRadius.all(Radius.circular(xl4));

  /// Full/pill border radius all corners
  static const BorderRadius allFull = BorderRadius.all(Radius.circular(full));

  // ============================================
  // BorderRadius Objects (top only)
  // ============================================

  /// Small border radius top corners only (4px)
  static const BorderRadius topSm = BorderRadius.vertical(
    top: Radius.circular(sm),
  );

  /// Medium border radius top corners only (6px)
  static const BorderRadius topMd = BorderRadius.vertical(
    top: Radius.circular(md),
  );

  /// Large border radius top corners only (8px)
  static const BorderRadius topLg = BorderRadius.vertical(
    top: Radius.circular(lg),
  );

  /// Extra large border radius top corners only (12px)
  static const BorderRadius topXl = BorderRadius.vertical(
    top: Radius.circular(xl),
  );

  /// 2XL border radius top corners only (16px)
  static const BorderRadius topXl2 = BorderRadius.vertical(
    top: Radius.circular(xl2),
  );

  /// 3XL border radius top corners only (24px)
  static const BorderRadius topXl3 = BorderRadius.vertical(
    top: Radius.circular(xl3),
  );

  // ============================================
  // BorderRadius Objects (bottom only)
  // ============================================

  /// Small border radius bottom corners only (4px)
  static const BorderRadius bottomSm = BorderRadius.vertical(
    bottom: Radius.circular(sm),
  );

  /// Medium border radius bottom corners only (6px)
  static const BorderRadius bottomMd = BorderRadius.vertical(
    bottom: Radius.circular(md),
  );

  /// Large border radius bottom corners only (8px)
  static const BorderRadius bottomLg = BorderRadius.vertical(
    bottom: Radius.circular(lg),
  );

  /// Extra large border radius bottom corners only (12px)
  static const BorderRadius bottomXl = BorderRadius.vertical(
    bottom: Radius.circular(xl),
  );

  /// 2XL border radius bottom corners only (16px)
  static const BorderRadius bottomXl2 = BorderRadius.vertical(
    bottom: Radius.circular(xl2),
  );

  /// 3XL border radius bottom corners only (24px)
  static const BorderRadius bottomXl3 = BorderRadius.vertical(
    bottom: Radius.circular(xl3),
  );

  // ============================================
  // BorderRadius Objects (left only)
  // ============================================

  /// Small border radius left corners only (4px)
  static const BorderRadius leftSm = BorderRadius.horizontal(
    left: Radius.circular(sm),
  );

  /// Medium border radius left corners only (6px)
  static const BorderRadius leftMd = BorderRadius.horizontal(
    left: Radius.circular(md),
  );

  /// Large border radius left corners only (8px)
  static const BorderRadius leftLg = BorderRadius.horizontal(
    left: Radius.circular(lg),
  );

  /// Extra large border radius left corners only (12px)
  static const BorderRadius leftXl = BorderRadius.horizontal(
    left: Radius.circular(xl),
  );

  // ============================================
  // BorderRadius Objects (right only)
  // ============================================

  /// Small border radius right corners only (4px)
  static const BorderRadius rightSm = BorderRadius.horizontal(
    right: Radius.circular(sm),
  );

  /// Medium border radius right corners only (6px)
  static const BorderRadius rightMd = BorderRadius.horizontal(
    right: Radius.circular(md),
  );

  /// Large border radius right corners only (8px)
  static const BorderRadius rightLg = BorderRadius.horizontal(
    right: Radius.circular(lg),
  );

  /// Extra large border radius right corners only (12px)
  static const BorderRadius rightXl = BorderRadius.horizontal(
    right: Radius.circular(xl),
  );
}

/// Border radius enum for type-safe access
enum GBorderRadiusToken {
  none(GBorderRadius.none),
  xs(GBorderRadius.xs),
  sm(GBorderRadius.sm),
  md(GBorderRadius.md),
  lg(GBorderRadius.lg),
  xl(GBorderRadius.xl),
  xl2(GBorderRadius.xl2),
  xl3(GBorderRadius.xl3),
  xl4(GBorderRadius.xl4),
  full(GBorderRadius.full);

  const GBorderRadiusToken(this.value);

  /// The radius value in logical pixels
  final double value;

  /// Get a BorderRadius with this value applied to all corners
  BorderRadius get all => BorderRadius.all(Radius.circular(value));

  /// Get a BorderRadius with this value applied to top corners only
  BorderRadius get top => BorderRadius.vertical(top: Radius.circular(value));

  /// Get a BorderRadius with this value applied to bottom corners only
  BorderRadius get bottom =>
      BorderRadius.vertical(bottom: Radius.circular(value));

  /// Get a BorderRadius with this value applied to left corners only
  BorderRadius get left =>
      BorderRadius.horizontal(left: Radius.circular(value));

  /// Get a BorderRadius with this value applied to right corners only
  BorderRadius get right =>
      BorderRadius.horizontal(right: Radius.circular(value));
}

