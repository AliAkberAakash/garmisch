import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SpacingResponsiveScreen extends StatelessWidget {
  const SpacingResponsiveScreen({
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
      title: 'Spacing & Responsive',
      subtitle: 'GGap, GSpacer, GResponsive',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GGap
            const SectionHeader(
              title: 'Gap',
              subtitle: 'GGap, GHGap, GVGap components',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Vertical Gaps',
              subtitle: 'GVGap in Column',
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
                    _GapLabel('GVGap.xs()', colors),
                    _GapItem(label: 'Item 2', color: colors.primary),
                    const GVGap.sm(),
                    _GapLabel('GVGap.sm()', colors),
                    _GapItem(label: 'Item 3', color: colors.primary),
                    const GVGap.md(),
                    _GapLabel('GVGap.md()', colors),
                    _GapItem(label: 'Item 4', color: colors.primary),
                    const GVGap.lg(),
                    _GapLabel('GVGap.lg()', colors),
                    _GapItem(label: 'Item 5', color: colors.primary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Horizontal Gaps',
              subtitle: 'GHGap in Row',
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
              title: 'GGap (Universal)',
              subtitle: 'Works in both Row and Column',
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
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GSpacer
            const SectionHeader(
              title: 'Spacer',
              subtitle: 'GSpacer component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Flexible Spacer',
              subtitle: 'Fills available space',
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
                    _GapBox('1', colors.success),
                    const GSpacer(flex: 1),
                    _GapBox('2', colors.success),
                    const GSpacer(flex: 2),
                    _GapBox('3', colors.success),
                    const GSpacer(flex: 1),
                    _GapBox('4', colors.success),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GResponsive
            const SectionHeader(
              title: 'Responsive',
              subtitle: 'GResponsive, GBreakpointBuilder',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Current Breakpoint',
              subtitle: 'GBreakpointBuilder',
              child: GBreakpointBuilder(
                builder: (context, breakpoint) {
                  return Container(
                    padding: const EdgeInsets.all(GSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: GBorderRadius.allMd,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Current: ${breakpoint.name.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: colors.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(height: GSpacing.xs),
                        Text(
                          breakpoint.isMobile
                              ? 'Mobile Layout'
                              : breakpoint.isTablet
                                  ? 'Tablet Layout'
                                  : 'Desktop Layout',
                          style: TextStyle(color: colors.onPrimaryContainer),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Responsive Layout',
              subtitle: 'GResponsive widget',
              child: GResponsive(
                xs: _ResponsiveDemo(
                  label: 'Mobile (XS)',
                  color: colors.error,
                  columns: 1,
                ),
                sm: _ResponsiveDemo(
                  label: 'Small (SM)',
                  color: colors.warning,
                  columns: 2,
                ),
                md: _ResponsiveDemo(
                  label: 'Tablet (MD)',
                  color: colors.success,
                  columns: 3,
                ),
                lg: _ResponsiveDemo(
                  label: 'Desktop (LG)',
                  color: colors.info,
                  columns: 4,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Responsive Value',
              subtitle: 'GResponsiveValue<T>',
              child: Builder(
                builder: (context) {
                  final columns = GResponsiveValue<int>(
                    xs: 1,
                    sm: 2,
                    md: 3,
                    lg: 4,
                  ).resolve(context);

                  final padding = GResponsiveValue<double>(
                    xs: 8,
                    md: 16,
                    lg: 24,
                  ).resolve(context);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Columns: $columns',
                        style: TextStyle(color: colors.onSurface),
                      ),
                      Text(
                        'Padding: ${padding}px',
                        style: TextStyle(color: colors.onSurface),
                      ),
                      const SizedBox(height: GSpacing.sm),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          columns,
                          (i) => Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: GBorderRadius.allSm,
                            ),
                            child: Center(
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(color: colors.onPrimary),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class _ResponsiveDemo extends StatelessWidget {
  const _ResponsiveDemo({
    required this.label,
    required this.color,
    required this.columns,
  });

  final String label;
  final Color color;
  final int columns;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(GSpacing.sm),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: GBorderRadius.allMd,
            border: Border.all(color: color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.devices, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: GSpacing.sm),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            columns,
            (i) => Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: GBorderRadius.allSm,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

