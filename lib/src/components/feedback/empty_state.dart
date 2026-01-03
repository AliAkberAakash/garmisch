import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// An empty state placeholder component.
///
/// ```dart
/// GEmptyState(
///   icon: Icons.inbox_outlined,
///   title: 'No messages',
///   description: 'You have no messages yet.',
///   action: GButton(label: 'Compose', onPressed: () {}),
/// )
/// ```
class GEmptyState extends StatelessWidget {
  const GEmptyState({
    super.key,
    this.icon,
    this.iconSize = 64,
    this.image,
    required this.title,
    this.description,
    this.action,
    this.compact = false,
  });

  /// Icon to display
  final IconData? icon;

  /// Icon size
  final double iconSize;

  /// Custom image/illustration widget
  final Widget? image;

  /// Title text
  final String title;

  /// Description text
  final String? description;

  /// Action button
  final Widget? action;

  /// Use compact layout
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(compact ? GSpacing.md : GSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon or Image
            if (image != null)
              image!
            else if (icon != null)
              Container(
                padding: EdgeInsets.all(compact ? GSpacing.md : GSpacing.lg),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: compact ? 40 : iconSize,
                  color: colors.onSurfaceVariant,
                ),
              ),

            SizedBox(height: compact ? GSpacing.md : GSpacing.lg),

            // Title
            Text(
              title,
              style: (compact ? textTheme.titleMedium : textTheme.titleLarge)
                  .copyWith(color: colors.onSurface),
              textAlign: TextAlign.center,
            ),

