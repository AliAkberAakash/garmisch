import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Dropdown size options
enum GDropdownSize {
  /// Small dropdown
  sm,

  /// Medium dropdown - Default
  md,

  /// Large dropdown
  lg,
}

/// A customizable dropdown component for the Garmisch design system.
///
/// ```dart
/// GDropdown<String>(
///   value: selectedValue,
///   items: ['Option 1', 'Option 2', 'Option 3'],
///   onChanged: (value) => setState(() => selectedValue = value),
///   itemBuilder: (item) => Text(item),
/// )
/// ```
class GDropdown<T> extends StatefulWidget {
  const GDropdown({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    this.itemBuilder,
    this.itemLabelBuilder,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.size = GDropdownSize.md,
    this.isDisabled = false,
    this.isRequired = false,
    this.prefixIcon,
    this.isFullWidth = true,
  });

  /// Currently selected value
  final T? value;

  /// List of items
  final List<T> items;

  /// Called when selection changes
  final ValueChanged<T?>? onChanged;

  /// Custom item widget builder
  final Widget Function(T item)? itemBuilder;

  /// Item label builder (for simple text)
  final String Function(T item)? itemLabelBuilder;

  /// Label text
  final String? label;

  /// Hint text when no selection
  final String? hint;

  /// Helper text
  final String? helperText;

  /// Error text
  final String? errorText;

  /// Dropdown size
  final GDropdownSize size;

  /// Whether the dropdown is disabled
  final bool isDisabled;

  /// Whether the field is required
  final bool isRequired;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Whether to take full width
  final bool isFullWidth;

  @override
  State<GDropdown<T>> createState() => _GDropdownState<T>();
}

class _GDropdownState<T> extends State<GDropdown<T>> {
  bool _isOpen = false;
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final _focusNode = FocusNode();

  bool get _hasError => widget.errorText != null;

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    if (widget.isDisabled) return;
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = _createOverlay();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  void _selectItem(T item) {
    widget.onChanged?.call(item);
    _removeOverlay();
  }

