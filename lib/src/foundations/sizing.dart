/// Garmisch Design System Sizing
///
/// Size tokens for widths, heights, and dimensions.
/// Based on a 4px base unit with semantic naming.
/// Usage: `GSizing.md` or `GSizing.xl4`
abstract final class GSizing {
  GSizing._();

  /// No size (0px)
  static const double none = 0.0;

  /// Single pixel size (1px)
  static const double px = 1.0;

  /// 4XS size (2px)
  static const double xs4 = 2.0;

  /// 3XS size (4px)
  static const double xs3 = 4.0;

  /// 2XS size (6px)
  static const double xs2 = 6.0;

  /// XS size (8px)
  static const double xs = 8.0;

  /// Small size (12px)
  static const double sm = 12.0;

  /// Medium size (16px)
  static const double md = 16.0;

  /// Large size (20px)
  static const double lg = 20.0;

  /// XL size (24px)
  static const double xl = 24.0;

  /// 2XL size (32px)
  static const double xl2 = 32.0;

  /// 3XL size (40px)
  static const double xl3 = 40.0;

  /// 4XL size (48px)
  static const double xl4 = 48.0;

  /// 5XL size (56px)
  static const double xl5 = 56.0;

  /// 6XL size (64px)
  static const double xl6 = 64.0;

  /// 7XL size (80px)
  static const double xl7 = 80.0;

  /// 8XL size (96px)
  static const double xl8 = 96.0;

  /// 9XL size (112px)
  static const double xl9 = 112.0;

  /// 10XL size (128px)
  static const double xl10 = 128.0;

  /// 11XL size (144px)
  static const double xl11 = 144.0;

  /// 12XL size (160px)
  static const double xl12 = 160.0;

  /// 13XL size (176px)
  static const double xl13 = 176.0;

  /// 14XL size (192px)
  static const double xl14 = 192.0;

  /// 15XL size (208px)
  static const double xl15 = 208.0;

  /// 16XL size (224px)
  static const double xl16 = 224.0;

  /// 17XL size (240px)
  static const double xl17 = 240.0;

  /// 18XL size (256px)
  static const double xl18 = 256.0;

  /// 19XL size (288px)
  static const double xl19 = 288.0;

  /// 20XL size (320px)
  static const double xl20 = 320.0;

  /// 21XL size (384px)
  static const double xl21 = 384.0;

  // ============================================
  // Icon Sizes
  // ============================================

  /// Extra small icon size (12px)
  static const double iconXs = 12.0;

  /// Small icon size (16px)
  static const double iconSm = 16.0;

  /// Medium icon size (20px)
  static const double iconMd = 20.0;

  /// Large icon size (24px)
  static const double iconLg = 24.0;

  /// Extra large icon size (32px)
  static const double iconXl = 32.0;

  /// 2XL icon size (40px)
  static const double iconXl2 = 40.0;

  /// 3XL icon size (48px)
  static const double iconXl3 = 48.0;

  // ============================================
  // Avatar Sizes
  // ============================================

  /// Extra small avatar size (24px)
  static const double avatarXs = 24.0;

  /// Small avatar size (32px)
  static const double avatarSm = 32.0;

  /// Medium avatar size (40px)
  static const double avatarMd = 40.0;

  /// Large avatar size (48px)
  static const double avatarLg = 48.0;

  /// Extra large avatar size (64px)
  static const double avatarXl = 64.0;

  /// 2XL avatar size (96px)
  static const double avatarXl2 = 96.0;

  // ============================================
  // Button Heights
  // ============================================

  /// Extra small button height (28px)
  static const double buttonHeightXs = 28.0;

  /// Small button height (32px)
  static const double buttonHeightSm = 32.0;

  /// Medium button height (40px)
  static const double buttonHeightMd = 40.0;

  /// Large button height (48px)
  static const double buttonHeightLg = 48.0;

  /// Extra large button height (56px)
  static const double buttonHeightXl = 56.0;

  // ============================================
  // Input Heights
  // ============================================

  /// Small input height (32px)
  static const double inputHeightSm = 32.0;

  /// Medium input height (40px)
  static const double inputHeightMd = 40.0;

  /// Large input height (48px)
  static const double inputHeightLg = 48.0;
}

/// Sizing enum for type-safe access
enum GSizingToken {
  none(GSizing.none),
  px(GSizing.px),
  xs4(GSizing.xs4),
  xs3(GSizing.xs3),
  xs2(GSizing.xs2),
  xs(GSizing.xs),
  sm(GSizing.sm),
  md(GSizing.md),
  lg(GSizing.lg),
  xl(GSizing.xl),
  xl2(GSizing.xl2),
  xl3(GSizing.xl3),
  xl4(GSizing.xl4),
  xl5(GSizing.xl5),
  xl6(GSizing.xl6),
  xl7(GSizing.xl7),
  xl8(GSizing.xl8),
  xl9(GSizing.xl9),
  xl10(GSizing.xl10),
  xl11(GSizing.xl11),
  xl12(GSizing.xl12),
  xl13(GSizing.xl13),
  xl14(GSizing.xl14),
  xl15(GSizing.xl15),
  xl16(GSizing.xl16),
  xl17(GSizing.xl17),
  xl18(GSizing.xl18),
  xl19(GSizing.xl19),
  xl20(GSizing.xl20),
  xl21(GSizing.xl21);

  const GSizingToken(this.value);

  /// The size value in logical pixels
  final double value;
}

