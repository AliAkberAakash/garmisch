import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Alert variant options
enum GAlertVariant {
  /// Solid background
  solid,

  /// Soft/muted background
  soft,

  /// Border only
  outlined,
}

/// Alert type/severity options
enum GAlertType {
  /// Informational
  info,

  /// Success/positive
  success,

  /// Warning/caution
  warning,

  /// Error/danger
  error,
}

/// A customizable alert component for the Garmisch design system.
///
/// ```dart
/// GAlert(
///   title: 'Success',
///   message: 'Your changes have been saved.',
///   type: GAlertType.success,
/// )
/// ```
class GAlert extends StatelessWidget {
  const GAlert({
    super.key,
    this.title,
    this.message,
    this.type = GAlertType.info,
    this.variant = GAlertVariant.soft,
    this.icon,
    this.showIcon = true,
    this.onDismiss,
    this.action,
    this.actionLabel,
    this.onAction,
  });

  /// Alert title
  final String? title;

  /// Alert message
  final String? message;

  /// Type/severity of alert
  final GAlertType type;

  /// Visual variant
  final GAlertVariant variant;

  /// Custom icon (overrides default type icon)
  final IconData? icon;

  /// Whether to show the type icon
  final bool showIcon;

  /// Called when dismiss button is pressed
  final VoidCallback? onDismiss;

  /// Custom action widget
  final Widget? action;

  /// Action button label
  final String? actionLabel;

  /// Called when action button is pressed
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final alertColors = _getAlertColors(colors);
    final alertIcon = icon ?? _getDefaultIcon();

    return Container(
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: _getBackgroundColor(alertColors),
        borderRadius: GBorderRadius.allLg,
        border: variant == GAlertVariant.outlined
            ? Border.all(
                color: alertColors.borderColor,
                width: GBorderWidth.thin,
              )
            : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          if (showIcon) ...[
            Icon(
              alertIcon,
              size: GSizing.iconMd,
              color: alertColors.iconColor,
            ),
            const SizedBox(width: GSpacing.sm),
          ],

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: textTheme.titleSmall.copyWith(
                      color: alertColors.titleColor,
                      fontWeight: GTypography.fontWeightSemiBold,
                    ),
                  ),
                if (title != null && message != null)
                  const SizedBox(height: GSpacing.xs3),
                if (message != null)
                  Text(
                    message!,
                    style: textTheme.bodyMedium.copyWith(
                      color: alertColors.messageColor,
                    ),
                  ),
                if (action != null || actionLabel != null) ...[
                  const SizedBox(height: GSpacing.sm),
                  if (action != null)
                    action!
                  else if (actionLabel != null)
                    GestureDetector(
                      onTap: onAction,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                          actionLabel!,
                          style: textTheme.labelMedium.copyWith(
                            color: alertColors.iconColor,
                            fontWeight: GTypography.fontWeightSemiBold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                ],
              ],
            ),
          ),

          // Dismiss button
          if (onDismiss != null) ...[
            const SizedBox(width: GSpacing.sm),
            GestureDetector(
              onTap: onDismiss,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.close,
                  size: GSizing.iconSm,
                  color: alertColors.iconColor.withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getDefaultIcon() {
    switch (type) {
      case GAlertType.info:
        return Icons.info_outline;
      case GAlertType.success:
        return Icons.check_circle_outline;
      case GAlertType.warning:
        return Icons.warning_amber_outlined;
      case GAlertType.error:
        return Icons.error_outline;
    }
  }

  Color _getBackgroundColor(_AlertColors alertColors) {
    switch (variant) {
      case GAlertVariant.solid:
        return alertColors.solidBackground;
      case GAlertVariant.soft:
        return alertColors.softBackground;
      case GAlertVariant.outlined:
        return Colors.transparent;
    }
  }

  _AlertColors _getAlertColors(GColorScheme colors) {
    switch (type) {
      case GAlertType.info:
        return _AlertColors(
          solidBackground: colors.info,
          softBackground: colors.info.withValues(alpha: 0.12),
          borderColor: colors.info,
          iconColor: variant == GAlertVariant.solid ? colors.onInfo : colors.info,
          titleColor: variant == GAlertVariant.solid ? colors.onInfo : colors.info,
          messageColor: variant == GAlertVariant.solid
              ? colors.onInfo.withValues(alpha: 0.9)
              : colors.onSurface,
        );
      case GAlertType.success:
        return _AlertColors(
          solidBackground: colors.success,
          softBackground: colors.success.withValues(alpha: 0.12),
          borderColor: colors.success,
          iconColor: variant == GAlertVariant.solid ? colors.onSuccess : colors.success,
          titleColor: variant == GAlertVariant.solid ? colors.onSuccess : colors.success,
          messageColor: variant == GAlertVariant.solid
              ? colors.onSuccess.withValues(alpha: 0.9)
              : colors.onSurface,
        );
      case GAlertType.warning:
        return _AlertColors(
          solidBackground: colors.warning,
          softBackground: colors.warning.withValues(alpha: 0.12),
          borderColor: colors.warning,
          iconColor: variant == GAlertVariant.solid ? colors.onWarning : colors.warning,
          titleColor: variant == GAlertVariant.solid ? colors.onWarning : colors.warning,
          messageColor: variant == GAlertVariant.solid
              ? colors.onWarning.withValues(alpha: 0.9)
              : colors.onSurface,
        );
      case GAlertType.error:
        return _AlertColors(
          solidBackground: colors.error,
          softBackground: colors.error.withValues(alpha: 0.12),
          borderColor: colors.error,
          iconColor: variant == GAlertVariant.solid ? colors.onError : colors.error,
          titleColor: variant == GAlertVariant.solid ? colors.onError : colors.error,
          messageColor: variant == GAlertVariant.solid
              ? colors.onError.withValues(alpha: 0.9)
              : colors.onSurface,
        );
    }
  }
}

class _AlertColors {
  const _AlertColors({
    required this.solidBackground,
    required this.softBackground,
    required this.borderColor,
    required this.iconColor,
    required this.titleColor,
    required this.messageColor,
  });

  final Color solidBackground;
  final Color softBackground;
  final Color borderColor;
  final Color iconColor;
  final Color titleColor;
  final Color messageColor;
}

