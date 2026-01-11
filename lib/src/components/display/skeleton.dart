import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/border_radius.dart';
import '../../theme/theme.dart';

/// Skeleton variant options
enum GSkeletonVariant {
  /// Rectangular shape
  rectangular,

  /// Circular shape
  circular,

  /// Rounded rectangle
  rounded,

  /// Text line shape
  text,
}

/// A skeleton loading placeholder component.
///
/// ```dart
/// GSkeleton(width: 200, height: 20)
/// GSkeleton.circular(size: 48)
/// GSkeleton.text(lines: 3)
/// ```
class GSkeleton extends StatefulWidget {
  const GSkeleton({
    super.key,
    this.width,
    this.height,
    this.variant = GSkeletonVariant.rectangular,
    this.borderRadius,
    this.animate = true,
  });

  /// Creates a circular skeleton
  const GSkeleton.circular({
    super.key,
    double size = 48,
    this.animate = true,
  })  : width = size,
        height = size,
        variant = GSkeletonVariant.circular,
        borderRadius = null;

  /// Creates a rounded skeleton
  const GSkeleton.rounded({
    super.key,
    this.width,
    this.height = 20,
    this.borderRadius,
    this.animate = true,
  }) : variant = GSkeletonVariant.rounded;

  /// Width of the skeleton
  final double? width;

  /// Height of the skeleton
  final double? height;

  /// Shape variant
  final GSkeletonVariant variant;

  /// Custom border radius
  final double? borderRadius;

  /// Whether to animate the shimmer effect
  final bool animate;

  @override
  State<GSkeleton> createState() => _GSkeletonState();
}

class _GSkeletonState extends State<GSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (widget.animate) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final baseColor = colors.surfaceVariant;
    final highlightColor = colors.surface;

    BorderRadius radius;
    switch (widget.variant) {
      case GSkeletonVariant.rectangular:
        radius = BorderRadius.circular(widget.borderRadius ?? 0);
      case GSkeletonVariant.circular:
        radius = BorderRadius.circular(9999);
      case GSkeletonVariant.rounded:
        radius = BorderRadius.circular(widget.borderRadius ?? GBorderRadius.md);
      case GSkeletonVariant.text:
        radius = BorderRadius.circular(widget.borderRadius ?? GBorderRadius.xs);
    }

    if (!widget.animate) {
      return Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: radius,
        ),
      );
    }

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                baseColor,
                highlightColor,
                baseColor,
              ],
              stops: [
                (_animation.value - 1).clamp(0.0, 1.0),
                _animation.value.clamp(0.0, 1.0),
                (_animation.value + 1).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Multiple text line skeletons
class GSkeletonText extends StatelessWidget {
  const GSkeletonText({
    super.key,
    this.lines = 3,
    this.lineHeight = 16,
    this.spacing = GSpacing.xs,
    this.lastLineWidth = 0.6,
    this.animate = true,
  });

  /// Number of lines
  final int lines;

  /// Height of each line
  final double lineHeight;

  /// Spacing between lines
  final double spacing;

  /// Width factor for the last line (0.0 to 1.0)
  final double lastLineWidth;

  /// Whether to animate
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(lines, (index) {
        final isLast = index == lines - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : spacing),
          child: FractionallySizedBox(
            widthFactor: isLast ? lastLineWidth : 1.0,
            child: GSkeleton(
              height: lineHeight,
              variant: GSkeletonVariant.text,
              animate: animate,
            ),
          ),
        );
      }),
    );
  }
}

/// Skeleton for avatar with text
class GSkeletonAvatar extends StatelessWidget {
  const GSkeletonAvatar({
    super.key,
    this.avatarSize = 40,
    this.showSubtitle = true,
    this.animate = true,
  });

  /// Avatar size
  final double avatarSize;

  /// Whether to show subtitle skeleton
  final bool showSubtitle;

  /// Whether to animate
  final bool animate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GSkeleton.circular(size: avatarSize, animate: animate),
        const SizedBox(width: GSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GSkeleton(
                height: 16,
                width: 120,
                variant: GSkeletonVariant.text,
                animate: animate,
              ),
              if (showSubtitle) ...[
                const SizedBox(height: GSpacing.xs),
                GSkeleton(
                  height: 12,
                  width: 80,
                  variant: GSkeletonVariant.text,
                  animate: animate,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Skeleton for card
class GSkeletonCard extends StatelessWidget {
  const GSkeletonCard({
    super.key,
    this.imageHeight = 120,
    this.showImage = true,
    this.textLines = 2,
    this.animate = true,
  });

  /// Image placeholder height
  final double imageHeight;

  /// Whether to show image skeleton
  final bool showImage;

  /// Number of text lines
  final int textLines;

  /// Whether to animate
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showImage)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(GBorderRadius.lg),
              ),
              child: GSkeleton(
                width: double.infinity,
                height: imageHeight,
                animate: animate,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(GSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GSkeleton(
                  height: 20,
                  width: double.infinity,
                  variant: GSkeletonVariant.text,
                  animate: animate,
                ),
                const SizedBox(height: GSpacing.sm),
                GSkeletonText(
                  lines: textLines,
                  lineHeight: 14,
                  animate: animate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

