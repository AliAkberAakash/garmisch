import 'package:flutter/widgets.dart';

/// Garmisch Design System Typography
///
/// Contains font families, sizes, weights, line heights, and letter spacing.
/// Usage: `GTypography.fontSizeLg` or `GTypography.fontWeightBold`
abstract final class GTypography {
  GTypography._();

  // ============================================
  // Font Families
  // ============================================

  /// Sans-serif font family (default)
  static const String fontFamilySans = 'Inter';

  /// Serif font family
  static const String fontFamilySerif = 'Georgia';

  /// Monospace font family
  static const String fontFamilyMono = 'JetBrains Mono';

  /// Default font family fallbacks
  static const List<String> fontFamilyFallback = [
    'system-ui',
    '-apple-system',
    'BlinkMacSystemFont',
    'Segoe UI',
    'Roboto',
    'sans-serif',
  ];

  // ============================================
  // Font Sizes
  // ============================================

  /// Extra small font size (12px)
  static const double fontSizeXs = 12.0;

  /// Small font size (14px)
  static const double fontSizeSm = 14.0;

  /// Base font size (16px)
  static const double fontSizeBase = 16.0;

  /// Large font size (18px)
  static const double fontSizeLg = 18.0;

  /// Extra large font size (20px)
  static const double fontSizeXl = 20.0;

  /// 2XL font size (24px)
  static const double fontSizeXl2 = 24.0;

  /// 3XL font size (30px)
  static const double fontSizeXl3 = 30.0;

  /// 4XL font size (36px)
  static const double fontSizeXl4 = 36.0;

  /// 5XL font size (48px)
  static const double fontSizeXl5 = 48.0;

  /// 6XL font size (60px)
  static const double fontSizeXl6 = 60.0;

  /// 7XL font size (72px)
  static const double fontSizeXl7 = 72.0;

  /// 8XL font size (96px)
  static const double fontSizeXl8 = 96.0;

  /// 9XL font size (128px)
  static const double fontSizeXl9 = 128.0;

  // ============================================
  // Line Heights
  // ============================================

  /// Line height for xs text (16px)
  static const double lineHeightXs = 16.0;

  /// Line height for sm text (20px)
  static const double lineHeightSm = 20.0;

  /// Line height for base text (24px)
  static const double lineHeightBase = 24.0;

  /// Line height for lg text (28px)
  static const double lineHeightLg = 28.0;

  /// Line height for xl text (28px)
  static const double lineHeightXl = 28.0;

  /// Line height for 2xl text (32px)
  static const double lineHeightXl2 = 32.0;

  /// Line height for 3xl text (36px)
  static const double lineHeightXl3 = 36.0;

  /// Line height for 4xl text (40px)
  static const double lineHeightXl4 = 40.0;

  /// Line height for 5xl text (48px)
  static const double lineHeightXl5 = 48.0;

  /// Line height for 6xl text (60px)
  static const double lineHeightXl6 = 60.0;

  /// Line height for 7xl text (72px)
  static const double lineHeightXl7 = 72.0;

  /// Line height for 8xl text (96px)
  static const double lineHeightXl8 = 96.0;

  /// Line height for 9xl text (128px)
  static const double lineHeightXl9 = 128.0;

  /// No line height (1.0 multiplier)
  static const double lineHeightNone = 1.0;

  /// Tight line height (1.25 multiplier)
  static const double lineHeightTight = 1.25;

  /// Snug line height (1.375 multiplier)
  static const double lineHeightSnug = 1.375;

  /// Normal line height (1.5 multiplier)
  static const double lineHeightNormal = 1.5;

  /// Relaxed line height (1.625 multiplier)
  static const double lineHeightRelaxed = 1.625;

  /// Loose line height (2.0 multiplier)
  static const double lineHeightLoose = 2.0;

  // ============================================
  // Font Weights
  // ============================================

  /// Thin font weight (100)
  static const FontWeight fontWeightThin = FontWeight.w100;

  /// Extra light font weight (200)
  static const FontWeight fontWeightExtraLight = FontWeight.w200;

  /// Light font weight (300)
  static const FontWeight fontWeightLight = FontWeight.w300;

  /// Regular font weight (400)
  static const FontWeight fontWeightRegular = FontWeight.w400;

  /// Medium font weight (500)
  static const FontWeight fontWeightMedium = FontWeight.w500;

  /// Semi-bold font weight (600)
  static const FontWeight fontWeightSemiBold = FontWeight.w600;

  /// Bold font weight (700)
  static const FontWeight fontWeightBold = FontWeight.w700;

  /// Extra bold font weight (800)
  static const FontWeight fontWeightExtraBold = FontWeight.w800;

  /// Black font weight (900)
  static const FontWeight fontWeightBlack = FontWeight.w900;

  // ============================================
  // Letter Spacing
  // ============================================

  /// Tighter letter spacing (-0.05em = -0.8px at 16px)
  static const double letterSpacingTighter = -0.8;

  /// Tight letter spacing (-0.025em = -0.4px at 16px)
  static const double letterSpacingTight = -0.4;

  /// Normal letter spacing (0)
  static const double letterSpacingNormal = 0.0;

  /// Wide letter spacing (0.025em = 0.4px at 16px)
  static const double letterSpacingWide = 0.4;

  /// Wider letter spacing (0.05em = 0.8px at 16px)
  static const double letterSpacingWider = 0.8;

  /// Widest letter spacing (0.1em = 1.6px at 16px)
  static const double letterSpacingWidest = 1.6;
}

/// Font size enum for type-safe access
enum GFontSize {
  xs(GTypography.fontSizeXs, GTypography.lineHeightXs),
  sm(GTypography.fontSizeSm, GTypography.lineHeightSm),
  base(GTypography.fontSizeBase, GTypography.lineHeightBase),
  lg(GTypography.fontSizeLg, GTypography.lineHeightLg),
  xl(GTypography.fontSizeXl, GTypography.lineHeightXl),
  xl2(GTypography.fontSizeXl2, GTypography.lineHeightXl2),
  xl3(GTypography.fontSizeXl3, GTypography.lineHeightXl3),
  xl4(GTypography.fontSizeXl4, GTypography.lineHeightXl4),
  xl5(GTypography.fontSizeXl5, GTypography.lineHeightXl5),
  xl6(GTypography.fontSizeXl6, GTypography.lineHeightXl6),
  xl7(GTypography.fontSizeXl7, GTypography.lineHeightXl7),
  xl8(GTypography.fontSizeXl8, GTypography.lineHeightXl8),
  xl9(GTypography.fontSizeXl9, GTypography.lineHeightXl9);

  const GFontSize(this.size, this.lineHeight);

  /// The font size in logical pixels
  final double size;

  /// The recommended line height for this font size
  final double lineHeight;
}

/// Font weight enum for type-safe access
enum GFontWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800),
  black(FontWeight.w900);

  const GFontWeight(this.weight);

  /// The Flutter FontWeight value
  final FontWeight weight;
}

/// Letter spacing enum for type-safe access
enum GLetterSpacing {
  tighter(GTypography.letterSpacingTighter),
  tight(GTypography.letterSpacingTight),
  normal(GTypography.letterSpacingNormal),
  wide(GTypography.letterSpacingWide),
  wider(GTypography.letterSpacingWider),
  widest(GTypography.letterSpacingWidest);

  const GLetterSpacing(this.value);

  /// The letter spacing value in logical pixels
  final double value;
}