  OverlayEntry _createOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 4),
          child: TapRegion(
            onTapOutside: (_) => _removeOverlay(),
            child: _DropdownMenu<T>(
              items: widget.items,
              selectedValue: widget.value,
              onSelect: _selectItem,
              itemBuilder: widget.itemBuilder,
              itemLabelBuilder: widget.itemLabelBuilder,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final dimensions = _getDimensions();

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
                      ? colors.onSurface.withValues(alpha: GOpacity.disabled)
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
          const SizedBox(height: GSpacing.xs),
        ],

        // Dropdown button
        CompositedTransformTarget(
          link: _layerLink,
          child: GestureDetector(
            onTap: _toggleDropdown,
            child: MouseRegion(
              cursor: widget.isDisabled
                  ? SystemMouseCursors.forbidden
                  : SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: GDurations.fast,
                height: dimensions.height,
                width: widget.isFullWidth ? double.infinity : null,
                padding: EdgeInsets.symmetric(
                  horizontal: dimensions.horizontalPadding,
                ),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(dimensions.borderRadius),
                  border: Border.all(
                    color: _hasError
                        ? colors.error
                        : _isOpen
                            ? colors.primary
                            : colors.outline,
                    width: _isOpen ? GBorderWidth.medium : GBorderWidth.thin,
                  ),
                ),
                child: Row(
                  children: [
                    if (widget.prefixIcon != null) ...[
                      Icon(
                        widget.prefixIcon,
                        size: dimensions.iconSize,
                        color: widget.isDisabled
                            ? colors.onSurface.withValues(alpha: GOpacity.disabled)
                            : colors.onSurfaceVariant,
                      ),
                      SizedBox(width: dimensions.iconSpacing),
                    ],
                    Expanded(
                      child: widget.value != null
                          ? _buildSelectedValue(colors, textTheme, dimensions)
                          : Text(
                              widget.hint ?? 'Select...',
                              style: TextStyle(
                                fontSize: dimensions.fontSize,
                                color: colors.onSurfaceVariant.withValues(alpha: 0.6),
                              ),
                            ),
                    ),
                    AnimatedRotation(
                      turns: _isOpen ? 0.5 : 0,
                      duration: GDurations.fast,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: dimensions.iconSize,
                        color: widget.isDisabled
                            ? colors.onSurface.withValues(alpha: GOpacity.disabled)
                            : colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Helper/Error text
        if (widget.helperText != null || widget.errorText != null) ...[
          const SizedBox(height: GSpacing.xs3),
          Text(
            widget.errorText ?? widget.helperText!,
            style: textTheme.bodySmall.copyWith(
              color: _hasError ? colors.error : colors.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSelectedValue(
    GColorScheme colors,
    GTextTheme textTheme,
    _DropdownDimensions dimensions,
  ) {
    if (widget.itemBuilder != null) {
      return widget.itemBuilder!(widget.value as T);
    }
    final label = widget.itemLabelBuilder?.call(widget.value as T) ??
        widget.value.toString();
    return Text(
      label,
      style: TextStyle(
        fontSize: dimensions.fontSize,
        color: widget.isDisabled
            ? colors.onSurface.withValues(alpha: GOpacity.disabled)
            : colors.onSurface,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  _DropdownDimensions _getDimensions() {
    switch (widget.size) {
      case GDropdownSize.sm:
        return const _DropdownDimensions(
          height: GSizing.inputHeightSm,
          horizontalPadding: GSpacing.sm,
          fontSize: GTypography.fontSizeSm,
          iconSize: 18,
          iconSpacing: GSpacing.xs,
          borderRadius: GBorderRadius.sm,
        );
      case GDropdownSize.md:
        return const _DropdownDimensions(
          height: GSizing.inputHeightMd,
          horizontalPadding: GSpacing.sm,
          fontSize: GTypography.fontSizeBase,
          iconSize: 20,
          iconSpacing: GSpacing.xs,
          borderRadius: GBorderRadius.md,
        );
      case GDropdownSize.lg:
        return const _DropdownDimensions(
          height: GSizing.inputHeightLg,
          horizontalPadding: GSpacing.md,
          fontSize: GTypography.fontSizeLg,
          iconSize: 24,
          iconSpacing: GSpacing.sm,
          borderRadius: GBorderRadius.md,
        );
    }
  }
}

class _DropdownDimensions {
  const _DropdownDimensions({
    required this.height,
    required this.horizontalPadding,
    required this.fontSize,
    required this.iconSize,
    required this.iconSpacing,
    required this.borderRadius,
  });

  final double height;
  final double horizontalPadding;
  final double fontSize;
  final double iconSize;
  final double iconSpacing;
  final double borderRadius;
}

class _DropdownMenu<T> extends StatelessWidget {
  const _DropdownMenu({
    required this.items,
    required this.selectedValue,
    required this.onSelect,
    this.itemBuilder,
    this.itemLabelBuilder,
  });

  final List<T> items;
  final T? selectedValue;
  final ValueChanged<T> onSelect;
  final Widget Function(T item)? itemBuilder;
  final String Function(T item)? itemLabelBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Material(
      color: colors.surface,
      elevation: 8,
      borderRadius: GBorderRadius.allMd,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        decoration: BoxDecoration(
          borderRadius: GBorderRadius.allMd,
          border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final isSelected = item == selectedValue;

            return InkWell(
              onTap: () => onSelect(item),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.md,
                  vertical: GSpacing.sm,
                ),
                color: isSelected
                    ? colors.primary.withValues(alpha: 0.08)
                    : null,
                child: Row(
                  children: [
                    Expanded(
                      child: itemBuilder != null
                          ? itemBuilder!(item)
                          : Text(
                              itemLabelBuilder?.call(item) ?? item.toString(),
                              style: textTheme.bodyMedium.copyWith(
                                color: isSelected
                                    ? colors.primary
                                    : colors.onSurface,
                                fontWeight: isSelected
                                    ? GTypography.fontWeightMedium
                                    : GTypography.fontWeightRegular,
                              ),
                            ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons.check,
                        size: 18,
                        color: colors.primary,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

