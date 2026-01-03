import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TextImageIconScreen extends StatelessWidget {
  const TextImageIconScreen({
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
      title: 'Text, Image & Icon',
      subtitle: 'GText, GImage, GIcon components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // GText
            const SectionHeader(
              title: 'Text',
              subtitle: 'GText component with style tokens',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Display Styles',
              subtitle: 'Large hero text',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.displayLarge('Display Large'),
                  const SizedBox(height: GSpacing.xs),
                  GText.displayMedium('Display Medium'),
                  const SizedBox(height: GSpacing.xs),
                  GText.displaySmall('Display Small'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Headline Styles',
              subtitle: 'Section headers',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.headlineLarge('Headline Large'),
                  const SizedBox(height: GSpacing.xs),
                  GText.headlineMedium('Headline Medium'),
                  const SizedBox(height: GSpacing.xs),
                  GText.headlineSmall('Headline Small'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Title Styles',
              subtitle: 'Component titles',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.titleLarge('Title Large'),
                  const SizedBox(height: GSpacing.xs),
                  GText.titleMedium('Title Medium'),
                  const SizedBox(height: GSpacing.xs),
                  GText.titleSmall('Title Small'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Body Styles',
              subtitle: 'Content text',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.bodyLarge('Body Large - Primary content text'),
                  const SizedBox(height: GSpacing.xs),
                  GText.bodyMedium('Body Medium - Secondary content text'),
                  const SizedBox(height: GSpacing.xs),
                  GText.bodySmall('Body Small - Tertiary content text'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Label Styles',
              subtitle: 'UI labels',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.labelLarge('Label Large'),
                  const SizedBox(height: GSpacing.xs),
                  GText.labelMedium('Label Medium'),
                  const SizedBox(height: GSpacing.xs),
                  GText.labelSmall('Label Small'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Text with Colors',
              subtitle: 'Custom color prop',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.titleMedium('Primary Color', color: colors.primary),
                  GText.titleMedium('Error Color', color: colors.error),
                  GText.titleMedium('Success Color', color: colors.success),
                  GText.titleMedium('Warning Color', color: colors.warning),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GIcon
            const SectionHeader(
              title: 'Icon',
              subtitle: 'GIcon component with sizes',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icon Sizes',
              subtitle: 'GIconSize enum',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.xs),
                      const SizedBox(height: GSpacing.xs),
                      Text('xs', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.sm),
                      const SizedBox(height: GSpacing.xs),
                      Text('sm', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.md),
                      const SizedBox(height: GSpacing.xs),
                      Text('md', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.lg),
                      const SizedBox(height: GSpacing.xs),
                      Text('lg', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.xl),
                      const SizedBox(height: GSpacing.xs),
                      Text('xl', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.xl2),
                      const SizedBox(height: GSpacing.xs),
                      Text('xl2', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Icon Colors',
              subtitle: 'Custom color prop',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GIcon(Icons.favorite, size: GIconSize.lg, color: colors.error),
                  GIcon(Icons.check_circle, size: GIconSize.lg, color: colors.success),
                  GIcon(Icons.warning, size: GIconSize.lg, color: colors.warning),
                  GIcon(Icons.info, size: GIconSize.lg, color: colors.info),
                  GIcon(Icons.star, size: GIconSize.lg, color: colors.primary),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GImage
            const SectionHeader(
              title: 'Image',
              subtitle: 'GImage component with loading/error states',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Network Image',
              subtitle: 'With loading indicator',
              child: Row(
                children: [
                  GImage(
                    src: 'https://picsum.photos/120/120',
                    width: 120,
                    height: 120,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  const SizedBox(width: GSpacing.md),
                  GImage(
                    src: 'https://picsum.photos/120/121',
                    width: 120,
                    height: 120,
                    borderRadius: GBorderRadius.allFull,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Image Error State',
              subtitle: 'Fallback on load failure',
              child: Row(
                children: [
                  const GImage(
                    src: 'https://invalid-url.example/image.jpg',
                    width: 100,
                    height: 100,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  const SizedBox(width: GSpacing.md),
                  GImage(
                    src: 'https://invalid-url.example/image.jpg',
                    width: 100,
                    height: 100,
                    borderRadius: GBorderRadius.allMd,
                    errorWidget: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colors.errorContainer,
                        borderRadius: GBorderRadius.allMd,
                      ),
                      child: Icon(Icons.error, color: colors.error),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Image Fit',
              subtitle: 'BoxFit options',
              child: Row(
                children: [
                  Column(
                    children: [
                      GImage(
                        src: 'https://picsum.photos/200/100',
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        borderRadius: GBorderRadius.allSm,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('cover', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(width: GSpacing.md),
                  Column(
                    children: [
                      GImage(
                        src: 'https://picsum.photos/200/101',
                        width: 80,
                        height: 80,
                        fit: BoxFit.contain,
                        borderRadius: GBorderRadius.allSm,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('contain', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(width: GSpacing.md),
                  Column(
                    children: [
                      GImage(
                        src: 'https://picsum.photos/200/102',
                        width: 80,
                        height: 80,
                        fit: BoxFit.fill,
                        borderRadius: GBorderRadius.allSm,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('fill', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
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

