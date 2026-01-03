import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class OverlayComponentsScreen extends StatelessWidget {
  const OverlayComponentsScreen({
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
      title: 'Overlay Components',
      subtitle: 'BottomSheet, PopupMenu, etc.',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bottom Sheet
            const SectionHeader(
              title: 'Bottom Sheet',
              subtitle: 'GBottomSheet component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Bottom Sheet',
              subtitle: 'Modal bottom sheets',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Simple Sheet',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GBottomSheet.show(
                        context,
                        title: 'Bottom Sheet',
                        subtitle: 'This is a simple bottom sheet',
                        child: Column(
                          children: [
                            GListTile(
                              leading: const Icon(Icons.share),
                              title: 'Share',
                              onTap: () => Navigator.pop(context),
                            ),
                            GListTile(
                              leading: const Icon(Icons.link),
                              title: 'Copy Link',
                              onTap: () => Navigator.pop(context),
                            ),
                            GListTile(
                              leading: const Icon(Icons.edit),
                              title: 'Edit',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  GButton(
                    label: 'Action Sheet',
                    variant: GButtonVariant.outlined,
                    onPressed: () async {
                      final result = await GBottomSheet.showActions<String>(
                        context,
                        title: 'Choose Action',
                        actions: [
                          const GBottomSheetAction(
                            label: 'Take Photo',
                            icon: Icons.camera_alt_outlined,
                            value: 'photo',
                          ),
                          const GBottomSheetAction(
                            label: 'Choose from Gallery',
                            icon: Icons.photo_library_outlined,
                            value: 'gallery',
                          ),
                          const GBottomSheetAction(
                            label: 'Delete Photo',
                            icon: Icons.delete_outline,
                            value: 'delete',
                            isDestructive: true,
                          ),
                        ],
                      );
                      if (context.mounted && result != null) {
                        GToastController.info(context, 'Selected: $result');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Popup Menu
            const SectionHeader(
              title: 'Popup Menu',
              subtitle: 'GPopupMenu component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Popup Menu',
              subtitle: 'Contextual menus',
              child: Row(
                children: [
                  GPopupMenu<String>(
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
                      label: 'Open Menu',
                      trailingIcon: Icons.arrow_drop_down,
                      variant: GButtonVariant.outlined,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GPopupMenu<String>(
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
                    child: GIconButton(
                      icon: Icons.more_vert,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Context Menu',
              subtitle: 'Right-click or long-press menu',
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
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Text(
                    'Right-click or long-press here',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Tooltip
            const SectionHeader(
              title: 'Tooltip',
              subtitle: 'GTooltip component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Tooltips',
              subtitle: 'Hover for information',
              child: Row(
                children: [
                  GTooltip(
                    message: 'This is a tooltip',
                    child: GIconButton(
                      icon: Icons.info_outline,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Add new item',
                    child: GButton(
                      label: 'Add',
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Delete this item permanently',
                    child: GIconButton(
                      icon: Icons.delete_outline,
                      variant: GIconButtonVariant.standard,
                      onPressed: () {},
                    ),
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

