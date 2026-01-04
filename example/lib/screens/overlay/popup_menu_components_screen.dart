import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class PopupMenuComponentsScreen extends StatelessWidget {
  const PopupMenuComponentsScreen({
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

    return ShowcaseScaffold(
      title: 'Popup Menu',
      subtitle: 'GPopupMenu & GContextMenu',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Popup Menu
            const SectionHeader(
              title: 'Popup Menu',
              subtitle: 'GPopupMenu component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Menu',
              subtitle: 'Simple popup menu',
              child: GPopupMenu<String>(
                onSelected: (value) {
                  GToastController.info(context, 'Selected: $value');
                },
                items: const [
                  GPopupMenuItem(
                    label: 'Edit',
                    icon: Icons.edit_outlined,
                    value: 'edit',
                  ),
                  GPopupMenuItem(
                    label: 'Duplicate',
                    icon: Icons.copy_outlined,
                    value: 'duplicate',
                  ),
                  GPopupMenuItem(
                    label: 'Share',
                    icon: Icons.share_outlined,
                    value: 'share',
                  ),
                ],
                child: GButton(
                  label: 'Open Menu',
                  trailingIcon: Icons.arrow_drop_down,
                  variant: GButtonVariant.outlined,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Menu with Divider',
              subtitle: 'GPopupMenuItem.divider()',
              child: GPopupMenu<String>(
                onSelected: (value) {
                  GToastController.info(context, 'Selected: $value');
                },
                items: const [
                  GPopupMenuItem(
                    label: 'Edit',
                    icon: Icons.edit_outlined,
                    value: 'edit',
                  ),
                  GPopupMenuItem(
                    label: 'Duplicate',
                    icon: Icons.copy_outlined,
                    value: 'duplicate',
                  ),
                  GPopupMenuItem.divider(),
                  GPopupMenuItem(
                    label: 'Delete',
                    icon: Icons.delete_outline,
                    value: 'delete',
                    isDestructive: true,
                  ),
                ],
                child: GButton(
                  label: 'Menu with Divider',
                  trailingIcon: Icons.arrow_drop_down,
                  variant: GButtonVariant.outlined,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Icon Button Trigger',
              subtitle: 'Using IconButton as trigger',
              child: Row(
                children: [
                  GPopupMenu<String>(
                    onSelected: (value) {
                      GToastController.info(context, 'Action: $value');
                    },
                    items: const [
                      GPopupMenuItem(
                        label: 'Profile',
                        icon: Icons.person_outline,
                        value: 'profile',
                      ),
                      GPopupMenuItem(
                        label: 'Settings',
                        icon: Icons.settings_outlined,
                        value: 'settings',
                      ),
                      GPopupMenuItem.divider(),
                      GPopupMenuItem(
                        label: 'Logout',
                        icon: Icons.logout,
                        value: 'logout',
                      ),
                    ],
                    child: IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GPopupMenu<String>(
                    items: const [
                      GPopupMenuItem(
                        label: 'Sort by Name',
                        value: 'name',
                      ),
                      GPopupMenuItem(
                        label: 'Sort by Date',
                        value: 'date',
                      ),
                      GPopupMenuItem(
                        label: 'Sort by Size',
                        value: 'size',
                      ),
                    ],
                    child: IconButton(
                      icon: const Icon(Icons.sort),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Context Menu
            const SectionHeader(
              title: 'Context Menu',
              subtitle: 'GContextMenu - Right-click or long-press',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Context Menu',
              subtitle: 'Right-click or long-press to show',
              child: GContextMenu<String>(
                onSelected: (value) {
                  GToastController.info(context, 'Action: $value');
                },
                items: const [
                  GPopupMenuItem(
                    label: 'Cut',
                    icon: Icons.content_cut,
                    value: 'cut',
                  ),
                  GPopupMenuItem(
                    label: 'Copy',
                    icon: Icons.content_copy,
                    value: 'copy',
                  ),
                  GPopupMenuItem(
                    label: 'Paste',
                    icon: Icons.content_paste,
                    value: 'paste',
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(GSpacing.xl),
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: GBorderRadius.allMd,
                    border: Border.all(
                      color: colors.outline.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    'Right-click or long-press here',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Rich Context Menu',
              subtitle: 'With dividers and destructive action',
              child: GContextMenu<String>(
                onSelected: (value) {
                  GToastController.info(context, 'Action: $value');
                },
                items: const [
                  GPopupMenuItem(
                    label: 'Open',
                    icon: Icons.open_in_new,
                    value: 'open',
                  ),
                  GPopupMenuItem(
                    label: 'Open in New Tab',
                    icon: Icons.tab,
                    value: 'new_tab',
                  ),
                  GPopupMenuItem.divider(),
                  GPopupMenuItem(
                    label: 'Save Link As...',
                    icon: Icons.save_alt,
                    value: 'save',
                  ),
                  GPopupMenuItem(
                    label: 'Copy Link',
                    icon: Icons.link,
                    value: 'copy_link',
                  ),
                  GPopupMenuItem.divider(),
                  GPopupMenuItem(
                    label: 'Remove',
                    icon: Icons.remove_circle_outline,
                    value: 'remove',
                    isDestructive: true,
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.all(GSpacing.lg),
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.link, color: colors.onPrimaryContainer),
                      const SizedBox(width: GSpacing.sm),
                      Text(
                        'https://example.com',
                        style: TextStyle(color: colors.onPrimaryContainer),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Image Context Menu',
              subtitle: 'Context menu on image',
              child: GContextMenu<String>(
                onSelected: (value) {
                  GToastController.info(context, 'Action: $value');
                },
                items: const [
                  GPopupMenuItem(
                    label: 'View Image',
                    icon: Icons.visibility,
                    value: 'view',
                  ),
                  GPopupMenuItem(
                    label: 'Save Image',
                    icon: Icons.download,
                    value: 'save',
                  ),
                  GPopupMenuItem(
                    label: 'Copy Image',
                    icon: Icons.copy,
                    value: 'copy',
                  ),
                  GPopupMenuItem.divider(),
                  GPopupMenuItem(
                    label: 'Set as Wallpaper',
                    icon: Icons.wallpaper,
                    value: 'wallpaper',
                  ),
                ],
                child: ClipRRect(
                  borderRadius: GBorderRadius.allMd,
                  child: Container(
                    width: 150,
                    height: 100,
                    color: colors.surfaceVariant,
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: colors.onSurfaceVariant,
                    ),
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

