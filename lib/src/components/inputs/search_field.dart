import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// A search field component.
///
/// ```dart
/// GSearchField(
///   hint: 'Search products...',
///   onChanged: (value) => _search(value),
///   onSubmitted: (value) => _performSearch(value),
/// )
/// ```
class GSearchField extends StatefulWidget {
  const GSearchField({
    super.key,
    this.controller,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.isLoading = false,
    this.autofocus = false,
    this.size = GSearchFieldSize.md,
    this.variant = GSearchFieldVariant.filled,
  });

  /// Text controller
  final TextEditingController? controller;

  /// Placeholder hint
  final String hint;

  /// Called when text changes
  final ValueChanged<String>? onChanged;

  /// Called when search is submitted
  final ValueChanged<String>? onSubmitted;

  /// Called when clear button is pressed
  final VoidCallback? onClear;

  /// Show loading indicator
  final bool isLoading;

  /// Auto focus on mount
  final bool autofocus;

  /// Field size
  final GSearchFieldSize size;

  /// Field variant
  final GSearchFieldVariant variant;

  @override
  State<GSearchField> createState() => _GSearchFieldState();
}

class _GSearchFieldState extends State<GSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
  }

  void _clear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final spacing = theme.spacing;
    final borderRadius = theme.borderRadius;
    final borderWidth = theme.borderWidth;

    final dimensions = _getDimensions(theme);

    return TextField(
      controller: _controller,
      autofocus: widget.autofocus,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      style: TextStyle(
        fontSize: dimensions.fontSize,
        color: colors.onSurface,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: dimensions.fontSize,
          color: colors.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: Icon(
            Icons.search,
            size: dimensions.iconSize,
            color: colors.onSurfaceVariant,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: dimensions.iconSize + 24,
        ),
        suffixIcon: widget.isLoading
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: dimensions.iconSize,
                  height: dimensions.iconSize,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: colors.primary,
                  ),
                ),
              )
            : _hasText
                ? IconButton(
                    icon: Icon(
                      Icons.close,
                      size: dimensions.iconSize,
                      color: colors.onSurfaceVariant,
                    ),
                    onPressed: _clear,
                  )
                : null,
        filled: widget.variant == GSearchFieldVariant.filled,
        fillColor: colors.surfaceVariant.withValues(alpha: 0.5),
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: dimensions.verticalPadding,
        ),
        border: _buildBorder(colors, borderRadius, borderWidth),
        enabledBorder: _buildBorder(colors, borderRadius, borderWidth),
        focusedBorder: _buildBorder(colors, borderRadius, borderWidth, focused: true),
      ),
    );
  }

  InputBorder _buildBorder(
    GColorScheme colors,
    GBorderRadiusTokens borderRadius,
    GBorderWidthTokens borderWidth, {
    bool focused = false,
  }) {
    switch (widget.variant) {
      case GSearchFieldVariant.outlined:
        return OutlineInputBorder(
          borderRadius: borderRadius.allFull,
          borderSide: BorderSide(
            color: focused ? colors.primary : colors.outline,
            width: focused ? borderWidth.medium : borderWidth.thin,
          ),
        );
      case GSearchFieldVariant.filled:
        return OutlineInputBorder(
          borderRadius: borderRadius.allFull,
          borderSide: BorderSide.none,
        );
    }
  }

  _SearchFieldDimensions _getDimensions(GThemeData theme) {
    final typography = theme.typography;
    switch (widget.size) {
      case GSearchFieldSize.sm:
        return _SearchFieldDimensions(
          height: 36,
          fontSize: typography.fontSizeSm,
          iconSize: 18,
          verticalPadding: 8,
        );
      case GSearchFieldSize.md:
        return _SearchFieldDimensions(
          height: 44,
          fontSize: typography.fontSizeBase,
          iconSize: 20,
          verticalPadding: 12,
        );
      case GSearchFieldSize.lg:
        return _SearchFieldDimensions(
          height: 52,
          fontSize: typography.fontSizeLg,
          iconSize: 24,
          verticalPadding: 14,
        );
    }
  }
}

/// Search field size options
enum GSearchFieldSize { sm, md, lg }

/// Search field variant options
enum GSearchFieldVariant { outlined, filled }

class _SearchFieldDimensions {
  const _SearchFieldDimensions({
    required this.height,
    required this.fontSize,
    required this.iconSize,
    required this.verticalPadding,
  });

  final double height;
  final double fontSize;
  final double iconSize;
  final double verticalPadding;
}

/// A link component for text navigation.
///
/// ```dart
/// GLink(
///   text: 'Learn more',
///   onTap: () => openUrl(),
/// )
/// ```
class GLink extends StatefulWidget {
  const GLink({
    super.key,
    required this.text,
    this.onTap,
    this.href,
    this.variant = GLinkVariant.primary,
    this.size = GLinkSize.md,
    this.isExternal = false,
    this.isDisabled = false,
  });

  /// Link text
  final String text;

  /// Tap handler
  final VoidCallback? onTap;

  /// URL (for semantics)
  final String? href;

  /// Link variant
  final GLinkVariant variant;

  /// Link size
  final GLinkSize size;

  /// Whether link opens externally
  final bool isExternal;

  /// Whether link is disabled
  final bool isDisabled;

  @override
  State<GLink> createState() => _GLinkState();
}

class _GLinkState extends State<GLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final opacity = theme.opacity;
    final typography = theme.typography;

    final color = _getColor(colors);
    final fontSize = _getFontSize(typography);

    return MouseRegion(
      onEnter: widget.isDisabled ? null : (_) => setState(() => _isHovered = true),
      onExit: widget.isDisabled ? null : (_) => setState(() => _isHovered = false),
      cursor: widget.isDisabled
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isDisabled ? null : widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: fontSize,
                color: widget.isDisabled
                    ? color.withValues(alpha: opacity.disabled)
                    : color,
                decoration: _isHovered ? TextDecoration.underline : null,
                decorationColor: color,
                fontWeight: typography.fontWeightMedium,
              ),
            ),
            if (widget.isExternal) ...[
              const SizedBox(width: 4),
              Icon(
                Icons.open_in_new,
                size: fontSize,
                color: widget.isDisabled
                    ? color.withValues(alpha: opacity.disabled)
                    : color,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getColor(GColorScheme colors) {
    switch (widget.variant) {
      case GLinkVariant.primary:
        return colors.primary;
      case GLinkVariant.secondary:
        return colors.secondary;
      case GLinkVariant.neutral:
        return colors.onSurface;
    }
  }

  double _getFontSize(GTypographyTokens typography) {
    switch (widget.size) {
      case GLinkSize.sm:
        return typography.fontSizeSm;
      case GLinkSize.md:
        return typography.fontSizeBase;
      case GLinkSize.lg:
        return typography.fontSizeLg;
    }
  }
}

/// Link variant options
enum GLinkVariant { primary, secondary, neutral }

/// Link size options
enum GLinkSize { sm, md, lg }

