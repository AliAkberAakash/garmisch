import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TypographyScreen extends StatelessWidget {
  const TypographyScreen({
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
      title: 'Typography',
      subtitle: 'Text styles and font scales',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Theme Styles
            const SectionHeader(
              title: 'Text Theme',
              subtitle: 'Pre-defined text styles',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Display Styles',
              subtitle: 'Large headlines and hero text',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStylePreview(
                    name: 'displayLarge',
                    style: textTheme.displayLarge,
                    description: '72px / Regular',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'displayMedium',
                    style: textTheme.displayMedium,
                    description: '60px / Regular',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'displaySmall',
                    style: textTheme.displaySmall,
                    description: '48px / Regular',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Headline Styles',
              subtitle: 'Page and section titles',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStylePreview(
                    name: 'headlineLarge',
                    style: textTheme.headlineLarge,
                    description: '36px / SemiBold',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'headlineMedium',
                    style: textTheme.headlineMedium,
                    description: '30px / SemiBold',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'headlineSmall',
                    style: textTheme.headlineSmall,
                    description: '24px / SemiBold',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Title Styles',
              subtitle: 'Subtitles and list titles',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStylePreview(
                    name: 'titleLarge',
                    style: textTheme.titleLarge,
                    description: '20px / Medium',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'titleMedium',
                    style: textTheme.titleMedium,
                    description: '16px / Medium',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'titleSmall',
                    style: textTheme.titleSmall,
                    description: '14px / Medium',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Body Styles',
              subtitle: 'Paragraph and content text',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStylePreview(
                    name: 'bodyLarge',
                    style: textTheme.bodyLarge,
                    description: '16px / Regular',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'bodyMedium',
                    style: textTheme.bodyMedium,
                    description: '14px / Regular',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'bodySmall',
                    style: textTheme.bodySmall,
                    description: '12px / Regular',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Label Styles',
              subtitle: 'Buttons, badges, and captions',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStylePreview(
                    name: 'labelLarge',
                    style: textTheme.labelLarge,
                    description: '14px / SemiBold',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'labelMedium',
                    style: textTheme.labelMedium,
                    description: '12px / SemiBold',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.md),
                  _TextStylePreview(
                    name: 'labelSmall',
                    style: textTheme.labelSmall,
                    description: '12px / Medium',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Font Sizes
            const SectionHeader(
              title: 'Font Sizes',
              subtitle: 'GTypography.fontSize* tokens',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Scale',
              subtitle: 'From xs (12px) to xl9 (128px)',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FontSizeRow('fontSizeXs', GTypography.fontSizeXs, colors),
                  _FontSizeRow('fontSizeSm', GTypography.fontSizeSm, colors),
                  _FontSizeRow('fontSizeBase', GTypography.fontSizeBase, colors),
                  _FontSizeRow('fontSizeLg', GTypography.fontSizeLg, colors),
                  _FontSizeRow('fontSizeXl', GTypography.fontSizeXl, colors),
                  _FontSizeRow('fontSizeXl2', GTypography.fontSizeXl2, colors),
                  _FontSizeRow('fontSizeXl3', GTypography.fontSizeXl3, colors),
                  _FontSizeRow('fontSizeXl4', GTypography.fontSizeXl4, colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Font Weights
            const SectionHeader(
              title: 'Font Weights',
              subtitle: 'GTypography.fontWeight* tokens',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Weight Scale',
              subtitle: 'From thin (100) to black (900)',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FontWeightRow('fontWeightThin', FontWeight.w100, colors, textTheme),
                  _FontWeightRow('fontWeightExtraLight', FontWeight.w200, colors, textTheme),
                  _FontWeightRow('fontWeightLight', FontWeight.w300, colors, textTheme),
                  _FontWeightRow('fontWeightRegular', FontWeight.w400, colors, textTheme),
                  _FontWeightRow('fontWeightMedium', FontWeight.w500, colors, textTheme),
                  _FontWeightRow('fontWeightSemiBold', FontWeight.w600, colors, textTheme),
                  _FontWeightRow('fontWeightBold', FontWeight.w700, colors, textTheme),
                  _FontWeightRow('fontWeightExtraBold', FontWeight.w800, colors, textTheme),
                  _FontWeightRow('fontWeightBlack', FontWeight.w900, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Letter Spacing
            const SectionHeader(
              title: 'Letter Spacing',
              subtitle: 'GTypography.letterSpacing* tokens',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Spacing Scale',
              subtitle: 'From tighter to widest',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _LetterSpacingRow('letterSpacingTighter', GTypography.letterSpacingTighter, colors, textTheme),
                  _LetterSpacingRow('letterSpacingTight', GTypography.letterSpacingTight, colors, textTheme),
                  _LetterSpacingRow('letterSpacingNormal', GTypography.letterSpacingNormal, colors, textTheme),
                  _LetterSpacingRow('letterSpacingWide', GTypography.letterSpacingWide, colors, textTheme),
                  _LetterSpacingRow('letterSpacingWider', GTypography.letterSpacingWider, colors, textTheme),
                  _LetterSpacingRow('letterSpacingWidest', GTypography.letterSpacingWidest, colors, textTheme),
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

class _TextStylePreview extends StatelessWidget {
  const _TextStylePreview({
    required this.name,
    required this.style,
    required this.description,
    required this.colors,
  });

  final String name;
  final TextStyle style;
  final String description;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: GTypography.fontSizeSm,
                color: colors.primary,
                fontFamily: GTypography.fontFamilyMono,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
            const SizedBox(width: GSpacing.sm),
            Text(
              description,
              style: TextStyle(
                fontSize: GTypography.fontSizeXs,
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: GSpacing.xs2),
        Text(
          'The quick brown fox jumps over the lazy dog',
          style: style.copyWith(color: colors.onSurface),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _FontSizeRow extends StatelessWidget {
  const _FontSizeRow(this.name, this.size, this.colors);

  final String name;
  final double size;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(
              name,
              style: TextStyle(
                fontSize: GTypography.fontSizeSm,
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              '${size.toInt()}px',
              style: TextStyle(
                fontSize: GTypography.fontSizeXs,
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Aa',
              style: TextStyle(
                fontSize: size,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FontWeightRow extends StatelessWidget {
  const _FontWeightRow(this.name, this.weight, this.colors, this.textTheme);

  final String name;
  final FontWeight weight;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'The quick brown fox',
              style: textTheme.bodyLarge.copyWith(
                fontWeight: weight,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LetterSpacingRow extends StatelessWidget {
  const _LetterSpacingRow(this.name, this.spacing, this.colors, this.textTheme);

  final String name;
  final double spacing;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'LETTER SPACING',
              style: textTheme.bodyMedium.copyWith(
                letterSpacing: spacing,
                color: colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

