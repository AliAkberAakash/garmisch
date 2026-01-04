import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ContainerComponentsScreen extends StatelessWidget {
  const ContainerComponentsScreen({
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
      title: 'Container',
      subtitle: 'GContainer component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container Variants
            const SectionHeader(
              title: 'Container Variants',
              subtitle: 'Different background styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Plain Container',
              subtitle: 'GContainerVariant.plain - No background',
              child: GContainer(
                variant: GContainerVariant.plain,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Plain container with no background',
                  style: TextStyle(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Surface Container',
              subtitle: 'GContainerVariant.surface',
              child: GContainer(
                variant: GContainerVariant.surface,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Surface container with theme surface color',
                  style: TextStyle(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Surface Variant Container',
              subtitle: 'GContainerVariant.surfaceVariant',
              child: GContainer(
                variant: GContainerVariant.surfaceVariant,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Surface variant with subtle background',
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Primary Container',
              subtitle: 'GContainerVariant.primary',
              child: GContainer(
                variant: GContainerVariant.primary,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Primary color container',
                  style: TextStyle(color: colors.onPrimaryContainer),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Secondary Container',
              subtitle: 'GContainerVariant.secondary',
              child: GContainer(
                variant: GContainerVariant.secondary,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Secondary color container',
                  style: TextStyle(color: colors.onSecondaryContainer),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Outlined Container',
              subtitle: 'GContainerVariant.outlined',
              child: GContainer(
                variant: GContainerVariant.outlined,
                borderRadius: GBorderRadius.allMd,
                child: Text(
                  'Outlined container with border',
                  style: TextStyle(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Container Sizes
            const SectionHeader(
              title: 'Container Padding Sizes',
              subtitle: 'GContainerSize presets',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Padding Sizes',
              subtitle: 'xs, sm, md, lg, xl, none',
              child: Column(
                children: [
                  _PaddingDemo('GContainerSize.none', GContainerSize.none, colors),
                  const SizedBox(height: GSpacing.sm),
                  _PaddingDemo('GContainerSize.xs', GContainerSize.xs, colors),
                  const SizedBox(height: GSpacing.sm),
                  _PaddingDemo('GContainerSize.sm', GContainerSize.sm, colors),
                  const SizedBox(height: GSpacing.sm),
                  _PaddingDemo('GContainerSize.md', GContainerSize.md, colors),
                  const SizedBox(height: GSpacing.sm),
                  _PaddingDemo('GContainerSize.lg', GContainerSize.lg, colors),
                  const SizedBox(height: GSpacing.sm),
                  _PaddingDemo('GContainerSize.xl', GContainerSize.xl, colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Border Radius Options
            const SectionHeader(
              title: 'Border Radius',
              subtitle: 'Rounded corners with GBorderRadius',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Radius Options',
              subtitle: 'Different corner styles',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  _RadiusDemo('None', GBorderRadius.allNone, colors),
                  _RadiusDemo('SM', GBorderRadius.allSm, colors),
                  _RadiusDemo('MD', GBorderRadius.allMd, colors),
                  _RadiusDemo('LG', GBorderRadius.allLg, colors),
                  _RadiusDemo('XL', GBorderRadius.allXl, colors),
                  _RadiusDemo('Full', GBorderRadius.allFull, colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'Override with color property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Background',
              subtitle: 'Using color property',
              child: Row(
                children: [
                  Expanded(
                    child: GContainer(
                      color: colors.error.withValues(alpha: 0.1),
                      borderRadius: GBorderRadius.allMd,
                      padding: GContainerSize.sm,
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, color: colors.error),
                          const SizedBox(height: GSpacing.xs),
                          Text('Error', style: TextStyle(color: colors.error, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GContainer(
                      color: colors.warning.withValues(alpha: 0.1),
                      borderRadius: GBorderRadius.allMd,
                      padding: GContainerSize.sm,
                      child: Column(
                        children: [
                          Icon(Icons.warning_outlined, color: colors.warning),
                          const SizedBox(height: GSpacing.xs),
                          Text('Warning', style: TextStyle(color: colors.warning, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GContainer(
                      color: colors.success.withValues(alpha: 0.1),
                      borderRadius: GBorderRadius.allMd,
                      padding: GContainerSize.sm,
                      child: Column(
                        children: [
                          Icon(Icons.check_circle_outline, color: colors.success),
                          const SizedBox(height: GSpacing.xs),
                          Text('Success', style: TextStyle(color: colors.success, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GContainer(
                      color: colors.info.withValues(alpha: 0.1),
                      borderRadius: GBorderRadius.allMd,
                      padding: GContainerSize.sm,
                      child: Column(
                        children: [
                          Icon(Icons.info_outline, color: colors.info),
                          const SizedBox(height: GSpacing.xs),
                          Text('Info', style: TextStyle(color: colors.info, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Fixed Dimensions
            const SectionHeader(
              title: 'Fixed Dimensions',
              subtitle: 'width and height properties',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Fixed Size Containers',
              subtitle: 'Explicit width and height',
              child: Wrap(
                spacing: GSpacing.md,
                runSpacing: GSpacing.md,
                children: [
                  GContainer(
                    width: 80,
                    height: 80,
                    variant: GContainerVariant.primary,
                    borderRadius: GBorderRadius.allMd,
                    alignment: Alignment.center,
                    child: Text('80x80', style: TextStyle(color: colors.onPrimaryContainer, fontSize: 12)),
                  ),
                  GContainer(
                    width: 120,
                    height: 60,
                    variant: GContainerVariant.secondary,
                    borderRadius: GBorderRadius.allMd,
                    alignment: Alignment.center,
                    child: Text('120x60', style: TextStyle(color: colors.onSecondaryContainer, fontSize: 12)),
                  ),
                  GContainer(
                    width: 60,
                    height: 100,
                    variant: GContainerVariant.surfaceVariant,
                    borderRadius: GBorderRadius.allMd,
                    alignment: Alignment.center,
                    child: Text('60x100', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Centered Container
            const SectionHeader(
              title: 'Centered Container',
              subtitle: 'GCenteredContainer with max width',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Max Width Constraint',
              subtitle: 'Content centered with max width',
              child: Container(
                color: colors.surfaceVariant.withValues(alpha: 0.3),
                padding: const EdgeInsets.symmetric(vertical: GSpacing.md),
                child: GCenteredContainer(
                  maxWidth: 300,
                  child: GContainer(
                    variant: GContainerVariant.primary,
                    borderRadius: GBorderRadius.allMd,
                    child: Text(
                      'This container has a max width of 300px and is centered',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colors.onPrimaryContainer),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Aspect Ratio Container
            const SectionHeader(
              title: 'Aspect Ratio Container',
              subtitle: 'GAspectRatioContainer',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Fixed Aspect Ratios',
              subtitle: 'Maintains ratio regardless of width',
              child: Column(
                children: [
                  Text('16:9 Aspect Ratio', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12)),
                  const SizedBox(height: GSpacing.xs),
                  GAspectRatioContainer(
                    aspectRatio: 16 / 9,
                    backgroundColor: colors.primaryContainer,
                    borderRadius: GBorderRadius.allMd,
                    child: Center(
                      child: Text(
                        '16:9',
                        style: TextStyle(
                          color: colors.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  Text('1:1 Aspect Ratio (Square)', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12)),
                  const SizedBox(height: GSpacing.xs),
                  SizedBox(
                    width: 150,
                    child: GAspectRatioContainer(
                      aspectRatio: 1,
                      backgroundColor: colors.secondaryContainer,
                      borderRadius: GBorderRadius.allMd,
                      child: Center(
                        child: Text(
                          '1:1',
                          style: TextStyle(
                            color: colors.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  Text('4:3 Aspect Ratio', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12)),
                  const SizedBox(height: GSpacing.xs),
                  GAspectRatioContainer(
                    aspectRatio: 4 / 3,
                    backgroundColor: colors.tertiaryContainer,
                    borderRadius: GBorderRadius.allMd,
                    child: Center(
                      child: Text(
                        '4:3',
                        style: TextStyle(
                          color: colors.onTertiaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Expanded Container
            const SectionHeader(
              title: 'Expanded Container',
              subtitle: 'GExpandedContainer fills available space',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Flex Layout',
              subtitle: 'Different flex values',
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    GExpandedContainer(
                      flex: 1,
                      color: colors.primaryContainer,
                      borderRadius: GBorderRadius.allMd,
                      padding: const EdgeInsets.all(GSpacing.sm),
                      child: Center(
                        child: Text(
                          'flex: 1',
                          style: TextStyle(color: colors.onPrimaryContainer, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: GSpacing.sm),
                    GExpandedContainer(
                      flex: 2,
                      color: colors.secondaryContainer,
                      borderRadius: GBorderRadius.allMd,
                      padding: const EdgeInsets.all(GSpacing.sm),
                      child: Center(
                        child: Text(
                          'flex: 2',
                          style: TextStyle(color: colors.onSecondaryContainer, fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: GSpacing.sm),
                    GExpandedContainer(
                      flex: 1,
                      color: colors.tertiaryContainer,
                      borderRadius: GBorderRadius.allMd,
                      padding: const EdgeInsets.all(GSpacing.sm),
                      child: Center(
                        child: Text(
                          'flex: 1',
                          style: TextStyle(color: colors.onTertiaryContainer, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Examples
            const SectionHeader(
              title: 'Practical Examples',
              subtitle: 'Common container patterns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Info Box',
              subtitle: 'Container as info panel',
              child: GContainer(
                variant: GContainerVariant.surfaceVariant,
                borderRadius: GBorderRadius.allMd,
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: colors.primary),
                    const SizedBox(width: GSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pro Tip',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            'Use containers to group related content and create visual hierarchy.',
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Stats Grid',
              subtitle: 'Dashboard-style layout',
              child: Row(
                children: [
                  Expanded(
                    child: GContainer(
                      variant: GContainerVariant.outlined,
                      borderRadius: GBorderRadius.allMd,
                      child: Column(
                        children: [
                          Text(
                            '1,234',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: colors.primary,
                            ),
                          ),
                          Text(
                            'Users',
                            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GContainer(
                      variant: GContainerVariant.outlined,
                      borderRadius: GBorderRadius.allMd,
                      child: Column(
                        children: [
                          Text(
                            '567',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: colors.success,
                            ),
                          ),
                          Text(
                            'Active',
                            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GContainer(
                      variant: GContainerVariant.outlined,
                      borderRadius: GBorderRadius.allMd,
                      child: Column(
                        children: [
                          Text(
                            '89%',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: colors.info,
                            ),
                          ),
                          Text(
                            'Rate',
                            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                          ),
                        ],
                      ),
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

class _PaddingDemo extends StatelessWidget {
  const _PaddingDemo(this.label, this.size, this.colors);
  final String label;
  final GContainerSize size;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Text(label, style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant)),
        ),
        Expanded(
          child: GContainer(
            variant: GContainerVariant.surfaceVariant,
            padding: size,
            borderRadius: GBorderRadius.allSm,
            child: Container(
              height: 20,
              color: colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _RadiusDemo extends StatelessWidget {
  const _RadiusDemo(this.label, this.radius, this.colors);
  final String label;
  final BorderRadius radius;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GContainer(
          width: 50,
          height: 50,
          variant: GContainerVariant.primary,
          borderRadius: radius,
          padding: GContainerSize.none,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(color: colors.onPrimaryContainer, fontSize: 10),
          ),
        ),
      ],
    );
  }
}

