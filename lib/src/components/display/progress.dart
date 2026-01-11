import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/durations.dart';
import '../../foundations/easing.dart';
import '../../theme/theme.dart';

/// Progress bar size options
enum GProgressSize {
  /// Small (4px height)
  sm,

  /// Medium (8px height) - Default
  md,

  /// Large (12px height)
  lg,
}

/// A linear progress bar component for the Garmisch design system.
///
/// ```dart
/// GProgressBar(value: 0.6)
/// GProgressBar(value: 0.3, color: GColors.green500)
/// GProgressBar.indeterminate()
/// ```
class GProgressBar extends StatelessWidget {
  const GProgressBar({
    super.key,
    this.value,
    this.size = GProgressSize.md,
    this.color,
    this.backgroundColor,
    this.borderRadius,
    this.showLabel = false,
    this.labelBuilder,
  });

  /// Creates an indeterminate progress bar
  const GProgressBar.indeterminate({
    super.key,
    this.size = GProgressSize.md,
    this.color,
    this.backgroundColor,
    this.borderRadius,
  })  : value = null,
        showLabel = false,
        labelBuilder = null;

  /// Progress value (0.0 to 1.0). Null for indeterminate.
  final double? value;

  /// Size of the progress bar
  final GProgressSize size;

  /// Progress color
  final Color? color;

  /// Background track color
  final Color? backgroundColor;

  /// Custom border radius
  final double? borderRadius;

  /// Whether to show percentage label
  final bool showLabel;

  /// Custom label builder
  final String Function(double value)? labelBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final dimensions = _getDimensions();
    final progressColor = color ?? colors.primary;
    final trackColor = backgroundColor ?? colors.surfaceVariant;
    final radius = borderRadius ?? dimensions.height / 2;

    if (value == null) {
      // Indeterminate
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: dimensions.height,
          child: LinearProgressIndicator(
            backgroundColor: trackColor,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      );
    }

    final clampedValue = value!.clamp(0.0, 1.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showLabel) ...[
          Text(
            labelBuilder?.call(clampedValue) ?? '${(clampedValue * 100).round()}%',
            style: textTheme.labelSmall.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.xs3),
        ],
        Container(
          height: dimensions.height,
          decoration: BoxDecoration(
            color: trackColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  AnimatedContainer(
                    duration: GDurations.normal,
                    curve: GEasing.easeOut,
                    width: constraints.maxWidth * clampedValue,
                    height: dimensions.height,
                    decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  _ProgressDimensions _getDimensions() {
    switch (size) {
      case GProgressSize.sm:
        return const _ProgressDimensions(height: 4);
      case GProgressSize.md:
        return const _ProgressDimensions(height: 8);
      case GProgressSize.lg:
        return const _ProgressDimensions(height: 12);
    }
  }
}

class _ProgressDimensions {
  const _ProgressDimensions({required this.height});
  final double height;
}

/// A circular progress indicator component.
///
/// ```dart
/// GProgressCircle(value: 0.75)
/// GProgressCircle.indeterminate()
/// ```
class GProgressCircle extends StatelessWidget {
  const GProgressCircle({
    super.key,
    this.value,
    this.size = 40,
    this.strokeWidth = 4,
    this.color,
    this.backgroundColor,
    this.showLabel = false,
    this.labelBuilder,
    this.child,
  });

  /// Creates an indeterminate progress circle
  const GProgressCircle.indeterminate({
    super.key,
    this.size = 40,
    this.strokeWidth = 4,
    this.color,
    this.backgroundColor,
  })  : value = null,
        showLabel = false,
        labelBuilder = null,
        child = null;

  /// Progress value (0.0 to 1.0). Null for indeterminate.
  final double? value;

  /// Size of the circle
  final double size;

  /// Stroke width
  final double strokeWidth;

  /// Progress color
  final Color? color;

  /// Background track color
  final Color? backgroundColor;

  /// Whether to show percentage label in center
  final bool showLabel;

  /// Custom label builder
  final String Function(double value)? labelBuilder;

  /// Custom child widget for center
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final typography = theme.typography;

    final progressColor = color ?? colors.primary;
    final trackColor = backgroundColor ?? colors.surfaceVariant;

    if (value == null) {
      // Indeterminate
      return SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          backgroundColor: trackColor,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        ),
      );
    }

    final clampedValue = value!.clamp(0.0, 1.0);

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            value: clampedValue,
            strokeWidth: strokeWidth,
            backgroundColor: trackColor,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
          if (child != null)
            Center(child: child!)
          else if (showLabel)
            Center(
              child: Text(
                labelBuilder?.call(clampedValue) ?? '${(clampedValue * 100).round()}%',
                style: textTheme.labelSmall.copyWith(
                  color: colors.onSurface,
                  fontWeight: typography.fontWeightSemiBold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A spinner loading indicator
class GSpinner extends StatelessWidget {
  const GSpinner({
    super.key,
    this.size = 24,
    this.strokeWidth = 2,
    this.color,
  });

  /// Size of the spinner
  final double size;

  /// Stroke width
  final double strokeWidth;

  /// Spinner color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final spinnerColor = color ?? colors.primary;

    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(spinnerColor),
      ),
    );
  }
}

