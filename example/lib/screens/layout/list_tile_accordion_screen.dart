import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ListTileAccordionScreen extends StatefulWidget {
  const ListTileAccordionScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ListTileAccordionScreen> createState() => _ListTileAccordionScreenState();
}

class _ListTileAccordionScreenState extends State<ListTileAccordionScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return ShowcaseScaffold(
      title: 'ListTile & Accordion',
      subtitle: 'GListTile, GAccordion components',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ListTile
            const SectionHeader(
              title: 'List Tile',
              subtitle: 'GListTile component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic List Tiles',
              subtitle: 'Interactive list items',
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
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'List Tile Sizes',
              subtitle: 'GListTileSize enum',
              child: Column(
                children: [
                  GListTile(
                    title: 'Small List Tile',
                    size: GListTileSize.sm,
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    title: 'Medium List Tile',
                    subtitle: 'With subtitle',
                    size: GListTileSize.md,
                    onTap: () {},
                  ),
                  const GDivider(),
                  GListTile(
                    title: 'Large List Tile',
                    subtitle: 'With subtitle',
                    size: GListTileSize.lg,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Selectable List',
              subtitle: 'isSelected prop',
              child: Column(
                children: List.generate(4, (index) {
                  return GListTile(
                    leading: Icon(
                      [Icons.home, Icons.search, Icons.notifications, Icons.settings][index],
                    ),
                    title: ['Home', 'Search', 'Notifications', 'Settings'][index],
                    isSelected: _selectedIndex == index,
                    onTap: () => setState(() => _selectedIndex = index),
                    showDivider: index < 3,
                  );
                }),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'List Section',
              subtitle: 'GListSection for grouping',
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
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Accordion
            const SectionHeader(
              title: 'Accordion',
              subtitle: 'GAccordion component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Accordion',
              subtitle: 'Collapsible sections',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  items: [
                    GAccordionItem(
                      title: 'What is Garmisch?',
                      content: Text(
                        'Garmisch is a minimalistic design system for Flutter, '
                        'providing a complete set of foundational tokens and UI components.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'How do I get started?',
                      content: Text(
                        'Add garmisch to your pubspec.yaml, wrap your app with GTheme, '
                        'and start using the components!',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Is it customizable?',
                      content: Text(
                        'Yes! You can customize colors, typography, spacing, and more '
                        'through the theme system.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                  initialExpandedIndex: 0,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Multi-Expand Accordion',
              subtitle: 'allowMultiple prop',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  allowMultiple: true,
                  items: [
                    GAccordionItem(
                      title: 'Section 1',
                      leading: Icon(Icons.looks_one, color: colors.primary),
                      content: Text(
                        'Content for section 1. Multiple sections can be open at once.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Section 2',
                      leading: Icon(Icons.looks_two, color: colors.primary),
                      content: Text(
                        'Content for section 2. Try opening multiple sections.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Section 3',
                      leading: Icon(Icons.looks_3, color: colors.primary),
                      content: Text(
                        'Content for section 3.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Expansion Tile',
              subtitle: 'GExpansionTile standalone component',
              child: GExpansionTile(
                title: 'Advanced Settings',
                subtitle: 'Configure advanced options',
                leading: Icon(Icons.settings, color: colors.primary),
                initiallyExpanded: true,
                children: [
                  GListTile(
                    title: 'Debug Mode',
                    trailing: GSwitch(value: false, onChanged: (v) {}),
                  ),
                  GListTile(
                    title: 'Analytics',
                    trailing: GSwitch(value: true, onChanged: (v) {}),
                  ),
                  GListTile(
                    title: 'Crash Reports',
                    trailing: GSwitch(value: true, onChanged: (v) {}),
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

