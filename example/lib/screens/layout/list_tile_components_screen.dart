import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ListTileComponentsScreen extends StatefulWidget {
  const ListTileComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ListTileComponentsScreen> createState() => _ListTileComponentsScreenState();
}

class _ListTileComponentsScreenState extends State<ListTileComponentsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'List Tile',
      subtitle: 'GListTile component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic List Tiles
            const SectionHeader(
              title: 'Basic List Tiles',
              subtitle: 'Interactive list items',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Leading & Trailing',
              subtitle: 'Icons, badges, and more',
              child: Column(
                children: [
                  GListTile(
                    leading: const Icon(Icons.inbox_outlined),
                    title: 'Inbox',
                    subtitle: '24 new messages',
                    trailing: GBadge(
                      label: '24',
                      color: GBadgeColor.primary,
                      size: GBadgeSize.sm,
                    ),
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: const Icon(Icons.send_outlined),
                    title: 'Sent',
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: const Icon(Icons.drafts_outlined),
                    title: 'Drafts',
                    subtitle: '3 drafts',
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: const Icon(Icons.delete_outlined),
                    title: 'Trash',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // List Tile Sizes
            const SectionHeader(
              title: 'List Tile Sizes',
              subtitle: 'GListTileSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Small Size',
              subtitle: 'GListTileSize.sm',
              child: GListTile(
                title: 'Small List Tile',
                leading: const Icon(Icons.star_outline, size: 18),
                size: GListTileSize.sm,
                onTap: () {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Medium Size',
              subtitle: 'GListTileSize.md (default)',
              child: GListTile(
                title: 'Medium List Tile',
                subtitle: 'With subtitle text',
                leading: const Icon(Icons.star_outline),
                size: GListTileSize.md,
                onTap: () {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Large Size',
              subtitle: 'GListTileSize.lg',
              child: GListTile(
                title: 'Large List Tile',
                subtitle: 'With subtitle text for more detail',
                leading: const Icon(Icons.star_outline, size: 28),
                size: GListTileSize.lg,
                onTap: () {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Selectable List
            const SectionHeader(
              title: 'Selectable List',
              subtitle: 'isSelected property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Navigation List',
              subtitle: 'Tap to select',
              child: Column(
                children: List.generate(4, (index) {
                  final items = [
                    (Icons.home, 'Home'),
                    (Icons.search, 'Search'),
                    (Icons.notifications, 'Notifications'),
                    (Icons.settings, 'Settings'),
                  ];
                  return GListTile(
                    leading: Icon(items[index].$1),
                    title: items[index].$2,
                    isSelected: _selectedIndex == index,
                    onTap: () => setState(() => _selectedIndex = index),
                    showDivider: index < 3,
                  );
                }),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // List Sections
            const SectionHeader(
              title: 'List Sections',
              subtitle: 'GListSection for grouping',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Grouped Settings',
              subtitle: 'Section headers',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GListSection(title: 'Account'),
                  GListTile(
                    leading: const Icon(Icons.person_outline),
                    title: 'Profile',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  GListTile(
                    leading: const Icon(Icons.lock_outline),
                    title: 'Privacy',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  GListTile(
                    leading: const Icon(Icons.security_outlined),
                    title: 'Security',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GListSection(title: 'Preferences'),
                  GListTile(
                    leading: const Icon(Icons.notifications_outlined),
                    title: 'Notifications',
                    trailing: GSwitch(
                      value: true,
                      onChanged: (v) {},
                    ),
                    onTap: () {},
                  ),
                  GListTile(
                    leading: const Icon(Icons.dark_mode_outlined),
                    title: 'Dark Mode',
                    trailing: GSwitch(
                      value: widget.isDarkMode,
                      onChanged: (v) => widget.onThemeToggle(),
                    ),
                    onTap: widget.onThemeToggle,
                  ),
                  GListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: 'Language',
                    subtitle: 'English',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // List Tile with Actions
            const SectionHeader(
              title: 'List Tile with Actions',
              subtitle: 'Interactive trailing widgets',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Action Buttons',
              subtitle: 'Icon buttons in trailing',
              child: Column(
                children: [
                  GListTile(
                    leading: GAvatar(name: 'John Doe', size: GAvatarSize.sm),
                    title: 'John Doe',
                    subtitle: 'john.doe@example.com',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.message_outlined),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.call_outlined),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: GAvatar(name: 'Jane Smith', size: GAvatarSize.sm),
                    title: 'Jane Smith',
                    subtitle: 'jane.smith@example.com',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.message_outlined),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.call_outlined),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Various Content Types
            const SectionHeader(
              title: 'Various Content',
              subtitle: 'Different list tile configurations',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Mixed Content',
              subtitle: 'Various trailing widgets',
              child: Column(
                children: [
                  GListTile(
                    leading: Icon(Icons.check_circle, color: colors.success),
                    title: 'Completed Task',
                    subtitle: 'This task is done',
                    trailing: Icon(Icons.check, color: colors.success),
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: Icon(Icons.lock, color: colors.onSurfaceVariant),
                    title: 'Premium Feature',
                    subtitle: 'Upgrade to unlock',
                    trailing: GBadge(
                      label: 'PRO',
                      color: GBadgeColor.warning,
                      size: GBadgeSize.sm,
                    ),
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    leading: Icon(Icons.schedule, color: colors.info),
                    title: 'Scheduled',
                    subtitle: 'Tomorrow at 10:00 AM',
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
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

