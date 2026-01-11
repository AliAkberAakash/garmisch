import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class BorderWidthEditor extends StatelessWidget {
  const BorderWidthEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final borderWidthEntries = tokenState.borderWidth.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Border Width Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define border thickness values. Values are in pixels.',
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
              children: borderWidthEntries.map((entry) {
                return _BorderWidthRow(
                  name: entry.key,
                  value: entry.value,
                  onChanged: (value) => tokenState.updateBorderWidth(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BorderWidthRow extends StatefulWidget {
  const _BorderWidthRow({
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final double value;
  final void Function(double) onChanged;

  @override
  State<_BorderWidthRow> createState() => _BorderWidthRowState();
}

class _BorderWidthRowState extends State<_BorderWidthRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void didUpdateWidget(_BorderWidthRow oldWidget) {
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
          Container(
            width: 80,
            height: 48,
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: GBorderRadius.allMd,
              border: Border.all(
                color: colors.primary,
                width: widget.value.clamp(0, 8),
              ),
            ),
            child: Center(
              child: Text(
                '${widget.value.toInt()}px',
                style: textTheme.labelSmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Slider
          Expanded(
            child: Slider(
              value: widget.value.clamp(0, 10),
              min: 0,
              max: 10,
              divisions: 10,
              activeColor: colors.primary,
              inactiveColor: colors.primary.withOpacity(0.2),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Value input
          SizedBox(
            width: 60,
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
                  horizontal: GSpacing.xs,
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

