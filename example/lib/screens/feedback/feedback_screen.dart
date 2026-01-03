import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'alert_toast_screen.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({
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
      title: 'Feedback Components',
      subtitle: 'User notifications and alerts',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Feedback components communicate status, errors, and important '
              'information to users through various notification patterns.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            _ComponentTile(
              title: 'Alert',
              subtitle: 'Inline notification messages',
              icon: Icons.warning_amber_outlined,
              status: _ComponentStatus.ready,
              color: GColors.amber500,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AlertToastScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Toast',
              subtitle: 'Brief popup notifications',
              icon: Icons.notifications_outlined,
              status: _ComponentStatus.ready,
              color: GColors.blue500,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AlertToastScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Snackbar',
              subtitle: 'Bottom action notifications',
              icon: Icons.announcement_outlined,
              status: _ComponentStatus.planned,
              color: GColors.green500,
              colors: colors,
              textTheme: textTheme,
              onTap: () {},
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Banner',
              subtitle: 'Persistent top notifications',
              icon: Icons.campaign_outlined,
              status: _ComponentStatus.planned,
              color: GColors.purple500,
              colors: colors,
              textTheme: textTheme,
              onTap: () {},
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
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
    required this.status,
    required this.color,
    required this.colors,
    required this.textTheme,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final _ComponentStatus status;
  final Color color;
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

