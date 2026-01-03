import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class OverlayScreen extends StatelessWidget {
  const OverlayScreen({
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
      title: 'Overlay Components',
      subtitle: 'Modals, dialogs, and popups',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overlay components appear above the main content to focus '
              'user attention on specific tasks or information.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            _ComponentTile(
              title: 'Dialog',
              subtitle: 'Confirmation and alert dialogs',
              icon: Icons.chat_bubble_outline,
              color: GColors.blue500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Modal',
              subtitle: 'Full-featured modal windows',
              icon: Icons.open_in_new_outlined,
              color: GColors.purple500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Bottom Sheet',
              subtitle: 'Slide-up panels',
              icon: Icons.vertical_align_bottom_outlined,
              color: GColors.teal500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Popup Menu',
              subtitle: 'Context menus',
              icon: Icons.more_vert_outlined,
              color: GColors.indigo500,
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Overlay Portal',
              subtitle: 'Custom overlays',
              icon: Icons.filter_none_outlined,
              color: GColors.orange500,
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

