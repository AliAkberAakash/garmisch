import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/durations.dart';
import '../../foundations/opacity.dart';
import '../../theme/theme.dart';

/// List tile size options
enum GListTileSize {
  /// Small list tile
  sm,

  /// Medium list tile - Default
  md,

  /// Large list tile
  lg,
}

/// A customizable list tile component.
///
/// ```dart
/// GListTile(
///   title: 'Title',
///   subtitle: 'Subtitle',
///   leading: Icon(Icons.star),
///   trailing: Icon(Icons.chevron_right),
///   onTap: () {},
/// )
/// ```
class GListTile extends StatefulWidget {
  const GListTile({
    super.key,
    this.title,
    this.titleWidget,
    this.subtitle,
    this.subtitleWidget,
    this.leading,
    this.trailing,
    this.onTap,
    this.onLongPress,
    this.size = GListTileSize.md,
    this.isSelected = false,
    this.isDisabled = false,
    this.showDivider = false,
    this.padding,
    this.backgroundColor,
  });

  /// Title text
  final String? title;

  /// Custom title widget
  final Widget? titleWidget;

  /// Subtitle text
  final String? subtitle;

  /// Custom subtitle widget
  final Widget? subtitleWidget;

  /// Leading widget
  final Widget? leading;

  /// Trailing widget
  final Widget? trailing;

  /// Called when tile is tapped
  final VoidCallback? onTap;

  /// Called when tile is long pressed
  final VoidCallback? onLongPress;

  /// Tile size
  final GListTileSize size;

  /// Whether the tile is selected
  final bool isSelected;

  /// Whether the tile is disabled
  final bool isDisabled;

  /// Whether to show bottom divider
  final bool showDivider;

  /// Custom padding
  final EdgeInsets? padding;

  /// Background color
  final Color? backgroundColor;

  @override
  State<GListTile> createState() => _GListTileState();
}

class _GListTileState extends State<GListTile> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isInteractive =>
      (widget.onTap != null || widget.onLongPress != null) &&
      !widget.isDisabled;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final dimensions = _getDimensions(theme);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          onEnter: _isInteractive
              ? (_) => setState(() => _isHovered = true)
              : null,
          onExit: _isInteractive
              ? (_) => setState(() => _isHovered = false)
              : null,
          cursor: _isInteractive
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          child: GestureDetector(
            onTapDown: _isInteractive
                ? (_) => setState(() => _isPressed = true)
                : null,
            onTapUp: _isInteractive
                ? (_) => setState(() => _isPressed = false)
                : null,
            onTapCancel: _isInteractive
                ? () => setState(() => _isPressed = false)
                : null,
            onTap: widget.isDisabled ? null : widget.onTap,
            onLongPress: widget.isDisabled ? null : widget.onLongPress,
            child: AnimatedContainer(
              duration: GDurations.fast,
              padding: widget.padding ?? dimensions.padding,
              decoration: BoxDecoration(color: _getBackgroundColor(colors)),
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    IconTheme(
                      data: IconThemeData(
                        color: widget.isDisabled
                            ? colors.onSurface.withValues(
                                alpha: GOpacity.disabled,
                              )
                            : colors.onSurfaceVariant,
                        size: dimensions.iconSize,
                      ),
                      child: widget.leading!,
                    ),
                    SizedBox(width: dimensions.spacing),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.titleWidget ??
                            Text(
                              widget.title ?? '',
                              style: dimensions.titleStyle.copyWith(
                                color: widget.isDisabled
                                    ? colors.onSurface.withValues(
                                        alpha: GOpacity.disabled,
                                      )
                                    : widget.isSelected
                                    ? colors.primary
                                    : colors.onSurface,
                              ),
                            ),
                        if (widget.subtitle != null ||
                            widget.subtitleWidget != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child:
                                widget.subtitleWidget ??
                                Text(
                                  widget.subtitle ?? '',
                                  style: dimensions.subtitleStyle.copyWith(
                                    color: widget.isDisabled
                                        ? colors.onSurfaceVariant.withValues(
                                            alpha: GOpacity.disabled,
                                          )
                                        : colors.onSurfaceVariant,
                                  ),
                                ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.trailing != null) ...[
                    SizedBox(width: dimensions.spacing),
                    IconTheme(
                      data: IconThemeData(
                        color: widget.isDisabled
                            ? colors.onSurface.withValues(
                                alpha: GOpacity.disabled,
                              )
                            : colors.onSurfaceVariant,
                        size: dimensions.iconSize,
                      ),
                      child: widget.trailing!,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (widget.showDivider)
          Divider(
            height: 1,
            thickness: 1,
            color: colors.outline.withValues(alpha: 0.2),
            indent: widget.leading != null ? 56 : 0,
          ),
      ],
    );
  }

  Color _getBackgroundColor(GColorScheme colors) {
    if (widget.backgroundColor != null) return widget.backgroundColor!;
    if (widget.isSelected) {
      return colors.primary.withValues(alpha: 0.08);
    }
    if (_isPressed && _isInteractive) {
      return colors.onSurface.withValues(alpha: 0.08);
    }
    if (_isHovered && _isInteractive) {
      return colors.onSurface.withValues(alpha: 0.04);
    }
    return Colors.transparent;
  }

  _ListTileDimensions _getDimensions(GThemeData theme) {
    switch (widget.size) {
      case GListTileSize.sm:
        return _ListTileDimensions(
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.md,
            vertical: GSpacing.xs,
          ),
          iconSize: 20,
          spacing: GSpacing.sm,
          titleStyle: TextStyle(
            fontSize: theme.typography.fontSizeSm,
            fontWeight: theme.typography.fontWeightMedium,
          ),
          subtitleStyle: TextStyle(fontSize: theme.typography.fontSizeXs),
        );
      case GListTileSize.md:
        return _ListTileDimensions(
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.md,
            vertical: GSpacing.sm,
          ),
          iconSize: 24,
          spacing: GSpacing.md,
          titleStyle: TextStyle(
            fontSize: theme.typography.fontSizeBase,
            fontWeight: theme.typography.fontWeightMedium,
          ),
          subtitleStyle: TextStyle(fontSize: theme.typography.fontSizeSm),
        );
      case GListTileSize.lg:
        return _ListTileDimensions(
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.lg,
            vertical: GSpacing.md,
          ),
          iconSize: 28,
          spacing: GSpacing.md,
          titleStyle: TextStyle(
            fontSize: theme.typography.fontSizeLg,
            fontWeight: theme.typography.fontWeightMedium,
          ),
          subtitleStyle: TextStyle(fontSize: theme.typography.fontSizeBase),
        );
    }
  }
}

class _ListTileDimensions {
  const _ListTileDimensions({
    required this.padding,
    required this.iconSize,
    required this.spacing,
    required this.titleStyle,
    required this.subtitleStyle,
  });

  final EdgeInsets padding;
  final double iconSize;
  final double spacing;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
}

/// A section header for list views.
class GListSection extends StatelessWidget {
  const GListSection({
    super.key,
    required this.title,
    this.trailing,
    this.padding,
  });

  final String title;
  final Widget? trailing;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      padding:
          padding ??
          const EdgeInsets.fromLTRB(
            GSpacing.md,
            GSpacing.lg,
            GSpacing.md,
            GSpacing.xs,
          ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title.toUpperCase(),
              style: textTheme.labelSmall.copyWith(
                color: colors.onSurfaceVariant,
                letterSpacing: 0.5,
              ),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
