import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
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
      title: 'Navigation Components',
      subtitle: 'App navigation and wayfinding',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Navigation components help users move through your app and '
              'understand their current location within the interface.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            _ComponentTile(
              title: 'App Bar',
              subtitle: 'Top navigation bar',
              icon: Icons.web_asset_outlined,
              color: GColors.blue500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Bottom Navigation',
              subtitle: 'Bottom tab bar',
              icon: Icons.navigation_outlined,
              color: GColors.indigo500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Tab Bar',
              subtitle: 'Content tabs',
              icon: Icons.tab_outlined,
              color: GColors.violet500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Drawer',
              subtitle: 'Side navigation panel',
              icon: Icons.menu_outlined,
              color: GColors.purple500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Breadcrumb',
              subtitle: 'Hierarchical navigation',
              icon: Icons.chevron_right_outlined,
              color: GColors.teal500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Pagination',
              subtitle: 'Page navigation',
              icon: Icons.more_horiz_outlined,
              color: GColors.cyan500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Stepper',
              subtitle: 'Multi-step progress',
              icon: Icons.format_list_numbered_outlined,
              color: GColors.green500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Link',
              subtitle: 'Text navigation links',
              icon: Icons.link_outlined,
              color: GColors.sky500,
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

class _ComponentTile extends StatelessWidget {
  const _ComponentTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.colors,
    required this.textTheme,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(
          color: colors.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(GSpacing.sm),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
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
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: GSpacing.sm,
              vertical: GSpacing.xs3,
            ),
            decoration: BoxDecoration(
              color: colors.onSurfaceVariant.withValues(alpha: 0.1),
              borderRadius: GBorderRadius.allFull,
            ),
            child: Text(
              'Planned',
              style: textTheme.labelSmall.copyWith(
                color: colors.onSurfaceVariant,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

