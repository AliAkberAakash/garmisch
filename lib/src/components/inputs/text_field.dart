import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../foundations/typography.dart';
import '../../theme/theme.dart';

/// Text field variants
enum GTextFieldVariant {
  /// Border on all sides
  outlined,

  /// Filled background
  filled,

  /// Bottom border only
  underlined,
}

/// Text field sizes
enum GTextFieldSize {
  /// Small (32px height)
  sm,

  /// Medium (40px height) - Default
  md,

  /// Large (48px height)
  lg,
}

/// A customizable text input component for the Garmisch design system.
///
/// ```dart
/// GTextField(
///   label: 'Email',
///   hint: 'Enter your email',
///   onChanged: (value) => print(value),
/// )
/// ```
class GTextField extends StatefulWidget {
  const GTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.variant = GTextFieldVariant.outlined,
    this.size = GTextFieldSize.md,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.isDisabled = false,
    this.isReadOnly = false,
    this.isRequired = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.validator,
    this.focusNode,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
  });

  /// Text editing controller
  final TextEditingController? controller;

  /// Label text displayed above the field
  final String? label;

  /// Placeholder text
  final String? hint;

  /// Helper text displayed below the field
  final String? helperText;

  /// Error message (when set, field shows error state)
  final String? errorText;

  /// Visual style variant
  final GTextFieldVariant variant;

  /// Size of the text field
  final GTextFieldSize size;

  /// Icon displayed at the start
  final IconData? prefixIcon;

  /// Icon displayed at the end
  final IconData? suffixIcon;

  /// Widget displayed at the start
  final Widget? prefix;

  /// Widget displayed at the end
  final Widget? suffix;

  /// Whether the field is disabled
  final bool isDisabled;

  /// Whether the field is read-only
  final bool isReadOnly;

  /// Whether the field is required
  final bool isRequired;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Maximum number of lines
  final int maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum character length
  final int? maxLength;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Called when text changes
  final ValueChanged<String>? onChanged;

  /// Called when submitted
  final ValueChanged<String>? onSubmitted;

  /// Called when field is tapped
  final VoidCallback? onTap;

  /// Validation function
  final String? Function(String?)? validator;

  /// Focus node
  final FocusNode? focusNode;

  /// Whether to autofocus
  final bool autofocus;

  /// Whether to enable autocorrect
  final bool autocorrect;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  @override
  State<GTextField> createState() => _GTextFieldState();
}

