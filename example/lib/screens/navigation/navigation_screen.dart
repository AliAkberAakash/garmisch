import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'navigation_components_screen.dart';

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
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Bottom Navigation',
              subtitle: 'Bottom tab bar',
              icon: Icons.navigation_outlined,
              color: GColors.indigo500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Tab Bar',
              subtitle: 'Content tabs',
              icon: Icons.tab_outlined,
              color: GColors.violet500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Drawer',
              subtitle: 'Side navigation panel',
              icon: Icons.menu_outlined,
              color: GColors.purple500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Breadcrumb',
              subtitle: 'Hierarchical navigation',
              icon: Icons.chevron_right_outlined,
              color: GColors.teal500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Pagination',
              subtitle: 'Page navigation',
              icon: Icons.more_horiz_outlined,
              color: GColors.cyan500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Stepper',
              subtitle: 'Multi-step progress',
              icon: Icons.format_list_numbered_outlined,
              color: GColors.green500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => _navigateToComponents(context),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }

  void _navigateToComponents(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NavigationComponentsScreen(
          onThemeToggle: onThemeToggle,
          isDarkMode: isDarkMode,
        ),
      ),
    );
  }
}

enum _ComponentStatus { ready, inProgress, planned }

class _ComponentTile extends StatelessWidget {
  const _ComponentTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.status,
    required this.colors,
    required this.textTheme,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final _ComponentStatus status;
  final GColorScheme colors;
  final GTextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final statusColor = switch (status) {
      _ComponentStatus.ready => colors.success,
      _ComponentStatus.inProgress => colors.warning,
      _ComponentStatus.planned => colors.onSurfaceVariant,
    };
    final statusLabel = switch (status) {
      _ComponentStatus.ready => 'Ready',
      _ComponentStatus.inProgress => 'In Progress',
      _ComponentStatus.planned => 'Planned',
    };

    return Material(
      color: colors.surface,
      borderRadius: GBorderRadius.allLg,
      child: InkWell(
        onTap: status == _ComponentStatus.ready ? onTap : null,
        borderRadius: GBorderRadius.allLg,
        child: Container(
          padding: const EdgeInsets.all(GSpacing.md),
          decoration: BoxDecoration(
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
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: GBorderRadius.allFull,
                ),
                child: Text(
                  statusLabel,
                  style: textTheme.labelSmall.copyWith(
                    color: statusColor,
                    fontWeight: GTypography.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
