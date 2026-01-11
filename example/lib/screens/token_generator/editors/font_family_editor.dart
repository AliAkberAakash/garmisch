import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class FontFamilyEditor extends StatelessWidget {
  const FontFamilyEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final fontFamilyEntries = tokenState.fontFamily.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Font Family Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define primary font families for different typographic contexts.',
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
              children: fontFamilyEntries.map((entry) {
                return _FontFamilyRow(
                  name: entry.key,
                  value: entry.value,
                  description: _getFontFamilyDescription(entry.key),
                  onChanged: (value) => tokenState.updateFontFamily(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  String _getFontFamilyDescription(String name) {
    switch (name) {
      case 'sans':
        return 'Sans-serif for UI and body text';
      case 'serif':
        return 'Serif for headings and editorial';
      case 'mono':
        return 'Monospace for code and data';
      default:
        return '';
    }
  }
}

class _FontFamilyRow extends StatefulWidget {
  const _FontFamilyRow({
    required this.name,
    required this.value,
    required this.description,
    required this.onChanged,
  });

  final String name;
  final String value;
  final String description;
  final void Function(String) onChanged;

  @override
  State<_FontFamilyRow> createState() => _FontFamilyRowState();
}

class _FontFamilyRowState extends State<_FontFamilyRow> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(_FontFamilyRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value;
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
      padding: const EdgeInsets.symmetric(vertical: GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Name badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.sm,
                  vertical: GSpacing.xs3,
                ),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: GBorderRadius.allSm,
                ),
                child: Text(
                  widget.name,
                  style: textTheme.labelMedium.copyWith(
                    color: colors.primary,
                    fontWeight: GTypography.fontWeightSemiBold,
                  ),
                ),
              ),
              const SizedBox(width: GSpacing.sm),
              Expanded(
                child: Text(
                  widget.description,
                  style: textTheme.bodySmall.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: GSpacing.sm),
          // Font input
          TextField(
            controller: _controller,
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurface,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: GSpacing.sm,
                vertical: GSpacing.sm,
              ),
              hintText: 'Enter font family name',
              hintStyle: textTheme.bodyMedium.copyWith(
                color: colors.onSurfaceVariant.withOpacity(0.5),
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
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
          ),
          const SizedBox(height: GSpacing.sm),
          // Preview
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(GSpacing.md),
            decoration: BoxDecoration(
              color: colors.surfaceContainerHighest.withOpacity(0.5),
              borderRadius: GBorderRadius.allMd,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Preview',
                  style: textTheme.labelSmall.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: GSpacing.xs),
                Text(
                  'The quick brown fox jumps over the lazy dog',
                  style: TextStyle(
                    fontFamily: widget.value,
                    fontSize: 16,
                    color: colors.onSurface,
                  ),
                ),
                const SizedBox(height: GSpacing.xs3),
                Text(
                  'ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789',
                  style: TextStyle(
                    fontFamily: widget.value,
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

