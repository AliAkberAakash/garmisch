import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// App bar size options
enum GAppBarSize {
  /// Small app bar
  sm,

  /// Medium app bar - Default
  md,

  /// Large app bar
  lg,
}

/// A customizable app bar component for the Garmisch design system.
///
/// ```dart
/// GAppBar(
///   title: 'Home',
///   leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
///   actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
/// )
/// ```
class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.actions,
    this.bottom,
    this.size = GAppBarSize.md,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.centerTitle,
    this.automaticallyImplyLeading = true,
  });

  /// Title text
  final String? title;

  /// Custom title widget
  final Widget? titleWidget;

  /// Leading widget
  final Widget? leading;

  /// Action widgets
  final List<Widget>? actions;

  /// Bottom widget (e.g., TabBar)
  final PreferredSizeWidget? bottom;

  /// App bar size
  final GAppBarSize size;

  /// Background color
  final Color? backgroundColor;

  /// Foreground/text color
  final Color? foregroundColor;

  /// Elevation
  final double elevation;

  /// Whether to center the title
  final bool? centerTitle;

  /// Whether to show back button automatically
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize {
    final height = switch (size) {
      GAppBarSize.sm => 48.0,
      GAppBarSize.md => 56.0,
      GAppBarSize.lg => 64.0,
    };
    return Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;
    final typography = theme.typography;

    final bgColor = backgroundColor ?? colors.surface;
    final fgColor = foregroundColor ?? colors.onSurface;

    final titleStyle = switch (size) {
      GAppBarSize.sm => textTheme.titleSmall,
      GAppBarSize.md => textTheme.titleLarge,
      GAppBarSize.lg => textTheme.headlineSmall,
    };

    return AppBar(
      title: titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: titleStyle.copyWith(
                    color: fgColor,
                    fontWeight: typography.fontWeightSemiBold,
                  ),
                )
              : null),
      leading: leading,
      actions: actions,
      bottom: bottom,
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: switch (size) {
        GAppBarSize.sm => 48.0,
        GAppBarSize.md => 56.0,
        GAppBarSize.lg => 64.0,
      },
    );
  }
}

/// A bottom navigation bar component.
///
/// ```dart
/// GBottomNav(
///   currentIndex: _currentIndex,
///   onTap: (index) => setState(() => _currentIndex = index),
///   items: [
///     GBottomNavItem(icon: Icons.home, label: 'Home'),
///     GBottomNavItem(icon: Icons.search, label: 'Search'),
///   ],
/// )
/// ```
class GBottomNav extends StatelessWidget {
  const GBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
    this.showLabels = true,
    this.elevation = 8,
  });

  /// Current selected index
  final int currentIndex;

  /// Called when an item is tapped
  final ValueChanged<int> onTap;

  /// Navigation items
  final List<GBottomNavItem> items;

  /// Background color
  final Color? backgroundColor;

  /// Selected item color
  final Color? selectedColor;

  /// Unselected item color
  final Color? unselectedColor;

  /// Whether to show labels
  final bool showLabels;

  /// Elevation
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final typography = theme.typography;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surface,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: elevation,
                  offset: const Offset(0, -2),
                ),
              ]
            : null,
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (index) {
              final item = items[index];
              final isSelected = index == currentIndex;
              final color = isSelected
                  ? selectedColor ?? colors.primary
                  : unselectedColor ?? colors.onSurfaceVariant;

              return Expanded(
                child: InkWell(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Icon(
                            isSelected
                                ? item.activeIcon ?? item.icon
                                : item.icon,
                            color: color,
                            size: 24,
                          ),
                          if (item.badge != null)
                            Positioned(
                              right: -8,
                              top: -4,
                              child: item.badge!,
                            ),
                        ],
                      ),
                      if (showLabels && item.label != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          item.label!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? typography.fontWeightMedium
                                : typography.fontWeightRegular,
                            color: color,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

/// Bottom navigation item data
class GBottomNavItem {
  const GBottomNavItem({
    required this.icon,
    this.activeIcon,
    this.label,
    this.badge,
  });

  final IconData icon;
  final IconData? activeIcon;
  final String? label;
  final Widget? badge;
}

/// A tab bar component.
///
/// ```dart
/// GTabBar(
///   controller: _tabController,
///   tabs: [
///     GTab(text: 'Tab 1'),
///     GTab(text: 'Tab 2'),
///   ],
/// )
/// ```
class GTabBar extends StatelessWidget implements PreferredSizeWidget {
  const GTabBar({
    super.key,
    required this.tabs,
    this.controller,
    this.isScrollable = false,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorWeight = 2,
    this.onTap,
  });

  /// Tab widgets
  final List<Widget> tabs;

  /// Tab controller
  final TabController? controller;

  /// Whether tabs are scrollable
  final bool isScrollable;

  /// Indicator color
  final Color? indicatorColor;

  /// Selected label color
  final Color? labelColor;

  /// Unselected label color
  final Color? unselectedLabelColor;

  /// Indicator weight
  final double indicatorWeight;

  /// Called when a tab is tapped
  final ValueChanged<int>? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(48);

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final typography = theme.typography;

    return TabBar(
      controller: controller,
      tabs: tabs,
      isScrollable: isScrollable,
      indicatorColor: indicatorColor ?? colors.primary,
      labelColor: labelColor ?? colors.primary,
      unselectedLabelColor: unselectedLabelColor ?? colors.onSurfaceVariant,
      indicatorWeight: indicatorWeight,
      labelStyle: TextStyle(
        fontSize: typography.fontSizeSm,
        fontWeight: typography.fontWeightMedium,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: typography.fontSizeSm,
        fontWeight: typography.fontWeightRegular,
      ),
      onTap: onTap,
    );
  }
}

/// Tab widget
class GTab extends StatelessWidget {
  const GTab({
    super.key,
    this.text,
    this.icon,
    this.child,
  });

  final String? text;
  final IconData? icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) return Tab(child: child);
    return Tab(
      text: text,
      icon: icon != null ? Icon(icon, size: 20) : null,
    );
  }
}

