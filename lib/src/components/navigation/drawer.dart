import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// A customizable drawer component for the Garmisch design system.
///
/// ```dart
/// GDrawer(
///   header: GDrawerHeader(title: 'Menu'),
///   items: [
///     GDrawerItem(icon: Icons.home, label: 'Home', onTap: () {}),
///     GDrawerItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
///   ],
/// )
/// ```
class GDrawer extends StatelessWidget {
  const GDrawer({
    super.key,
    this.header,
    required this.items,
    this.footer,
    this.width = 280,
    this.backgroundColor,
    this.selectedIndex,
    this.onItemTap,
  });

  /// Drawer header widget
  final Widget? header;

  /// Drawer items
  final List<GDrawerItem> items;

  /// Footer widget
  final Widget? footer;

  /// Drawer width
  final double width;

  /// Background color
  final Color? backgroundColor;

  /// Currently selected item index
  final int? selectedIndex;

  /// Called when an item is tapped
  final ValueChanged<int>? onItemTap;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Drawer(
      width: width,
      backgroundColor: backgroundColor ?? colors.surface,
      child: SafeArea(
        child: Column(
          children: [
            if (header != null) header!,
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.sm,
                  vertical: GSpacing.sm,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final isSelected = index == selectedIndex;

                  if (item.isDivider) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: GSpacing.xs),
                      child: Divider(height: 1),
                    );
                  }

                  return _DrawerItemTile(
                    item: item,
                    isSelected: isSelected,
                    onTap: () {
                      item.onTap?.call();
                      onItemTap?.call(index);
                    },
                  );
                },
              ),
            ),
            if (footer != null) footer!,
          ],
        ),
      ),
    );
  }
}

/// Drawer item data
class GDrawerItem {
  const GDrawerItem({
    this.icon,
    this.label,
    this.trailing,
    this.onTap,
    this.isDivider = false,
  });

  /// Creates a divider item
  const GDrawerItem.divider()
      : icon = null,
        label = null,
        trailing = null,
        onTap = null,
        isDivider = true;

  final IconData? icon;
  final String? label;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool isDivider;
}

class _DrawerItemTile extends StatefulWidget {
  const _DrawerItemTile({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  final GDrawerItem item;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_DrawerItemTile> createState() => _DrawerItemTileState();
}

class _DrawerItemTileState extends State<_DrawerItemTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: GDurations.fast,
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.md,
            vertical: GSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? colors.primary.withValues(alpha: 0.12)
                : _isHovered
                    ? colors.onSurface.withValues(alpha: 0.04)
                    : Colors.transparent,
            borderRadius: GBorderRadius.allMd,
          ),
          child: Row(
            children: [
              if (widget.item.icon != null) ...[
                Icon(
                  widget.item.icon,
                  size: 22,
                  color: widget.isSelected
                      ? colors.primary
                      : colors.onSurfaceVariant,
                ),
                const SizedBox(width: GSpacing.md),
              ],
              Expanded(
                child: Text(
                  widget.item.label ?? '',
                  style: textTheme.bodyMedium.copyWith(
                    color: widget.isSelected
                        ? colors.primary
                        : colors.onSurface,
                    fontWeight: widget.isSelected
                        ? GTypography.fontWeightMedium
                        : GTypography.fontWeightRegular,
                  ),
                ),
              ),
              if (widget.item.trailing != null) widget.item.trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

/// Drawer header widget
class GDrawerHeader extends StatelessWidget {
  const GDrawerHeader({
    super.key,
    this.title,
    this.subtitle,
    this.avatar,
    this.decoration,
    this.padding,
  });

  final String? title;
  final String? subtitle;
  final Widget? avatar;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(GSpacing.lg),
      decoration: decoration ??
          BoxDecoration(
            color: colors.primaryContainer,
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (avatar != null) ...[
            avatar!,
            const SizedBox(height: GSpacing.md),
          ],
          if (title != null)
            Text(
              title!,
              style: textTheme.titleMedium.copyWith(
                color: colors.onPrimaryContainer,
                fontWeight: GTypography.fontWeightSemiBold,
              ),
            ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: textTheme.bodySmall.copyWith(
                color: colors.onPrimaryContainer.withValues(alpha: 0.8),
              ),
            ),
        ],
      ),
    );
  }
}

