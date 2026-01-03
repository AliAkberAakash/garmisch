/// Garmisch Design System Breakpoints
///
/// Responsive breakpoint tokens for different screen sizes.
/// Usage: `GBreakpoints.md` or `GBreakpoints.isLarge(width)`
abstract final class GBreakpoints {
  GBreakpoints._();

  /// Extra small breakpoint - phones portrait (0px)
  static const double xs = 0.0;

  /// Small breakpoint - phones landscape (576px)
  static const double sm = 576.0;

  /// Medium breakpoint - tablets (768px)
  static const double md = 768.0;

  /// Large breakpoint - desktops (992px)
  static const double lg = 992.0;

  /// Extra large breakpoint - large desktops (1200px)
  static const double xl = 1200.0;

  /// 2XL breakpoint - wide screens (1400px)
  static const double xl2 = 1400.0;

  // ============================================
  // Max Width Constraints (for containers)
  // ============================================

  /// Max width for small container (540px)
  static const double maxWidthSm = 540.0;

  /// Max width for medium container (720px)
  static const double maxWidthMd = 720.0;

  /// Max width for large container (960px)
  static const double maxWidthLg = 960.0;

  /// Max width for extra large container (1140px)
  static const double maxWidthXl = 1140.0;

  /// Max width for 2XL container (1320px)
  static const double maxWidthXl2 = 1320.0;

  // ============================================
  // Helper Methods
  // ============================================

  /// Check if width is extra small (< 576px)
  static bool isXs(double width) => width < sm;

  /// Check if width is small (>= 576px and < 768px)
  static bool isSm(double width) => width >= sm && width < md;

  /// Check if width is medium (>= 768px and < 992px)
  static bool isMd(double width) => width >= md && width < lg;

  /// Check if width is large (>= 992px and < 1200px)
  static bool isLg(double width) => width >= lg && width < xl;

  /// Check if width is extra large (>= 1200px and < 1400px)
  static bool isXl(double width) => width >= xl && width < xl2;

  /// Check if width is 2XL (>= 1400px)
  static bool isXl2(double width) => width >= xl2;

  /// Check if width is at least small (>= 576px)
  static bool isSmUp(double width) => width >= sm;

  /// Check if width is at least medium (>= 768px)
  static bool isMdUp(double width) => width >= md;

  /// Check if width is at least large (>= 992px)
  static bool isLgUp(double width) => width >= lg;

  /// Check if width is at least extra large (>= 1200px)
  static bool isXlUp(double width) => width >= xl;

  /// Check if width is at least 2XL (>= 1400px)
  static bool isXl2Up(double width) => width >= xl2;

  /// Check if width is at most small (< 768px)
  static bool isSmDown(double width) => width < md;

  /// Check if width is at most medium (< 992px)
  static bool isMdDown(double width) => width < lg;

  /// Check if width is at most large (< 1200px)
  static bool isLgDown(double width) => width < xl;

  /// Check if width is at most extra large (< 1400px)
  static bool isXlDown(double width) => width < xl2;

  /// Get the current breakpoint for a given width
  static GBreakpointToken current(double width) {
    if (width >= xl2) return GBreakpointToken.xl2;
    if (width >= xl) return GBreakpointToken.xl;
    if (width >= lg) return GBreakpointToken.lg;
    if (width >= md) return GBreakpointToken.md;
    if (width >= sm) return GBreakpointToken.sm;
    return GBreakpointToken.xs;
  }

  /// Get the max width constraint for the current breakpoint
  static double? maxWidthFor(double width) {
    if (width >= xl2) return maxWidthXl2;
    if (width >= xl) return maxWidthXl;
    if (width >= lg) return maxWidthLg;
    if (width >= md) return maxWidthMd;
    if (width >= sm) return maxWidthSm;
    return null; // No max width for xs
  }
}

/// Breakpoint enum for type-safe access
enum GBreakpointToken {
  xs(GBreakpoints.xs),
  sm(GBreakpoints.sm),
  md(GBreakpoints.md),
  lg(GBreakpoints.lg),
  xl(GBreakpoints.xl),
  xl2(GBreakpoints.xl2);

  const GBreakpointToken(this.value);

  /// The breakpoint value in logical pixels
  final double value;

  /// Check if this breakpoint is mobile (xs or sm)
  bool get isMobile => this == xs || this == sm;

  /// Check if this breakpoint is tablet (md)
  bool get isTablet => this == md;

  /// Check if this breakpoint is desktop (lg, xl, or xl2)
  bool get isDesktop => this == lg || this == xl || this == xl2;
}

