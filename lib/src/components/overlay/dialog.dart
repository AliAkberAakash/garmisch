import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/sizing.dart';
import '../../foundations/border_radius.dart';
import '../../foundations/shadows.dart';
import '../../theme/theme.dart';
import '../inputs/button.dart';

/// Dialog size options
enum GDialogSize {
  /// Small dialog (320px max width)
  sm,

  /// Medium dialog (480px max width) - Default
  md,

  /// Large dialog (640px max width)
  lg,

  /// Full width dialog
  full,
}

/// A customizable dialog component for the Garmisch design system.
///
/// ```dart
/// GDialog.show(
///   context,
///   title: 'Confirm',
///   message: 'Are you sure?',
///   confirmLabel: 'Yes',
///   cancelLabel: 'No',
/// );
/// ```
class GDialog extends StatelessWidget {
  const GDialog({
    super.key,
    this.title,
    this.message,
    this.content,
    this.icon,
    this.iconColor,
    this.size = GDialogSize.md,
    this.confirmLabel,
    this.cancelLabel,
    this.onConfirm,
    this.onCancel,
    this.confirmVariant = GButtonVariant.primary,
    this.isDismissible = true,
    this.showCloseButton = false,
    this.actions,
  });

  /// Dialog title
  final String? title;

  /// Dialog message
  final String? message;

  /// Custom content widget
  final Widget? content;

  /// Icon displayed above title
  final IconData? icon;

  /// Icon color
  final Color? iconColor;

  /// Dialog size
  final GDialogSize size;

  /// Confirm button label
  final String? confirmLabel;

  /// Cancel button label
  final String? cancelLabel;

  /// Called when confirm is pressed
  final VoidCallback? onConfirm;

  /// Called when cancel is pressed
  final VoidCallback? onCancel;

  /// Confirm button variant
  final GButtonVariant confirmVariant;

  /// Whether dialog can be dismissed by tapping outside
  final bool isDismissible;

  /// Whether to show close button
  final bool showCloseButton;

  /// Custom action widgets
  final List<Widget>? actions;

  /// Show the dialog
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    String? message,
    Widget? content,
    IconData? icon,
    Color? iconColor,
    GDialogSize size = GDialogSize.md,
    String? confirmLabel,
    String? cancelLabel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    GButtonVariant confirmVariant = GButtonVariant.primary,
    bool isDismissible = true,
    bool showCloseButton = false,
    List<Widget>? actions,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (context) => GDialog(
        title: title,
        message: message,
        content: content,
        icon: icon,
        iconColor: iconColor,
        size: size,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        onConfirm: onConfirm,
        onCancel: onCancel,
        confirmVariant: confirmVariant,
        isDismissible: isDismissible,
        showCloseButton: showCloseButton,
        actions: actions,
      ),
    );
  }

  /// Show a confirmation dialog
  static Future<bool> confirm(
    BuildContext context, {
    String? title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    GButtonVariant confirmVariant = GButtonVariant.primary,
  }) async {
    final result = await show<bool>(
      context,
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      confirmVariant: confirmVariant,
      onConfirm: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
    );
    return result ?? false;
  }

  /// Show a destructive confirmation dialog
  static Future<bool> confirmDestructive(
    BuildContext context, {
    String title = 'Are you sure?',
    required String message,
    String confirmLabel = 'Delete',
    String cancelLabel = 'Cancel',
  }) async {
    final result = await show<bool>(
      context,
      title: title,
      message: message,
      icon: Icons.warning_amber_outlined,
      confirmLabel: confirmLabel,
      cancelLabel: cancelLabel,
      confirmVariant: GButtonVariant.destructive,
      onConfirm: () => Navigator.of(context).pop(true),
      onCancel: () => Navigator.of(context).pop(false),
    );
    return result ?? false;
  }

  /// Show an alert dialog (single action)
  static Future<void> alert(
    BuildContext context, {
    String? title,
    required String message,
    String buttonLabel = 'OK',
    IconData? icon,
  }) {
    return show(
      context,
      title: title,
      message: message,
      icon: icon,
      confirmLabel: buttonLabel,
      onConfirm: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final maxWidth = _getMaxWidth();

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(GSpacing.lg),
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: GBorderRadius.allXl,
          boxShadow: GShadows.xl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            if (title != null || showCloseButton || icon != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  GSpacing.lg,
                  GSpacing.lg,
                  GSpacing.lg,
                  0,
                ),
                child: Column(
                  children: [
                    if (icon != null) ...[
                      Container(
                        padding: const EdgeInsets.all(GSpacing.md),
                        decoration: BoxDecoration(
                          color: (iconColor ?? colors.primary).withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          size: GSizing.iconXl,
                          color: iconColor ?? colors.primary,
                        ),
                      ),
                      const SizedBox(height: GSpacing.md),
                    ],
                    Row(
                      children: [
                        if (title != null)
                          Expanded(
                            child: Text(
                              title!,
                              style: textTheme.titleLarge.copyWith(
                                color: colors.onSurface,
                                fontWeight: theme.typography.fontWeightSemiBold,
                              ),
                              textAlign: icon != null ? TextAlign.center : TextAlign.start,
                            ),
                          ),
                        if (showCloseButton)
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Icon(
                                Icons.close,
                                size: GSizing.iconMd,
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

            // Content
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  GSpacing.lg,
                  title != null ? GSpacing.sm : GSpacing.lg,
                  GSpacing.lg,
                  GSpacing.lg,
                ),
                child: content ??
                    (message != null
                        ? Text(
                            message!,
                            style: textTheme.bodyMedium.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                            textAlign: icon != null ? TextAlign.center : TextAlign.start,
                          )
                        : null),
              ),
            ),

            // Actions
            if (actions != null || confirmLabel != null || cancelLabel != null)
              Container(
                padding: const EdgeInsets.fromLTRB(
                  GSpacing.lg,
                  0,
                  GSpacing.lg,
                  GSpacing.lg,
                ),
                child: actions != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actions!,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (cancelLabel != null) ...[
                            GButton(
                              label: cancelLabel,
                              variant: GButtonVariant.ghost,
                              onPressed: () {
                                onCancel?.call();
                                if (onCancel == null) {
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                            const SizedBox(width: GSpacing.sm),
                          ],
                          if (confirmLabel != null)
                            GButton(
                              label: confirmLabel,
                              variant: confirmVariant,
                              onPressed: () {
                                onConfirm?.call();
                                if (onConfirm == null) {
                                  Navigator.of(context).pop(true);
                                }
                              },
                            ),
                        ],
                      ),
              ),
          ],
        ),
      ),
    );
  }

  double _getMaxWidth() {
    switch (size) {
      case GDialogSize.sm:
        return 320;
      case GDialogSize.md:
        return 480;
      case GDialogSize.lg:
        return 640;
      case GDialogSize.full:
        return double.infinity;
    }
  }
}

