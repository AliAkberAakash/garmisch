import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({
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
      title: 'Layout Components',
      subtitle: 'Structure and composition',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Layout components help organize content and create consistent '
              'spatial relationships between UI elements.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            _ComponentTile(
              title: 'Card',
              subtitle: 'Content container with shadow',
              icon: Icons.crop_square_outlined,
              color: GColors.blue500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Container',
              subtitle: 'Basic box container',
              icon: Icons.check_box_outline_blank,
              color: GColors.gray500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Grid',
              subtitle: 'Responsive grid layout',
              icon: Icons.grid_view_outlined,
              color: GColors.purple500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Stack',
              subtitle: 'Overlapping elements',
              icon: Icons.layers_outlined,
              color: GColors.indigo500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Spacer / Gap',
              subtitle: 'Spacing utilities',
              icon: Icons.space_bar_outlined,
              color: GColors.teal500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Responsive',
              subtitle: 'Breakpoint-based layouts',
              icon: Icons.devices_outlined,
              color: GColors.cyan500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Scaffold',
              subtitle: 'Page structure',
              icon: Icons.web_outlined,
              color: GColors.green500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'List Tile',
              subtitle: 'List item layout',
              icon: Icons.view_list_outlined,
              color: GColors.orange500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Expansion Tile',
              subtitle: 'Expandable content',
              icon: Icons.expand_more_outlined,
              color: GColors.amber500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Accordion',
              subtitle: 'Collapsible sections',
              icon: Icons.unfold_more_outlined,
              color: GColors.rose500,
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

