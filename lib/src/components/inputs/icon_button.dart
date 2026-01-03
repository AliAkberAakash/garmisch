import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Icon button variants
enum GIconButtonVariant {
  /// No background
  standard,

  /// Solid background
  filled,

  /// Tonal (muted) background
  filledTonal,

  /// Border only
  outlined,
}

/// Icon button sizes
enum GIconButtonSize {
  /// Extra small (24px)
  xs,

  /// Small (32px)
  sm,

  /// Medium (40px) - Default
  md,

  /// Large (48px)
  lg,

  /// Extra large (56px)
  xl,
}

/// An icon-only button component for the Garmisch design system.
///
/// ```dart
/// GIconButton(
///   icon: Icons.add,
///   onPressed: () {},
///   variant: GIconButtonVariant.filled,
/// )
/// ```
class GIconButton extends StatefulWidget {
  const GIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = GIconButtonVariant.standard,
    this.size = GIconButtonSize.md,
    this.isDisabled = false,
    this.tooltip,
    this.color,
  });

  /// The icon to display
  final IconData icon;

  /// Called when the button is pressed
  final VoidCallback? onPressed;

  /// The visual style variant
  final GIconButtonVariant variant;

  /// The size of the button
  final GIconButtonSize size;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Optional tooltip text
  final String? tooltip;

  /// Optional custom color
  final Color? color;

  @override
  State<GIconButton> createState() => _GIconButtonState();
}

class _GIconButtonState extends State<GIconButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isEnabled => !widget.isDisabled && widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final buttonColors = _getButtonColors(colors);
    final dimensions = _getDimensions();

    Widget button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTapDown: _isEnabled ? (_) => setState(() => _isPressed = true) : null,
        onTapUp: _isEnabled ? (_) => setState(() => _isPressed = false) : null,
        onTapCancel: _isEnabled ? () => setState(() => _isPressed = false) : null,
        onTap: _isEnabled ? widget.onPressed : null,
        child: AnimatedContainer(
          duration: GDurations.fast,
          curve: GEasing.easeOut,
          width: dimensions.size,
          height: dimensions.size,
          decoration: BoxDecoration(
            color: _getBackgroundColor(buttonColors),
            borderRadius: BorderRadius.circular(dimensions.size / 2),
            border: buttonColors.borderColor != null
                ? Border.all(
                    color: _isEnabled
                        ? buttonColors.borderColor!
                        : buttonColors.borderColor!.withValues(alpha: GOpacity.disabled),
                    width: GBorderWidth.thin,
                  )
                : null,
          ),
          child: Center(
            child: Icon(
              widget.icon,
              size: dimensions.iconSize,
              color: _isEnabled
                  ? buttonColors.foregroundColor
                  : buttonColors.foregroundColor.withValues(alpha: GOpacity.disabled),
            ),
          ),
        ),
      ),
    );

    if (widget.tooltip != null) {
      button = Tooltip(
        message: widget.tooltip!,
        child: button,
      );
    }

    return button;
  }

  Color _getBackgroundColor(_IconButtonColors buttonColors) {
    if (!_isEnabled) {
      if (buttonColors.backgroundColor == Colors.transparent) {
        return Colors.transparent;
      }
      return buttonColors.backgroundColor.withValues(alpha: GOpacity.disabled);
    }
    if (_isPressed) {
      return buttonColors.pressedColor ?? buttonColors.backgroundColor;
    }
    if (_isHovered) {
      return buttonColors.hoverColor ?? buttonColors.backgroundColor;
    }
    return buttonColors.backgroundColor;
  }

  _IconButtonColors _getButtonColors(GColorScheme colors) {
    final customColor = widget.color;

    switch (widget.variant) {
      case GIconButtonVariant.standard:
        return _IconButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: customColor ?? colors.onSurfaceVariant,
          hoverColor: (customColor ?? colors.onSurfaceVariant).withValues(alpha: GOpacity.hover),
          pressedColor: (customColor ?? colors.onSurfaceVariant).withValues(alpha: GOpacity.pressed),
        );
      case GIconButtonVariant.filled:
        return _IconButtonColors(
          backgroundColor: customColor ?? colors.primary,
          foregroundColor: colors.onPrimary,
          hoverColor: _adjustBrightness(customColor ?? colors.primary, -0.1),
          pressedColor: _adjustBrightness(customColor ?? colors.primary, -0.2),
        );
      case GIconButtonVariant.filledTonal:
        return _IconButtonColors(
          backgroundColor: (customColor ?? colors.primary).withValues(alpha: 0.12),
          foregroundColor: customColor ?? colors.primary,
          hoverColor: (customColor ?? colors.primary).withValues(alpha: 0.16),
          pressedColor: (customColor ?? colors.primary).withValues(alpha: 0.20),
        );
      case GIconButtonVariant.outlined:
        return _IconButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: customColor ?? colors.onSurfaceVariant,
          hoverColor: (customColor ?? colors.onSurfaceVariant).withValues(alpha: GOpacity.hover),
          pressedColor: (customColor ?? colors.onSurfaceVariant).withValues(alpha: GOpacity.pressed),
          borderColor: colors.outline,
        );
    }
  }

  _IconButtonDimensions _getDimensions() {
    switch (widget.size) {
      case GIconButtonSize.xs:
        return const _IconButtonDimensions(size: 24, iconSize: 14);
      case GIconButtonSize.sm:
        return const _IconButtonDimensions(size: 32, iconSize: 18);
      case GIconButtonSize.md:
        return const _IconButtonDimensions(size: 40, iconSize: 20);
      case GIconButtonSize.lg:
        return const _IconButtonDimensions(size: 48, iconSize: 24);
      case GIconButtonSize.xl:
        return const _IconButtonDimensions(size: 56, iconSize: 28);
    }
  }

  Color _adjustBrightness(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final adjustedLightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(adjustedLightness).toColor();
  }
}

class _IconButtonColors {
  const _IconButtonColors({
    required this.backgroundColor,
    required this.foregroundColor,
    this.hoverColor,
    this.pressedColor,
    this.borderColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? borderColor;
}

class _IconButtonDimensions {
  const _IconButtonDimensions({
    required this.size,
    required this.iconSize,
  });

  final double size;
  final double iconSize;
}

