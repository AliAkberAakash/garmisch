import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class BreadcrumbComponentsScreen extends StatelessWidget {
  const BreadcrumbComponentsScreen({
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
      title: 'Breadcrumb',
      subtitle: 'Hierarchical navigation component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Breadcrumb
            const SectionHeader(
              title: 'Basic Breadcrumb',
              subtitle: 'Standard breadcrumb navigation',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Breadcrumb',
              subtitle: 'Text-only breadcrumb items',
              child: GBreadcrumb(
                items: [
                  GBreadcrumbItem(label: 'Home', onTap: () {}),
                  GBreadcrumbItem(label: 'Products', onTap: () {}),
                  GBreadcrumbItem(label: 'Electronics', onTap: () {}),
                  const GBreadcrumbItem(label: 'Phones'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Breadcrumb with Icons
            const SectionHeader(
              title: 'With Icons',
              subtitle: 'Breadcrumb items with icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icon Breadcrumb',
              subtitle: 'Icons with labels',
              child: GBreadcrumb(
                items: [
                  GBreadcrumbItem(
                    label: 'Dashboard',
                    icon: Icons.dashboard,
                    onTap: () {},
                  ),
                  GBreadcrumbItem(
                    label: 'Settings',
                    icon: Icons.settings,
                    onTap: () {},
                  ),
                  const GBreadcrumbItem(
                    label: 'Profile',
                    icon: Icons.person,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Long Breadcrumb with Max Items
            const SectionHeader(
              title: 'Collapsed Breadcrumb',
              subtitle: 'With maxItems to show ellipsis',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Max Items',
              subtitle: 'maxItems: 3 (shows ellipsis)',
              child: GBreadcrumb(
                maxItems: 3,
                items: [
                  GBreadcrumbItem(label: 'Home', onTap: () {}),
                  GBreadcrumbItem(label: 'Category', onTap: () {}),
                  GBreadcrumbItem(label: 'Subcategory', onTap: () {}),
                  GBreadcrumbItem(label: 'Products', onTap: () {}),
                  const GBreadcrumbItem(label: 'Item Details'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Separator
            const SectionHeader(
              title: 'Custom Separator',
              subtitle: 'Using custom separator widget',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Slash Separator',
              subtitle: 'Custom separator: "/"',
              child: GBreadcrumb(
                separator: Text(
                  '/',
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                items: [
                  GBreadcrumbItem(label: 'Users', onTap: () {}),
                  GBreadcrumbItem(label: 'Admin', onTap: () {}),
                  const GBreadcrumbItem(label: 'Permissions'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Arrow Separator',
              subtitle: 'Custom separator: "→"',
              child: GBreadcrumb(
                separator: Text(
                  '→',
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                items: [
                  GBreadcrumbItem(label: 'Start', onTap: () {}),
                  GBreadcrumbItem(label: 'Middle', onTap: () {}),
                  const GBreadcrumbItem(label: 'End'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Various Use Cases
            const SectionHeader(
              title: 'Use Cases',
              subtitle: 'Different breadcrumb scenarios',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'File Path',
              subtitle: 'File system navigation',
              child: GBreadcrumb(
                items: [
                  GBreadcrumbItem(
                    label: 'Root',
                    icon: Icons.folder,
                    onTap: () {},
                  ),
                  GBreadcrumbItem(
                    label: 'Documents',
                    icon: Icons.folder,
                    onTap: () {},
                  ),
                  GBreadcrumbItem(
                    label: 'Projects',
                    icon: Icons.folder,
                    onTap: () {},
                  ),
                  const GBreadcrumbItem(
                    label: 'file.txt',
                    icon: Icons.insert_drive_file,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'E-commerce',
              subtitle: 'Product category navigation',
              child: GBreadcrumb(
                items: [
                  GBreadcrumbItem(label: 'Shop', onTap: () {}),
                  GBreadcrumbItem(label: 'Clothing', onTap: () {}),
                  GBreadcrumbItem(label: 'Men', onTap: () {}),
                  GBreadcrumbItem(label: 'Shirts', onTap: () {}),
                  const GBreadcrumbItem(label: 'Casual Shirts'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Settings',
              subtitle: 'App settings navigation',
              child: GBreadcrumb(
                items: [
                  GBreadcrumbItem(
                    label: 'Settings',
                    icon: Icons.settings,
                    onTap: () {},
                  ),
                  GBreadcrumbItem(
                    label: 'Account',
                    icon: Icons.account_circle,
                    onTap: () {},
                  ),
                  const GBreadcrumbItem(
                    label: 'Security',
                    icon: Icons.security,
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

