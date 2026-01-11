import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class BorderRadiusEditor extends StatelessWidget {
  const BorderRadiusEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final radiusEntries = tokenState.borderRadius.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Border Radius Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define corner radius values for rounded elements. Values are in pixels.',
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
              children: radiusEntries.map((entry) {
                return _BorderRadiusRow(
                  name: entry.key,
                  value: entry.value,
                  onChanged: (value) => tokenState.updateBorderRadius(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BorderRadiusRow extends StatefulWidget {
  const _BorderRadiusRow({
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final double value;
  final void Function(double) onChanged;

  @override
  State<_BorderRadiusRow> createState() => _BorderRadiusRowState();
}

class _BorderRadiusRowState extends State<_BorderRadiusRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void didUpdateWidget(_BorderRadiusRow oldWidget) {
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

    // Clamp preview radius for reasonable display
    final previewRadius = widget.value.clamp(0, 32).toDouble();

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
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: colors.primary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(previewRadius),
              border: Border.all(color: colors.primary, width: 2),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Slider
          Expanded(
            child: Slider(
              value: widget.value.clamp(0, 100),
              min: 0,
              max: 100,
              divisions: 100,
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
              onSubmitted: (value) {
                final parsed = double.tryParse(value);
                if (parsed != null) {
                  widget.onChanged(parsed);
                }
              },
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

