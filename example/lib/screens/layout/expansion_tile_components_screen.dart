import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ExpansionTileComponentsScreen extends StatelessWidget {
  const ExpansionTileComponentsScreen({
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
      title: 'Expansion Tile',
      subtitle: 'GExpansionTile component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Expansion Tile
            const SectionHeader(
              title: 'Basic Expansion Tile',
              subtitle: 'Collapsible content section',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Expansion',
              subtitle: 'Tap to expand/collapse',
              child: GExpansionTile(
                title: 'Click to Expand',
                children: [
                  Padding(
                    padding: const EdgeInsets.all(GSpacing.md),
                    child: Text(
                      'This is the expanded content. You can put any widgets here.',
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Leading Icon
            const SectionHeader(
              title: 'With Leading Icon',
              subtitle: 'Icon on the left side',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Leading Property',
              subtitle: 'Icon or widget on left',
              child: Column(
                children: [
                  GExpansionTile(
                    title: 'Settings',
                    leading: Icon(Icons.settings, color: colors.primary),
                    children: [
                      GListTile(
                        title: 'General',
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      GListTile(
                        title: 'Privacy',
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      GListTile(
                        title: 'Security',
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                    ],
                  ),
                  const GDivider(),
                  GExpansionTile(
                    title: 'Notifications',
                    leading: Icon(Icons.notifications, color: colors.warning),
                    children: [
                      GListTile(
                        title: 'Push Notifications',
                        trailing: GSwitch(value: true, onChanged: (v) {}),
                      ),
                      GListTile(
                        title: 'Email Notifications',
                        trailing: GSwitch(value: false, onChanged: (v) {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Subtitle
            const SectionHeader(
              title: 'With Subtitle',
              subtitle: 'Additional description text',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Title & Subtitle',
              subtitle: 'Two lines of text',
              child: Column(
                children: [
                  GExpansionTile(
                    title: 'Account Settings',
                    subtitle: 'Manage your account preferences',
                    leading: Icon(Icons.person, color: colors.primary),
                    children: [
                      GListTile(
                        leading: const Icon(Icons.edit),
                        title: 'Edit Profile',
                        onTap: () {},
                      ),
                      GListTile(
                        leading: const Icon(Icons.lock),
                        title: 'Change Password',
                        onTap: () {},
                      ),
                      GListTile(
                        leading: const Icon(Icons.delete_outline),
                        title: 'Delete Account',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const GDivider(),
                  GExpansionTile(
                    title: 'Privacy Settings',
                    subtitle: 'Control your data and visibility',
                    leading: Icon(Icons.shield, color: colors.success),
                    children: [
                      GListTile(
                        title: 'Profile Visibility',
                        subtitle: 'Public',
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      ),
                      GListTile(
                        title: 'Activity Status',
                        trailing: GSwitch(value: true, onChanged: (v) {}),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Initially Expanded
            const SectionHeader(
              title: 'Initially Expanded',
              subtitle: 'Start in expanded state',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'initiallyExpanded: true',
              subtitle: 'Opens expanded by default',
              child: GExpansionTile(
                title: 'Advanced Options',
                subtitle: 'Configure advanced settings',
                leading: Icon(Icons.tune, color: colors.info),
                initiallyExpanded: true,
                children: [
                  GListTile(
                    title: 'Debug Mode',
                    trailing: GSwitch(value: false, onChanged: (v) {}),
                  ),
                  GListTile(
                    title: 'Developer Options',
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
            const SizedBox(height: GSpacing.xl),

            // Nested Expansion Tiles
            const SectionHeader(
              title: 'Nested Expansion',
              subtitle: 'Expansion tiles within expansion tiles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Multi-Level',
              subtitle: 'Hierarchical structure',
              child: GExpansionTile(
                title: 'Categories',
                leading: Icon(Icons.category, color: colors.primary),
                initiallyExpanded: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: GSpacing.md),
                    child: GExpansionTile(
                      title: 'Electronics',
                      leading: Icon(Icons.devices, color: colors.secondary, size: 20),
                      children: [
                        GListTile(title: 'Phones', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Laptops', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Tablets', size: GListTileSize.sm, onTap: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: GSpacing.md),
                    child: GExpansionTile(
                      title: 'Clothing',
                      leading: Icon(Icons.checkroom, color: colors.secondary, size: 20),
                      children: [
                        GListTile(title: 'Men', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Women', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Kids', size: GListTileSize.sm, onTap: () {}),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: GSpacing.md),
                    child: GExpansionTile(
                      title: 'Home & Garden',
                      leading: Icon(Icons.home, color: colors.secondary, size: 20),
                      children: [
                        GListTile(title: 'Furniture', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Decor', size: GListTileSize.sm, onTap: () {}),
                        GListTile(title: 'Garden', size: GListTileSize.sm, onTap: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Rich Content
            const SectionHeader(
              title: 'Rich Content',
              subtitle: 'Complex widgets inside',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Content',
              subtitle: 'Any widget as children',
              child: GExpansionTile(
                title: 'Product Details',
                leading: Icon(Icons.shopping_bag, color: colors.primary),
                initiallyExpanded: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(GSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: colors.surfaceVariant,
                                borderRadius: GBorderRadius.allMd,
                              ),
                              child: Icon(Icons.image, color: colors.onSurfaceVariant),
                            ),
                            const SizedBox(width: GSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Premium Widget',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colors.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: GSpacing.xs),
                                  Text(
                                    '\$99.99',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: colors.primary,
                                    ),
                                  ),
                                  const SizedBox(height: GSpacing.xs),
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 16, color: colors.warning),
                                      Icon(Icons.star, size: 16, color: colors.warning),
                                      Icon(Icons.star, size: 16, color: colors.warning),
                                      Icon(Icons.star, size: 16, color: colors.warning),
                                      Icon(Icons.star_half, size: 16, color: colors.warning),
                                      const SizedBox(width: GSpacing.xs),
                                      Text(
                                        '4.5 (128 reviews)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: colors.onSurfaceVariant,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: GSpacing.md),
                        Text(
                          'This is a high-quality premium widget with excellent features and durability.',
                          style: TextStyle(color: colors.onSurfaceVariant),
                        ),
                        const SizedBox(height: GSpacing.md),
                        Row(
                          children: [
                            Expanded(
                              child: GButton(
                                label: 'Add to Cart',
                                icon: Icons.shopping_cart,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(width: GSpacing.sm),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
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

