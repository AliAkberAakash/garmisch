/// Garmisch Design System Border Width
///
/// Border width tokens for strokes and outlines.
/// Usage: `GBorderWidth.thin` or `GBorderWidth.thick`
abstract final class GBorderWidth {
  GBorderWidth._();

  /// No border (0px)
  static const double none = 0.0;

  /// Hairline border (0.5px)
  static const double hairline = 0.5;

  /// Thin border (1px)
  static const double thin = 1.0;

  /// Medium border (2px)
  static const double medium = 2.0;

  /// Thick border (4px)
  static const double thick = 4.0;

  /// Heavy border (8px)
  static const double heavy = 8.0;
}

/// Border width enum for type-safe access
enum GBorderWidthToken {
  none(GBorderWidth.none),
  hairline(GBorderWidth.hairline),
  thin(GBorderWidth.thin),
  medium(GBorderWidth.medium),
  thick(GBorderWidth.thick),
  heavy(GBorderWidth.heavy);

  const GBorderWidthToken(this.value);

  /// The border width value in logical pixels
  final double value;
}

