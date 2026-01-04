import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SpacerComponentsScreen extends StatelessWidget {
  const SpacerComponentsScreen({
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

    return ShowcaseScaffold(
      title: 'Spacer / Gap',
      subtitle: 'GGap, GSpacer components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GVGap - Vertical Gaps
            const SectionHeader(
              title: 'Vertical Gaps',
              subtitle: 'GVGap in Column layouts',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GVGap Sizes',
              subtitle: 'xs, sm, md, lg, xl',
              child: Container(
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _GapItem(label: 'Item 1', color: colors.primary),
                    const GVGap.xs(),
                    _GapLabel('GVGap.xs() - 4px', colors),
                    _GapItem(label: 'Item 2', color: colors.primary),
                    const GVGap.sm(),
                    _GapLabel('GVGap.sm() - 8px', colors),
                    _GapItem(label: 'Item 3', color: colors.primary),
                    const GVGap.md(),
                    _GapLabel('GVGap.md() - 16px', colors),
                    _GapItem(label: 'Item 4', color: colors.primary),
                    const GVGap.lg(),
                    _GapLabel('GVGap.lg() - 24px', colors),
                    _GapItem(label: 'Item 5', color: colors.primary),
                    const GVGap.xl(),
                    _GapLabel('GVGap.xl() - 32px', colors),
                    _GapItem(label: 'Item 6', color: colors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GHGap - Horizontal Gaps
            const SectionHeader(
              title: 'Horizontal Gaps',
              subtitle: 'GHGap in Row layouts',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GHGap Sizes',
              subtitle: 'xs, sm, md, lg, xl',
              child: Container(
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _GapBox('1', colors.secondary),
                      const GHGap.xs(),
                      _GapBox('2', colors.secondary),
                      const GHGap.sm(),
                      _GapBox('3', colors.secondary),
                      const GHGap.md(),
                      _GapBox('4', colors.secondary),
                      const GHGap.lg(),
                      _GapBox('5', colors.secondary),
                      const GHGap.xl(),
                      _GapBox('6', colors.secondary),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Horizontal Gap Labels',
              subtitle: 'Size reference',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SizeReference('GHGap.xs()', '4px', colors),
                  _SizeReference('GHGap.sm()', '8px', colors),
                  _SizeReference('GHGap.md()', '16px', colors),
                  _SizeReference('GHGap.lg()', '24px', colors),
                  _SizeReference('GHGap.xl()', '32px', colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GGap - Universal
            const SectionHeader(
              title: 'Universal Gap',
              subtitle: 'GGap works in both Row and Column',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GGap in Grid Layout',
              subtitle: 'Consistent spacing',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GapBox('A', colors.tertiary),
                      const GGap.md(),
                      _GapBox('B', colors.tertiary),
                      const GGap.md(),
                      _GapBox('C', colors.tertiary),
                    ],
                  ),
                  const GGap.lg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GapBox('D', colors.tertiary),
                      const GGap.md(),
                      _GapBox('E', colors.tertiary),
                      const GGap.md(),
                      _GapBox('F', colors.tertiary),
                    ],
                  ),
                  const GGap.lg(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GapBox('G', colors.tertiary),
                      const GGap.md(),
                      _GapBox('H', colors.tertiary),
                      const GGap.md(),
                      _GapBox('I', colors.tertiary),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GSpacer
            const SectionHeader(
              title: 'Flexible Spacer',
              subtitle: 'GSpacer fills available space',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Spacer',
              subtitle: 'Pushes items to edges',
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Row(
                  children: [
                    _GapBox('Left', colors.primary),
                    const GSpacer(),
                    _GapBox('Right', colors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Multiple Spacers',
              subtitle: 'Even distribution',
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Row(
                  children: [
                    _GapBox('1', colors.success),
                    const GSpacer(),
                    _GapBox('2', colors.success),
                    const GSpacer(),
                    _GapBox('3', colors.success),
                    const GSpacer(),
                    _GapBox('4', colors.success),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Spacer with Flex',
              subtitle: 'Different flex values',
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Row(
                  children: [
                    _GapBox('1', colors.warning),
                    const GSpacer(flex: 1),
                    Text('flex:1', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    const GSpacer(flex: 1),
                    _GapBox('2', colors.warning),
                    const GSpacer(flex: 2),
                    Text('flex:2', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    const GSpacer(flex: 2),
                    _GapBox('3', colors.warning),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Spacing Tokens
            const SectionHeader(
              title: 'Spacing Tokens',
              subtitle: 'GSpacing constants',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'All Spacing Values',
              subtitle: 'Design system tokens',
              child: Column(
                children: [
                  _SpacingToken('GSpacing.xs3', '2px', 2, colors),
                  _SpacingToken('GSpacing.xs2', '4px', 4, colors),
                  _SpacingToken('GSpacing.xs', '6px', 6, colors),
                  _SpacingToken('GSpacing.sm', '8px', 8, colors),
                  _SpacingToken('GSpacing.md', '16px', 16, colors),
                  _SpacingToken('GSpacing.lg', '24px', 24, colors),
                  _SpacingToken('GSpacing.xl', '32px', 32, colors),
                  _SpacingToken('GSpacing.xl2', '48px', 48, colors),
                  _SpacingToken('GSpacing.xl3', '64px', 64, colors),
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

class _GapItem extends StatelessWidget {
  const _GapItem({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: GBorderRadius.allSm,
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _GapLabel extends StatelessWidget {
  const _GapLabel(this.text, this.colors);
  final String text;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: colors.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _GapBox extends StatelessWidget {
  const _GapBox(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: GBorderRadius.allSm,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ),
    );
  }
}

class _SizeReference extends StatelessWidget {
  const _SizeReference(this.name, this.size, this.colors);
  final String name;
  final String size;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs3),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(name, style: TextStyle(fontSize: 12, color: colors.onSurface)),
          ),
          Text(size, style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant)),
        ],
      ),
    );
  }
}

class _SpacingToken extends StatelessWidget {
  const _SpacingToken(this.name, this.size, this.pixels, this.colors);
  final String name;
  final String size;
  final double pixels;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs3),
      child: Row(
        children: [
          SizedBox(
            width: 130,
            child: Text(name, style: TextStyle(fontSize: 12, color: colors.onSurface)),
          ),
          SizedBox(
            width: 50,
            child: Text(size, style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant)),
          ),
          Container(
            width: pixels.clamp(4, 100),
            height: 12,
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}

