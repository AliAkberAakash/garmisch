import 'package:flutter/widgets.dart';


/// Garmisch Design System Shadows
///
/// Shadow/elevation tokens for depth and layering.
/// Usage: `GShadows.md` or `GShadows.lg`
abstract final class GShadows {
  GShadows._();

  /// No shadow
  static const List<BoxShadow> none = [];

  /// Extra small shadow - subtle depth (1px blur)
  static const List<BoxShadow> xs = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
  ];

  /// Small shadow - light depth (2px blur)
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x0A000000), // 4% opacity
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
  ];

  /// Medium shadow - standard elevation (6px blur)
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  /// Large shadow - prominent elevation (15px blur)
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      blurRadius: 15,
      offset: Offset(0, 10),
    ),
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  /// Extra large shadow - high elevation (25px blur)
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      blurRadius: 25,
      offset: Offset(0, 20),
    ),
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 10,
      offset: Offset(0, 8),
    ),
  ];

  /// 2XL shadow - maximum elevation (50px blur)
  static const List<BoxShadow> xl2 = [
    BoxShadow(
      color: Color(0x40000000), // 25% opacity
      blurRadius: 50,
      offset: Offset(0, 25),
    ),
  ];

  /// Inner shadow - inset depth
  static const List<BoxShadow> inner = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 4,
      offset: Offset(0, 2),
      spreadRadius: -1,
    ),
  ];

  // ============================================
  // Colored Shadows
  // ============================================

  /// Primary colored shadow (blue tint)
  static const List<BoxShadow> primaryMd = [
    BoxShadow(
      color: Color(0x403B82F6), // 25% blue
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  /// Primary colored shadow large
  static const List<BoxShadow> primaryLg = [
    BoxShadow(
      color: Color(0x403B82F6), // 25% blue
      blurRadius: 15,
      offset: Offset(0, 10),
    ),
  ];

  /// Success colored shadow (green tint)
  static const List<BoxShadow> successMd = [
    BoxShadow(
      color: Color(0x4022C55E), // 25% green
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  /// Error colored shadow (red tint)
  static const List<BoxShadow> errorMd = [
    BoxShadow(
      color: Color(0x40EF4444), // 25% red
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  /// Warning colored shadow (amber tint)
  static const List<BoxShadow> warningMd = [
    BoxShadow(
      color: Color(0x40F59E0B), // 25% amber
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];
}

/// Shadow elevation enum for type-safe access
enum GShadowToken {
  none,
  xs,
  sm,
  md,
  lg,
  xl,
  xl2,
  inner;

  /// Get the list of BoxShadow for this elevation
  List<BoxShadow> get value {
    switch (this) {
      case GShadowToken.none:
        return GShadows.none;
      case GShadowToken.xs:
        return GShadows.xs;
      case GShadowToken.sm:
        return GShadows.sm;
      case GShadowToken.md:
        return GShadows.md;
      case GShadowToken.lg:
        return GShadows.lg;
      case GShadowToken.xl:
        return GShadows.xl;
      case GShadowToken.xl2:
        return GShadows.xl2;
      case GShadowToken.inner:
        return GShadows.inner;
    }
  }
}