class _GTextFieldState extends State<GTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;
  bool _isHovered = false;
  String? _errorText;

  bool get _hasError => widget.errorText != null || _errorText != null;
  String? get _displayError => widget.errorText ?? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    } else {
      _focusNode.removeListener(_onFocusChange);
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final opacity = theme.opacity;
    final spacing = theme.spacing;

    final dimensions = _getDimensions(theme);
    final fieldColors = _getFieldColors(colors);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Row(
            children: [
              Text(
                widget.label!,
                style: textTheme.labelMedium.copyWith(
                  color: widget.isDisabled
                      ? colors.onSurface.withValues(alpha: opacity.disabled)
                      : colors.onSurface,
                ),
              ),
              if (widget.isRequired)
                Text(
                  ' *',
                  style: textTheme.labelMedium.copyWith(
                    color: colors.error,
                  ),
                ),
            ],
          ),
          SizedBox(height: spacing.xs),
        ],

        // Input field
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: theme.durations.fast,
            curve: theme.easing.easeOut,
            height: widget.maxLines > 1 ? null : dimensions.height,
            constraints: widget.maxLines > 1
                ? BoxConstraints(minHeight: dimensions.height)
                : null,
            decoration: _buildDecoration(fieldColors, dimensions, theme),
            child: Row(
              children: [
                // Prefix icon
                if (widget.prefixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: dimensions.horizontalPadding,
                      right: spacing.xs,
                    ),
                    child: Icon(
                      widget.prefixIcon,
                      size: dimensions.iconSize,
                      color: widget.isDisabled
                          ? colors.onSurface.withValues(alpha: opacity.disabled)
                          : colors.onSurfaceVariant,
                    ),
                  ),

                // Prefix widget
                if (widget.prefix != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: dimensions.horizontalPadding,
                      right: spacing.xs,
                    ),
                    child: widget.prefix!,
                  ),

                // Text field
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    enabled: !widget.isDisabled,
                    readOnly: widget.isReadOnly,
                    obscureText: widget.obscureText,
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    maxLength: widget.maxLength,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    inputFormatters: widget.inputFormatters,
                    autofocus: widget.autofocus,
                    autocorrect: widget.autocorrect,
                    enableSuggestions: widget.enableSuggestions,
                    style: dimensions.textStyle.copyWith(
                      color: widget.isDisabled
                          ? colors.onSurface.withValues(alpha: opacity.disabled)
                          : colors.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                      hintStyle: dimensions.textStyle.copyWith(
                        color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: widget.prefixIcon != null || widget.prefix != null
                            ? 0
                            : dimensions.horizontalPadding,
                        vertical: dimensions.verticalPadding,
                      ),
                      isDense: true,
                      counterText: '',
                    ),
                    onChanged: (value) {
                      if (widget.validator != null) {
                        setState(() {
                          _errorText = widget.validator!(value);
                        });
                      }
                      widget.onChanged?.call(value);
                    },
                    onSubmitted: widget.onSubmitted,
                    onTap: widget.onTap,
                  ),
                ),

                // Suffix widget
                if (widget.suffix != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: spacing.xs,
                      right: dimensions.horizontalPadding,
                    ),
                    child: widget.suffix!,
                  ),

                // Suffix icon
                if (widget.suffixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: spacing.xs,
                      right: dimensions.horizontalPadding,
                    ),
                    child: Icon(
                      widget.suffixIcon,
                      size: dimensions.iconSize,
                      color: widget.isDisabled
                          ? colors.onSurface.withValues(alpha: opacity.disabled)
                          : colors.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Helper/Error text
        if (widget.helperText != null || _displayError != null) ...[
          SizedBox(height: spacing.xs3),
          Text(
            _displayError ?? widget.helperText!,
            style: textTheme.bodySmall.copyWith(
              color: _hasError
                  ? colors.error
                  : colors.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  BoxDecoration _buildDecoration(_FieldColors fieldColors, _FieldDimensions dimensions, GThemeData theme) {
    final borderWidth = theme.borderWidth;
    final opacity = theme.opacity;

    Color borderColor;
    if (widget.isDisabled) {
      borderColor = fieldColors.borderColor.withValues(alpha: opacity.disabled);
    } else if (_hasError) {
      borderColor = fieldColors.errorBorderColor;
    } else if (_isFocused) {
      borderColor = fieldColors.focusBorderColor;
    } else if (_isHovered) {
      borderColor = fieldColors.hoverBorderColor;
    } else {
      borderColor = fieldColors.borderColor;
    }

    switch (widget.variant) {
      case GTextFieldVariant.outlined:
        return BoxDecoration(
          color: fieldColors.backgroundColor,
          borderRadius: BorderRadius.circular(dimensions.borderRadius),
          border: Border.all(
            color: borderColor,
            width: _isFocused ? borderWidth.medium : borderWidth.thin,
          ),
        );
      case GTextFieldVariant.filled:
        return BoxDecoration(
          color: widget.isDisabled
              ? fieldColors.disabledBackgroundColor
              : fieldColors.filledBackgroundColor,
          borderRadius: BorderRadius.circular(dimensions.borderRadius),
          border: Border.all(
            color: _isFocused || _hasError ? borderColor : Colors.transparent,
            width: _isFocused ? borderWidth.medium : borderWidth.thin,
          ),
        );
      case GTextFieldVariant.underlined:
        return BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: _isFocused ? borderWidth.medium : borderWidth.thin,
            ),
          ),
        );
    }
  }

  _FieldColors _getFieldColors(GColorScheme colors) {
    return _FieldColors(
      backgroundColor: colors.surface,
      filledBackgroundColor: colors.surfaceVariant,
      disabledBackgroundColor: colors.surfaceVariant.withValues(alpha: 0.5),
      borderColor: colors.outline,
      hoverBorderColor: colors.onSurface,
      focusBorderColor: colors.primary,
      errorBorderColor: colors.error,
    );
  }

  _FieldDimensions _getDimensions(GThemeData theme) {
    final spacing = theme.spacing;
    final sizing = theme.sizing;
    final borderRadius = theme.borderRadius;

    switch (widget.size) {
      case GTextFieldSize.sm:
        return _FieldDimensions(
          height: sizing.inputHeightSm,
          horizontalPadding: spacing.sm,
          verticalPadding: spacing.xs,
          iconSize: sizing.iconSm,
          borderRadius: borderRadius.sm,
          textStyle: const TextStyle(
            fontSize: GTypography.fontSizeSm,
          ),
        );
      case GTextFieldSize.md:
        return _FieldDimensions(
          height: sizing.inputHeightMd,
          horizontalPadding: spacing.sm,
          verticalPadding: spacing.sm,
          iconSize: sizing.iconMd,
          borderRadius: borderRadius.md,
          textStyle: const TextStyle(
            fontSize: GTypography.fontSizeBase,
          ),
        );
      case GTextFieldSize.lg:
        return _FieldDimensions(
          height: sizing.inputHeightLg,
          horizontalPadding: spacing.md,
          verticalPadding: spacing.sm,
          iconSize: sizing.iconLg,
          borderRadius: borderRadius.md,
          textStyle: const TextStyle(
            fontSize: GTypography.fontSizeLg,
          ),
        );
    }
  }
}

class _FieldColors {
  const _FieldColors({
    required this.backgroundColor,
    required this.filledBackgroundColor,
    required this.disabledBackgroundColor,
    required this.borderColor,
    required this.hoverBorderColor,
    required this.focusBorderColor,
    required this.errorBorderColor,
  });

  final Color backgroundColor;
  final Color filledBackgroundColor;
  final Color disabledBackgroundColor;
  final Color borderColor;
  final Color hoverBorderColor;
  final Color focusBorderColor;
  final Color errorBorderColor;
}

class _FieldDimensions {
  const _FieldDimensions({
    required this.height,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.iconSize,
    required this.borderRadius,
    required this.textStyle,
  });

  final double height;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSize;
  final double borderRadius;
  final TextStyle textStyle;
}

