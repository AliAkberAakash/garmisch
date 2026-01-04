import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AppBarComponentsScreen extends StatelessWidget {
  const AppBarComponentsScreen({
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
      title: 'App Bar',
      subtitle: 'Top navigation bar component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Small App Bar
            const SectionHeader(
              title: 'Small App Bar',
              subtitle: 'GAppBarSize.sm - Compact app bar',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Small Size',
              subtitle: 'Height: 48px',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    title: 'Small App Bar',
                    size: GAppBarSize.sm,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search, color: colors.onSurface, size: 20),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Medium App Bar (Default)
            const SectionHeader(
              title: 'Medium App Bar',
              subtitle: 'GAppBarSize.md - Default size',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Medium Size (Default)',
              subtitle: 'Height: 56px',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    title: 'Medium App Bar',
                    size: GAppBarSize.md,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search, color: colors.onSurface),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: colors.onSurface),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Large App Bar
            const SectionHeader(
              title: 'Large App Bar',
              subtitle: 'GAppBarSize.lg - Prominent app bar',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Large Size',
              subtitle: 'Height: 64px',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    title: 'Large App Bar',
                    size: GAppBarSize.lg,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search, color: colors.onSurface),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_outlined, color: colors.onSurface),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.more_vert, color: colors.onSurface),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // App Bar with Leading Icon
            const SectionHeader(
              title: 'With Leading Icon',
              subtitle: 'App bar with custom leading widget',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Leading Widget',
              subtitle: 'Menu icon as leading',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    title: 'With Menu',
                    leading: IconButton(
                      icon: Icon(Icons.menu, color: colors.onSurface),
                      onPressed: () {},
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.search, color: colors.onSurface),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // App Bar with Custom Title Widget
            const SectionHeader(
              title: 'Custom Title Widget',
              subtitle: 'App bar with custom title widget',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Title',
              subtitle: 'Using titleWidget property',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    titleWidget: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flutter_dash, color: colors.primary),
                        const SizedBox(width: GSpacing.sm),
                        Text(
                          'Garmisch',
                          style: TextStyle(
                            color: colors.onSurface,
                            fontWeight: GTypography.fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: Icon(Icons.settings_outlined, color: colors.onSurface),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Centered Title
            const SectionHeader(
              title: 'Centered Title',
              subtitle: 'App bar with centered title',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Centered',
              subtitle: 'centerTitle: true',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: GAppBar(
                    title: 'Centered Title',
                    centerTitle: true,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: colors.onSurface),
                      onPressed: () {},
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.share_outlined, color: colors.onSurface),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Colored App Bar
            const SectionHeader(
              title: 'Colored App Bar',
              subtitle: 'App bar with custom colors',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Colors',
              subtitle: 'backgroundColor & foregroundColor',
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: GBorderRadius.allMd,
                    child: GAppBar(
                      title: 'Primary Color',
                      backgroundColor: colors.primary,
                      foregroundColor: colors.onPrimary,
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.favorite_outline, color: colors.onPrimary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  ClipRRect(
                    borderRadius: GBorderRadius.allMd,
                    child: GAppBar(
                      title: 'Secondary Color',
                      backgroundColor: colors.secondary,
                      foregroundColor: colors.onSecondary,
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.edit_outlined, color: colors.onSecondary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  ClipRRect(
                    borderRadius: GBorderRadius.allMd,
                    child: GAppBar(
                      title: 'Error Color',
                      backgroundColor: colors.error,
                      foregroundColor: colors.onError,
                      automaticallyImplyLeading: false,
                      actions: [
                        IconButton(
                          icon: Icon(Icons.delete_outline, color: colors.onError),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // App Bar with Elevation
            const SectionHeader(
              title: 'With Elevation',
              subtitle: 'App bar with shadow elevation',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Elevated',
              subtitle: 'elevation: 4',
              child: ClipRRect(
                borderRadius: GBorderRadius.allMd,
                child: GAppBar(
                  title: 'Elevated App Bar',
                  elevation: 4,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: Icon(Icons.search, color: colors.onSurface),
                      onPressed: () {},
                    ),
                  ],
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

