import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'bottomsheet_components_screen.dart';
import 'dialog_components_screen.dart';
import 'popover_components_screen.dart';
import 'popup_menu_components_screen.dart';
import 'tooltip_components_screen.dart';

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
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DialogComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Bottom Sheet',
              subtitle: 'Bottom sliding panel',
              icon: Icons.vertical_align_bottom_outlined,
              color: GColors.indigo500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BottomSheetComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Popup Menu',
              subtitle: 'Contextual menu options',
              icon: Icons.more_vert,
              color: GColors.purple500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PopupMenuComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Tooltip',
              subtitle: 'Hover information tips',
              icon: Icons.info_outline,
              color: GColors.teal500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TooltipComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Popover',
              subtitle: 'Rich popup content',
              icon: Icons.open_in_new_outlined,
              color: GColors.cyan500,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PopoverComponentsScreen(
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
