import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class NavigationComponentsScreen extends StatefulWidget {
  const NavigationComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<NavigationComponentsScreen> createState() =>
      _NavigationComponentsScreenState();
}

class _NavigationComponentsScreenState
    extends State<NavigationComponentsScreen> with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0;
  late TabController _tabController;
  int _currentStep = 1;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Navigation Components',
      subtitle: 'Navigation and routing',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            const SectionHeader(
              title: 'Tab Bar',
              subtitle: 'GTabBar component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Tab Bar',
              subtitle: 'Horizontal tab navigation',
              child: Column(
                children: [
                  GTabBar(
                    controller: _tabController,
                    tabs: const [
                      GTab(text: 'Tab 1'),
                      GTab(text: 'Tab 2'),
                      GTab(text: 'Tab 3'),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Center(child: Text('Content 1', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Content 2', style: TextStyle(color: colors.onSurface))),
                        Center(child: Text('Content 3', style: TextStyle(color: colors.onSurface))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Bottom Navigation
            const SectionHeader(
              title: 'Bottom Navigation',
              subtitle: 'GBottomNav component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Bottom Navigation Bar',
              subtitle: 'App-level navigation',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GBottomNav(
                  currentIndex: _bottomNavIndex,
                  onTap: (index) => setState(() => _bottomNavIndex = index),
                  items: [
                    const GBottomNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: 'Home',
                    ),
                    const GBottomNavItem(
                      icon: Icons.search_outlined,
                      activeIcon: Icons.search,
                      label: 'Search',
                    ),
                    GBottomNavItem(
                      icon: Icons.notifications_outlined,
                      activeIcon: Icons.notifications,
                      label: 'Alerts',
                      badge: GDot(color: colors.error, size: 8),
                    ),
                    const GBottomNavItem(
                      icon: Icons.person_outline,
                      activeIcon: Icons.person,
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Breadcrumb
            const SectionHeader(
              title: 'Breadcrumb',
              subtitle: 'GBreadcrumb component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Breadcrumb Navigation',
              subtitle: 'Hierarchical navigation',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GBreadcrumb(
                    items: [
                      GBreadcrumbItem(label: 'Home', onTap: () {}),
                      GBreadcrumbItem(label: 'Products', onTap: () {}),
                      GBreadcrumbItem(label: 'Electronics', onTap: () {}),
                      const GBreadcrumbItem(label: 'Phones'),
                    ],
                  ),
                  const SizedBox(height: GSpacing.md),
                  GBreadcrumb(
                    items: [
                      GBreadcrumbItem(
                        label: 'Dashboard',
                        icon: Icons.dashboard,
                        onTap: () {},
                      ),
                      GBreadcrumbItem(label: 'Settings', onTap: () {}),
                      const GBreadcrumbItem(label: 'Profile'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Stepper
            const SectionHeader(
              title: 'Stepper',
              subtitle: 'GStepper component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Horizontal Stepper',
              subtitle: 'Multi-step process indicator',
              child: Column(
                children: [
                  GStepper(
                    currentStep: _currentStep,
                    steps: const [
                      GStepData(title: 'Account'),
                      GStepData(title: 'Details'),
                      GStepData(title: 'Review'),
                      GStepData(title: 'Complete'),
                    ],
                    onStepTapped: (step) => setState(() => _currentStep = step),
                  ),
                  const SizedBox(height: GSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GButton(
                        label: 'Previous',
                        variant: GButtonVariant.outlined,
                        size: GButtonSize.sm,
                        isDisabled: _currentStep == 0,
                        onPressed: () =>
                            setState(() => _currentStep = (_currentStep - 1).clamp(0, 3)),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Next',
                        size: GButtonSize.sm,
                        isDisabled: _currentStep == 3,
                        onPressed: () =>
                            setState(() => _currentStep = (_currentStep + 1).clamp(0, 3)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Vertical Stepper',
              subtitle: 'With subtitles',
              child: GStepper(
                currentStep: _currentStep,
                orientation: Axis.vertical,
                steps: const [
                  GStepData(
                    title: 'Create Account',
                    subtitle: 'Enter your email and password',
                  ),
                  GStepData(
                    title: 'Personal Details',
                    subtitle: 'Fill in your information',
                  ),
                  GStepData(
                    title: 'Review',
                    subtitle: 'Review your information',
                  ),
                  GStepData(
                    title: 'Complete',
                    subtitle: 'You\'re all set!',
                  ),
                ],
                onStepTapped: (step) => setState(() => _currentStep = step),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Pagination
            const SectionHeader(
              title: 'Pagination',
              subtitle: 'GPagination component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Pagination',
              subtitle: 'Page navigation',
              child: Column(
                children: [
                  GPagination(
                    currentPage: _currentPage,
                    totalPages: 20,
                    onPageChanged: (page) => setState(() => _currentPage = page),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Page: $_currentPage',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Drawer
            const SectionHeader(
              title: 'Drawer',
              subtitle: 'GDrawer component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Navigation Drawer',
              subtitle: 'Side menu navigation',
              child: GButton(
                label: 'Open Drawer Demo',
                icon: Icons.menu,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
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

