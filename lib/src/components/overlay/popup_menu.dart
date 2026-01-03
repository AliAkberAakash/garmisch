import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Popup menu component for the Garmisch design system.
///
/// ```dart
/// GPopupMenu(
///   items: [
///     GPopupMenuItem(label: 'Edit', icon: Icons.edit),
///     GPopupMenuItem(label: 'Delete', icon: Icons.delete, isDestructive: true),
///   ],
///   child: Icon(Icons.more_vert),
/// )
/// ```
class GPopupMenu<T> extends StatelessWidget {
  const GPopupMenu({
    super.key,
    required this.items,
    required this.child,
    this.onSelected,
    this.offset = Offset.zero,
    this.tooltip,
  });

  /// Menu items
  final List<GPopupMenuItem<T>> items;

  /// Trigger widget
  final Widget child;

  /// Called when an item is selected
  final ValueChanged<T>? onSelected;

  /// Offset from trigger
  final Offset offset;

  /// Tooltip for the trigger
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return PopupMenuButton<T>(
      onSelected: onSelected,
      offset: offset,
      tooltip: tooltip,
      shape: RoundedRectangleBorder(
        borderRadius: GBorderRadius.allMd,
      ),
      color: colors.surface,
      elevation: 8,
      itemBuilder: (context) => items.map((item) {
        if (item.isDivider) {
          return PopupMenuDivider() as PopupMenuEntry<T>;
        }

        final color = item.isDestructive
            ? colors.error
            : item.isDisabled
                ? colors.onSurface.withValues(alpha: 0.38)
                : colors.onSurface;

        return PopupMenuItem<T>(
          value: item.value,
          enabled: !item.isDisabled,
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.md,
            vertical: GSpacing.xs,
          ),
          child: Row(
            children: [
              if (item.icon != null) ...[
                Icon(item.icon, size: 20, color: color),
                const SizedBox(width: GSpacing.sm),
              ],
              Expanded(
                child: Text(
                  item.label ?? '',
                  style: textTheme.bodyMedium.copyWith(color: color),
                ),
              ),
              if (item.trailing != null) ...[
                const SizedBox(width: GSpacing.sm),
                item.trailing!,
              ],
            ],
          ),
        );
      }).toList(),
      child: child,
    );
  }
}

/// Popup menu item data
class GPopupMenuItem<T> {
  const GPopupMenuItem({
    this.label,
    this.icon,
    this.value,
    this.trailing,
    this.isDestructive = false,
    this.isDisabled = false,
    this.isDivider = false,
  });

  /// Creates a divider item
  const GPopupMenuItem.divider()
      : label = null,
        icon = null,
        value = null,
        trailing = null,
        isDestructive = false,
        isDisabled = false,
        isDivider = true;

  final String? label;
  final IconData? icon;
  final T? value;
  final Widget? trailing;
  final bool isDestructive;
  final bool isDisabled;
  final bool isDivider;
}

/// A context menu that appears on right-click or long-press.
class GContextMenu<T> extends StatelessWidget {
  const GContextMenu({
    super.key,
    required this.items,
    required this.child,
    this.onSelected,
  });

  /// Menu items
  final List<GPopupMenuItem<T>> items;

  /// Child widget
  final Widget child;

  /// Called when an item is selected
  final ValueChanged<T>? onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onSecondaryTapDown: (details) {
        _showMenu(context, details.globalPosition, colors, textTheme);
      },
      onLongPressStart: (details) {
        _showMenu(context, details.globalPosition, colors, textTheme);
      },
      child: child,
    );
  }

  void _showMenu(
    BuildContext context,
    Offset position,
    GColorScheme colors,
    GTextTheme textTheme,
  ) async {
    final result = await showMenu<T>(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy,
        position.dx,
        position.dy,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: GBorderRadius.allMd,
      ),
      color: colors.surface,
      elevation: 8,
      items: items.map((item) {
        if (item.isDivider) {
          return PopupMenuDivider() as PopupMenuEntry<T>;
        }

        final color = item.isDestructive
            ? colors.error
            : item.isDisabled
                ? colors.onSurface.withValues(alpha: 0.38)
                : colors.onSurface;

        return PopupMenuItem<T>(
          value: item.value,
          enabled: !item.isDisabled,
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.md,
            vertical: GSpacing.xs,
          ),
          child: Row(
            children: [
              if (item.icon != null) ...[
                Icon(item.icon, size: 20, color: color),
                const SizedBox(width: GSpacing.sm),
              ],
              Expanded(
                child: Text(
                  item.label ?? '',
                  style: textTheme.bodyMedium.copyWith(color: color),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );

    if (result != null) {
      onSelected?.call(result);
    }
  }
}

