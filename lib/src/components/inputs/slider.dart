import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Slider size options
enum GSliderSize {
  /// Small slider
  sm,

  /// Medium slider - Default
  md,

  /// Large slider
  lg,
}

/// A customizable slider component for the Garmisch design system.
///
/// ```dart
/// GSlider(
///   value: _value,
///   onChanged: (v) => setState(() => _value = v),
///   min: 0,
///   max: 100,
/// )
/// ```
class GSlider extends StatefulWidget {
  const GSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.size = GSliderSize.md,
    this.label,
    this.showValue = false,
    this.isDisabled = false,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
  });

  /// Current value
  final double value;

  /// Called when value changes
  final ValueChanged<double>? onChanged;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of discrete divisions
  final int? divisions;

  /// Slider size
  final GSliderSize size;

  /// Optional label
  final String? label;

  /// Whether to show the current value
  final bool showValue;

  /// Whether the slider is disabled
  final bool isDisabled;

  /// Active track color
  final Color? activeColor;

  /// Inactive track color
  final Color? inactiveColor;

  /// Thumb color
  final Color? thumbColor;

  @override
  State<GSlider> createState() => _GSliderState();
}

class _GSliderState extends State<GSlider> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final opacity = theme.opacity;
    final spacing = theme.spacing;
    final typography = theme.typography;

    final dimensions = _getDimensions();
    final activeColor = widget.activeColor ?? colors.primary;
    final inactiveColor = widget.inactiveColor ?? colors.surfaceVariant;
    final thumbColor = widget.thumbColor ?? colors.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null || widget.showValue)
          Padding(
            padding: EdgeInsets.only(bottom: spacing.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.label != null)
                  Text(
                    widget.label!,
                    style: textTheme.labelMedium.copyWith(
                      color: widget.isDisabled
                          ? colors.onSurface.withValues(alpha: opacity.disabled)
                          : colors.onSurface,
                    ),
                  ),
                if (widget.showValue)
                  Text(
                    widget.value.toStringAsFixed(widget.divisions != null ? 0 : 1),
                    style: textTheme.labelMedium.copyWith(
                      color: widget.isDisabled
                          ? colors.onSurfaceVariant.withValues(alpha: opacity.disabled)
                          : colors.onSurfaceVariant,
                      fontFamily: typography.fontFamilyMono,
                    ),
                  ),
              ],
            ),
          ),
        SizedBox(
          height: dimensions.height,
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: dimensions.trackHeight,
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: dimensions.thumbRadius,
                disabledThumbRadius: dimensions.thumbRadius,
                elevation: _isDragging ? 4 : 2,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: dimensions.thumbRadius * 2,
              ),
              activeTrackColor: widget.isDisabled
                  ? activeColor.withValues(alpha: opacity.disabled)
                  : activeColor,
              inactiveTrackColor: widget.isDisabled
                  ? inactiveColor.withValues(alpha: opacity.disabled)
                  : inactiveColor,
              thumbColor: widget.isDisabled
                  ? thumbColor.withValues(alpha: opacity.disabled)
                  : thumbColor,
              overlayColor: activeColor.withValues(alpha: 0.12),
              tickMarkShape: widget.divisions != null
                  ? const RoundSliderTickMarkShape(tickMarkRadius: 2)
                  : SliderTickMarkShape.noTickMark,
              activeTickMarkColor: colors.onPrimary,
              inactiveTickMarkColor: colors.onSurfaceVariant,
            ),
            child: Slider(
              value: widget.value,
              min: widget.min,
              max: widget.max,
              divisions: widget.divisions,
              onChanged: widget.isDisabled ? null : widget.onChanged,
              onChangeStart: (_) => setState(() => _isDragging = true),
              onChangeEnd: (_) => setState(() => _isDragging = false),
            ),
          ),
        ),
      ],
    );
  }

  _SliderDimensions _getDimensions() {
    switch (widget.size) {
      case GSliderSize.sm:
        return const _SliderDimensions(
          height: 24,
          trackHeight: 4,
          thumbRadius: 8,
        );
      case GSliderSize.md:
        return const _SliderDimensions(
          height: 32,
          trackHeight: 6,
          thumbRadius: 10,
        );
      case GSliderSize.lg:
        return const _SliderDimensions(
          height: 40,
          trackHeight: 8,
          thumbRadius: 12,
        );
    }
  }
}

class _SliderDimensions {
  const _SliderDimensions({
    required this.height,
    required this.trackHeight,
    required this.thumbRadius,
  });

  final double height;
  final double trackHeight;
  final double thumbRadius;
}

/// A range slider component
class GRangeSlider extends StatefulWidget {
  const GRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
    this.divisions,
    this.size = GSliderSize.md,
    this.label,
    this.showValues = false,
    this.isDisabled = false,
    this.activeColor,
  });

  /// Current range values
  final RangeValues values;

  /// Called when values change
  final ValueChanged<RangeValues>? onChanged;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of discrete divisions
  final int? divisions;

  /// Slider size
  final GSliderSize size;

  /// Optional label
  final String? label;

  /// Whether to show the current values
  final bool showValues;

  /// Whether the slider is disabled
  final bool isDisabled;

  /// Active track color
  final Color? activeColor;

  @override
  State<GRangeSlider> createState() => _GRangeSliderState();
}

class _GRangeSliderState extends State<GRangeSlider> {
  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final opacity = theme.opacity;
    final spacing = theme.spacing;
    final typography = theme.typography;

    final activeColor = widget.activeColor ?? colors.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null || widget.showValues)
          Padding(
            padding: EdgeInsets.only(bottom: spacing.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.label != null)
                  Text(
                    widget.label!,
                    style: textTheme.labelMedium.copyWith(
                      color: widget.isDisabled
                          ? colors.onSurface.withValues(alpha: opacity.disabled)
                          : colors.onSurface,
                    ),
                  ),
                if (widget.showValues)
                  Text(
                    '${widget.values.start.toStringAsFixed(0)} - ${widget.values.end.toStringAsFixed(0)}',
                    style: textTheme.labelMedium.copyWith(
                      color: widget.isDisabled
                          ? colors.onSurfaceVariant.withValues(alpha: opacity.disabled)
                          : colors.onSurfaceVariant,
                      fontFamily: typography.fontFamilyMono,
                    ),
                  ),
              ],
            ),
          ),
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 6,
            activeTrackColor: widget.isDisabled
                ? activeColor.withValues(alpha: opacity.disabled)
                : activeColor,
            inactiveTrackColor: widget.isDisabled
                ? colors.surfaceVariant.withValues(alpha: opacity.disabled)
                : colors.surfaceVariant,
            thumbColor: widget.isDisabled
                ? activeColor.withValues(alpha: opacity.disabled)
                : activeColor,
            overlayColor: activeColor.withValues(alpha: 0.12),
            rangeThumbShape: const RoundRangeSliderThumbShape(
              enabledThumbRadius: 10,
            ),
          ),
          child: RangeSlider(
            values: widget.values,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            onChanged: widget.isDisabled ? null : widget.onChanged,
          ),
        ),
      ],
    );
  }
}

