import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Tooltip position options
enum GTooltipPosition {
  /// Above the target
  top,

  /// Below the target
  bottom,

  /// To the left of the target
  left,

  /// To the right of the target
  right,
}

/// A customizable tooltip component for the Garmisch design system.
///
/// ```dart
/// GTooltip(
///   message: 'This is a tooltip',
///   child: Icon(Icons.info),
/// )
/// ```
class GTooltip extends StatefulWidget {
  const GTooltip({
    super.key,
    required this.message,
    required this.child,
    this.position = GTooltipPosition.top,
    this.showDelay = const Duration(milliseconds: 500),
    this.hideDelay = const Duration(milliseconds: 200),
    this.richMessage,
    this.preferredWidth,
  });

  /// Tooltip text message
  final String message;

  /// Child widget that triggers the tooltip
  final Widget child;

  /// Preferred position of the tooltip
  final GTooltipPosition position;

  /// Delay before showing tooltip
  final Duration showDelay;

  /// Delay before hiding tooltip
  final Duration hideDelay;

  /// Rich text message (overrides message)
  final InlineSpan? richMessage;

  /// Preferred width for the tooltip
  final double? preferredWidth;

  @override
  State<GTooltip> createState() => _GTooltipState();
}

class _GTooltipState extends State<GTooltip> {
  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final borderRadius = theme.borderRadius;
    final shadows = theme.shadows;
    final spacing = theme.spacing;

    return Tooltip(
      message: widget.richMessage != null ? '' : widget.message,
      richMessage: widget.richMessage,
      preferBelow: widget.position == GTooltipPosition.bottom,
      waitDuration: widget.showDelay,
      showDuration: widget.hideDelay,
      decoration: BoxDecoration(
        color: colors.inverseSurface,
        borderRadius: borderRadius.allMd,
        boxShadow: shadows.md,
      ),
      textStyle: textTheme.bodySmall.copyWith(
        color: colors.onInverseSurface,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: spacing.sm,
        vertical: spacing.xs,
      ),
      child: widget.child,
    );
  }
}

/// A tooltip with custom content
class GTooltipCustom extends StatefulWidget {
  const GTooltipCustom({
    super.key,
    required this.content,
    required this.child,
    this.position = GTooltipPosition.top,
    this.showOnTap = false,
  });

  /// Custom tooltip content
  final Widget content;

  /// Child widget that triggers the tooltip
  final Widget child;

  /// Preferred position
  final GTooltipPosition position;

  /// Whether to show on tap instead of hover
  final bool showOnTap;

  @override
  State<GTooltipCustom> createState() => _GTooltipCustomState();
}

class _GTooltipCustomState extends State<GTooltipCustom> {
  final _overlayController = OverlayPortalController();
  final _link = LayerLink();

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final borderRadius = theme.borderRadius;
    final shadows = theme.shadows;
    final spacing = theme.spacing;
    final typography = theme.typography;

    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _overlayController,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: _getTargetAnchor(),
            followerAnchor: _getFollowerAnchor(),
            offset: _getOffset(),
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing.sm,
                  vertical: spacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colors.inverseSurface,
                  borderRadius: borderRadius.allMd,
                  boxShadow: shadows.md,
                ),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: colors.onInverseSurface,
                    fontSize: typography.fontSizeSm,
                  ),
                  child: widget.content,
                ),
              ),
            ),
          );
        },
        child: MouseRegion(
          onEnter: widget.showOnTap ? null : (_) => _overlayController.show(),
          onExit: widget.showOnTap ? null : (_) => _overlayController.hide(),
          child: GestureDetector(
            onTap: widget.showOnTap ? _toggleTooltip : null,
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _toggleTooltip() {
    if (_overlayController.isShowing) {
      _overlayController.hide();
    } else {
      _overlayController.show();
    }
  }

  Alignment _getTargetAnchor() {
    switch (widget.position) {
      case GTooltipPosition.top:
        return Alignment.topCenter;
      case GTooltipPosition.bottom:
        return Alignment.bottomCenter;
      case GTooltipPosition.left:
        return Alignment.centerLeft;
      case GTooltipPosition.right:
        return Alignment.centerRight;
    }
  }

  Alignment _getFollowerAnchor() {
    switch (widget.position) {
      case GTooltipPosition.top:
        return Alignment.bottomCenter;
      case GTooltipPosition.bottom:
        return Alignment.topCenter;
      case GTooltipPosition.left:
        return Alignment.centerRight;
      case GTooltipPosition.right:
        return Alignment.centerLeft;
    }
  }

  Offset _getOffset() {
    const gap = 8.0;
    switch (widget.position) {
      case GTooltipPosition.top:
        return const Offset(0, -gap);
      case GTooltipPosition.bottom:
        return const Offset(0, gap);
      case GTooltipPosition.left:
        return const Offset(-gap, 0);
      case GTooltipPosition.right:
        return const Offset(gap, 0);
    }
  }
}

