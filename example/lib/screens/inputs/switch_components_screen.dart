import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SwitchComponentsScreen extends StatefulWidget {
  const SwitchComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<SwitchComponentsScreen> createState() => _SwitchComponentsScreenState();
}

class _SwitchComponentsScreenState extends State<SwitchComponentsScreen> {
  bool _switch1 = false;
  bool _switch2 = true;
  bool _notifications = true;
  bool _emailAlerts = false;
  bool _darkMode = false;
  bool _autoSave = true;

  @override
  void initState() {
    super.initState();
    _darkMode = widget.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Switch',
      subtitle: 'GSwitch component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Switch
            const SectionHeader(
              title: 'Basic Switch',
              subtitle: 'Toggle on/off state',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Switch States',
              subtitle: 'value, onChanged props',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSwitch(
                    value: _switch1,
                    onChanged: (v) => setState(() => _switch1 = v),
                    label: 'Off switch',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: _switch2,
                    onChanged: (v) => setState(() => _switch2 = v),
                    label: 'On switch',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Switch Sizes
            const SectionHeader(
              title: 'Switch Sizes',
              subtitle: 'GSwitchSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Options',
              subtitle: 'sm, md, lg',
              child: Row(
                children: [
                  GSwitch(
                    value: true,
                    size: GSwitchSize.sm,
                    onChanged: (v) {},
                    label: 'Small',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GSwitch(
                    value: true,
                    size: GSwitchSize.md,
                    onChanged: (v) {},
                    label: 'Medium',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GSwitch(
                    value: true,
                    size: GSwitchSize.lg,
                    onChanged: (v) {},
                    label: 'Large',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Disabled State
            const SectionHeader(
              title: 'Disabled State',
              subtitle: 'isDisabled: true',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Disabled Switches',
              subtitle: 'Non-interactive states',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSwitch(
                    value: false,
                    isDisabled: true,
                    label: 'Disabled off',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: true,
                    isDisabled: true,
                    label: 'Disabled on',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'activeColor property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Colored Switches',
              subtitle: 'Different active colors',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSwitch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.success,
                    label: 'Success color',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.warning,
                    label: 'Warning color',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.error,
                    label: 'Error color',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example - Settings
            const SectionHeader(
              title: 'Practical Example',
              subtitle: 'Settings panel',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'App Settings',
              subtitle: 'Common switch patterns',
              child: Column(
                children: [
                  _SettingsItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                    subtitle: 'Use dark theme',
                    value: _darkMode,
                    onChanged: (v) {
                      setState(() => _darkMode = v);
                      widget.onThemeToggle();
                    },
                    colors: colors,
                  ),
                  const GDivider(),
                  _SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Receive push notifications',
                    value: _notifications,
                    onChanged: (v) => setState(() => _notifications = v),
                    colors: colors,
                  ),
                  const GDivider(),
                  _SettingsItem(
                    icon: Icons.email_outlined,
                    title: 'Email Alerts',
                    subtitle: 'Get email updates',
                    value: _emailAlerts,
                    onChanged: (v) => setState(() => _emailAlerts = v),
                    colors: colors,
                  ),
                  const GDivider(),
                  _SettingsItem(
                    icon: Icons.save_outlined,
                    title: 'Auto Save',
                    subtitle: 'Save changes automatically',
                    value: _autoSave,
                    onChanged: (v) => setState(() => _autoSave = v),
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Feature Toggles',
              subtitle: 'Enable/disable features',
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Analytics', style: TextStyle(color: colors.onSurface)),
                      GSwitch(
                        value: true,
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Crash Reports', style: TextStyle(color: colors.onSurface)),
                      GSwitch(
                        value: true,
                        onChanged: (v) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Beta Features', style: TextStyle(color: colors.onSurface)),
                      GSwitch(
                        value: false,
                        onChanged: (v) {},
                      ),
                    ],
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

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    required this.colors,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.sm),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(GSpacing.sm),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              borderRadius: GBorderRadius.allMd,
            ),
            child: Icon(icon, size: 20, color: colors.primary),
          ),
          const SizedBox(width: GSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colors.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          GSwitch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

