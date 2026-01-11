import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// Button variants for GButton
enum GButtonVariant {
  /// Solid primary color button
  primary,

  /// Solid secondary color button
  secondary,

  /// Solid tertiary color button
  tertiary,

  /// Button with border only
  outlined,

  /// Button with no background
  ghost,

  /// Red/error colored button for destructive actions
  destructive,

  /// Text link style button
  link,
}

/// Button sizes for GButton
enum GButtonSize {
  /// Extra small button (28px height)
  xs,

  /// Small button (32px height)
  sm,

  /// Medium button (40px height) - Default
  md,

  /// Large button (48px height)
  lg,

  /// Extra large button (56px height)
  xl,
}

/// A customizable button component for the Garmisch design system.
///
/// GButton supports multiple variants, sizes, icons, and states.
///
/// ```dart
/// GButton(
///   label: 'Click me',
///   onPressed: () {},
///   variant: GButtonVariant.primary,
///   size: GButtonSize.md,
/// )
/// ```
class GButton extends StatefulWidget {
  const GButton({
    super.key,
    this.label,
    this.onPressed,
    this.variant = GButtonVariant.primary,
    this.size = GButtonSize.md,
    this.icon,
    this.trailingIcon,
    this.isLoading = false,
    this.isDisabled = false,
    this.isFullWidth = false,
    this.child,
  });

  /// The button text label
  final String? label;

  /// Called when the button is pressed
  final VoidCallback? onPressed;

  /// The visual style variant of the button
  final GButtonVariant variant;

  /// The size of the button
  final GButtonSize size;

  /// Optional leading icon
  final IconData? icon;

  /// Optional trailing icon
  final IconData? trailingIcon;

  /// Whether the button is in a loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Whether the button takes full width
  final bool isFullWidth;

  /// Optional custom child widget (overrides label)
  final Widget? child;

  @override
  State<GButton> createState() => _GButtonState();
}

