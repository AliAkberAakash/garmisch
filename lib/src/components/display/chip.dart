import 'package:flutter/material.dart';

import '../../foundations/typography.dart';
import '../../theme/theme.dart';

/// Chip variant options
enum GChipVariant {
  /// Solid background
  solid,

  /// Soft/muted background
  soft,

  /// Border only
  outlined,
}

/// Chip size options
enum GChipSize {
  /// Small chip
  sm,

  /// Medium chip - Default
  md,

  /// Large chip
  lg,
}

/// A customizable chip component for the Garmisch design system.
///
/// ```dart
/// GChip(
///   label: 'Flutter',
///   onTap: () {},
///   onDelete: () {},
/// )
/// ```
class GChip extends StatefulWidget {
  const GChip({
    super.key,
    required this.label,
    this.variant = GChipVariant.soft,
    this.size = GChipSize.md,
    this.leadingIcon,
    this.avatar,
    this.selected = false,
    this.disabled = false,
    this.onTap,
    this.onDelete,
    this.color,
  });

  /// Chip label text
  final String label;

  /// Visual variant
  final GChipVariant variant;

  /// Chip size
  final GChipSize size;

  /// Leading icon
  final IconData? leadingIcon;

  /// Avatar widget (takes precedence over leadingIcon)
  final Widget? avatar;

  /// Whether the chip is selected
  final bool selected;

  /// Whether the chip is disabled
  final bool disabled;

  /// Called when chip is tapped
  final VoidCallback? onTap;

  /// Called when delete button is tapped
  final VoidCallback? onDelete;

  /// Custom color
  final Color? color;

  @override
  State<GChip> createState() => _GChipState();
}

class _GChipState extends State<GChip> {
  bool _isHovered = false;

  bool get _isInteractive => widget.onTap != null && !widget.disabled;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final opacity = theme.opacity;
    final borderWidth = theme.borderWidth;

    final dimensions = _getDimensions();
    final chipColors = _getChipColors(colors, opacity);

    return MouseRegion(
      onEnter: _isInteractive ? (_) => setState(() => _isHovered = true) : null,
      onExit: _isInteractive ? (_) => setState(() => _isHovered = false) : null,
      cursor: _isInteractive ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: _isInteractive ? widget.onTap : null,
        child: AnimatedContainer(
          duration: theme.durations.fast,
          curve: theme.easing.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: dimensions.horizontalPadding,
            vertical: dimensions.verticalPadding,
          ),
          decoration: BoxDecoration(
            color: _getBackgroundColor(chipColors),
            borderRadius: BorderRadius.circular(dimensions.borderRadius),
            border: widget.variant == GChipVariant.outlined ||
                    (widget.selected && widget.variant != GChipVariant.solid)
                ? Border.all(
                    color: widget.disabled
                        ? chipColors.borderColor.withValues(alpha: opacity.disabled)
                        : chipColors.borderColor,
                    width: borderWidth.thin,
                  )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar or leading icon
              if (widget.avatar != null) ...[
                SizedBox(
                  width: dimensions.avatarSize,
                  height: dimensions.avatarSize,
                  child: widget.avatar!,
                ),
                SizedBox(width: dimensions.iconSpacing),
              ] else if (widget.leadingIcon != null) ...[
                Icon(
                  widget.leadingIcon,
                  size: dimensions.iconSize,
                  color: widget.disabled
                      ? chipColors.foregroundColor.withValues(alpha: opacity.disabled)
                      : chipColors.foregroundColor,
                ),
                SizedBox(width: dimensions.iconSpacing),
              ],

              // Label
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: dimensions.fontSize,
                  fontWeight: GTypography.fontWeightMedium,
                  color: widget.disabled
                      ? chipColors.foregroundColor.withValues(alpha: opacity.disabled)
                      : chipColors.foregroundColor,
                ),
              ),

