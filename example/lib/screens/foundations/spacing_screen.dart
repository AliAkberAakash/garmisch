import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SpacingScreen extends StatelessWidget {
  const SpacingScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return ShowcaseScaffold(
      title: 'Spacing',
      subtitle: 'Consistent spacing scale',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spacing tokens are used for margins, paddings, and gaps. '
              'Using consistent spacing creates visual harmony.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Spacing Scale',
              subtitle: 'GSpacing.* tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Visual Scale',
              subtitle: 'Each spacing value visualized',
              padding: const EdgeInsets.all(GSpacing.md),
              child: Column(
                children: [
                  _SpacingRow('none', GSpacing.none, colors, textTheme),
                  _SpacingRow('px', GSpacing.px, colors, textTheme),
                  _SpacingRow('xs4', GSpacing.xs4, colors, textTheme),
                  _SpacingRow('xs3', GSpacing.xs3, colors, textTheme),
                  _SpacingRow('xs2', GSpacing.xs2, colors, textTheme),
                  _SpacingRow('xs', GSpacing.xs, colors, textTheme),
                  _SpacingRow('sm', GSpacing.sm, colors, textTheme),
                  _SpacingRow('md', GSpacing.md, colors, textTheme),
                  _SpacingRow('lg', GSpacing.lg, colors, textTheme),
                  _SpacingRow('xl', GSpacing.xl, colors, textTheme),
                  _SpacingRow('xl2', GSpacing.xl2, colors, textTheme),
                  _SpacingRow('xl3', GSpacing.xl3, colors, textTheme),
                  _SpacingRow('xl4', GSpacing.xl4, colors, textTheme),
                  _SpacingRow('xl5', GSpacing.xl5, colors, textTheme),
                  _SpacingRow('xl6', GSpacing.xl6, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Usage Examples',
              subtitle: 'How to use spacing tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Padding',
              subtitle: 'EdgeInsets with spacing tokens',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodeExample(
                    'EdgeInsets.all(GSpacing.md)',
                    colors,
                    textTheme,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.outline),
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(GSpacing.md),
                      color: colors.primary.withOpacity(0.1),
                      child: Text(
                        'Content with md (16px) padding',
                        style: textTheme.bodyMedium.copyWith(
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Gaps (SizedBox)',
              subtitle: 'Spacing between elements',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodeExample(
                    'SizedBox(height: GSpacing.sm)',
                    colors,
                    textTheme,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: Column(
                      children: [
                        _DemoBox('Item 1', colors),
                        const SizedBox(height: GSpacing.xs),
                        _DemoBox('Gap: xs (8px)', colors, isLabel: true),
                        const SizedBox(height: GSpacing.xs),
                        _DemoBox('Item 2', colors),
                        const SizedBox(height: GSpacing.sm),
                        _DemoBox('Gap: sm (12px)', colors, isLabel: true),
                        const SizedBox(height: GSpacing.sm),
                        _DemoBox('Item 3', colors),
                        const SizedBox(height: GSpacing.md),
                        _DemoBox('Gap: md (16px)', colors, isLabel: true),
                        const SizedBox(height: GSpacing.md),
                        _DemoBox('Item 4', colors),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Horizontal Spacing',
              subtitle: 'Spacing in rows',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodeExample(
                    'SizedBox(width: GSpacing.md)',
                    colors,
                    textTheme,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: Row(
                      children: [
                        _DemoBox('A', colors, width: 40),
                        const SizedBox(width: GSpacing.xs),
                        _DemoBox('B', colors, width: 40),
                        const SizedBox(width: GSpacing.sm),
                        _DemoBox('C', colors, width: 40),
                        const SizedBox(width: GSpacing.md),
                        _DemoBox('D', colors, width: 40),
                        const SizedBox(width: GSpacing.lg),
                        _DemoBox('E', colors, width: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _SpacingRow extends StatelessWidget {
  const _SpacingRow(this.name, this.value, this.colors, this.textTheme);

  final String name;
  final double value;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              name,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              '${value.toInt()}px',
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 24,
              alignment: Alignment.centerLeft,
              child: Container(
                width: value,
                height: 16,
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: GBorderRadius.allXs,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeExample extends StatelessWidget {
  const _CodeExample(this.code, this.colors, this.textTheme);

  final String code;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.sm,
        vertical: GSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: GBorderRadius.allSm,
      ),
      child: Text(
        code,
        style: textTheme.bodySmall.copyWith(
          color: colors.onSurfaceVariant,
          fontFamily: GTypography.fontFamilyMono,
        ),
      ),
    );
  }
}

class _DemoBox extends StatelessWidget {
  const _DemoBox(
    this.label,
    this.colors, {
    this.width,
    this.isLabel = false,
  });

  final String label;
  final GColorScheme colors;
  final double? width;
  final bool isLabel;

  @override
  Widget build(BuildContext context) {
    if (isLabel) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: GSpacing.xs,
          vertical: GSpacing.xs3,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: GTypography.fontSizeXs,
            color: colors.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.sm,
        vertical: GSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: GBorderRadius.allSm,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: GTypography.fontSizeSm,
          color: colors.onPrimary,
          fontWeight: GTypography.fontWeightMedium,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

