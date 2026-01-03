import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class BorderRadiusScreen extends StatelessWidget {
  const BorderRadiusScreen({
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
      title: 'Border Radius',
      subtitle: 'Rounded corner values',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Border radius tokens create consistent rounded corners across your UI. '
              'Use smaller radii for subtle rounding and larger values for pills and circles.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Radius Scale',
              subtitle: 'GBorderRadius.* tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            // Radius Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: GSpacing.md,
              crossAxisSpacing: GSpacing.md,
              childAspectRatio: 1,
              children: [
                _RadiusCard(
                  name: 'none',
                  radius: GBorderRadius.none,
                  value: '0px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'xs',
                  radius: GBorderRadius.xs,
                  value: '2px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'sm',
                  radius: GBorderRadius.sm,
                  value: '4px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'md',
                  radius: GBorderRadius.md,
                  value: '6px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'lg',
                  radius: GBorderRadius.lg,
                  value: '8px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'xl',
                  radius: GBorderRadius.xl,
                  value: '12px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'xl2',
                  radius: GBorderRadius.xl2,
                  value: '16px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'xl3',
                  radius: GBorderRadius.xl3,
                  value: '24px',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _RadiusCard(
                  name: 'full',
                  radius: GBorderRadius.full,
                  value: '9999px',
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Pre-built BorderRadius',
              subtitle: 'GBorderRadius.all* constants',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'All Corners',
              subtitle: 'BorderRadius applied to all corners',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  _RadiusChip('allSm', GBorderRadius.allSm, colors, textTheme),
                  _RadiusChip('allMd', GBorderRadius.allMd, colors, textTheme),
                  _RadiusChip('allLg', GBorderRadius.allLg, colors, textTheme),
                  _RadiusChip('allXl', GBorderRadius.allXl, colors, textTheme),
                  _RadiusChip('allXl2', GBorderRadius.allXl2, colors, textTheme),
                  _RadiusChip('allFull', GBorderRadius.allFull, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Directional Radius',
              subtitle: 'Top, bottom, left, right only',
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _DirectionalRadiusDemo(
                          name: 'topLg',
                          radius: GBorderRadius.topLg,
                          colors: colors,
                          textTheme: textTheme,
                        ),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      Expanded(
                        child: _DirectionalRadiusDemo(
                          name: 'bottomLg',
                          radius: GBorderRadius.bottomLg,
                          colors: colors,
                          textTheme: textTheme,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Row(
                    children: [
                      Expanded(
                        child: _DirectionalRadiusDemo(
                          name: 'leftLg',
                          radius: GBorderRadius.leftLg,
                          colors: colors,
                          textTheme: textTheme,
                        ),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      Expanded(
                        child: _DirectionalRadiusDemo(
                          name: 'rightLg',
                          radius: GBorderRadius.rightLg,
                          colors: colors,
                          textTheme: textTheme,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Common Use Cases',
              subtitle: 'When to use each radius',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Buttons',
              subtitle: 'Typically use md to lg radius',
              child: Row(
                children: [
                  _UseCaseButton('sm', GBorderRadius.allSm, colors, textTheme),
                  const SizedBox(width: GSpacing.sm),
                  _UseCaseButton('md', GBorderRadius.allMd, colors, textTheme),
                  const SizedBox(width: GSpacing.sm),
                  _UseCaseButton('lg', GBorderRadius.allLg, colors, textTheme),
                  const SizedBox(width: GSpacing.sm),
                  _UseCaseButton('full', GBorderRadius.allFull, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Cards',
              subtitle: 'Typically use lg to xl2 radius',
              child: Row(
                children: [
                  Expanded(
                    child: _UseCaseCard('lg', GBorderRadius.allLg, colors, textTheme),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: _UseCaseCard('xl', GBorderRadius.allXl, colors, textTheme),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: _UseCaseCard('xl2', GBorderRadius.allXl2, colors, textTheme),
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

class _RadiusCard extends StatelessWidget {
  const _RadiusCard({
    required this.name,
    required this.radius,
    required this.value,
    required this.colors,
    required this.textTheme,
  });

  final String name;
  final double radius;
  final String value;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: textTheme.labelLarge.copyWith(
              color: colors.onPrimary,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs3),
          Text(
            value,
            style: textTheme.labelSmall.copyWith(
              color: colors.onPrimary.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadiusChip extends StatelessWidget {
  const _RadiusChip(this.name, this.radius, this.colors, this.textTheme);

  final String name;
  final BorderRadius radius;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: radius,
      ),
      child: Text(
        name,
        style: textTheme.labelMedium.copyWith(
          color: colors.onPrimaryContainer,
        ),
      ),
    );
  }
}

class _DirectionalRadiusDemo extends StatelessWidget {
  const _DirectionalRadiusDemo({
    required this.name,
    required this.radius,
    required this.colors,
    required this.textTheme,
  });

  final String name;
  final BorderRadius radius;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: radius,
      ),
      child: Center(
        child: Text(
          name,
          style: textTheme.labelMedium.copyWith(
            color: colors.onSecondary,
          ),
        ),
      ),
    );
  }
}

class _UseCaseButton extends StatelessWidget {
  const _UseCaseButton(this.label, this.radius, this.colors, this.textTheme);

  final String label;
  final BorderRadius radius;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: radius,
      ),
      child: Text(
        label,
        style: textTheme.labelLarge.copyWith(
          color: colors.onPrimary,
        ),
      ),
    );
  }
}

class _UseCaseCard extends StatelessWidget {
  const _UseCaseCard(this.label, this.radius, this.colors, this.textTheme);

  final String label;
  final BorderRadius radius;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: radius,
        border: Border.all(color: colors.outline.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Text(
          label,
          style: textTheme.labelLarge.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

