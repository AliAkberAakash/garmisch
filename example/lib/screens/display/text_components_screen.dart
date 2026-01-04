import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TextComponentsScreen extends StatelessWidget {
  const TextComponentsScreen({
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
      title: 'Text',
      subtitle: 'GText component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Styles
            const SectionHeader(
              title: 'Display Styles',
              subtitle: 'Large hero text for prominent content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Display Large',
              subtitle: 'GText.displayLarge()',
              child: GText.displayLarge('Display Large'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Display Medium',
              subtitle: 'GText.displayMedium()',
              child: GText.displayMedium('Display Medium'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Display Small',
              subtitle: 'GText.displaySmall()',
              child: GText.displaySmall('Display Small'),
            ),
            const SizedBox(height: GSpacing.xl),

            // Headline Styles
            const SectionHeader(
              title: 'Headline Styles',
              subtitle: 'Section headers and titles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Headline Large',
              subtitle: 'GText.headlineLarge()',
              child: GText.headlineLarge('Headline Large'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Headline Medium',
              subtitle: 'GText.headlineMedium()',
              child: GText.headlineMedium('Headline Medium'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Headline Small',
              subtitle: 'GText.headlineSmall()',
              child: GText.headlineSmall('Headline Small'),
            ),
            const SizedBox(height: GSpacing.xl),

            // Title Styles
            const SectionHeader(
              title: 'Title Styles',
              subtitle: 'Component and card titles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Title Large',
              subtitle: 'GText.titleLarge()',
              child: GText.titleLarge('Title Large'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Title Medium',
              subtitle: 'GText.titleMedium()',
              child: GText.titleMedium('Title Medium'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Title Small',
              subtitle: 'GText.titleSmall()',
              child: GText.titleSmall('Title Small'),
            ),
            const SizedBox(height: GSpacing.xl),

            // Body Styles
            const SectionHeader(
              title: 'Body Styles',
              subtitle: 'Content and paragraph text',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Body Large',
              subtitle: 'GText.bodyLarge() - Primary content',
              child: GText.bodyLarge(
                'Body Large is used for primary content text. It provides good readability for longer passages of text.',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Body Medium',
              subtitle: 'GText.bodyMedium() - Secondary content',
              child: GText.bodyMedium(
                'Body Medium is the default text style for most UI content. It balances readability with space efficiency.',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Body Small',
              subtitle: 'GText.bodySmall() - Tertiary content',
              child: GText.bodySmall(
                'Body Small is used for captions, helper text, and less prominent information.',
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Label Styles
            const SectionHeader(
              title: 'Label Styles',
              subtitle: 'UI labels and button text',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Label Large',
              subtitle: 'GText.labelLarge()',
              child: GText.labelLarge('Label Large'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Label Medium',
              subtitle: 'GText.labelMedium()',
              child: GText.labelMedium('Label Medium'),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Label Small',
              subtitle: 'GText.labelSmall()',
              child: GText.labelSmall('Label Small'),
            ),
            const SizedBox(height: GSpacing.xl),

            // Text with Colors
            const SectionHeader(
              title: 'Text with Colors',
              subtitle: 'Custom color property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Semantic Colors',
              subtitle: 'Using theme colors',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GText.titleMedium('Primary Color', color: colors.primary),
                  const SizedBox(height: GSpacing.sm),
                  GText.titleMedium('Secondary Color', color: colors.secondary),
                  const SizedBox(height: GSpacing.sm),
                  GText.titleMedium('Error Color', color: colors.error),
                  const SizedBox(height: GSpacing.sm),
                  GText.titleMedium('Success Color', color: colors.success),
                  const SizedBox(height: GSpacing.sm),
                  GText.titleMedium('Warning Color', color: colors.warning),
                  const SizedBox(height: GSpacing.sm),
                  GText.titleMedium('Info Color', color: colors.info),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Text Alignment
            const SectionHeader(
              title: 'Text Alignment',
              subtitle: 'Align property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Alignment Options',
              subtitle: 'TextAlign values',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: GText.bodyMedium('Left aligned text (default)', align: TextAlign.left),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: GText.bodyMedium('Center aligned text', align: TextAlign.center),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: GText.bodyMedium('Right aligned text', align: TextAlign.right),
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

