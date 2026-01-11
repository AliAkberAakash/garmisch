import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class SizingEditor extends StatelessWidget {
  const SizingEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final sizingEntries = tokenState.sizing.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sizing Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define size values for widths, heights, and dimensions. Values are in pixels.',
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
              children: sizingEntries.map((entry) {
                return _SizingRow(
                  name: entry.key,
                  value: entry.value,
                  onChanged: (value) => tokenState.updateSizing(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SizingRow extends StatefulWidget {
  const _SizingRow({
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final double value;
  final void Function(double) onChanged;

  @override
  State<_SizingRow> createState() => _SizingRowState();
}

class _SizingRowState extends State<_SizingRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void didUpdateWidget(_SizingRow oldWidget) {
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
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: Row(
        children: [
          // Name
          SizedBox(
            width: 80,
            child: Text(
              widget.name,
              style: textTheme.labelLarge.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Visual preview
          Expanded(
            child: Container(
              height: 24,
              alignment: Alignment.centerLeft,
              child: Container(
                width: widget.value.clamp(0, 200),
                height: 16,
                decoration: BoxDecoration(
                  color: colors.secondary.withOpacity(0.3),
                  borderRadius: GBorderRadius.allXs,
                  border: Border.all(color: colors.secondary),
                ),
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Value input
          SizedBox(
            width: 80,
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