            // Description
            if (description != null) ...[
              SizedBox(height: compact ? GSpacing.xs : GSpacing.sm),
              Text(
                description!,
                style: (compact ? textTheme.bodySmall : textTheme.bodyMedium)
                    .copyWith(color: colors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ],

            // Action
            if (action != null) ...[
              SizedBox(height: compact ? GSpacing.md : GSpacing.lg),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

/// A snackbar component.
///
/// ```dart
/// GSnackbar.show(context, message: 'Action completed');
/// GSnackbar.showError(context, message: 'Something went wrong');
/// ```
class GSnackbar {
  GSnackbar._();

  /// Show a snackbar
  static void show(
    BuildContext context, {
    required String message,
    GSnackbarType type = GSnackbarType.neutral,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 4),
    bool isDismissible = true,
  }) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final snackBarColors = _getColors(type, colors);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (snackBarColors.icon != null) ...[
              Icon(
                snackBarColors.icon,
                color: snackBarColors.foreground,
                size: 20,
              ),
              const SizedBox(width: GSpacing.sm),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: snackBarColors.foreground),
              ),
            ),
          ],
        ),
        backgroundColor: snackBarColors.background,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: GBorderRadius.allMd),
        action: actionLabel != null
            ? SnackBarAction(
                label: actionLabel,
                textColor: snackBarColors.action,
                onPressed: onAction ?? () {},
              )
            : null,
        dismissDirection:
            isDismissible ? DismissDirection.horizontal : DismissDirection.none,
      ),
    );
  }

  /// Show success snackbar
  static void success(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    show(
      context,
      message: message,
      type: GSnackbarType.success,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Show error snackbar
  static void error(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    show(
      context,
      message: message,
      type: GSnackbarType.error,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Show warning snackbar
  static void warning(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    show(
      context,
      message: message,
      type: GSnackbarType.warning,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  /// Show info snackbar
  static void info(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    show(
      context,
      message: message,
      type: GSnackbarType.info,
      actionLabel: actionLabel,
      onAction: onAction,
    );
  }

  static _SnackbarColors _getColors(GSnackbarType type, GColorScheme colors) {
    switch (type) {
      case GSnackbarType.neutral:
        return _SnackbarColors(
          background: colors.inverseSurface,
          foreground: colors.onInverseSurface,
          action: colors.inversePrimary,
          icon: null,
        );
      case GSnackbarType.success:
        return _SnackbarColors(
          background: colors.success,
          foreground: colors.onSuccess,
          action: colors.onSuccess,
          icon: Icons.check_circle_outline,
        );
      case GSnackbarType.error:
        return _SnackbarColors(
          background: colors.error,
          foreground: colors.onError,
          action: colors.onError,
          icon: Icons.error_outline,
        );
      case GSnackbarType.warning:
        return _SnackbarColors(
          background: colors.warning,
          foreground: colors.onWarning,
          action: colors.onWarning,
          icon: Icons.warning_amber_outlined,
        );
      case GSnackbarType.info:
        return _SnackbarColors(
          background: colors.info,
          foreground: colors.onInfo,
          action: colors.onInfo,
          icon: Icons.info_outline,
        );
    }
  }
}

/// Snackbar type options
enum GSnackbarType {
  neutral,
  success,
  error,
  warning,
  info,
}

class _SnackbarColors {
  const _SnackbarColors({
    required this.background,
    required this.foreground,
    required this.action,
    this.icon,
  });

  final Color background;
  final Color foreground;
  final Color action;
  final IconData? icon;
}

/// A banner component for persistent notifications.
///
/// ```dart
/// GBanner(
///   message: 'Your subscription expires soon.',
///   variant: GBannerVariant.warning,
///   action: GButton(label: 'Renew', onPressed: () {}),
/// )
/// ```
class GBanner extends StatelessWidget {
  const GBanner({
    super.key,
    required this.message,
    this.variant = GBannerVariant.info,
    this.icon,
    this.action,
    this.isDismissible = false,
    this.onDismiss,
  });

  /// Banner message
  final String message;

  /// Banner variant
  final GBannerVariant variant;

  /// Custom leading icon
  final IconData? icon;

  /// Action widget
  final Widget? action;

  /// Whether banner can be dismissed
  final bool isDismissible;

  /// Called when dismissed
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final bannerColors = _getColors(colors);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: bannerColors.background,
        border: Border(
          bottom: BorderSide(
            color: bannerColors.border,
            width: GBorderWidth.thin,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Icon(
              icon ?? bannerColors.icon,
              color: bannerColors.foreground,
              size: 20,
            ),
            const SizedBox(width: GSpacing.sm),
            Expanded(
              child: Text(
                message,
                style: textTheme.bodyMedium.copyWith(
                  color: bannerColors.foreground,
                ),
              ),
            ),
            if (action != null) ...[
              const SizedBox(width: GSpacing.sm),
              action!,
            ],
            if (isDismissible) ...[
              const SizedBox(width: GSpacing.xs),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: bannerColors.foreground,
                  size: 18,
                ),
                onPressed: onDismiss,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  _BannerColors _getColors(GColorScheme colors) {
    switch (variant) {
      case GBannerVariant.info:
        return _BannerColors(
          background: colors.infoContainer,
          foreground: colors.onInfoContainer,
          border: colors.info.withValues(alpha: 0.3),
          icon: Icons.info_outline,
        );
      case GBannerVariant.success:
        return _BannerColors(
          background: colors.successContainer,
          foreground: colors.onSuccessContainer,
          border: colors.success.withValues(alpha: 0.3),
          icon: Icons.check_circle_outline,
        );
      case GBannerVariant.warning:
        return _BannerColors(
          background: colors.warningContainer,
          foreground: colors.onWarningContainer,
          border: colors.warning.withValues(alpha: 0.3),
          icon: Icons.warning_amber_outlined,
        );
      case GBannerVariant.error:
        return _BannerColors(
          background: colors.errorContainer,
          foreground: colors.onErrorContainer,
          border: colors.error.withValues(alpha: 0.3),
          icon: Icons.error_outline,
        );
    }
  }
}

/// Banner variant options
enum GBannerVariant {
  info,
  success,
  warning,
  error,
}

class _BannerColors {
  const _BannerColors({
    required this.background,
    required this.foreground,
    required this.border,
    required this.icon,
  });

  final Color background;
  final Color foreground;
  final Color border;
  final IconData icon;
}

