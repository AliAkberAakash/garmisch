import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class UtilitiesScreen extends StatelessWidget {
  const UtilitiesScreen({
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
      title: 'Utilities',
      subtitle: 'Extensions and helpers',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Utility extensions and helpers that make working with '
              'the design system easier and more productive.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Context Extensions
            const SectionHeader(
              title: 'Context Extensions',
              subtitle: 'BuildContext helpers',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Theme Access',
              subtitle: 'context.gTheme, context.gColors, context.gTextTheme',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CodeExample('context.gColors.primary', colors.primary),
                  _CodeExample('context.gColors.error', colors.error),
                  _CodeExample('context.gColors.success', colors.success),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'context.isDarkMode: ${context.isDarkMode}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Screen Info',
              subtitle: 'context.screenWidth, context.isMobile, etc.',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Screen Width: ${context.screenWidth.toStringAsFixed(0)}px',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  Text(
                    'Screen Height: ${context.screenHeight.toStringAsFixed(0)}px',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  const SizedBox(height: GSpacing.xs),
                  Text(
                    'Breakpoint: ${context.breakpoint.name}',
                    style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                  ),
                  Text(
                    'isMobile: ${context.isMobile} | isTablet: ${context.isTablet} | isDesktop: ${context.isDesktop}',
                    style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Widget Extensions
            const SectionHeader(
              title: 'Widget Extensions',
              subtitle: 'Chainable widget modifiers',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Padding & Margin',
              subtitle: '.padding(), .paddingSymmetric(), .margin()',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: colors.primaryContainer,
                    child: const Text('Text with .padding(16)')
                        .padding(16),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Container(
                    color: colors.secondaryContainer,
                    child: const Text('Text with .paddingSymmetric(h: 24, v: 8)')
                        .paddingSymmetric(horizontal: 24, vertical: 8),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Layout Modifiers',
              subtitle: '.centered(), .expanded(), .sized()',
              child: Column(
                children: [
                  Container(
                    height: 60,
                    color: colors.surfaceVariant,
                    child: const Text('Centered').centered(),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Row(
                    children: [
                      Container(color: colors.primary, child: const Text('1').padding(8)),
                      Container(color: colors.secondary, child: const Text('Expanded').padding(8)).expanded(),
                      Container(color: colors.tertiary, child: const Text('3').padding(8)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Visual Modifiers',
              subtitle: '.opacity(), .clipRRect(), .background()',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    color: colors.primary,
                  ).opacity(0.3),
                  Container(
                    width: 60,
                    height: 60,
                    color: colors.primary,
                  ).clipRRect(radius: 16),
                  const Text('BG')
                      .padding(16)
                      .background(colors.successContainer)
                      .clipRRect(radius: 8),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Color Extensions
            const SectionHeader(
              title: 'Color Extensions',
              subtitle: 'Color manipulation helpers',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Lighten & Darken',
              subtitle: 'color.lighten(), color.darken()',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ColorSwatch('darken(0.2)', colors.primary.darken(0.2)),
                  _ColorSwatch('primary', colors.primary),
                  _ColorSwatch('lighten(0.2)', colors.primary.lighten(0.2)),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Color Info',
              subtitle: 'isLight, isDark, toHex(), contrastColor',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primary Hex: ${colors.primary.toHex()}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  Text(
                    'Is Light: ${colors.primary.isLight}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  Text(
                    'Contrast Color: ${colors.primary.contrastColor == Colors.white ? "White" : "Black"}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Num Extensions
            const SectionHeader(
              title: 'Number Extensions',
              subtitle: 'Spacing and duration helpers',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Spacing Helpers',
              subtitle: '16.horizontalSpace, 8.verticalSpace',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: 40, height: 40, color: colors.primary),
                      16.horizontalSpace,
                      Container(width: 40, height: 40, color: colors.secondary),
                      24.horizontalSpace,
                      Container(width: 40, height: 40, color: colors.tertiary),
                    ],
                  ),
                  12.verticalSpace,
                  Text(
                    '16.allInsets → EdgeInsets.all(16)',
                    style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                  ),
                  Text(
                    '8.borderRadius → BorderRadius.circular(8)',
                    style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Duration Helpers',
              subtitle: '200.ms, 2.seconds',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '200.ms → ${200.ms}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  Text(
                    '2.seconds → ${2.seconds}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                  ),
                  Text(
                    '1.minutes → ${1.minutes}',
                    style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
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

class _CodeExample extends StatelessWidget {
  const _CodeExample(this.code, this.color);
  final String code;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: GBorderRadius.allSm,
            ),
          ),
          const SizedBox(width: GSpacing.sm),
          Text(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: GTheme.of(context).colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch(this.label, this.color);
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: GBorderRadius.allMd,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: GTheme.of(context).colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

