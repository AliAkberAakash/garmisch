import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TabBarComponentsScreen extends StatefulWidget {
  const TabBarComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<TabBarComponentsScreen> createState() => _TabBarComponentsScreenState();
}

class _TabBarComponentsScreenState extends State<TabBarComponentsScreen>
    with TickerProviderStateMixin {
  late TabController _basicTabController;
  late TabController _iconTabController;
  late TabController _scrollableTabController;
  late TabController _customColorTabController;

  @override
  void initState() {
    super.initState();
    _basicTabController = TabController(length: 3, vsync: this);
    _iconTabController = TabController(length: 4, vsync: this);
    _scrollableTabController = TabController(length: 6, vsync: this);
    _customColorTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _basicTabController.dispose();
    _iconTabController.dispose();
    _scrollableTabController.dispose();
    _customColorTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Tab Bar',
      subtitle: 'Content tabs component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Tab Bar
            const SectionHeader(
              title: 'Basic Tab Bar',
              subtitle: 'Standard horizontal tabs',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Text Tabs',
              subtitle: 'Simple text-only tabs',
              child: Column(
                children: [
                  GTabBar(
                    controller: _basicTabController,
                    tabs: const [
                      GTab(text: 'Tab 1'),
                      GTab(text: 'Tab 2'),
                      GTab(text: 'Tab 3'),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: TabBarView(
                      controller: _basicTabController,
                      children: [
                        Center(
                          child: Text(
                            'Content for Tab 1',
                            style: TextStyle(color: colors.onSurface),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Content for Tab 2',
                            style: TextStyle(color: colors.onSurface),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Content for Tab 3',
                            style: TextStyle(color: colors.onSurface),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Tabs with Icons
            const SectionHeader(
              title: 'Tabs with Icons',
              subtitle: 'Tab items with icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icon Tabs',
              subtitle: 'Icons with text labels',
              child: Column(
                children: [
                  GTabBar(
                    controller: _iconTabController,
                    tabs: const [
                      GTab(text: 'Home', icon: Icons.home),
                      GTab(text: 'Search', icon: Icons.search),
                      GTab(text: 'Favorites', icon: Icons.favorite),
                      GTab(text: 'Profile', icon: Icons.person),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: TabBarView(
                      controller: _iconTabController,
                      children: [
                        Center(
                          child: Icon(Icons.home, size: 40, color: colors.primary),
                        ),
                        Center(
                          child: Icon(Icons.search, size: 40, color: colors.primary),
                        ),
                        Center(
                          child: Icon(Icons.favorite, size: 40, color: colors.primary),
                        ),
                        Center(
                          child: Icon(Icons.person, size: 40, color: colors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Scrollable Tabs
            const SectionHeader(
              title: 'Scrollable Tabs',
              subtitle: 'Horizontally scrollable tab bar',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Scrollable',
              subtitle: 'isScrollable: true',
              child: Column(
                children: [
                  GTabBar(
                    controller: _scrollableTabController,
                    isScrollable: true,
                    tabs: const [
                      GTab(text: 'Overview'),
                      GTab(text: 'Specifications'),
                      GTab(text: 'Reviews'),
                      GTab(text: 'Questions'),
                      GTab(text: 'Related'),
                      GTab(text: 'Accessories'),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: TabBarView(
                      controller: _scrollableTabController,
                      children: [
                        Center(child: Text('Overview content', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Specifications content', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Reviews content', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Questions content', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Related content', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Accessories content', style: TextStyle(color: colors.onSurface))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'Tab bar with custom color scheme',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Theme',
              subtitle: 'indicatorColor, labelColor, unselectedLabelColor',
              child: Column(
                children: [
                  GTabBar(
                    controller: _customColorTabController,
                    indicatorColor: colors.secondary,
                    labelColor: colors.secondary,
                    unselectedLabelColor: colors.onSurfaceVariant,
                    indicatorWeight: 3,
                    tabs: const [
                      GTab(text: 'Active'),
                      GTab(text: 'Pending'),
                      GTab(text: 'Completed'),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    child: TabBarView(
                      controller: _customColorTabController,
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: GSpacing.md,
                              vertical: GSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: colors.success.withValues(alpha: 0.1),
                              borderRadius: GBorderRadius.allMd,
                            ),
                            child: Text(
                              'Active Items',
                              style: TextStyle(color: colors.success),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: GSpacing.md,
                              vertical: GSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: colors.warning.withValues(alpha: 0.1),
                              borderRadius: GBorderRadius.allMd,
                            ),
                            child: Text(
                              'Pending Items',
                              style: TextStyle(color: colors.warning),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: GSpacing.md,
                              vertical: GSpacing.sm,
                            ),
                            decoration: BoxDecoration(
                              color: colors.primary.withValues(alpha: 0.1),
                              borderRadius: GBorderRadius.allMd,
                            ),
                            child: Text(
                              'Completed Items',
                              style: TextStyle(color: colors.primary),
                            ),
                          ),
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

