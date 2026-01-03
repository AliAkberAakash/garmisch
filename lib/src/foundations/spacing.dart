/// Garmisch Design System Spacing
///
/// Spacing tokens for margins, paddings, and gaps.
/// Based on a 4px base unit with semantic naming.
/// Usage: `GSpacing.md` or `GSpacing.xl2`
abstract final class GSpacing {
  GSpacing._();

  /// No spacing (0px)
  static const double none = 0.0;

  /// Single pixel spacing (1px)
  static const double px = 1.0;

  /// 4XS spacing (2px)
  static const double xs4 = 2.0;

  /// 3XS spacing (4px)
  static const double xs3 = 4.0;

  /// 2XS spacing (6px)
  static const double xs2 = 6.0;

  /// XS spacing (8px)
  static const double xs = 8.0;

  /// Small spacing (12px)
  static const double sm = 12.0;

  /// Medium spacing (16px) - Default
  static const double md = 16.0;

  /// Large spacing (20px)
  static const double lg = 20.0;

  /// XL spacing (24px)
  static const double xl = 24.0;

  /// 2XL spacing (32px)
  static const double xl2 = 32.0;

  /// 3XL spacing (40px)
  static const double xl3 = 40.0;

  /// 4XL spacing (48px)
  static const double xl4 = 48.0;

  /// 5XL spacing (56px)
  static const double xl5 = 56.0;

  /// 6XL spacing (64px)
  static const double xl6 = 64.0;

  /// 7XL spacing (80px)
  static const double xl7 = 80.0;

  /// 8XL spacing (96px)
  static const double xl8 = 96.0;

  /// 9XL spacing (112px)
  static const double xl9 = 112.0;

  /// 10XL spacing (128px)
  static const double xl10 = 128.0;

  /// 11XL spacing (144px)
  static const double xl11 = 144.0;

  /// 12XL spacing (160px)
  static const double xl12 = 160.0;
}

/// Spacing enum for type-safe access
enum GSpacingToken {
  none(GSpacing.none),
  px(GSpacing.px),
  xs4(GSpacing.xs4),
  xs3(GSpacing.xs3),
  xs2(GSpacing.xs2),
  xs(GSpacing.xs),
  sm(GSpacing.sm),
  md(GSpacing.md),
  lg(GSpacing.lg),
  xl(GSpacing.xl),
  xl2(GSpacing.xl2),
  xl3(GSpacing.xl3),
  xl4(GSpacing.xl4),
  xl5(GSpacing.xl5),
  xl6(GSpacing.xl6),
  xl7(GSpacing.xl7),
  xl8(GSpacing.xl8),
  xl9(GSpacing.xl9),
  xl10(GSpacing.xl10),
  xl11(GSpacing.xl11),
  xl12(GSpacing.xl12);

  const GSpacingToken(this.value);

  /// The spacing value in logical pixels
  final double value;
}