class _GButtonState extends State<GButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  bool get _isEnabled => !widget.isDisabled && !widget.isLoading && widget.onPressed != null;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);

    final buttonColors = _getButtonColors(theme);
    final dimensions = _getDimensions(theme);

    final borderRadius = BorderRadius.circular(dimensions.borderRadius);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
      child: AnimatedContainer(
        duration: theme.durations.fast,
        curve: theme.easing.easeOut,
        width: widget.isFullWidth ? double.infinity : null,
        height: dimensions.height,
        decoration: BoxDecoration(
          color: _getBackgroundColor(buttonColors),
          borderRadius: borderRadius,
          border: buttonColors.borderColor != null
              ? Border.all(
                  color: _isEnabled
                      ? buttonColors.borderColor!
                      : buttonColors.borderColor!.withValues(alpha: theme.opacity.disabled),
                  width: theme.borderWidth.thin,
                )
              : null,
          boxShadow: _isPressed || !_isEnabled ? null : buttonColors.shadow,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _isEnabled ? widget.onPressed : null,
            onTapDown: _isEnabled ? (_) => setState(() => _isPressed = true) : null,
            onTapCancel: _isEnabled ? () => setState(() => _isPressed = false) : null,
            onHighlightChanged: (highlighted) {
              if (!highlighted && _isPressed) {
                setState(() => _isPressed = false);
              }
            },
            borderRadius: borderRadius,
            splashColor: buttonColors.foregroundColor.withValues(alpha: 0.12),
            highlightColor: buttonColors.foregroundColor.withValues(alpha: 0.08),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: dimensions.horizontalPadding),
              child: Row(
                mainAxisSize: widget.isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.isLoading) ...[
                    SizedBox(
                      width: dimensions.iconSize,
                      height: dimensions.iconSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          buttonColors.foregroundColor,
                        ),
                      ),
                    ),
                    if (widget.label != null || widget.child != null)
                      SizedBox(width: dimensions.iconSpacing),
                  ] else if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: dimensions.iconSize,
                      color: _isEnabled
                          ? buttonColors.foregroundColor
                          : buttonColors.foregroundColor.withValues(alpha: buttonColors.disabledOpacity),
                    ),
                    if (widget.label != null || widget.child != null)
                      SizedBox(width: dimensions.iconSpacing),
                  ],
                  if (widget.child != null)
                    widget.child!
                  else if (widget.label != null)
                    Text(
                      widget.label!,
                      style: dimensions.textStyle.copyWith(
                        color: _isEnabled
                            ? buttonColors.foregroundColor
                            : buttonColors.foregroundColor.withValues(alpha: buttonColors.disabledOpacity),
                      ),
                    ),
                  if (widget.trailingIcon != null && !widget.isLoading) ...[
                    if (widget.label != null || widget.child != null)
                      SizedBox(width: dimensions.iconSpacing),
                    Icon(
                      widget.trailingIcon,
                      size: dimensions.iconSize,
                      color: _isEnabled
                          ? buttonColors.foregroundColor
                          : buttonColors.foregroundColor.withValues(alpha: buttonColors.disabledOpacity),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(_ButtonColors buttonColors) {
    if (!_isEnabled) {
      return buttonColors.backgroundColor.withValues(alpha: buttonColors.disabledOpacity);
    }
    if (_isPressed) {
      return buttonColors.pressedColor ?? buttonColors.backgroundColor;
    }
    if (_isHovered) {
      return buttonColors.hoverColor ?? buttonColors.backgroundColor;
    }
    return buttonColors.backgroundColor;
  }

  _ButtonColors _getButtonColors(GThemeData theme) {
    final colors = theme.colors;
    final opacity = theme.opacity;
    final shadows = theme.shadows;

    switch (widget.variant) {
      case GButtonVariant.primary:
        return _ButtonColors(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          hoverColor: _adjustBrightness(colors.primary, -0.1),
          pressedColor: _adjustBrightness(colors.primary, -0.2),
          shadow: shadows.sm,
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.secondary:
        return _ButtonColors(
          backgroundColor: colors.secondary,
          foregroundColor: colors.onSecondary,
          hoverColor: _adjustBrightness(colors.secondary, -0.1),
          pressedColor: _adjustBrightness(colors.secondary, -0.2),
          shadow: shadows.sm,
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.tertiary:
        return _ButtonColors(
          backgroundColor: colors.tertiary,
          foregroundColor: colors.onTertiary,
          hoverColor: _adjustBrightness(colors.tertiary, -0.1),
          pressedColor: _adjustBrightness(colors.tertiary, -0.2),
          shadow: shadows.sm,
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.outlined:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          hoverColor: colors.primary.withValues(alpha: opacity.hover),
          pressedColor: colors.primary.withValues(alpha: opacity.pressed),
          borderColor: colors.outline,
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.ghost:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          hoverColor: colors.primary.withValues(alpha: opacity.hover),
          pressedColor: colors.primary.withValues(alpha: opacity.pressed),
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.destructive:
        return _ButtonColors(
          backgroundColor: colors.error,
          foregroundColor: colors.onError,
          hoverColor: _adjustBrightness(colors.error, -0.1),
          pressedColor: _adjustBrightness(colors.error, -0.2),
          shadow: shadows.sm,
          disabledOpacity: opacity.disabled,
        );
      case GButtonVariant.link:
        return _ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: colors.primary,
          hoverColor: Colors.transparent,
          pressedColor: Colors.transparent,
          disabledOpacity: opacity.disabled,
        );
    }
  }

  _ButtonDimensions _getDimensions(GThemeData theme) {
    final spacing = theme.spacing;
    final sizing = theme.sizing;
    final borderRadius = theme.borderRadius;
    final typography = theme.typography;

    switch (widget.size) {
      case GButtonSize.xs:
        return _ButtonDimensions(
          height: sizing.buttonHeightXs,
          horizontalPadding: spacing.sm,
          iconSize: sizing.iconXs,
          iconSpacing: spacing.xs3,
          borderRadius: borderRadius.sm,
          textStyle: TextStyle(
            fontSize: typography.fontSizeXs,
            fontWeight: typography.fontWeightMedium,
          ),
        );
      case GButtonSize.sm:
        return _ButtonDimensions(
          height: sizing.buttonHeightSm,
          horizontalPadding: spacing.sm,
          iconSize: sizing.iconSm,
          iconSpacing: spacing.xs3,
          borderRadius: borderRadius.md,
          textStyle: TextStyle(
            fontSize: typography.fontSizeSm,
            fontWeight: typography.fontWeightMedium,
          ),
        );
      case GButtonSize.md:
        return _ButtonDimensions(
          height: sizing.buttonHeightMd,
          horizontalPadding: spacing.md,
          iconSize: sizing.iconMd,
          iconSpacing: spacing.xs,
          borderRadius: borderRadius.md,
          textStyle: TextStyle(
            fontSize: typography.fontSizeSm,
            fontWeight: typography.fontWeightSemiBold,
          ),
        );
      case GButtonSize.lg:
        return _ButtonDimensions(
          height: sizing.buttonHeightLg,
          horizontalPadding: spacing.lg,
          iconSize: sizing.iconMd,
          iconSpacing: spacing.sm,
          borderRadius: borderRadius.lg,
          textStyle: TextStyle(
            fontSize: typography.fontSizeBase,
            fontWeight: typography.fontWeightSemiBold,
          ),
        );
      case GButtonSize.xl:
        return _ButtonDimensions(
          height: sizing.buttonHeightXl,
          horizontalPadding: spacing.xl,
          iconSize: sizing.iconLg,
          iconSpacing: spacing.sm,
          borderRadius: borderRadius.lg,
          textStyle: TextStyle(
            fontSize: typography.fontSizeLg,
            fontWeight: typography.fontWeightSemiBold,
          ),
        );
    }
  }

  Color _adjustBrightness(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    final adjustedLightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(adjustedLightness).toColor();
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.backgroundColor,
    required this.foregroundColor,
    this.hoverColor,
    this.pressedColor,
    this.borderColor,
    this.shadow,
    this.disabledOpacity = 0.5,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final Color? hoverColor;
  final Color? pressedColor;
  final Color? borderColor;
  final List<BoxShadow>? shadow;
  final double disabledOpacity;
}

class _ButtonDimensions {
  const _ButtonDimensions({
    required this.height,
    required this.horizontalPadding,
    required this.iconSize,
    required this.iconSpacing,
    required this.borderRadius,
    required this.textStyle,
  });

  final double height;
  final double horizontalPadding;
  final double iconSize;
  final double iconSpacing;
  final double borderRadius;
  final TextStyle textStyle;
}

