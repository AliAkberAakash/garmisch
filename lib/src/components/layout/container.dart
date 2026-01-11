import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../theme/theme.dart';

/// Container variant options
enum GContainerVariant {
  /// Plain container with no background
  plain,

  /// Container with surface background
  surface,

  /// Container with surface variant background
  surfaceVariant,

  /// Container with primary color background
  primary,

  /// Container with secondary color background
  secondary,

  /// Container with outlined border
  outlined,
}

/// Container size presets
enum GContainerSize {
  /// Extra small - 4px padding
  xs,

  /// Small - 8px padding
  sm,

  /// Medium - 16px padding
  md,

  /// Large - 24px padding
  lg,

  /// Extra large - 32px padding
  xl,

  /// No padding
  none,
}

/// A versatile container component for the Garmisch design system.
///
/// Provides consistent styling with theme-aware colors, padding, and borders.
///
/// ```dart
/// GContainer(
///   variant: GContainerVariant.surface,
///   padding: GContainerSize.md,
///   borderRadius: GBorderRadius.allMd,
///   child: Text('Content'),
/// )
/// ```
class GContainer extends StatelessWidget {
  const GContainer({
    super.key,
    this.child,
    this.variant = GContainerVariant.plain,
    this.padding = GContainerSize.md,
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.borderRadius,
    this.border,
    this.shadow,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.color,
  });

  /// Child widget
  final Widget? child;

  /// Container variant
  final GContainerVariant variant;

  /// Padding size preset
  final GContainerSize padding;

  /// Margin around the container
  final EdgeInsetsGeometry? margin;

  /// Fixed width
  final double? width;

  /// Fixed height
  final double? height;

  /// Size constraints
  final BoxConstraints? constraints;

  /// Border radius (defaults to none)
  final BorderRadiusGeometry? borderRadius;

  /// Custom border
  final BoxBorder? border;

  /// Box shadow
  final List<BoxShadow>? shadow;

  /// Content alignment
  final AlignmentGeometry? alignment;

  /// Clip behavior
  final Clip clipBehavior;

  /// Custom background color (overrides variant)
  final Color? color;

  EdgeInsetsGeometry _getPadding() {
    return switch (padding) {
      GContainerSize.xs => const EdgeInsets.all(GSpacing.xs),
      GContainerSize.sm => const EdgeInsets.all(GSpacing.sm),
      GContainerSize.md => const EdgeInsets.all(GSpacing.md),
      GContainerSize.lg => const EdgeInsets.all(GSpacing.lg),
      GContainerSize.xl => const EdgeInsets.all(GSpacing.xl),
      GContainerSize.none => EdgeInsets.zero,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    Color? backgroundColor;
    BoxBorder? effectiveBorder = border;

    switch (variant) {
      case GContainerVariant.plain:
        backgroundColor = null;
        break;
      case GContainerVariant.surface:
        backgroundColor = colors.surface;
        break;
      case GContainerVariant.surfaceVariant:
        backgroundColor = colors.surfaceVariant;
        break;
      case GContainerVariant.primary:
        backgroundColor = colors.primaryContainer;
        break;
      case GContainerVariant.secondary:
        backgroundColor = colors.secondaryContainer;
        break;
      case GContainerVariant.outlined:
        backgroundColor = null;
        effectiveBorder ??= Border.all(color: colors.outline);
        break;
    }

    // Custom color overrides variant
    if (color != null) {
      backgroundColor = color;
    }

    return Container(
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      padding: _getPadding(),
      alignment: alignment,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: effectiveBorder,
        boxShadow: shadow,
      ),
      child: child,
    );
  }
}

/// A centered container with maximum width constraint.
///
/// Useful for centering content on larger screens.
///
/// ```dart
/// GCenteredContainer(
///   maxWidth: 800,
///   child: Text('Centered content'),
/// )
/// ```
class GCenteredContainer extends StatelessWidget {
  const GCenteredContainer({
    super.key,
    required this.child,
    this.maxWidth = 1200,
    this.padding,
  });

  /// Child widget
  final Widget child;

  /// Maximum width
  final double maxWidth;

  /// Horizontal padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: padding,
        child: child,
      ),
    );
  }
}

/// A container with a fixed aspect ratio.
///
/// ```dart
/// GAspectRatioContainer(
///   aspectRatio: 16 / 9,
///   child: Image(...),
/// )
/// ```
class GAspectRatioContainer extends StatelessWidget {
  const GAspectRatioContainer({
    super.key,
    required this.aspectRatio,
    required this.child,
    this.backgroundColor,
    this.borderRadius,
  });

  /// Aspect ratio (width / height)
  final double aspectRatio;

  /// Child widget
  final Widget child;

  /// Background color
  final Color? backgroundColor;

  /// Border radius
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        clipBehavior: borderRadius != null ? Clip.antiAlias : Clip.none,
        child: child,
      ),
    );
  }
}

/// A container that fills available space.
///
/// ```dart
/// GExpandedContainer(
///   child: Text('Fills space'),
/// )
/// ```
class GExpandedContainer extends StatelessWidget {
  const GExpandedContainer({
    super.key,
    required this.child,
    this.flex = 1,
    this.padding,
    this.color,
    this.borderRadius,
  });

  /// Child widget
  final Widget child;

  /// Flex factor
  final int flex;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Background color
  final Color? color;

  /// Border radius
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}