              // Delete button
              if (widget.onDelete != null) ...[
                SizedBox(width: dimensions.iconSpacing),
                GestureDetector(
                  onTap: widget.disabled ? null : widget.onDelete,
                  child: MouseRegion(
                    cursor: widget.disabled
                        ? SystemMouseCursors.basic
                        : SystemMouseCursors.click,
                    child: Icon(
                      Icons.close,
                      size: dimensions.iconSize,
                      color: widget.disabled
                          ? chipColors.foregroundColor.withValues(alpha: opacity.disabled)
                          : chipColors.foregroundColor.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(_ChipColors chipColors) {
    if (widget.disabled) {
      return chipColors.backgroundColor.withValues(alpha: chipColors.disabledOpacity);
    }
    if (widget.selected) {
      return chipColors.selectedBackground;
    }
    if (_isHovered) {
      return chipColors.hoverBackground;
    }
    return chipColors.backgroundColor;
  }

  _ChipColors _getChipColors(GColorScheme colors, GOpacityTokens opacity) {
    final baseColor = widget.color ?? colors.primary;

    switch (widget.variant) {
      case GChipVariant.solid:
        return _ChipColors(
          backgroundColor: widget.selected ? baseColor : colors.surfaceVariant,
          selectedBackground: baseColor,
          hoverBackground: widget.selected ? baseColor : colors.surfaceContainerHigh,
          foregroundColor: widget.selected ? colors.onPrimary : colors.onSurfaceVariant,
          borderColor: baseColor,
          disabledOpacity: opacity.disabled,
        );
      case GChipVariant.soft:
        return _ChipColors(
          backgroundColor: baseColor.withValues(alpha: 0.1),
          selectedBackground: baseColor.withValues(alpha: 0.2),
          hoverBackground: baseColor.withValues(alpha: 0.15),
          foregroundColor: baseColor,
          borderColor: baseColor,
          disabledOpacity: opacity.disabled,
        );
      case GChipVariant.outlined:
        return _ChipColors(
          backgroundColor: Colors.transparent,
          selectedBackground: baseColor.withValues(alpha: 0.1),
          hoverBackground: baseColor.withValues(alpha: 0.05),
          foregroundColor: widget.selected ? baseColor : colors.onSurfaceVariant,
          borderColor: widget.selected ? baseColor : colors.outline,
          disabledOpacity: opacity.disabled,
        );
    }
  }

  _ChipDimensions _getDimensions() {
    switch (widget.size) {
      case GChipSize.sm:
        return const _ChipDimensions(
          horizontalPadding: 8,
          verticalPadding: 4,
          fontSize: 12,
          iconSize: 14,
          avatarSize: 18,
          iconSpacing: 4,
          borderRadius: 12,
        );
      case GChipSize.md:
        return const _ChipDimensions(
          horizontalPadding: 12,
          verticalPadding: 6,
          fontSize: 13,
          iconSize: 16,
          avatarSize: 22,
          iconSpacing: 6,
          borderRadius: 14,
        );
      case GChipSize.lg:
        return const _ChipDimensions(
          horizontalPadding: 16,
          verticalPadding: 8,
          fontSize: 14,
          iconSize: 18,
          avatarSize: 26,
          iconSpacing: 8,
          borderRadius: 16,
        );
    }
  }
}

class _ChipColors {
  const _ChipColors({
    required this.backgroundColor,
    required this.selectedBackground,
    required this.hoverBackground,
    required this.foregroundColor,
    required this.borderColor,
    this.disabledOpacity = 0.5,
  });

  final Color backgroundColor;
  final Color selectedBackground;
  final Color hoverBackground;
  final Color foregroundColor;
  final Color borderColor;
  final double disabledOpacity;
}

class _ChipDimensions {
  const _ChipDimensions({
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.fontSize,
    required this.iconSize,
    required this.avatarSize,
    required this.iconSpacing,
    required this.borderRadius,
  });

  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double iconSize;
  final double avatarSize;
  final double iconSpacing;
  final double borderRadius;
}

/// A group of selectable chips
class GChipGroup extends StatelessWidget {
  const GChipGroup({
    super.key,
    required this.chips,
    required this.selectedValues,
    required this.onChanged,
    this.variant = GChipVariant.soft,
    this.size = GChipSize.md,
    this.allowMultiple = true,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
  });

  /// List of chip data
  final List<GChipData> chips;

  /// Currently selected values
  final Set<String> selectedValues;

  /// Called when selection changes
  final ValueChanged<Set<String>> onChanged;

  /// Chip variant
  final GChipVariant variant;

  /// Chip size
  final GChipSize size;

  /// Allow multiple selection
  final bool allowMultiple;

  /// Horizontal spacing between chips
  final double spacing;

  /// Vertical spacing between rows
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: chips.map((chip) {
        final isSelected = selectedValues.contains(chip.value);
        return GChip(
          label: chip.label,
          leadingIcon: chip.icon,
          variant: variant,
          size: size,
          selected: isSelected,
          onTap: () {
            final newSelection = Set<String>.from(selectedValues);
            if (isSelected) {
              newSelection.remove(chip.value);
            } else {
              if (!allowMultiple) {
                newSelection.clear();
              }
              newSelection.add(chip.value);
            }
            onChanged(newSelection);
          },
        );
      }).toList(),
    );
  }
}

/// Data class for chip information
class GChipData {
  const GChipData({
    required this.value,
    required this.label,
    this.icon,
  });

  final String value;
  final String label;
  final IconData? icon;
}

