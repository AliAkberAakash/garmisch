import 'package:flutter/material.dart';

import '../../foundations/border_radius.dart';
import '../../theme/theme.dart';


/// An overlay container for adding elements on top of content.
///
/// ```dart
/// GOverlayContainer(
///   overlay: Positioned(
///     bottom: 0,
///     left: 0,
///     right: 0,
///     child: Container(color: Colors.black54, child: Text('Overlay')),
///   ),
///   child: Image(...),
/// )
/// ```
class GOverlayContainer extends StatelessWidget {
  const GOverlayContainer({
    super.key,
    required this.child,
    this.overlay,
    this.overlays,
    this.clipBehavior = Clip.hardEdge,
    this.borderRadius,
  });

  /// Main content widget
  final Widget child;

  /// Single overlay widget
  final Widget? overlay;

  /// Multiple overlay widgets
  final List<Widget>? overlays;

  /// Clip behavior
  final Clip clipBehavior;

  /// Border radius for clipping
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final content = Stack(
      clipBehavior: clipBehavior,
      children: [
        child,
        if (overlay != null) overlay!,
        if (overlays != null) ...overlays!,
      ],
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: content,
      );
    }

    return content;
  }
}

/// A layered card with stacked visual effect.
///
/// Creates a visual stack of cards behind the main content.
///
/// ```dart
/// GLayeredCard(
///   layers: 2,
///   child: Card(child: Text('Content')),
/// )
/// ```
class GLayeredCard extends StatelessWidget {
  const GLayeredCard({
    super.key,
    required this.child,
    this.layers = 2,
    this.layerOffset = 4.0,
    this.layerColor,
    this.borderRadius,
  });

  /// Main content widget
  final Widget child;

  /// Number of background layers
  final int layers;

  /// Offset between layers
  final double layerOffset;

  /// Color of background layers
  final Color? layerColor;

  /// Border radius
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final effectiveBorderRadius = borderRadius ?? GBorderRadius.allMd;
    final effectiveLayerColor = layerColor ?? colors.outline.withValues(alpha: 0.1);

    return Stack(
      children: [
        // Background layers
        for (var i = layers; i > 0; i--)
          Positioned(
            top: i * layerOffset,
            left: i * layerOffset,
            right: -i * layerOffset,
            bottom: -i * layerOffset,
            child: Container(
              decoration: BoxDecoration(
                color: effectiveLayerColor,
                borderRadius: effectiveBorderRadius,
                border: Border.all(
                  color: colors.outline.withValues(alpha: 0.05),
                ),
              ),
            ),
          ),
        // Main content
        child,
      ],
    );
  }
}

