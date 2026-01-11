import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class ShadowEditor extends StatelessWidget {
  const ShadowEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final shadowEntries = tokenState.shadows.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shadow Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Configure shadow properties for elevation and depth. Each shadow can have multiple layers.',
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.lg),
          ...shadowEntries.map((entry) {
            return _ShadowCard(
              name: entry.key,
              shadows: entry.value,
              onShadowChanged: (index, value) {
                tokenState.updateShadow(entry.key, index, value);
              },
            );
          }),
        ],
      ),
    );
  }
}

class _ShadowCard extends StatelessWidget {
  const _ShadowCard({
    required this.name,
    required this.shadows,
    required this.onShadowChanged,
  });

  final String name;
  final List<ShadowValue> shadows;
  final void Function(int index, ShadowValue value) onShadowChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    // Convert ShadowValue list to BoxShadow list for preview
    final boxShadows = shadows
        .map((s) => BoxShadow(
              color: s.color,
              offset: Offset(s.offsetX, s.offsetY),
              blurRadius: s.blur,
              spreadRadius: s.spread,
            ))
        .toList();

    return Container(
      margin: const EdgeInsets.only(bottom: GSpacing.lg),
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name,
                style: textTheme.titleMedium.copyWith(
                  color: colors.onSurface,
                  fontWeight: GTypography.fontWeightSemiBold,
                ),
              ),
              const Spacer(),
              Text(
                '${shadows.length} layer${shadows.length != 1 ? 's' : ''}',
                style: textTheme.labelMedium.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: GSpacing.md),
          // Preview
          Center(
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: GBorderRadius.allLg,
                boxShadow: boxShadows.isEmpty ? null : boxShadows,
                border: boxShadows.isEmpty
                    ? Border.all(color: colors.outline.withOpacity(0.3))
                    : null,
              ),
              child: Center(
                child: Text(
                  'Preview',
                  style: textTheme.labelMedium.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          if (shadows.isNotEmpty) ...[
            const SizedBox(height: GSpacing.md),
            const Divider(),
            const SizedBox(height: GSpacing.sm),
            ...shadows.asMap().entries.map((entry) {
              return _ShadowLayerEditor(
                index: entry.key,
                shadow: entry.value,
                onChanged: (value) => onShadowChanged(entry.key, value),
              );
            }),
          ],
        ],
      ),
    );
  }
}

class _ShadowLayerEditor extends StatelessWidget {
  const _ShadowLayerEditor({
    required this.index,
    required this.shadow,
    required this.onChanged,
  });

  final int index;
  final ShadowValue shadow;
  final void Function(ShadowValue) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: GSpacing.sm),
      padding: const EdgeInsets.all(GSpacing.sm),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: GBorderRadius.allMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Layer ${index + 1}',
            style: textTheme.labelMedium.copyWith(
              color: colors.onSurface,
              fontWeight: GTypography.fontWeightMedium,
            ),
          ),
          const SizedBox(height: GSpacing.sm),
          Wrap(
            spacing: GSpacing.sm,
            runSpacing: GSpacing.sm,
            children: [
              // Color
              _ShadowColorButton(
                color: shadow.color,
                onChanged: (color) => onChanged(shadow.copyWith(color: color)),
              ),
              // Offset X
              _ShadowInput(
                label: 'X',
                value: shadow.offsetX,
                onChanged: (value) => onChanged(shadow.copyWith(offsetX: value)),
              ),
              // Offset Y
              _ShadowInput(
                label: 'Y',
                value: shadow.offsetY,
                onChanged: (value) => onChanged(shadow.copyWith(offsetY: value)),
              ),
              // Blur
              _ShadowInput(
                label: 'Blur',
                value: shadow.blur,
                onChanged: (value) => onChanged(shadow.copyWith(blur: value)),
              ),
              // Spread
              _ShadowInput(
                label: 'Spread',
                value: shadow.spread,
                onChanged: (value) => onChanged(shadow.copyWith(spread: value)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ShadowColorButton extends StatelessWidget {
  const _ShadowColorButton({
    required this.color,
    required this.onChanged,
  });

  final Color color;
  final void Function(Color) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return GestureDetector(
      onTap: () => _showColorPicker(context),
      child: Container(
        width: 60,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          borderRadius: GBorderRadius.allMd,
          border: Border.all(color: colors.outline.withOpacity(0.3)),
        ),
        child: const Center(
          child: Icon(Icons.colorize, size: 16, color: Colors.white),
        ),
      ),
    );
  }

  Future<void> _showColorPicker(BuildContext context) async {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    Color selectedColor = color;

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: colors.surface,
          title: const Text('Shadow Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              color: selectedColor,
              onColorChanged: (Color newColor) {
                selectedColor = newColor;
              },
              width: 44,
              height: 44,
              borderRadius: 22,
              spacing: 8,
              runSpacing: 8,
              wheelDiameter: 200,
              enableOpacity: true,
              showColorCode: true,
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.both: false,
                ColorPickerType.primary: false,
                ColorPickerType.accent: false,
                ColorPickerType.bw: false,
                ColorPickerType.custom: false,
                ColorPickerType.wheel: true,
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                onChanged(selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}

class _ShadowInput extends StatefulWidget {
  const _ShadowInput({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final void Function(double) onChanged;

  @override
  State<_ShadowInput> createState() => _ShadowInputState();
}

class _ShadowInputState extends State<_ShadowInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toInt().toString());
  }

  @override
  void didUpdateWidget(_ShadowInput oldWidget) {
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

    return SizedBox(
      width: 70,
      child: TextField(
        controller: _controller,
        keyboardType: const TextInputType.numberWithOptions(signed: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^-?\d*')),
        ],
        textAlign: TextAlign.center,
        style: textTheme.bodySmall.copyWith(color: colors.onSurface),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: GSpacing.xs,
            vertical: GSpacing.xs,
          ),
          labelText: widget.label,
          labelStyle: textTheme.labelSmall.copyWith(
            color: colors.onSurfaceVariant,
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
          final parsed = double.tryParse(value);
          if (parsed != null) {
            widget.onChanged(parsed);
          }
        },
      ),
    );
  }
}

