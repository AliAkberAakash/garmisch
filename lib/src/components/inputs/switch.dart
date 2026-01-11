import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Switch size options
enum GSwitchSize {
  /// Small switch (32x18px)
  sm,

  /// Medium switch (40x22px) - Default
  md,

  /// Large switch (48x26px)
  lg,
}

/// A customizable toggle switch component for the Garmisch design system.
///
/// ```dart
/// GSwitch(
///   value: isEnabled,
///   onChanged: (value) => setState(() => isEnabled = value),
///   label: 'Enable notifications',
/// )
/// ```
class GSwitch extends StatefulWidget {
  const GSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.isDisabled = false,
    this.size = GSwitchSize.md,
    this.activeColor,
    this.inactiveColor,
  });

  /// Whether the switch is on
  final bool value;

  /// Called when the switch is toggled
  final ValueChanged<bool>? onChanged;

  /// Optional label text
  final String? label;

  /// Whether the switch is disabled
  final bool isDisabled;

  /// Size of the switch
  final GSwitchSize size;

  /// Custom active/on color
  final Color? activeColor;

  /// Custom inactive/off color
  final Color? inactiveColor;

  @override
  State<GSwitch> createState() => _GSwitchState();
}

class _GSwitchState extends State<GSwitch> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  bool get _isEnabled => !widget.isDisabled && widget.onChanged != null;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
    );
    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = GTheme.of(context);
    _controller.duration = theme.durations.fast;
    _alignmentAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(parent: _controller, curve: theme.easing.easeOut));
  }

  @override
  void didUpdateWidget(GSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_isEnabled) {
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
    final shadows = theme.shadows;

    final dimensions = _getDimensions(theme);
    final activeColor = widget.activeColor ?? colors.primary;
    final inactiveColor = widget.inactiveColor ?? colors.surfaceVariant;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: _handleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Switch track
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final trackColor = ColorTween(
                  begin: widget.isDisabled
                      ? inactiveColor.withValues(alpha: opacity.disabled)
                      : inactiveColor,
                  end: widget.isDisabled
                      ? activeColor.withValues(alpha: opacity.disabled)
                      : activeColor,
                ).evaluate(_controller)!;

                return Container(
                  width: dimensions.trackWidth,
                  height: dimensions.trackHeight,
                  decoration: BoxDecoration(
                    color: trackColor,
                    borderRadius: BorderRadius.circular(dimensions.trackHeight / 2),
                    border: Border.all(
                      color: widget.value
                          ? Colors.transparent
                          : (_isHovered && _isEnabled
                              ? colors.onSurface.withValues(alpha: 0.3)
                              : colors.outline.withValues(alpha: 0.3)),
                      width: borderWidth.thin,
                    ),
                  ),
                  padding: EdgeInsets.all(dimensions.thumbPadding),
                  child: Align(
                    alignment: _alignmentAnimation.value,
                    child: Container(
                      width: dimensions.thumbSize,
                      height: dimensions.thumbSize,
                      decoration: BoxDecoration(
                        color: widget.isDisabled
                            ? colors.onPrimary.withValues(alpha: opacity.disabled)
                            : colors.onPrimary,
                        shape: BoxShape.circle,
                        boxShadow: widget.isDisabled ? null : shadows.sm,
                      ),
                    ),
                  ),
                );
              },
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

  _SwitchDimensions _getDimensions(GThemeData theme) {
    final spacing = theme.spacing;

    switch (widget.size) {
      case GSwitchSize.sm:
        return _SwitchDimensions(
          trackWidth: 32,
          trackHeight: 18,
          thumbSize: 14,
          thumbPadding: 2,
          labelSpacing: spacing.xs,
        );
      case GSwitchSize.md:
        return _SwitchDimensions(
          trackWidth: 40,
          trackHeight: 22,
          thumbSize: 18,
          thumbPadding: 2,
          labelSpacing: spacing.sm,
        );
      case GSwitchSize.lg:
        return _SwitchDimensions(
          trackWidth: 48,
          trackHeight: 26,
          thumbSize: 22,
          thumbPadding: 2,
          labelSpacing: spacing.sm,
        );
    }
  }
}

class _SwitchDimensions {
  const _SwitchDimensions({
    required this.trackWidth,
    required this.trackHeight,
    required this.thumbSize,
    required this.thumbPadding,
    required this.labelSpacing,
  });

  final double trackWidth;
  final double trackHeight;
  final double thumbSize;
  final double thumbPadding;
  final double labelSpacing;
}

