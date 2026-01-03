import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
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
      duration: GDurations.fast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: GEasing.easeOut),
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

    final dimensions = _getDimensions();
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
                duration: GDurations.fast,
                curve: GEasing.easeOut,
                width: dimensions.size,
                height: dimensions.size,
                decoration: BoxDecoration(
                  color: _getBackgroundColor(colors),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: _getBorderColor(colors, activeColor),
                    width: _isSelected ? dimensions.size * 0.15 : GBorderWidth.thin,
                  ),
                ),
                child: _isSelected
                    ? Center(
                        child: AnimatedContainer(
                          duration: GDurations.fast,
                          width: dimensions.innerSize,
                          height: dimensions.innerSize,
                          decoration: BoxDecoration(
                            color: widget.isDisabled
                                ? activeColor.withValues(alpha: GOpacity.disabled)
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
                      ? colors.onSurface.withValues(alpha: GOpacity.disabled)
                      : colors.onSurface,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(GColorScheme colors) {
    if (_isHovered && _isEnabled && !_isSelected) {
      return colors.onSurface.withValues(alpha: GOpacity.hover);
    }
    return Colors.transparent;
  }

  Color _getBorderColor(GColorScheme colors, Color activeColor) {
    if (_isSelected) {
      if (widget.isDisabled) {
        return activeColor.withValues(alpha: GOpacity.disabled);
      }
      return activeColor;
    }
    if (widget.isDisabled) {
      return colors.outline.withValues(alpha: GOpacity.disabled);
    }
    if (_isHovered) {
      return colors.onSurface;
    }
    return colors.outline;
  }

  _RadioDimensions _getDimensions() {
    switch (widget.size) {
      case GRadioSize.sm:
        return const _RadioDimensions(
          size: 16,
          innerSize: 6,
          labelSpacing: GSpacing.xs,
        );
      case GRadioSize.md:
        return const _RadioDimensions(
          size: 20,
          innerSize: 8,
          labelSpacing: GSpacing.sm,
        );
      case GRadioSize.lg:
        return const _RadioDimensions(
          size: 24,
          innerSize: 10,
          labelSpacing: GSpacing.sm,
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

