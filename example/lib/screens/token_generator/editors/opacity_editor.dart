import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class OpacityEditor extends StatelessWidget {
  const OpacityEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final opacityEntries = tokenState.opacity.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Opacity Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define opacity/transparency levels. Values range from 0 (transparent) to 1 (opaque).',
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
              children: opacityEntries.map((entry) {
                return _OpacityRow(
                  name: entry.key,
                  value: entry.value,
                  onChanged: (value) => tokenState.updateOpacity(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _OpacityRow extends StatelessWidget {
  const _OpacityRow({
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final double value;
  final void Function(double) onChanged;

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
            width: 100,
            child: Text(
              name,
              style: textTheme.labelLarge.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Visual preview with checkerboard background
          Container(
            width: 48,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: GBorderRadius.allMd,
              border: Border.all(color: colors.outline.withOpacity(0.3)),
            ),
            child: ClipRRect(
              borderRadius: GBorderRadius.allMd,
              child: Stack(
                children: [
                  // Checkerboard pattern
                  CustomPaint(
                    size: const Size(48, 32),
                    painter: _CheckerboardPainter(),
                  ),
                  // Color overlay with opacity
                  Container(
                    color: colors.primary.withOpacity(value),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Slider
          Expanded(
            child: Slider(
              value: value,
              min: 0,
              max: 1,
              divisions: 100,
              activeColor: colors.primary,
              inactiveColor: colors.primary.withOpacity(0.2),
              onChanged: (newValue) {
                onChanged(newValue);
              },
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Value display
          SizedBox(
            width: 50,
            child: Text(
              value.toStringAsFixed(2),
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurface,
                fontFamily: 'monospace',
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const squareSize = 8.0;
    final paint1 = Paint()..color = Colors.grey.shade300;
    final paint2 = Paint()..color = Colors.white;

    for (var x = 0.0; x < size.width; x += squareSize) {
      for (var y = 0.0; y < size.height; y += squareSize) {
        final isEven = ((x / squareSize) + (y / squareSize)) % 2 == 0;
        canvas.drawRect(
          Rect.fromLTWH(x, y, squareSize, squareSize),
          isEven ? paint1 : paint2,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

