import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Toast position options
enum GToastPosition {
  /// Top of screen
  top,

  /// Bottom of screen
  bottom,
}

/// Toast type/severity options
enum GToastType {
  /// Informational
  info,

  /// Success/positive
  success,

  /// Warning/caution
  warning,

  /// Error/danger
  error,

  /// Neutral
  neutral,
}

/// Toast data class
class GToastData {
  const GToastData({
    required this.message,
    this.title,
    this.type = GToastType.neutral,
    this.icon,
    this.duration = const Duration(seconds: 4),
    this.action,
    this.actionLabel,
    this.onAction,
    this.onDismiss,
  });

  final String message;
  final String? title;
  final GToastType type;
  final IconData? icon;
  final Duration duration;
  final Widget? action;
  final String? actionLabel;
  final VoidCallback? onAction;
  final VoidCallback? onDismiss;
}

/// Toast widget
class GToast extends StatelessWidget {
  const GToast({
    super.key,
    required this.data,
    this.onClose,
  });

  final GToastData data;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final toastColors = _getToastColors(colors);
    final icon = data.icon ?? _getDefaultIcon();

    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.symmetric(
          horizontal: GSpacing.md,
          vertical: GSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: toastColors.background,
          borderRadius: GBorderRadius.allLg,
          boxShadow: GShadows.lg,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Icon(
              icon,
              size: GSizing.iconMd,
              color: toastColors.iconColor,
            ),
            const SizedBox(width: GSpacing.sm),

            // Content
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.title != null) ...[
                    Text(
                      data.title!,
                      style: textTheme.titleSmall.copyWith(
                        color: toastColors.textColor,
                        fontWeight: GTypography.fontWeightSemiBold,
                      ),
                    ),
                    const SizedBox(height: GSpacing.xs3),
                  ],
                  Text(
                    data.message,
                    style: textTheme.bodyMedium.copyWith(
                      color: data.title != null
                          ? toastColors.textColor.withValues(alpha: 0.8)
                          : toastColors.textColor,
                    ),
                  ),
                ],
              ),
            ),

            // Action
            if (data.action != null || data.actionLabel != null) ...[
              const SizedBox(width: GSpacing.sm),
              if (data.action != null)
                data.action!
              else
                GestureDetector(
                  onTap: () {
                    data.onAction?.call();
                    onClose?.call();
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GSpacing.sm,
                        vertical: GSpacing.xs,
                      ),
                      decoration: BoxDecoration(
                        color: toastColors.iconColor.withValues(alpha: 0.15),
                        borderRadius: GBorderRadius.allSm,
                      ),
                      child: Text(
                        data.actionLabel!,
                        style: textTheme.labelMedium.copyWith(
                          color: toastColors.iconColor,
                          fontWeight: GTypography.fontWeightSemiBold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],

            // Close button
            const SizedBox(width: GSpacing.xs),
            GestureDetector(
              onTap: () {
                data.onDismiss?.call();
                onClose?.call();
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(
                  Icons.close,
                  size: GSizing.iconSm,
                  color: toastColors.textColor.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getDefaultIcon() {
    switch (data.type) {
      case GToastType.info:
        return Icons.info_outline;
      case GToastType.success:
        return Icons.check_circle_outline;
      case GToastType.warning:
        return Icons.warning_amber_outlined;
      case GToastType.error:
        return Icons.error_outline;
      case GToastType.neutral:
        return Icons.notifications_outlined;
    }
  }

  _ToastColors _getToastColors(GColorScheme colors) {
    switch (data.type) {
      case GToastType.info:
        return _ToastColors(
          background: colors.surface,
          textColor: colors.onSurface,
          iconColor: colors.info,
        );
      case GToastType.success:
        return _ToastColors(
          background: colors.surface,
          textColor: colors.onSurface,
          iconColor: colors.success,
        );
      case GToastType.warning:
        return _ToastColors(
          background: colors.surface,
          textColor: colors.onSurface,
          iconColor: colors.warning,
        );
      case GToastType.error:
        return _ToastColors(
          background: colors.surface,
          textColor: colors.onSurface,
          iconColor: colors.error,
        );
      case GToastType.neutral:
        return _ToastColors(
          background: colors.inverseSurface,
          textColor: colors.onInverseSurface,
          iconColor: colors.onInverseSurface,
        );
    }
  }
}

class _ToastColors {
  const _ToastColors({
    required this.background,
    required this.textColor,
    required this.iconColor,
  });

  final Color background;
  final Color textColor;
  final Color iconColor;
}

/// Toast controller for showing toasts
class GToastController {
  static final List<OverlayEntry> _entries = [];

  /// Show a toast
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    GToastType type = GToastType.neutral,
    IconData? icon,
    Duration duration = const Duration(seconds: 4),
    GToastPosition position = GToastPosition.bottom,
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;

    void removeEntry() {
      entry.remove();
      _entries.remove(entry);
    }

    entry = OverlayEntry(
      builder: (context) => _ToastOverlay(
        data: GToastData(
          message: message,
          title: title,
          type: type,
          icon: icon,
          duration: duration,
          actionLabel: actionLabel,
          onAction: onAction,
        ),
        position: position,
        onDismiss: removeEntry,
      ),
    );

    _entries.add(entry);
    overlay.insert(entry);
  }

  /// Show info toast
  static void info(BuildContext context, String message, {String? title}) {
    show(context, message: message, title: title, type: GToastType.info);
  }

  /// Show success toast
  static void success(BuildContext context, String message, {String? title}) {
    show(context, message: message, title: title, type: GToastType.success);
  }

  /// Show warning toast
  static void warning(BuildContext context, String message, {String? title}) {
    show(context, message: message, title: title, type: GToastType.warning);
  }

  /// Show error toast
  static void error(BuildContext context, String message, {String? title}) {
    show(context, message: message, title: title, type: GToastType.error);
  }

  /// Dismiss all toasts
  static void dismissAll() {
    for (final entry in _entries) {
      entry.remove();
    }
    _entries.clear();
  }
}

class _ToastOverlay extends StatefulWidget {
  const _ToastOverlay({
    required this.data,
    required this.position,
    required this.onDismiss,
  });

  final GToastData data;
  final GToastPosition position;
  final VoidCallback onDismiss;

  @override
  State<_ToastOverlay> createState() => _ToastOverlayState();
}

class _ToastOverlayState extends State<_ToastOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: GDurations.normal,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: GEasing.easeOut),
    );

    final beginOffset = widget.position == GToastPosition.top
        ? const Offset(0, -1)
        : const Offset(0, 1);

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: GEasing.easeOutCubic));

    _controller.forward();

    // Auto dismiss
    Future.delayed(widget.data.duration, _dismiss);
  }

  void _dismiss() {
    if (!mounted) return;
    _controller.reverse().then((_) {
      if (mounted) {
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: widget.position == GToastPosition.top ? GSpacing.xl2 : null,
      bottom: widget.position == GToastPosition.bottom ? GSpacing.xl2 : null,
      child: SafeArea(
        child: Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: GSpacing.md),
                child: GToast(
                  data: widget.data,
                  onClose: _dismiss,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

