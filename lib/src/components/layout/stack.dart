import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Stack badge position options
enum GStackBadgePosition {
  /// Top left corner
  topLeft,

  /// Top right corner
  topRight,

  /// Bottom left corner
  bottomLeft,

  /// Bottom right corner
  bottomRight,
}


/// An overlay badge positioned on a widget.
///
/// Commonly used for notification badges, status indicators, etc.
///
/// ```dart
/// GStackBadge(
///   badge: GBadge(label: '3'),
///   position: GStackBadgePosition.topRight,
///   child: Icon(Icons.notifications),
/// )
/// ```
class GStackBadge extends StatelessWidget {
  const GStackBadge({
    super.key,
    required this.child,
    required this.badge,
    this.position = GStackBadgePosition.topRight,
    this.offset = const Offset(0, 0),
    this.showBadge = true,
  });

  /// Main content widget
  final Widget child;

  /// Badge widget to overlay
  final Widget badge;

  /// Position of the badge
  final GStackBadgePosition position;

  /// Offset from the position
  final Offset offset;

  /// Whether to show the badge
  final bool showBadge;

  @override
  Widget build(BuildContext context) {
    if (!showBadge) return child;

    double? top, right, bottom, left;

    switch (position) {
      case GStackBadgePosition.topLeft:
        top = offset.dy;
        left = offset.dx;
        break;
      case GStackBadgePosition.topRight:
        top = offset.dy;
        right = offset.dx;
        break;
      case GStackBadgePosition.bottomLeft:
        bottom = offset.dy;
        left = offset.dx;
        break;
      case GStackBadgePosition.bottomRight:
        bottom = offset.dy;
        right = offset.dx;
        break;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: top,
          right: right,
          bottom: bottom,
          left: left,
          child: badge,
        ),
      ],
    );
  }
}

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

