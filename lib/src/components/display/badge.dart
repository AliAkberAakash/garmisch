import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Badge variant options
enum GBadgeVariant {
  /// Solid background
  solid,

  /// Soft/muted background
  soft,

  /// Border only
  outlined,
}

/// Badge color options
enum GBadgeColor {
  /// Primary color
  primary,

  /// Secondary color
  secondary,

  /// Success/green color
  success,

  /// Warning/amber color
  warning,

  /// Error/red color
  error,

  /// Info/blue color
  info,

  /// Neutral/gray color
  neutral,
}

/// Badge size options
enum GBadgeSize {
  /// Small badge
  sm,

  /// Medium badge - Default
  md,

  /// Large badge
  lg,
}

/// A customizable badge/tag component for the Garmisch design system.
///
/// ```dart
/// GBadge(
///   label: 'New',
///   color: GBadgeColor.success,
///   variant: GBadgeVariant.solid,
/// )
/// ```
class GBadge extends StatelessWidget {
  const GBadge({
    super.key,
    required this.label,
    this.color = GBadgeColor.primary,
    this.variant = GBadgeVariant.solid,
    this.size = GBadgeSize.md,
    this.icon,
    this.onDismiss,
    this.isRounded = false,
  });

  /// Badge text
  final String label;

  /// Color scheme
  final GBadgeColor color;

  /// Visual variant
  final GBadgeVariant variant;

  /// Size of the badge
  final GBadgeSize size;

  /// Optional leading icon
  final IconData? icon;

  /// If provided, shows dismiss button
  final VoidCallback? onDismiss;

  /// Whether to use fully rounded (pill) shape
  final bool isRounded;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final badgeColors = _getBadgeColors(colors);
    final dimensions = _getDimensions();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dimensions.horizontalPadding,
        vertical: dimensions.verticalPadding,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(badgeColors),
        borderRadius: BorderRadius.circular(
          isRounded ? dimensions.height / 2 : dimensions.borderRadius,
        ),
        border: variant == GBadgeVariant.outlined
            ? Border.all(
                color: badgeColors.borderColor,
                width: GBorderWidth.thin,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: dimensions.iconSize,
              color: badgeColors.foregroundColor,
            ),
            SizedBox(width: dimensions.iconSpacing),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: dimensions.fontSize,
              fontWeight: GTypography.fontWeightMedium,
              color: badgeColors.foregroundColor,
              height: 1,
            ),
          ),
          if (onDismiss != null) ...[
            SizedBox(width: dimensions.iconSpacing),
            GestureDetector(
              onTap: onDismiss,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.close,
                  size: dimensions.iconSize,
                  color: badgeColors.foregroundColor,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor(_BadgeColors badgeColors) {
    switch (variant) {
      case GBadgeVariant.solid:
        return badgeColors.solidBackground;
      case GBadgeVariant.soft:
        return badgeColors.softBackground;
      case GBadgeVariant.outlined:
        return Colors.transparent;
    }
  }

  _BadgeColors _getBadgeColors(GColorScheme colors) {
    switch (color) {
      case GBadgeColor.primary:
        return _BadgeColors(
          solidBackground: colors.primary,
          softBackground: colors.primary.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onPrimary
              : colors.primary,
          borderColor: colors.primary,
        );
      case GBadgeColor.secondary:
        return _BadgeColors(
          solidBackground: colors.secondary,
          softBackground: colors.secondary.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onSecondary
              : colors.secondary,
          borderColor: colors.secondary,
        );
      case GBadgeColor.success:
        return _BadgeColors(
          solidBackground: colors.success,
          softBackground: colors.success.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onSuccess
              : colors.success,
          borderColor: colors.success,
        );
      case GBadgeColor.warning:
        return _BadgeColors(
          solidBackground: colors.warning,
          softBackground: colors.warning.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onWarning
              : colors.warning,
          borderColor: colors.warning,
        );
      case GBadgeColor.error:
        return _BadgeColors(
          solidBackground: colors.error,
          softBackground: colors.error.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onError
              : colors.error,
          borderColor: colors.error,
        );
      case GBadgeColor.info:
        return _BadgeColors(
          solidBackground: colors.info,
          softBackground: colors.info.withValues(alpha: 0.15),
          foregroundColor: variant == GBadgeVariant.solid
              ? colors.onInfo
              : colors.info,
          borderColor: colors.info,
        );
      case GBadgeColor.neutral:
        return _BadgeColors(
          solidBackground: colors.surfaceVariant,
          softBackground: colors.surfaceVariant.withValues(alpha: 0.5),
          foregroundColor: colors.onSurfaceVariant,
          borderColor: colors.outline,
        );
    }
  }

  _BadgeDimensions _getDimensions() {
    switch (size) {
      case GBadgeSize.sm:
        return const _BadgeDimensions(
          height: 20,
          horizontalPadding: GSpacing.xs,
          verticalPadding: 2,
          fontSize: 11,
          iconSize: 12,
          iconSpacing: 4,
          borderRadius: 4,
        );
      case GBadgeSize.md:
        return const _BadgeDimensions(
          height: 24,
          horizontalPadding: GSpacing.sm,
          verticalPadding: 4,
          fontSize: 12,
          iconSize: 14,
          iconSpacing: 4,
          borderRadius: 5,
        );
      case GBadgeSize.lg:
        return const _BadgeDimensions(
          height: 28,
          horizontalPadding: GSpacing.sm,
          verticalPadding: 6,
          fontSize: 13,
          iconSize: 16,
          iconSpacing: 6,
          borderRadius: 6,
        );
    }
  }
}

class _BadgeColors {
  const _BadgeColors({
    required this.solidBackground,
    required this.softBackground,
    required this.foregroundColor,
    required this.borderColor,
  });

  final Color solidBackground;
  final Color softBackground;
  final Color foregroundColor;
  final Color borderColor;
}

class _BadgeDimensions {
  const _BadgeDimensions({
    required this.height,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.fontSize,
    required this.iconSize,
    required this.iconSpacing,
    required this.borderRadius,
  });

  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double iconSize;
  final double iconSpacing;
  final double borderRadius;
}

/// A notification dot badge
class GNotificationBadge extends StatelessWidget {
  const GNotificationBadge({
    super.key,
    this.count,
    this.showZero = false,
    this.maxCount = 99,
    this.color,
    required this.child,
  });

  /// Count to display
  final int? count;

  /// Whether to show badge when count is 0
  final bool showZero;

  /// Maximum count to display
  final int maxCount;

  /// Badge color
  final Color? color;

  /// Child widget to wrap
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final badgeColor = color ?? colors.error;
    final shouldShow = count != null && (count! > 0 || showZero);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (shouldShow)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 18,
                minHeight: 18,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(9),
              ),
              child: Center(
                child: Text(
                  count! > maxCount ? '$maxCount+' : '$count',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: GTypography.fontWeightSemiBold,
                    color: colors.onError,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// A simple dot indicator
class GDot extends StatelessWidget {
  const GDot({
    super.key,
    this.color,
    this.size = 8,
  });

  /// Dot color
  final Color? color;

  /// Dot size
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color ?? colors.primary,
        shape: BoxShape.circle,
      ),
    );
  }
}

