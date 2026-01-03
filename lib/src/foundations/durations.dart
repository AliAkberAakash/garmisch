/// Garmisch Design System Durations
///
/// Animation and transition duration tokens.
/// Usage: `GDurations.normal` or `GDurations.fast`
abstract final class GDurations {
  GDurations._();

  /// Instant - no animation (0ms)
  static const Duration instant = Duration.zero;

  /// Fastest - micro-interactions (50ms)
  static const Duration fastest = Duration(milliseconds: 50);

  /// Faster - quick feedback (100ms)
  static const Duration faster = Duration(milliseconds: 100);

  /// Fast - button states, toggles (150ms)
  static const Duration fast = Duration(milliseconds: 150);

  /// Normal - default transitions (200ms)
  static const Duration normal = Duration(milliseconds: 200);

  /// Slow - page transitions, modals (300ms)
  static const Duration slow = Duration(milliseconds: 300);

  /// Slower - complex animations (400ms)
  static const Duration slower = Duration(milliseconds: 400);

  /// Slowest - elaborate animations (500ms)
  static const Duration slowest = Duration(milliseconds: 500);

  // ============================================
  // Semantic Durations
  // ============================================

  /// Duration for tooltip show/hide
  static const Duration tooltip = Duration(milliseconds: 200);

  /// Duration for snackbar/toast display
  static const Duration snackbar = Duration(seconds: 4);

  /// Duration for ripple effects
  static const Duration ripple = Duration(milliseconds: 300);

  /// Duration for page route transitions
  static const Duration pageTransition = Duration(milliseconds: 300);

  /// Duration for modal open/close
  static const Duration modal = Duration(milliseconds: 250);

  /// Duration for bottom sheet open/close
  static const Duration bottomSheet = Duration(milliseconds: 250);

  /// Duration for drawer open/close
  static const Duration drawer = Duration(milliseconds: 250);

  /// Duration for skeleton shimmer
  static const Duration shimmer = Duration(milliseconds: 1500);

  /// Debounce duration for search inputs
  static const Duration debounce = Duration(milliseconds: 300);

  /// Throttle duration for scroll events
  static const Duration throttle = Duration(milliseconds: 100);
}

/// Duration enum for type-safe access
enum GDurationToken {
  instant(GDurations.instant),
  fastest(GDurations.fastest),
  faster(GDurations.faster),
  fast(GDurations.fast),
  normal(GDurations.normal),
  slow(GDurations.slow),
  slower(GDurations.slower),
  slowest(GDurations.slowest);

  const GDurationToken(this.value);

  /// The Duration value
  final Duration value;

  /// Get milliseconds
  int get inMilliseconds => value.inMilliseconds;
}

