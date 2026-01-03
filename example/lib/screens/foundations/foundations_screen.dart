import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'colors_screen.dart';
import 'typography_screen.dart';
import 'spacing_screen.dart';
import 'shadows_screen.dart';
import 'border_radius_screen.dart';
import 'animations_screen.dart';

class FoundationsScreen extends StatelessWidget {
  const FoundationsScreen({
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
      title: 'Foundations',
      subtitle: 'Design tokens and primitives',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Design foundations are the atomic values that define your design system. '
              'They include colors, typography, spacing, shadows, and more.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Foundation Categories
            _FoundationTile(
              title: 'Colors',
              subtitle: '18 color scales with 11 shades each',
              icon: Icons.palette_outlined,
              color: GColors.rose500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ColorsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Typography',
              subtitle: 'Font sizes, weights, and text styles',
              icon: Icons.text_fields_outlined,
              color: GColors.violet500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TypographyScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Spacing',
              subtitle: 'Consistent spacing scale',
              icon: Icons.space_bar_outlined,
              color: GColors.teal500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SpacingScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Shadows',
              subtitle: 'Elevation and depth',
              icon: Icons.layers_outlined,
              color: GColors.amber500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ShadowsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Border Radius',
              subtitle: 'Rounded corner values',
              icon: Icons.rounded_corner_outlined,
              color: GColors.cyan500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BorderRadiusScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Sizing',
              subtitle: 'Width and height values',
              icon: Icons.straighten_outlined,
              color: GColors.green500,
              onTap: () {},
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Opacity',
              subtitle: 'Transparency levels',
              icon: Icons.opacity_outlined,
              color: GColors.indigo500,
              onTap: () {},
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Breakpoints',
              subtitle: 'Responsive design values',
              icon: Icons.devices_outlined,
              color: GColors.orange500,
              onTap: () {},
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Durations',
              subtitle: 'Animation timing',
              icon: Icons.timer_outlined,
              color: GColors.pink500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimationsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _FoundationTile(
              title: 'Easing Curves',
              subtitle: 'Animation curves',
              icon: Icons.animation_outlined,
              color: GColors.purple500,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnimationsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _FoundationTile extends StatelessWidget {
  const _FoundationTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    required this.colors,
    required this.textTheme,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.surface,
      borderRadius: GBorderRadius.allLg,
      child: InkWell(
        onTap: onTap,
        borderRadius: GBorderRadius.allLg,
        child: Container(
          padding: const EdgeInsets.all(GSpacing.md),
          decoration: BoxDecoration(
            borderRadius: GBorderRadius.allLg,
            border: Border.all(
              color: colors.outline.withOpacity(0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: GSizing.iconLg,
                ),
              ),
              const SizedBox(width: GSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleSmall.copyWith(
                        color: colors.onSurface,
                        fontWeight: GTypography.fontWeightSemiBold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: textTheme.bodySmall.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

