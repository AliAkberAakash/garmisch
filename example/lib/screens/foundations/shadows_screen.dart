import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ShadowsScreen extends StatelessWidget {
  const ShadowsScreen({
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
      title: 'Shadows',
      subtitle: 'Elevation and depth',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shadow tokens create depth and hierarchy in your UI. '
              'Use subtle shadows for cards and stronger shadows for elevated elements.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Shadow Scale',
              subtitle: 'GShadows.* tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            // Shadow Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: GSpacing.md,
              crossAxisSpacing: GSpacing.md,
              childAspectRatio: 1.2,
              children: [
                _ShadowCard(
                  name: 'none',
                  shadow: GShadows.none,
                  description: 'No shadow',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'xs',
                  shadow: GShadows.xs,
                  description: '1px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'sm',
                  shadow: GShadows.sm,
                  description: '2px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'md',
                  shadow: GShadows.md,
                  description: '6px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'lg',
                  shadow: GShadows.lg,
                  description: '15px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'xl',
                  shadow: GShadows.xl,
                  description: '25px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'xl2',
                  shadow: GShadows.xl2,
                  description: '50px blur',
                  colors: colors,
                  textTheme: textTheme,
                ),
                _ShadowCard(
                  name: 'inner',
                  shadow: GShadows.inner,
                  description: 'Inset shadow',
                  colors: colors,
                  textTheme: textTheme,
                ),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Colored Shadows',
              subtitle: 'Shadows with color tints',
            ),
            const SizedBox(height: GSpacing.sm),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: GSpacing.md,
              crossAxisSpacing: GSpacing.md,
              childAspectRatio: 1.2,
              children: [
                _ShadowCard(
                  name: 'primaryMd',
                  shadow: GShadows.primaryMd,
                  description: 'Blue tint',
                  colors: colors,
                  textTheme: textTheme,
                  backgroundColor: colors.primary,
                  textColor: colors.onPrimary,
                ),
                _ShadowCard(
                  name: 'primaryLg',
                  shadow: GShadows.primaryLg,
                  description: 'Blue tint large',
                  colors: colors,
                  textTheme: textTheme,
                  backgroundColor: colors.primary,
                  textColor: colors.onPrimary,
                ),
                _ShadowCard(
                  name: 'successMd',
                  shadow: GShadows.successMd,
                  description: 'Green tint',
                  colors: colors,
                  textTheme: textTheme,
                  backgroundColor: colors.success,
                  textColor: colors.onSuccess,
                ),
                _ShadowCard(
                  name: 'errorMd',
                  shadow: GShadows.errorMd,
                  description: 'Red tint',
                  colors: colors,
                  textTheme: textTheme,
                  backgroundColor: colors.error,
                  textColor: colors.onError,
                ),
                _ShadowCard(
                  name: 'warningMd',
                  shadow: GShadows.warningMd,
                  description: 'Amber tint',
                  colors: colors,
                  textTheme: textTheme,
                  backgroundColor: colors.warning,
                  textColor: colors.onWarning,
                ),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Usage Examples',
              subtitle: 'How to apply shadows',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Container with Shadow',
              subtitle: 'Using BoxDecoration',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GSpacing.sm,
                      vertical: GSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: Text(
                      'boxShadow: GShadows.md',
                      style: textTheme.bodySmall.copyWith(
                        color: colors.onSurfaceVariant,
                        fontFamily: GTypography.fontFamilyMono,
                      ),
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(GSpacing.lg),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: GBorderRadius.allLg,
                      boxShadow: GShadows.md,
                    ),
                    child: Text(
                      'Card with medium shadow',
                      style: textTheme.bodyMedium.copyWith(
                        color: colors.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Elevation Comparison',
              subtitle: 'Side by side shadows',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _ElevationBox('xs', GShadows.xs, colors, textTheme),
                    const SizedBox(width: GSpacing.md),
                    _ElevationBox('sm', GShadows.sm, colors, textTheme),
                    const SizedBox(width: GSpacing.md),
                    _ElevationBox('md', GShadows.md, colors, textTheme),
                    const SizedBox(width: GSpacing.md),
                    _ElevationBox('lg', GShadows.lg, colors, textTheme),
                    const SizedBox(width: GSpacing.md),
                    _ElevationBox('xl', GShadows.xl, colors, textTheme),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _ShadowCard extends StatelessWidget {
  const _ShadowCard({
    required this.name,
    required this.shadow,
    required this.description,
    required this.colors,
    required this.textTheme,
    this.backgroundColor,
    this.textColor,
  });

  final String name;
  final List<BoxShadow> shadow;
  final String description;
  final GColorScheme colors;
  final GTextTheme textTheme;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? colors.surface;
    final txtColor = textColor ?? colors.onSurface;

    return Container(
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: GBorderRadius.allLg,
        boxShadow: shadow,
        border: shadow.isEmpty
            ? Border.all(color: colors.outline.withOpacity(0.2))
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: textTheme.titleMedium.copyWith(
              color: txtColor,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs3),
          Text(
            description,
            style: textTheme.bodySmall.copyWith(
              color: txtColor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _ElevationBox extends StatelessWidget {
  const _ElevationBox(
    this.name,
    this.shadow,
    this.colors,
    this.textTheme,
  );

  final String name;
  final List<BoxShadow> shadow;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allMd,
        boxShadow: shadow,
      ),
      child: Center(
        child: Text(
          name,
          style: textTheme.labelLarge.copyWith(
            color: colors.onSurface,
          ),
        ),
      ),
    );
  }
}

