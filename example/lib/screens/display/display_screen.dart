import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'avatar_badge_screen.dart';
import 'chip_components_screen.dart';
import 'progress_components_screen.dart';
import 'skeleton_divider_screen.dart';
import 'text_image_icon_screen.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({
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
      title: 'Display Components',
      subtitle: 'Visual presentation elements',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Display components present information and content to users. '
              'They include avatars, badges, progress indicators, and more.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            _ComponentTile(
              title: 'Avatar',
              subtitle: 'User/entity representation',
              icon: Icons.account_circle_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AvatarBadgeScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Badge',
              subtitle: 'Status indicators',
              icon: Icons.verified_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AvatarBadgeScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Chip',
              subtitle: 'Compact element for info/actions',
              icon: Icons.label_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChipComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Divider',
              subtitle: 'Content separator',
              icon: Icons.horizontal_rule_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SkeletonDividerScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Progress',
              subtitle: 'Progress indicators',
              icon: Icons.donut_large_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProgressComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Skeleton',
              subtitle: 'Loading placeholder',
              icon: Icons.rectangle_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SkeletonDividerScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Tooltip',
              subtitle: 'Contextual information',
              icon: Icons.info_outline,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SkeletonDividerScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Text',
              subtitle: 'Styled text with tokens',
              icon: Icons.text_fields_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TextImageIconScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Image',
              subtitle: 'Images with loading states',
              icon: Icons.image_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TextImageIconScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Icon',
              subtitle: 'Themed icon wrapper',
              icon: Icons.emoji_symbols_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TextImageIconScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
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
    required this.colors,
    required this.textTheme,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
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
                  color: colors.secondary.withValues(alpha: 0.1),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Icon(
                  icon,
                  color: colors.secondary,
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

