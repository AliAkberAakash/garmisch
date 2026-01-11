import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class ColorEditor extends StatelessWidget {
  const ColorEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final paletteNames = tokenState.colorPalettes.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color Palettes',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Click on any color to edit it. Each palette has shades from 50 (lightest) to 950 (darkest).',
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.lg),
          ...paletteNames.map((paletteName) {
            return _ColorPaletteEditor(
              paletteName: paletteName,
              palette: tokenState.colorPalettes[paletteName]!,
              onColorChanged: (shade, color) {
                tokenState.updateColor(paletteName, shade, color);
              },
            );
          }),
        ],
      ),
    );
  }
}

class _ColorPaletteEditor extends StatelessWidget {
  const _ColorPaletteEditor({
    required this.paletteName,
    required this.palette,
    required this.onColorChanged,
  });

  final String paletteName;
  final ColorPaletteState palette;
  final void Function(String shade, Color color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final shades = ['50', '100', '200', '300', '400', '500', '600', '700', '800', '900', '950'];

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
          Text(
            paletteName.substring(0, 1).toUpperCase() + paletteName.substring(1),
            style: textTheme.titleMedium.copyWith(
              color: colors.onSurface,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.sm),
          Wrap(
            spacing: GSpacing.xs,
            runSpacing: GSpacing.xs,
            children: shades.map((shade) {
              final color = palette.shades[shade] ?? Colors.grey;
              return _ColorSwatch(
                shade: shade,
                color: color,
                onColorChanged: (newColor) => onColorChanged(shade, newColor),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.shade,
    required this.color,
    required this.onColorChanged,
  });

  final String shade;
  final Color color;
  final void Function(Color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final textTheme = theme.textTheme;

    // Determine if text should be light or dark based on color luminance
    final isLight = color.computeLuminance() > 0.5;
    final textColor = isLight ? Colors.black87 : Colors.white;

    return GestureDetector(
      onTap: () => _showColorPicker(context),
      child: Container(
        width: 72,
        height: 56,
        decoration: BoxDecoration(
          color: color,
          borderRadius: GBorderRadius.allMd,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              shade,
              style: textTheme.labelSmall.copyWith(
                color: textColor,
                fontWeight: GTypography.fontWeightSemiBold,
              ),
            ),
            Text(
              _colorToHex(color),
              style: textTheme.labelSmall.copyWith(
                color: textColor.withOpacity(0.7),
                fontSize: 8,
              ),
            ),
          ],
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
          title: Text('Edit Color - Shade $shade'),
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
              heading: Text(
                'Select color',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subheading: Text(
                'Select color shade',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              wheelSubheading: Text(
                'Selected color and its shades',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              showMaterialName: false,
              showColorName: false,
              showColorCode: true,
              copyPasteBehavior: const ColorPickerCopyPasteBehavior(
                longPressMenu: true,
              ),
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
                onColorChanged(selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }

  String _colorToHex(Color color) {
    final argb = color.toARGB32();
    return '#${argb.toRadixString(16).substring(2).toUpperCase()}';
  }
}

