import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';
import 'button_screen.dart';
import 'checkbox_radio_switch_screen.dart';
import 'dropdown_components_screen.dart';
import 'search_link_screen.dart';
import 'slider_components_screen.dart';
import 'text_field_screen.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({
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
      title: 'Input Components',
      subtitle: 'Form controls and buttons',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Input components allow users to enter data, make selections, '
              'and trigger actions. All inputs support various states and variants.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Component List
            _ComponentTile(
              title: 'Button',
              subtitle: 'Primary action triggers',
              icon: Icons.smart_button_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ButtonScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Icon Button',
              subtitle: 'Icon-only actions',
              icon: Icons.radio_button_checked_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ButtonScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Text Field',
              subtitle: 'Text input with validation',
              icon: Icons.text_fields_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TextFieldScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Checkbox',
              subtitle: 'Multi-selection control',
              icon: Icons.check_box_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckboxRadioSwitchScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Radio',
              subtitle: 'Single-selection control',
              icon: Icons.radio_button_checked,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckboxRadioSwitchScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Switch',
              subtitle: 'Toggle control',
              icon: Icons.toggle_on_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckboxRadioSwitchScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Slider',
              subtitle: 'Range selection',
              icon: Icons.tune_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SliderComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Dropdown',
              subtitle: 'Selection from list',
              icon: Icons.arrow_drop_down_circle_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DropdownComponentsScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Search Field',
              subtitle: 'Search input with loading',
              icon: Icons.search_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchLinkScreen(
                    onThemeToggle: onThemeToggle,
                    isDarkMode: isDarkMode,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.sm),
            _ComponentTile(
              title: 'Link',
              subtitle: 'Navigation text links',
              icon: Icons.link_outlined,
              status: _ComponentStatus.ready,
              colors: colors,
              textTheme: textTheme,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SearchLinkScreen(
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
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Icon(
                  icon,
                  color: colors.primary,
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

