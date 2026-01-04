import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class BottomSheetComponentsScreen extends StatelessWidget {
  const BottomSheetComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Bottom Sheet',
      subtitle: 'GBottomSheet component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Bottom Sheet
            const SectionHeader(
              title: 'Basic Bottom Sheet',
              subtitle: 'Simple content bottom sheet',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Sheet',
              subtitle: 'GBottomSheet.show()',
              child: GButton(
                label: 'Show Bottom Sheet',
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
            ),
            const SizedBox(height: GSpacing.xl),

            // Action Sheet
            const SectionHeader(
              title: 'Action Sheet',
              subtitle: 'Bottom sheet with action items',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Action Items',
              subtitle: 'GBottomSheet.showActions()',
              child: GButton(
                label: 'Show Action Sheet',
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
                        label: 'Browse Files',
                        icon: Icons.folder_outlined,
                        value: 'files',
                      ),
                    ],
                  );
                  if (context.mounted && result != null) {
                    GToastController.info(context, 'Selected: $result');
                  }
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'With Destructive Action',
              subtitle: 'isDestructive: true',
              child: GButton(
                label: 'Show Delete Options',
                variant: GButtonVariant.outlined,
                onPressed: () async {
                  final result = await GBottomSheet.showActions<String>(
                    context,
                    title: 'Delete Options',
                    actions: [
                      const GBottomSheetAction(
                        label: 'Move to Trash',
                        icon: Icons.delete_outline,
                        value: 'trash',
                      ),
                      const GBottomSheetAction(
                        label: 'Delete Permanently',
                        icon: Icons.delete_forever,
                        value: 'delete',
                        isDestructive: true,
                      ),
                    ],
                  );
                  if (context.mounted && result != null) {
                    GToastController.info(context, 'Action: $result');
                  }
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Content
            const SectionHeader(
              title: 'Custom Content',
              subtitle: 'Bottom sheet with custom widgets',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Filter Sheet',
              subtitle: 'Custom filter options',
              child: GButton(
                label: 'Show Filter Sheet',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GBottomSheet.show(
                    context,
                    title: 'Filter Results',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Category',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Wrap(
                          spacing: GSpacing.xs,
                          runSpacing: GSpacing.xs,
                          children: [
                            GChip(label: 'All', selected: true, onTap: () {}),
                            GChip(label: 'Electronics', onTap: () {}),
                            GChip(label: 'Clothing', onTap: () {}),
                            GChip(label: 'Books', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: GSpacing.lg),
                        const Text(
                          'Price Range',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Wrap(
                          spacing: GSpacing.xs,
                          runSpacing: GSpacing.xs,
                          children: [
                            GChip(label: 'Under \$50', onTap: () {}),
                            GChip(label: '\$50 - \$100', onTap: () {}),
                            GChip(label: 'Over \$100', onTap: () {}),
                          ],
                        ),
                        const SizedBox(height: GSpacing.xl),
                        Row(
                          children: [
                            Expanded(
                              child: GButton(
                                label: 'Reset',
                                variant: GButtonVariant.outlined,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const SizedBox(width: GSpacing.sm),
                            Expanded(
                              child: GButton(
                                label: 'Apply',
                                onPressed: () {
                                  Navigator.pop(context);
                                  GToastController.success(context, 'Filters applied');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Share Sheet',
              subtitle: 'Share options',
              child: GButton(
                label: 'Show Share Sheet',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GBottomSheet.show(
                    context,
                    title: 'Share',
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _ShareOption(
                              icon: Icons.message,
                              label: 'Message',
                              onTap: () => Navigator.pop(context),
                            ),
                            _ShareOption(
                              icon: Icons.email,
                              label: 'Email',
                              onTap: () => Navigator.pop(context),
                            ),
                            _ShareOption(
                              icon: Icons.link,
                              label: 'Copy Link',
                              onTap: () => Navigator.pop(context),
                            ),
                            _ShareOption(
                              icon: Icons.more_horiz,
                              label: 'More',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        const SizedBox(height: GSpacing.lg),
                        const GDivider(),
                        const SizedBox(height: GSpacing.sm),
                        GListTile(
                          leading: const Icon(Icons.bookmark_outline),
                          title: 'Save to Bookmarks',
                          onTap: () => Navigator.pop(context),
                        ),
                        GListTile(
                          leading: const Icon(Icons.flag_outlined),
                          title: 'Report',
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: colors.surfaceVariant,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colors.onSurfaceVariant),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: colors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

