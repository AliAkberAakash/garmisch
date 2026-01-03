import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Card variant options
enum GCardVariant {
  /// Elevated card with shadow
  elevated,

  /// Filled card with background
  filled,

  /// Outlined card with border
  outlined,
}

/// A customizable card component for the Garmisch design system.
///
/// ```dart
/// GCard(
///   child: Text('Card content'),
///   variant: GCardVariant.elevated,
///   onTap: () {},
/// )
/// ```
class GCard extends StatefulWidget {
  const GCard({
    super.key,
    required this.child,
    this.variant = GCardVariant.elevated,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.shadow,
    this.onTap,
    this.onLongPress,
    this.width,
    this.height,
    this.constraints,
  });

  /// Card content
  final Widget child;

  /// Visual variant
  final GCardVariant variant;

  /// Custom padding
  final EdgeInsets? padding;

  /// Custom border radius
  final BorderRadius? borderRadius;

  /// Custom background color
  final Color? backgroundColor;

  /// Custom border color (for outlined variant)
  final Color? borderColor;

  /// Custom shadow
  final List<BoxShadow>? shadow;

  /// Called when card is tapped
  final VoidCallback? onTap;

  /// Called when card is long pressed
  final VoidCallback? onLongPress;

  /// Fixed width
  final double? width;

  /// Fixed height
  final double? height;

  /// Box constraints
  final BoxConstraints? constraints;

  @override
  State<GCard> createState() => _GCardState();
}

class _GCardState extends State<GCard> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isInteractive => widget.onTap != null || widget.onLongPress != null;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final cardColors = _getCardColors(colors);
    final radius = widget.borderRadius ?? GBorderRadius.allLg;

    return MouseRegion(
      onEnter: _isInteractive ? (_) => setState(() => _isHovered = true) : null,
      onExit: _isInteractive ? (_) => setState(() => _isHovered = false) : null,
      cursor: _isInteractive ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTapDown: _isInteractive ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: _isInteractive ? (_) => setState(() => _isPressed = false) : null,
        onTapCancel: _isInteractive ? () => setState(() => _isPressed = false) : null,
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        child: AnimatedContainer(
          duration: GDurations.fast,
          curve: GEasing.easeOut,
          width: widget.width,
          height: widget.height,
          constraints: widget.constraints,
          padding: widget.padding ?? const EdgeInsets.all(GSpacing.md),
          decoration: BoxDecoration(
            color: _getBackgroundColor(cardColors),
            borderRadius: radius,
            border: _getBorder(cardColors),
            boxShadow: _getShadow(cardColors),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  Color _getBackgroundColor(_CardColors cardColors) {
    if (_isPressed && _isInteractive) {
      return cardColors.pressedBackground;
    }
    if (_isHovered && _isInteractive) {
      return cardColors.hoverBackground;
    }
    return widget.backgroundColor ?? cardColors.background;
  }

  Border? _getBorder(_CardColors cardColors) {
    if (widget.variant == GCardVariant.outlined) {
      return Border.all(
        color: widget.borderColor ?? cardColors.borderColor,
        width: GBorderWidth.thin,
      );
    }
    return null;
  }

  List<BoxShadow>? _getShadow(_CardColors cardColors) {
    if (widget.shadow != null) return widget.shadow;
    if (widget.variant == GCardVariant.elevated) {
      if (_isHovered && _isInteractive) {
        return GShadows.md;
      }
      return GShadows.sm;
    }
    return null;
  }

  _CardColors _getCardColors(GColorScheme colors) {
    switch (widget.variant) {
      case GCardVariant.elevated:
        return _CardColors(
          background: colors.surface,
          hoverBackground: colors.surface,
          pressedBackground: colors.surfaceVariant,
          borderColor: Colors.transparent,
        );
      case GCardVariant.filled:
        return _CardColors(
          background: colors.surfaceVariant,
          hoverBackground: colors.surfaceContainerHigh,
          pressedBackground: colors.surfaceContainerHighest,
          borderColor: Colors.transparent,
        );
      case GCardVariant.outlined:
        return _CardColors(
          background: colors.surface,
          hoverBackground: colors.surfaceVariant.withValues(alpha: 0.5),
          pressedBackground: colors.surfaceVariant,
          borderColor: colors.outline,
        );
    }
  }
}

class _CardColors {
  const _CardColors({
    required this.background,
    required this.hoverBackground,
    required this.pressedBackground,
    required this.borderColor,
  });

  final Color background;
  final Color hoverBackground;
  final Color pressedBackground;
  final Color borderColor;
}

/// A card with header, body, and footer sections
class GCardSection extends StatelessWidget {
  const GCardSection({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.variant = GCardVariant.elevated,
    this.padding,
    this.headerPadding,
    this.bodyPadding,
    this.footerPadding,
    this.showDividers = false,
    this.onTap,
  });

  /// Header content
  final Widget? header;

  /// Body content
  final Widget body;

  /// Footer content
  final Widget? footer;

  /// Visual variant
  final GCardVariant variant;

  /// Overall padding (applied if section padding not specified)
  final EdgeInsets? padding;

  /// Header padding
  final EdgeInsets? headerPadding;

  /// Body padding
  final EdgeInsets? bodyPadding;

  /// Footer padding
  final EdgeInsets? footerPadding;

  /// Whether to show dividers between sections
  final bool showDividers;

  /// Called when card is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final defaultPadding = padding ?? const EdgeInsets.all(GSpacing.md);

    return GCard(
      variant: variant,
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null) ...[
            Padding(
              padding: headerPadding ?? defaultPadding,
              child: header!,
            ),
            if (showDividers)
              Divider(
                height: 1,
                color: colors.outline.withValues(alpha: 0.2),
              ),
          ],
          Padding(
            padding: bodyPadding ?? defaultPadding,
            child: body,
          ),
          if (footer != null) ...[
            if (showDividers)
              Divider(
                height: 1,
                color: colors.outline.withValues(alpha: 0.2),
              ),
            Padding(
              padding: footerPadding ?? defaultPadding,
              child: footer!,
            ),
          ],
        ],
      ),
    );
  }
}

