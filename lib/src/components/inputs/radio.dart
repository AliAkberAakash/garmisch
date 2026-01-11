import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Radio button size options
enum GRadioSize {
  /// Small radio (16px)
  sm,

  /// Medium radio (20px) - Default
  md,

  /// Large radio (24px)
  lg,
}

/// A customizable radio button component for the Garmisch design system.
///
/// ```dart
/// GRadio<String>(
///   value: 'option1',
///   groupValue: selectedValue,
///   onChanged: (value) => setState(() => selectedValue = value),
///   label: 'Option 1',
/// )
/// ```
class GRadio<T> extends StatefulWidget {
  const GRadio({
    super.key,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.size = GRadioSize.md,
    this.activeColor,
  });

  /// The value of this radio button
  final T value;

  /// The currently selected value in the group
  final T? groupValue;

  /// Called when this radio is selected
  final ValueChanged<T?>? onChanged;

  /// Optional label text
  final String? label;

  /// Whether the radio is disabled
  final bool isDisabled;

  /// Size of the radio
  final GRadioSize size;

  /// Custom active/selected color
  final Color? activeColor;

  @override
  State<GRadio<T>> createState() => _GRadioState<T>();
}

class _GRadioState<T> extends State<GRadio<T>> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  bool get _isSelected => widget.value == widget.groupValue;
  bool get _isEnabled => !widget.isDisabled && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
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
      widget.onChanged?.call(widget.value);
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

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: _handleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Radio
            ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedContainer(
                duration: theme.durations.fast,
                curve: theme.easing.easeOut,
                width: dimensions.size,
                height: dimensions.size,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(colors, opacity),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _getBorderColor(colors, activeColor, opacity),
                    width: _isSelected ? dimensions.size * 0.15 : borderWidth.thin,
                  ),
                ),
                child: _isSelected
                    ? Center(
                        child: AnimatedContainer(
                          duration: theme.durations.fast,
                          width: dimensions.innerSize,
                          height: dimensions.innerSize,
                          decoration: BoxDecoration(
                            color: widget.isDisabled
                                ? activeColor.withValues(alpha: opacity.disabled)
                                : activeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
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

  Color _getBackgroundColor(GColorScheme colors, GOpacityTokens opacity) {
    if (_isHovered && _isEnabled && !_isSelected) {
      return colors.onSurface.withValues(alpha: opacity.hover);
    }
    return Colors.transparent;
  }

  Color _getBorderColor(GColorScheme colors, Color activeColor, GOpacityTokens opacity) {
    if (_isSelected) {
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

  _RadioDimensions _getDimensions(GThemeData theme) {
    final spacing = theme.spacing;

    switch (widget.size) {
      case GRadioSize.sm:
        return _RadioDimensions(
          size: 16,
          innerSize: 6,
          labelSpacing: spacing.xs,
        );
      case GRadioSize.md:
        return _RadioDimensions(
          size: 20,
          innerSize: 8,
          labelSpacing: spacing.sm,
        );
      case GRadioSize.lg:
        return _RadioDimensions(
          size: 24,
          innerSize: 10,
          labelSpacing: spacing.sm,
        );
    }
  }
}

class _RadioDimensions {
  const _RadioDimensions({
    required this.size,
    required this.innerSize,
    required this.labelSpacing,
  });

  final double size;
  final double innerSize;
  final double labelSpacing;
}

