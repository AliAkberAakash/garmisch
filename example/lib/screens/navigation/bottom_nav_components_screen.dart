import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class BottomNavComponentsScreen extends StatefulWidget {
  const BottomNavComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<BottomNavComponentsScreen> createState() =>
      _BottomNavComponentsScreenState();
}

class _BottomNavComponentsScreenState extends State<BottomNavComponentsScreen> {
  int _basicNavIndex = 0;
  int _badgeNavIndex = 0;
  int _noLabelNavIndex = 0;
  int _customColorNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Bottom Navigation',
      subtitle: 'Bottom tab bar component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Bottom Navigation
            const SectionHeader(
              title: 'Basic Bottom Navigation',
              subtitle: 'Standard bottom navigation bar',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Navigation',
              subtitle: 'Four navigation items',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GBottomNav(
                  currentIndex: _basicNavIndex,
                  onTap: (index) => setState(() => _basicNavIndex = index),
                  items: const [
                    GBottomNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: 'Home',
                    ),
                    GBottomNavItem(
                      icon: Icons.search_outlined,
                      activeIcon: Icons.search,
                      label: 'Search',
                    ),
                    GBottomNavItem(
                      icon: Icons.favorite_outline,
                      activeIcon: Icons.favorite,
                      label: 'Favorites',
                    ),
                    GBottomNavItem(
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Badges
            const SectionHeader(
              title: 'With Badges',
              subtitle: 'Navigation items with notification badges',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Badge Indicators',
              subtitle: 'Notification dots on items',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GBottomNav(
                  currentIndex: _badgeNavIndex,
                  onTap: (index) => setState(() => _badgeNavIndex = index),
                  items: [
                    const GBottomNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: 'Home',
                    ),
                    GBottomNavItem(
                      icon: Icons.chat_bubble_outline,
                      activeIcon: Icons.chat_bubble,
                      label: 'Messages',
                      badge: GDot(color: colors.error, size: 8),
                    ),
                    GBottomNavItem(
                      icon: Icons.notifications_outlined,
                      activeIcon: Icons.notifications,
                      label: 'Alerts',
                      badge: GDot(color: colors.warning, size: 8),
                    ),
                    const GBottomNavItem(
                      icon: Icons.settings_outlined,
                      activeIcon: Icons.settings,
                      label: 'Settings',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Without Labels
            const SectionHeader(
              title: 'Without Labels',
              subtitle: 'Icon-only navigation',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icons Only',
              subtitle: 'showLabels: false',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GBottomNav(
                  currentIndex: _noLabelNavIndex,
                  onTap: (index) => setState(() => _noLabelNavIndex = index),
                  showLabels: false,
                  items: const [
                    GBottomNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                    ),
                    GBottomNavItem(
                      icon: Icons.explore_outlined,
                      activeIcon: Icons.explore,
                    ),
                    GBottomNavItem(
                      icon: Icons.add_circle_outline,
                      activeIcon: Icons.add_circle,
                    ),
                    GBottomNavItem(
                      icon: Icons.bookmark_outline,
                      activeIcon: Icons.bookmark,
                    ),
                    GBottomNavItem(
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'Navigation with custom color scheme',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Theme',
              subtitle: 'selectedColor & unselectedColor',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GBottomNav(
                  currentIndex: _customColorNavIndex,
                  onTap: (index) => setState(() => _customColorNavIndex = index),
                  selectedColor: colors.secondary,
                  unselectedColor: colors.onSurfaceVariant.withValues(alpha: 0.5),
                  items: const [
                    GBottomNavItem(
                      icon: Icons.dashboard_outlined,
                      activeIcon: Icons.dashboard,
                      label: 'Dashboard',
                    ),
                    GBottomNavItem(
                      icon: Icons.analytics_outlined,
                      activeIcon: Icons.analytics,
                      label: 'Analytics',
                    ),
                    GBottomNavItem(
                      icon: Icons.inventory_2_outlined,
                      activeIcon: Icons.inventory_2,
                      label: 'Inventory',
                    ),
                    GBottomNavItem(
                      icon: Icons.account_circle_outlined,
                      activeIcon: Icons.account_circle,
                      label: 'Account',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // No Elevation
            const SectionHeader(
              title: 'Flat Navigation',
              subtitle: 'Without shadow elevation',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'No Elevation',
              subtitle: 'elevation: 0',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: GBorderRadius.allMd,
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                ),
                child: ClipRRect(
                  borderRadius: GBorderRadius.allMd,
                  child: GBottomNav(
                    currentIndex: 0,
                    onTap: (index) {},
                    elevation: 0,
                    items: const [
                      GBottomNavItem(
                        icon: Icons.home_outlined,
                        activeIcon: Icons.home,
                        label: 'Home',
                      ),
                      GBottomNavItem(
                        icon: Icons.search_outlined,
                        activeIcon: Icons.search,
                        label: 'Search',
                      ),
                      GBottomNavItem(
                        icon: Icons.person_outline,
                        activeIcon: Icons.person,
                        label: 'Profile',
                      ),
                    ],
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

