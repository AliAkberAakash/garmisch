import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';
import 'spacing.dart';

/// A responsive grid layout component for the Garmisch design system.
///
/// Automatically adjusts the number of columns based on screen size.
///
/// ```dart
/// GGrid(
///   columns: GResponsiveValue(xs: 1, sm: 2, md: 3, lg: 4),
///   spacing: GSpacing.md,
///   children: [
///     Container(...),
///     Container(...),
///   ],
/// )
/// ```
class GGrid extends StatelessWidget {
  const GGrid({
    super.key,
    required this.children,
    this.columns,
    this.crossAxisCount,
    this.spacing = GSpacing.md,
    this.runSpacing,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
    this.shrinkWrap = true,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  /// Children widgets
  final List<Widget> children;

  /// Responsive column count (overrides crossAxisCount)
  final GResponsiveValue<int>? columns;

  /// Fixed column count (use columns for responsive)
  final int? crossAxisCount;

  /// Spacing between items (both axes)
  final double spacing;

  /// Vertical spacing (overrides spacing for run)
  final double? runSpacing;

  /// Aspect ratio of children (width / height)
  final double childAspectRatio;

  /// Fixed height for each item
  final double? mainAxisExtent;

  /// Horizontal spacing between items
  final double? crossAxisSpacing;

  /// Vertical spacing between items
  final double? mainAxisSpacing;

  /// Padding around the grid
  final EdgeInsetsGeometry? padding;

  /// Whether to shrink wrap
  final bool shrinkWrap;

  /// Scroll physics
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    final effectiveCrossAxisCount = columns?.resolve(context) ?? crossAxisCount ?? 2;

    return GridView.builder(
      shrinkWrap: shrinkWrap,
      physics: physics,
      padding: padding,
      gridDelegate: mainAxisExtent != null
          ? SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: effectiveCrossAxisCount,
              crossAxisSpacing: crossAxisSpacing ?? spacing,
              mainAxisSpacing: mainAxisSpacing ?? runSpacing ?? spacing,
              mainAxisExtent: mainAxisExtent,
            )
          : SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: effectiveCrossAxisCount,
              crossAxisSpacing: crossAxisSpacing ?? spacing,
              mainAxisSpacing: mainAxisSpacing ?? runSpacing ?? spacing,
              childAspectRatio: childAspectRatio,
            ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

/// A responsive grid with auto-fit columns based on minimum item width.
///
/// ```dart
/// GAutoGrid(
///   minItemWidth: 200,
///   spacing: GSpacing.md,
///   children: [
///     Container(...),
///     Container(...),
///   ],
/// )
/// ```
class GAutoGrid extends StatelessWidget {
  const GAutoGrid({
    super.key,
    required this.children,
    this.minItemWidth = 200,
    this.maxItemWidth,
    this.spacing = GSpacing.md,
    this.runSpacing,
    this.childAspectRatio = 1.0,
    this.mainAxisExtent,
    this.padding,
  });

  /// Children widgets
  final List<Widget> children;

  /// Minimum width for each item
  final double minItemWidth;

  /// Maximum width for each item
  final double? maxItemWidth;

  /// Spacing between items
  final double spacing;

  /// Vertical spacing
  final double? runSpacing;

  /// Aspect ratio of children
  final double childAspectRatio;

  /// Fixed height for each item
  final double? mainAxisExtent;

  /// Padding around the grid
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth - (padding != null ? (padding as EdgeInsets).horizontal : 0);
        var crossAxisCount = (availableWidth / minItemWidth).floor();
        crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: padding,
          gridDelegate: mainAxisExtent != null
              ? SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: runSpacing ?? spacing,
                  mainAxisExtent: mainAxisExtent,
                )
              : SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: runSpacing ?? spacing,
                  childAspectRatio: childAspectRatio,
                ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}

/// A simple row-based grid using Wrap widget.
///
/// Useful for flexible layouts where items wrap to next line.
///
/// ```dart
/// GWrapGrid(
///   spacing: GSpacing.md,
///   children: [
///     Container(width: 100, ...),
///     Container(width: 150, ...),
///   ],
/// )
/// ```
class GWrapGrid extends StatelessWidget {
  const GWrapGrid({
    super.key,
    required this.children,
    this.spacing = GSpacing.md,
    this.runSpacing,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.start,
  });

  /// Children widgets
  final List<Widget> children;

  /// Horizontal spacing
  final double spacing;

  /// Vertical spacing
  final double? runSpacing;

  /// Main axis alignment
  final WrapAlignment alignment;

  /// Run alignment
  final WrapAlignment runAlignment;

  /// Cross axis alignment
  final WrapCrossAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing ?? spacing,
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}

/// A grid item with consistent styling.
///
/// ```dart
/// GGridItem(
///   child: Text('Content'),
/// )
/// ```
class GGridItem extends StatelessWidget {
  const GGridItem({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.border,
    this.padding,
    this.onTap,
  });

  /// Child widget
  final Widget child;

  /// Background color
  final Color? color;

  /// Border radius
  final BorderRadiusGeometry? borderRadius;

  /// Border
  final BoxBorder? border;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Tap callback
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final content = Container(
      padding: padding ?? const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: color ?? colors.surface,
        borderRadius: borderRadius ?? GBorderRadius.allMd,
        border: border ?? Border.all(color: colors.outline.withValues(alpha: 0.2)),
      ),
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: (borderRadius ?? GBorderRadius.allMd) as BorderRadius,
          child: content,
        ),
      );
    }

    return content;
  }
}

/// A masonry-style grid with items of varying heights.
///
/// Note: This is a simplified implementation using Column + Row.
/// For production, consider using flutter_staggered_grid_view package.
class GMasonryGrid extends StatelessWidget {
  const GMasonryGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 2,
    this.spacing = GSpacing.md,
  });

  /// Children widgets
  final List<Widget> children;

  /// Number of columns
  final int crossAxisCount;

  /// Spacing between items
  final double spacing;

  @override
  Widget build(BuildContext context) {
    // Distribute children across columns
    final columns = List.generate(crossAxisCount, (_) => <Widget>[]);
    for (var i = 0; i < children.length; i++) {
      columns[i % crossAxisCount].add(children[i]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < columns.length; i++) ...[
          if (i > 0) SizedBox(width: spacing),
          Expanded(
            child: Column(
              children: [
                for (var j = 0; j < columns[i].length; j++) ...[
                  if (j > 0) SizedBox(height: spacing),
                  columns[i][j],
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

