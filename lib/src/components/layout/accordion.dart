import 'package:flutter/material.dart';

import '../../foundations/spacing.dart';
import '../../foundations/border_radius.dart';
import '../../foundations/durations.dart';
import '../../foundations/easing.dart';
import '../../foundations/opacity.dart';
import '../../theme/theme.dart';

/// An accordion/expandable panel component.
///
/// ```dart
/// GAccordion(
///   items: [
///     GAccordionItem(title: 'Section 1', content: Text('Content 1')),
///     GAccordionItem(title: 'Section 2', content: Text('Content 2')),
///   ],
/// )
/// ```
class GAccordion extends StatefulWidget {
  const GAccordion({
    super.key,
    required this.items,
    this.allowMultiple = false,
    this.initialExpandedIndex,
    this.dividerColor,
  });

  /// Accordion items
  final List<GAccordionItem> items;

  /// Whether to allow multiple panels open at once
  final bool allowMultiple;

  /// Initially expanded index
  final int? initialExpandedIndex;

  /// Divider color
  final Color? dividerColor;

  @override
  State<GAccordion> createState() => _GAccordionState();
}

class _GAccordionState extends State<GAccordion> {
  late Set<int> _expandedIndices;

  @override
  void initState() {
    super.initState();
    _expandedIndices = widget.initialExpandedIndex != null
        ? {widget.initialExpandedIndex!}
        : {};
  }

  void _toggleItem(int index) {
    setState(() {
      if (_expandedIndices.contains(index)) {
        _expandedIndices.remove(index);
      } else {
        if (!widget.allowMultiple) {
          _expandedIndices.clear();
        }
        _expandedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Column(
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isExpanded = _expandedIndices.contains(index);
        final isFirst = index == 0;
        final isLast = index == widget.items.length - 1;

        return _AccordionPanel(
          item: item,
          isExpanded: isExpanded,
          isFirst: isFirst,
          isLast: isLast,
          onToggle: () => _toggleItem(index),
          dividerColor: widget.dividerColor ?? colors.outline.withValues(alpha: 0.2),
        );
      }),
    );
  }
}

/// Accordion item data
class GAccordionItem {
  const GAccordionItem({
    required this.title,
    this.titleWidget,
    required this.content,
    this.leading,
    this.isDisabled = false,
  });

  final String title;
  final Widget? titleWidget;
  final Widget content;
  final Widget? leading;
  final bool isDisabled;
}

class _AccordionPanel extends StatefulWidget {
  const _AccordionPanel({
    required this.item,
    required this.isExpanded,
    required this.isFirst,
    required this.isLast,
    required this.onToggle,
    required this.dividerColor,
  });

  final GAccordionItem item;
  final bool isExpanded;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onToggle;
  final Color dividerColor;

  @override
  State<_AccordionPanel> createState() => _AccordionPanelState();
}

class _AccordionPanelState extends State<_AccordionPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: GDurations.normal,
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: GEasing.easeOut,
    );
    _iconTurns = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: GEasing.easeOut),
    );

    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_AccordionPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        InkWell(
          onTap: widget.item.isDisabled ? null : widget.onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GSpacing.md,
              vertical: GSpacing.md,
            ),
            child: Row(
              children: [
                if (widget.item.leading != null) ...[
                  widget.item.leading!,
                  const SizedBox(width: GSpacing.md),
                ],
                Expanded(
                  child: widget.item.titleWidget ??
                      Text(
                        widget.item.title,
                        style: textTheme.titleSmall.copyWith(
                          color: widget.item.isDisabled
                              ? colors.onSurface.withValues(alpha: GOpacity.disabled)
                              : colors.onSurface,
                          fontWeight: widget.isExpanded
                              ? theme.typography.fontWeightMedium
                              : theme.typography.fontWeightRegular,
                        ),
                      ),
                ),
                RotationTransition(
                  turns: _iconTurns,
                  child: Icon(
                    Icons.expand_more,
                    color: widget.item.isDisabled
                        ? colors.onSurfaceVariant.withValues(alpha: GOpacity.disabled)
                        : colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Content
        ClipRect(
          child: AnimatedBuilder(
            animation: _heightFactor,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topCenter,
                heightFactor: _heightFactor.value,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                GSpacing.md,
                0,
                GSpacing.md,
                GSpacing.md,
              ),
              child: widget.item.content,
            ),
          ),
        ),

        // Divider
        if (!widget.isLast)
          Divider(
            height: 1,
            thickness: 1,
            color: widget.dividerColor,
          ),
      ],
    );
  }
}

/// A single expansion tile component.
///
/// ```dart
/// GExpansionTile(
///   title: 'Expandable Section',
///   children: [
///     Text('Content here'),
///   ],
/// )
/// ```
class GExpansionTile extends StatefulWidget {
  const GExpansionTile({
    super.key,
    required this.title,
    this.titleWidget,
    this.subtitle,
    this.leading,
    this.trailing,
    this.children = const [],
    this.initiallyExpanded = false,
    this.onExpansionChanged,
    this.padding,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
  });

  final String title;
  final Widget? titleWidget;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final List<Widget> children;
  final bool initiallyExpanded;
  final ValueChanged<bool>? onExpansionChanged;
  final EdgeInsets? padding;
  final EdgeInsets? childrenPadding;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;

  @override
  State<GExpansionTile> createState() => _GExpansionTileState();
}

class _GExpansionTileState extends State<GExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;
  late Animation<double> _iconTurns;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: GDurations.normal,
      vsync: this,
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: GEasing.easeOut,
    );
    _iconTurns = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: GEasing.easeOut),
    );

    _isExpanded = widget.initiallyExpanded;
    if (_isExpanded) {
      _controller.value = 1.0;
    }
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
      widget.onExpansionChanged?.call(_isExpanded);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return AnimatedContainer(
      duration: GDurations.fast,
      decoration: BoxDecoration(
        color: _isExpanded
            ? widget.backgroundColor ?? colors.surface
            : widget.collapsedBackgroundColor ?? colors.surface,
        borderRadius: GBorderRadius.allMd,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: _handleTap,
            borderRadius: GBorderRadius.allMd,
            child: Padding(
              padding: widget.padding ??
                  const EdgeInsets.all(GSpacing.md),
              child: Row(
                children: [
                  if (widget.leading != null) ...[
                    widget.leading!,
                    const SizedBox(width: GSpacing.md),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.titleWidget ??
                            Text(
                              widget.title,
                              style: textTheme.titleSmall.copyWith(
                                color: colors.onSurface,
                              ),
                            ),
                        if (widget.subtitle != null)
                          Text(
                            widget.subtitle!,
                            style: textTheme.bodySmall.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.trailing != null)
                    widget.trailing!
                  else
                    RotationTransition(
                      turns: _iconTurns,
                      child: Icon(
                        Icons.expand_more,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ),
          ClipRect(
            child: AnimatedBuilder(
              animation: _heightFactor,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _heightFactor.value,
                  child: child,
                );
              },
              child: Padding(
                padding: widget.childrenPadding ??
                    const EdgeInsets.fromLTRB(
                      GSpacing.md,
                      0,
                      GSpacing.md,
                      GSpacing.md,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: widget.children,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

