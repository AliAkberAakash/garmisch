import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class DrawerComponentsScreen extends StatefulWidget {
  const DrawerComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<DrawerComponentsScreen> createState() => _DrawerComponentsScreenState();
}

class _DrawerComponentsScreenState extends State<DrawerComponentsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Drawer',
      subtitle: 'Side navigation panel component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Drawer Preview
            const SectionHeader(
              title: 'Basic Drawer',
              subtitle: 'Standard drawer with items',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Navigation Drawer',
              subtitle: 'Tap to open drawer demo',
              child: Column(
                children: [
                  GButton(
                    label: 'Open Basic Drawer',
                    icon: Icons.menu,
                    onPressed: () {
                      _showDrawerDemo(
                        context,
                        GDrawer(
                          items: [
                            GDrawerItem(
                              icon: Icons.home,
                              label: 'Home',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.explore,
                              label: 'Explore',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.favorite,
                              label: 'Favorites',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.settings,
                              label: 'Settings',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Drawer with Header
            const SectionHeader(
              title: 'Drawer with Header',
              subtitle: 'Drawer with GDrawerHeader',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Header',
              subtitle: 'Profile header with avatar',
              child: Column(
                children: [
                  GButton(
                    label: 'Open Drawer with Header',
                    icon: Icons.account_circle,
                    onPressed: () {
                      _showDrawerDemo(
                        context,
                        GDrawer(
                          header: GDrawerHeader(
                            title: 'John Doe',
                            subtitle: 'john.doe@example.com',
                            avatar: CircleAvatar(
                              radius: 32,
                              backgroundColor: colors.primary,
                              child: Icon(
                                Icons.person,
                                size: 32,
                                color: colors.onPrimary,
                              ),
                            ),
                          ),
                          items: [
                            GDrawerItem(
                              icon: Icons.dashboard,
                              label: 'Dashboard',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.inbox,
                              label: 'Inbox',
                              trailing: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: GSpacing.sm,
                                  vertical: GSpacing.xs3,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.error,
                                  borderRadius: GBorderRadius.allFull,
                                ),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                    color: colors.onError,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.calendar_today,
                              label: 'Calendar',
                              onTap: () => Navigator.pop(context),
                            ),
                            const GDrawerItem.divider(),
                            GDrawerItem(
                              icon: Icons.settings,
                              label: 'Settings',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.help_outline,
                              label: 'Help & Feedback',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Drawer with Selected Item
            const SectionHeader(
              title: 'With Selected State',
              subtitle: 'Drawer with selectedIndex',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Selected Item',
              subtitle: 'Highlighted active item',
              child: Column(
                children: [
                  Text(
                    'Selected Index: $_selectedIndex',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GButton(
                    label: 'Open Drawer',
                    icon: Icons.menu,
                    onPressed: () {
                      _showDrawerDemo(
                        context,
                        GDrawer(
                          selectedIndex: _selectedIndex,
                          onItemTap: (index) {
                            setState(() => _selectedIndex = index);
                            Navigator.pop(context);
                          },
                          items: const [
                            GDrawerItem(
                              icon: Icons.home,
                              label: 'Home',
                            ),
                            GDrawerItem(
                              icon: Icons.search,
                              label: 'Search',
                            ),
                            GDrawerItem(
                              icon: Icons.notifications,
                              label: 'Notifications',
                            ),
                            GDrawerItem(
                              icon: Icons.person,
                              label: 'Profile',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Drawer with Footer
            const SectionHeader(
              title: 'Drawer with Footer',
              subtitle: 'Drawer with header and footer',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Footer',
              subtitle: 'Footer widget at bottom',
              child: Column(
                children: [
                  GButton(
                    label: 'Open Full Drawer',
                    icon: Icons.view_sidebar,
                    onPressed: () {
                      _showDrawerDemo(
                        context,
                        GDrawer(
                          header: GDrawerHeader(
                            title: 'Garmisch App',
                            subtitle: 'Design System',
                            avatar: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: colors.primary,
                                borderRadius: GBorderRadius.allMd,
                              ),
                              child: Icon(
                                Icons.flutter_dash,
                                color: colors.onPrimary,
                              ),
                            ),
                          ),
                          items: [
                            GDrawerItem(
                              icon: Icons.home,
                              label: 'Home',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.palette,
                              label: 'Theme',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.widgets,
                              label: 'Components',
                              onTap: () => Navigator.pop(context),
                            ),
                            const GDrawerItem.divider(),
                            GDrawerItem(
                              icon: Icons.info_outline,
                              label: 'About',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                          footer: Container(
                            padding: const EdgeInsets.all(GSpacing.md),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: colors.outline.withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  size: 20,
                                  color: colors.error,
                                ),
                                const SizedBox(width: GSpacing.sm),
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    color: colors.error,
                                    fontWeight: GTypography.fontWeightMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Drawer with Dividers
            const SectionHeader(
              title: 'With Dividers',
              subtitle: 'Drawer items with section dividers',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Sectioned Drawer',
              subtitle: 'Using GDrawerItem.divider()',
              child: Column(
                children: [
                  GButton(
                    label: 'Open Sectioned Drawer',
                    icon: Icons.list,
                    onPressed: () {
                      _showDrawerDemo(
                        context,
                        GDrawer(
                          items: [
                            GDrawerItem(
                              icon: Icons.inbox,
                              label: 'Inbox',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.send,
                              label: 'Sent',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.drafts,
                              label: 'Drafts',
                              onTap: () => Navigator.pop(context),
                            ),
                            const GDrawerItem.divider(),
                            GDrawerItem(
                              icon: Icons.label,
                              label: 'Labels',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.archive,
                              label: 'Archive',
                              onTap: () => Navigator.pop(context),
                            ),
                            GDrawerItem(
                              icon: Icons.delete,
                              label: 'Trash',
                              onTap: () => Navigator.pop(context),
                            ),
                            const GDrawerItem.divider(),
                            GDrawerItem(
                              icon: Icons.settings,
                              label: 'Settings',
                              onTap: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
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

  void _showDrawerDemo(BuildContext context, Widget drawer) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Drawer',
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerLeft,
          child: drawer,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          )),
          child: child,
        );
      },
    );
  }
}

