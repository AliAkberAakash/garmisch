import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Bottom sheet component for the Garmisch design system.
///
/// ```dart
/// GBottomSheet.show(
///   context,
///   title: 'Select Option',
///   child: YourContent(),
/// );
/// ```
class GBottomSheet extends StatelessWidget {
  const GBottomSheet({
    super.key,
    this.title,
    this.subtitle,
    required this.child,
    this.showHandle = true,
    this.showCloseButton = false,
    this.padding,
    this.maxHeight,
  });

  /// Title text
  final String? title;

  /// Subtitle text
  final String? subtitle;

  /// Content widget
  final Widget child;

  /// Whether to show the drag handle
  final bool showHandle;

  /// Whether to show close button
  final bool showCloseButton;

  /// Content padding
  final EdgeInsets? padding;

  /// Maximum height
  final double? maxHeight;

  /// Show the bottom sheet
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? subtitle,
    required Widget child,
    bool showHandle = true,
    bool showCloseButton = false,
    EdgeInsets? padding,
    double? maxHeight,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) => GBottomSheet(
        title: title,
        subtitle: subtitle,
        showHandle: showHandle,
        showCloseButton: showCloseButton,
        padding: padding,
        maxHeight: maxHeight,
        child: child,
      ),
    );
  }

  /// Show an action sheet with options
  static Future<T?> showActions<T>(
    BuildContext context, {
    String? title,
    required List<GBottomSheetAction<T>> actions,
    bool showCancel = true,
    String cancelLabel = 'Cancel',
  }) {
    return show<T>(
      context,
      title: title,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...actions.map((action) => _ActionItem<T>(action: action)),
          if (showCancel) ...[
            const SizedBox(height: GSpacing.sm),
            _CancelButton(label: cancelLabel),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      constraints: maxHeight != null
          ? BoxConstraints(maxHeight: maxHeight!)
          : null,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(GBorderRadius.xl),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Handle
            if (showHandle)
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: GSpacing.sm),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: colors.outline.withValues(alpha: 0.4),
                    borderRadius: GBorderRadius.allFull,
                  ),
                ),
              ),

            // Header
            if (title != null || showCloseButton)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  GSpacing.lg,
                  GSpacing.md,
                  GSpacing.lg,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: textTheme.titleLarge.copyWith(
                                color: colors.onSurface,
                                fontWeight: GTypography.fontWeightSemiBold,
                              ),
                            ),
                          if (subtitle != null)
                            Text(
                              subtitle!,
                              style: textTheme.bodyMedium.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (showCloseButton)
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: colors.onSurfaceVariant,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                  ],
                ),
              ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: padding ?? const EdgeInsets.all(GSpacing.lg),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Action item for action sheets
class GBottomSheetAction<T> {
  const GBottomSheetAction({
    required this.label,
    this.icon,
    this.value,
    this.isDestructive = false,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final T? value;
  final bool isDestructive;
  final VoidCallback? onTap;
}

class _ActionItem<T> extends StatefulWidget {
  const _ActionItem({required this.action});

  final GBottomSheetAction<T> action;

  @override
  State<_ActionItem<T>> createState() => _ActionItemState<T>();
}

class _ActionItemState<T> extends State<_ActionItem<T>> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final color = widget.action.isDestructive
        ? colors.error
        : colors.onSurface;

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        widget.action.onTap?.call();
        Navigator.of(context).pop(widget.action.value);
      },
      child: AnimatedContainer(
        duration: GDurations.fast,
        padding: const EdgeInsets.symmetric(
          horizontal: GSpacing.md,
          vertical: GSpacing.md,
        ),
        color: _isPressed
            ? colors.onSurface.withValues(alpha: 0.05)
            : Colors.transparent,
        child: Row(
          children: [
            if (widget.action.icon != null) ...[
              Icon(
                widget.action.icon,
                color: color,
                size: 22,
              ),
              const SizedBox(width: GSpacing.md),
            ],
            Expanded(
              child: Text(
                widget.action.label,
                style: textTheme.bodyLarge.copyWith(
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GSpacing.md,
          vertical: GSpacing.md,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: colors.outline.withValues(alpha: 0.2),
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: textTheme.bodyLarge.copyWith(
              color: colors.primary,
              fontWeight: GTypography.fontWeightMedium,
            ),
          ),
        ),
      ),
    );
  }
}

