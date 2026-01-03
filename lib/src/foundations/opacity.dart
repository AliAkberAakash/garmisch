/// Garmisch Design System Opacity
///
/// Opacity tokens for transparency levels.
/// Usage: `GOpacity.50` or `GOpacity.disabled`
abstract final class GOpacity {
  GOpacity._();

  /// Fully transparent (0%)
  static const double transparent = 0.0;

  /// 5% opacity
  static const double o5 = 0.05;

  /// 10% opacity
  static const double o10 = 0.10;

  /// 20% opacity
  static const double o20 = 0.20;

  /// 25% opacity
  static const double o25 = 0.25;

  /// 30% opacity
  static const double o30 = 0.30;

  /// 40% opacity
  static const double o40 = 0.40;

  /// 50% opacity
  static const double o50 = 0.50;

  /// 60% opacity
  static const double o60 = 0.60;

  /// 70% opacity
  static const double o70 = 0.70;

  /// 75% opacity
  static const double o75 = 0.75;

  /// 80% opacity
  static const double o80 = 0.80;

  /// 90% opacity
  static const double o90 = 0.90;

  /// 95% opacity
  static const double o95 = 0.95;

  /// Fully opaque (100%)
  static const double opaque = 1.0;

  // ============================================
  // Semantic Opacity Values
  // ============================================

  /// Disabled state opacity
  static const double disabled = 0.38;

  /// Hover state opacity overlay
  static const double hover = 0.08;

  /// Focus state opacity overlay
  static const double focus = 0.12;

  /// Pressed state opacity overlay
  static const double pressed = 0.16;

  /// Dragged state opacity overlay
  static const double dragged = 0.20;

  /// Scrim/overlay opacity
  static const double scrim = 0.50;

  /// Backdrop opacity (for modals)
  static const double backdrop = 0.60;
}

/// Opacity enum for type-safe access
enum GOpacityToken {
  transparent(GOpacity.transparent),
  o5(GOpacity.o5),
  o10(GOpacity.o10),
  o20(GOpacity.o20),
  o25(GOpacity.o25),
  o30(GOpacity.o30),
  o40(GOpacity.o40),
  o50(GOpacity.o50),
  o60(GOpacity.o60),
  o70(GOpacity.o70),
  o75(GOpacity.o75),
  o80(GOpacity.o80),
  o90(GOpacity.o90),
  o95(GOpacity.o95),
  opaque(GOpacity.opaque);

  const GOpacityToken(this.value);

  /// The opacity value (0.0 to 1.0)
  final double value;
}

