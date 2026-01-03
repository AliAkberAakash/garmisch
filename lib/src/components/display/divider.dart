import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Divider orientation
enum GDividerOrientation {
  /// Horizontal divider
  horizontal,

  /// Vertical divider
  vertical,
}

/// A customizable divider component for the Garmisch design system.
///
/// ```dart
/// GDivider()
/// GDivider(label: 'OR')
/// GDivider.vertical(height: 40)
/// ```
class GDivider extends StatelessWidget {
  const GDivider({
    super.key,
    this.orientation = GDividerOrientation.horizontal,
    this.thickness = GBorderWidth.thin,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
    this.label,
    this.labelStyle,
    this.height,
    this.width,
  });

  /// Creates a vertical divider
  const GDivider.vertical({
    super.key,
    this.thickness = GBorderWidth.thin,
    this.color,
    this.indent = 0,
    this.endIndent = 0,
    this.height,
    this.width,
  })  : orientation = GDividerOrientation.vertical,
        label = null,
        labelStyle = null;

  /// Divider orientation
  final GDividerOrientation orientation;

  /// Thickness of the divider line
  final double thickness;

  /// Color of the divider
  final Color? color;

  /// Indent from the start
  final double indent;

  /// Indent from the end
  final double endIndent;

  /// Optional label (only for horizontal)
  final String? label;

  /// Label text style
  final TextStyle? labelStyle;

  /// Height (for vertical) or spacing (for horizontal)
  final double? height;

  /// Width (for horizontal) or spacing (for vertical)
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final dividerColor = color ?? colors.outlineVariant;

    if (orientation == GDividerOrientation.vertical) {
      return Container(
        width: width ?? thickness,
        height: height,
        margin: EdgeInsets.only(top: indent, bottom: endIndent),
        color: dividerColor,
      );
    }

    if (label != null) {
      return Row(
        children: [
          Expanded(
            child: Container(
              height: thickness,
              margin: EdgeInsets.only(left: indent),
              color: dividerColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: GSpacing.md),
            child: Text(
              label!,
              style: labelStyle ??
                  textTheme.labelSmall.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              height: thickness,
              margin: EdgeInsets.only(right: endIndent),
              color: dividerColor,
            ),
          ),
        ],
      );
    }

    return Container(
      height: height ?? thickness,
      margin: EdgeInsets.only(left: indent, right: endIndent),
      color: height != null ? null : dividerColor,
      child: height != null
          ? Center(
              child: Container(
                height: thickness,
                color: dividerColor,
              ),
            )
          : null,
    );
  }
}

