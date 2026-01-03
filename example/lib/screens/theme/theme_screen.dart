import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({
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
      title: 'Theme System',
      subtitle: 'Theming and customization',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The theme system provides consistent styling across your app. '
              'Customize colors, typography, and more through theme data.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Color Scheme Preview
            const SectionHeader(
              title: 'Color Scheme',
              subtitle: 'Current theme colors',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Primary Colors',
              subtitle: 'Main brand colors',
              child: Column(
                children: [
                  _ColorPreviewRow('primary', colors.primary, colors.onPrimary, colors, textTheme),
                  _ColorPreviewRow('primaryContainer', colors.primaryContainer, colors.onPrimaryContainer, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Secondary Colors',
              subtitle: 'Supporting brand colors',
              child: Column(
                children: [
                  _ColorPreviewRow('secondary', colors.secondary, colors.onSecondary, colors, textTheme),
                  _ColorPreviewRow('secondaryContainer', colors.secondaryContainer, colors.onSecondaryContainer, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Semantic Colors',
              subtitle: 'Status and feedback colors',
              child: Column(
                children: [
                  _ColorPreviewRow('error', colors.error, colors.onError, colors, textTheme),
                  _ColorPreviewRow('warning', colors.warning, colors.onWarning, colors, textTheme),
                  _ColorPreviewRow('success', colors.success, colors.onSuccess, colors, textTheme),
                  _ColorPreviewRow('info', colors.info, colors.onInfo, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Surface Colors',
              subtitle: 'Background and container colors',
              child: Column(
                children: [
                  _ColorPreviewRow('background', colors.background, colors.onBackground, colors, textTheme),
                  _ColorPreviewRow('surface', colors.surface, colors.onSurface, colors, textTheme),
                  _ColorPreviewRow('surfaceVariant', colors.surfaceVariant, colors.onSurfaceVariant, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Text Theme Preview
            const SectionHeader(
              title: 'Text Theme',
              subtitle: 'Typography styles',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'All Text Styles',
              subtitle: 'Tap to see in action',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextStyleRow('displayLarge', textTheme.displayLarge, colors),
                  _TextStyleRow('displayMedium', textTheme.displayMedium, colors),
                  _TextStyleRow('displaySmall', textTheme.displaySmall, colors),
                  const Divider(height: GSpacing.lg),
                  _TextStyleRow('headlineLarge', textTheme.headlineLarge, colors),
                  _TextStyleRow('headlineMedium', textTheme.headlineMedium, colors),
                  _TextStyleRow('headlineSmall', textTheme.headlineSmall, colors),
                  const Divider(height: GSpacing.lg),
                  _TextStyleRow('titleLarge', textTheme.titleLarge, colors),
                  _TextStyleRow('titleMedium', textTheme.titleMedium, colors),
                  _TextStyleRow('titleSmall', textTheme.titleSmall, colors),
                  const Divider(height: GSpacing.lg),
                  _TextStyleRow('bodyLarge', textTheme.bodyLarge, colors),
                  _TextStyleRow('bodyMedium', textTheme.bodyMedium, colors),
                  _TextStyleRow('bodySmall', textTheme.bodySmall, colors),
                  const Divider(height: GSpacing.lg),
                  _TextStyleRow('labelLarge', textTheme.labelLarge, colors),
                  _TextStyleRow('labelMedium', textTheme.labelMedium, colors),
                  _TextStyleRow('labelSmall', textTheme.labelSmall, colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Usage Example
            const SectionHeader(
              title: 'Usage',
              subtitle: 'How to access theme values',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Context Extensions',
              subtitle: 'Easy access via BuildContext',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodeSnippet('context.gTheme', 'Get full theme data', colors, textTheme),
                  _CodeSnippet('context.gColors', 'Get color scheme', colors, textTheme),
                  _CodeSnippet('context.gTextTheme', 'Get text theme', colors, textTheme),
                  _CodeSnippet('context.isDarkMode', 'Check if dark mode', colors, textTheme),
                  _CodeSnippet('context.isMobile', 'Check if mobile screen', colors, textTheme),
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

class _ColorPreviewRow extends StatelessWidget {
  const _ColorPreviewRow(
    this.name,
    this.background,
    this.foreground,
    this.colors,
    this.textTheme,
  );

  final String name;
  final Color background;
  final Color foreground;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 36,
            decoration: BoxDecoration(
              color: background,
              borderRadius: GBorderRadius.allSm,
              border: Border.all(
                color: colors.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Center(
              child: Text(
                'Aa',
                style: textTheme.labelMedium.copyWith(
                  color: foreground,
                ),
              ),
            ),
          ),
          const SizedBox(width: GSpacing.sm),
          Expanded(
            child: Text(
              name,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextStyleRow extends StatelessWidget {
  const _TextStyleRow(this.name, this.style, this.colors);

  final String name;
  final TextStyle style;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: TextStyle(
                fontSize: GTypography.fontSizeXs,
                color: colors.onSurfaceVariant,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Sample',
              style: style.copyWith(color: colors.onSurface),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeSnippet extends StatelessWidget {
  const _CodeSnippet(this.code, this.description, this.colors, this.textTheme);

  final String code;
  final String description;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
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
              code,
              style: textTheme.bodySmall.copyWith(
                color: colors.primary,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.sm),
          Expanded(
            child: Text(
              description,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

