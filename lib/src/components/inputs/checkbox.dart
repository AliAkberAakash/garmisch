import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Checkbox size options
enum GCheckboxSize {
  /// Small checkbox (16px)
  sm,

  /// Medium checkbox (20px) - Default
  md,

  /// Large checkbox (24px)
  lg,
}

/// A customizable checkbox component for the Garmisch design system.
///
/// ```dart
/// GCheckbox(
///   value: isChecked,
///   onChanged: (value) => setState(() => isChecked = value),
///   label: 'Accept terms',
/// )
/// ```
class GCheckbox extends StatefulWidget {
  const GCheckbox({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.isIndeterminate = false,
    this.size = GCheckboxSize.md,
    this.activeColor,
    this.checkColor,
  });

  /// Whether the checkbox is checked
  final bool value;

  /// Called when the checkbox is tapped
  final ValueChanged<bool>? onChanged;

  /// Optional label text
  final String? label;

  /// Whether the checkbox is disabled
  final bool isDisabled;

  /// Whether to show indeterminate state
  final bool isIndeterminate;

  /// Size of the checkbox
  final GCheckboxSize size;

  /// Custom active/checked color
  final Color? activeColor;

  /// Custom check mark color
  final Color? checkColor;

  @override
  State<GCheckbox> createState() => _GCheckboxState();
}

class _GCheckboxState extends State<GCheckbox> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool get _isEnabled => !widget.isDisabled && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150), // Will be updated in didChangeDependencies
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = GTheme.of(context);
    _controller.duration = theme.durations.fast;
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: theme.easing.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_isEnabled) {
      _controller.forward().then((_) => _controller.reverse());
      widget.onChanged?.call(!widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final opacity = theme.opacity;
    final borderWidth = theme.borderWidth;

    final dimensions = _getDimensions(theme);
    final activeColor = widget.activeColor ?? colors.primary;
    final checkColor = widget.checkColor ?? colors.onPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: _handleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Checkbox
            ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedContainer(
                duration: theme.durations.fast,
                curve: theme.easing.easeOut,
                width: dimensions.size,
                height: dimensions.size,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(colors, activeColor, opacity),
                  borderRadius: BorderRadius.circular(dimensions.borderRadius),
                  border: Border.all(
                    color: _getBorderColor(colors, activeColor, opacity),
                    width: borderWidth.thin,
                  ),
                ),
                child: _buildCheckIcon(checkColor, dimensions, opacity),
              ),
            ),

            // Label
            if (widget.label != null) ...[
              SizedBox(width: dimensions.labelSpacing),
              Text(
                widget.label!,
                style: textTheme.bodyMedium.copyWith(
                  color: widget.isDisabled
                      ? colors.onSurface.withValues(alpha: opacity.disabled)
                      : colors.onSurface,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget? _buildCheckIcon(Color checkColor, _CheckboxDimensions dimensions, GOpacityTokens opacity) {
    if (widget.isIndeterminate) {
      return Center(
        child: Container(
          width: dimensions.size * 0.5,
          height: 2,
          decoration: BoxDecoration(
            color: widget.isDisabled
                ? checkColor.withValues(alpha: opacity.disabled)
                : checkColor,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      );
    }

    if (widget.value) {
      return Center(
        child: Icon(
          Icons.check,
          size: dimensions.iconSize,
          color: widget.isDisabled
              ? checkColor.withValues(alpha: opacity.disabled)
              : checkColor,
        ),
      );
    }

    return null;
  }

  Color _getBackgroundColor(GColorScheme colors, Color activeColor, GOpacityTokens opacity) {
    if (widget.value || widget.isIndeterminate) {
      if (widget.isDisabled) {
        return activeColor.withValues(alpha: opacity.disabled);
      }
      return activeColor;
    }
    if (_isHovered && _isEnabled) {
      return colors.onSurface.withValues(alpha: opacity.hover);
    }
    return Colors.transparent;
  }

  Color _getBorderColor(GColorScheme colors, Color activeColor, GOpacityTokens opacity) {
    if (widget.value || widget.isIndeterminate) {
      if (widget.isDisabled) {
        return activeColor.withValues(alpha: opacity.disabled);
      }
      return activeColor;
    }
    if (widget.isDisabled) {
      return colors.outline.withValues(alpha: opacity.disabled);
    }
    if (_isHovered) {
      return colors.onSurface;
    }
    return colors.outline;
  }

  _CheckboxDimensions _getDimensions(GThemeData theme) {
    final spacing = theme.spacing;

    switch (widget.size) {
      case GCheckboxSize.sm:
        return _CheckboxDimensions(
          size: 16,
          iconSize: 12,
          borderRadius: 3,
          labelSpacing: spacing.xs,
        );
      case GCheckboxSize.md:
        return _CheckboxDimensions(
          size: 20,
          iconSize: 14,
          borderRadius: 4,
          labelSpacing: spacing.sm,
        );
      case GCheckboxSize.lg:
        return _CheckboxDimensions(
          size: 24,
          iconSize: 16,
          borderRadius: 5,
          labelSpacing: spacing.sm,
        );
    }
  }
}

class _CheckboxDimensions {
  const _CheckboxDimensions({
    required this.size,
    required this.iconSize,
    required this.borderRadius,
    required this.labelSpacing,
  });

  final double size;
  final double iconSize;
  final double borderRadius;
  final double labelSpacing;
}

