import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/breakpoints.dart';

/// A fixed-size gap component.
///
/// ```dart
/// Column(
///   children: [
///     Text('First'),
///     GGap.md(),
///     Text('Second'),
///   ],
/// )
/// ```
class GGap extends StatelessWidget {
  const GGap(this.size, {super.key});

  /// Extra small gap (4px)
  const GGap.xs3({super.key}) : size = GSpacing.xs3;

  /// Extra small gap (6px)
  const GGap.xs2({super.key}) : size = GSpacing.xs2;

  /// Extra small gap (8px)
  const GGap.xs({super.key}) : size = GSpacing.xs;

  /// Small gap (12px)
  const GGap.sm({super.key}) : size = GSpacing.sm;

  /// Medium gap (16px)
  const GGap.md({super.key}) : size = GSpacing.md;

  /// Large gap (20px)
  const GGap.lg({super.key}) : size = GSpacing.lg;

  /// Extra large gap (24px)
  const GGap.xl({super.key}) : size = GSpacing.xl;

  /// 2XL gap (32px)
  const GGap.xl2({super.key}) : size = GSpacing.xl2;

  /// 3XL gap (40px)
  const GGap.xl3({super.key}) : size = GSpacing.xl3;

  /// Gap size
  final double size;

  @override
  Widget build(BuildContext context) {
    // Use SizedBox which works in both Row and Column
    return SizedBox.square(dimension: size);
  }
}

/// A horizontal gap.
class GHGap extends StatelessWidget {
  const GHGap(this.width, {super.key});

  const GHGap.xs({super.key}) : width = GSpacing.xs;
  const GHGap.sm({super.key}) : width = GSpacing.sm;
  const GHGap.md({super.key}) : width = GSpacing.md;
  const GHGap.lg({super.key}) : width = GSpacing.lg;
  const GHGap.xl({super.key}) : width = GSpacing.xl;

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}

/// A vertical gap.
class GVGap extends StatelessWidget {
  const GVGap(this.height, {super.key});

  const GVGap.xs({super.key}) : height = GSpacing.xs;
  const GVGap.sm({super.key}) : height = GSpacing.sm;
  const GVGap.md({super.key}) : height = GSpacing.md;
  const GVGap.lg({super.key}) : height = GSpacing.lg;
  const GVGap.xl({super.key}) : height = GSpacing.xl;

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

/// A flexible spacer component.
///
/// ```dart
/// Row(
///   children: [
///     Text('Left'),
///     GSpacer(), // Fills available space
///     Text('Right'),
///   ],
/// )
/// ```
class GSpacer extends StatelessWidget {
  const GSpacer({super.key, this.flex = 1});

  /// Flex factor
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Spacer(flex: flex);
  }
}

/// A responsive layout builder.
///
/// ```dart
/// GResponsive(
///   xs: MobileLayout(),
///   md: TabletLayout(),
///   lg: DesktopLayout(),
/// )
/// ```
class GResponsive extends StatelessWidget {
  const GResponsive({
    super.key,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  /// Extra small layout (default/mobile)
  final Widget xs;

  /// Small layout
  final Widget? sm;

  /// Medium layout (tablet)
  final Widget? md;

  /// Large layout (desktop)
  final Widget? lg;

  /// Extra large layout
  final Widget? xl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width >= GBreakpoints.xl && xl != null) return xl!;
        if (width >= GBreakpoints.lg && lg != null) return lg!;
        if (width >= GBreakpoints.md && md != null) return md!;
        if (width >= GBreakpoints.sm && sm != null) return sm!;
        return xs;
      },
    );
  }
}

/// A breakpoint builder that provides the current breakpoint.
///
/// ```dart
/// GBreakpointBuilder(
///   builder: (context, breakpoint) {
///     return switch (breakpoint) {
///       GBreakpoint.xs => MobileView(),
///       GBreakpoint.sm => MobileView(),
///       GBreakpoint.md => TabletView(),
///       _ => DesktopView(),
///     };
///   },
/// )
/// ```
class GBreakpointBuilder extends StatelessWidget {
  const GBreakpointBuilder({
    super.key,
    required this.builder,
  });

  /// Builder that receives the current breakpoint
  final Widget Function(BuildContext context, GBreakpoint breakpoint) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final breakpoint = GBreakpoint.fromWidth(constraints.maxWidth);
        return builder(context, breakpoint);
      },
    );
  }
}

/// Breakpoint enum
enum GBreakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xl2;

  static GBreakpoint fromWidth(double width) {
    if (width >= GBreakpoints.xl2) return GBreakpoint.xl2;
    if (width >= GBreakpoints.xl) return GBreakpoint.xl;
    if (width >= GBreakpoints.lg) return GBreakpoint.lg;
    if (width >= GBreakpoints.md) return GBreakpoint.md;
    if (width >= GBreakpoints.sm) return GBreakpoint.sm;
    return GBreakpoint.xs;
  }

  bool get isXs => this == GBreakpoint.xs;
  bool get isSm => this == GBreakpoint.sm;
  bool get isMd => this == GBreakpoint.md;
  bool get isLg => this == GBreakpoint.lg;
  bool get isXl => this == GBreakpoint.xl;
  bool get isXl2 => this == GBreakpoint.xl2;

  bool get isMobile => this == GBreakpoint.xs || this == GBreakpoint.sm;
  bool get isTablet => this == GBreakpoint.md;
  bool get isDesktop => this == GBreakpoint.lg || this == GBreakpoint.xl || this == GBreakpoint.xl2;
}

/// A responsive value that resolves based on screen width.
class GResponsiveValue<T> {
  const GResponsiveValue({
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  final T xs;
  final T? sm;
  final T? md;
  final T? lg;
  final T? xl;

  T resolve(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= GBreakpoints.xl && xl != null) return xl!;
    if (width >= GBreakpoints.lg && lg != null) return lg!;
    if (width >= GBreakpoints.md && md != null) return md!;
    if (width >= GBreakpoints.sm && sm != null) return sm!;
    return xs;
  }
}

