import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class BreakpointEditor extends StatelessWidget {
  const BreakpointEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final breakpointEntries = tokenState.breakpoints.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Breakpoint Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define responsive breakpoint widths for different screen sizes. Values are in pixels.',
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.lg),
          Container(
            padding: const EdgeInsets.all(GSpacing.md),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: GBorderRadius.allLg,
              border: Border.all(color: colors.outline.withOpacity(0.2)),
            ),
            child: Column(
              children: breakpointEntries.map((entry) {
                return _BreakpointRow(
                  name: entry.key,
                  value: entry.value,
                  description: _getBreakpointDescription(entry.key),
                  onChanged: (value) => tokenState.updateBreakpoint(entry.key, value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: GSpacing.lg),
          // Visual breakpoint scale
          _BreakpointScale(breakpoints: tokenState.breakpoints.values),
        ],
      ),
    );
  }

  String _getBreakpointDescription(String name) {
    switch (name) {
      case 'xs':
        return 'Extra small (phones portrait)';
      case 'sm':
        return 'Small (phones landscape)';
      case 'md':
        return 'Medium (tablets)';
      case 'lg':
        return 'Large (desktops)';
      case 'xl':
        return 'Extra large (large desktops)';
      case 'xl2':
        return 'XXL (wide screens)';
      default:
        return '';
    }
  }
}

class _BreakpointRow extends StatefulWidget {
  const _BreakpointRow({
    required this.name,
    required this.value,
    required this.description,
    required this.onChanged,
  });

  final String name;
  final double value;
  final String description;
  final void Function(double) onChanged;

  @override
  State<_BreakpointRow> createState() => _BreakpointRowState();
}

class _BreakpointRowState extends State<_BreakpointRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void didUpdateWidget(_BreakpointRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value.toInt().toString();
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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.sm),
      child: Row(
        children: [
          // Name
          SizedBox(
            width: 50,
            child: Text(
              widget.name,
              style: textTheme.labelLarge.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightSemiBold,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.sm),
          // Description
          Expanded(
            child: Text(
              widget.description,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Value input
          SizedBox(
            width: 100,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurface,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.sm,
                  vertical: GSpacing.xs,
                ),
                border: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.primary),
                ),
                suffixText: 'px',
                suffixStyle: textTheme.labelSmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              onChanged: (value) {
                final parsed = double.tryParse(value);
                if (parsed != null) {
                  widget.onChanged(parsed);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakpointScale extends StatelessWidget {
  const _BreakpointScale({required this.breakpoints});

  final Map<String, double> breakpoints;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final sortedEntries = breakpoints.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    final maxValue = sortedEntries.last.value;

    return Container(
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visual Scale',
            style: textTheme.titleSmall.copyWith(
              color: colors.onSurface,
              fontWeight: GTypography.fontWeightMedium,
            ),
          ),
          const SizedBox(height: GSpacing.md),
          ...sortedEntries.map((entry) {
            final width = maxValue > 0 ? (entry.value / maxValue) : 0.0;
            return Padding(
              padding: const EdgeInsets.only(bottom: GSpacing.xs),
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text(
                      entry.key,
                      style: textTheme.labelSmall.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: width.clamp(0.02, 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: colors.primary.withOpacity(0.3),
                            borderRadius: GBorderRadius.allXs,
                            border: Border.all(color: colors.primary),
                          ),
                          child: Center(
                            child: Text(
                              '${entry.value.toInt()}px',
                              style: textTheme.labelSmall.copyWith(
                                color: colors.primary,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

