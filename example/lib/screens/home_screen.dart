import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import 'foundations/foundations_screen.dart';
import 'foundations/colors_screen.dart';
import 'foundations/typography_screen.dart';
import 'foundations/spacing_screen.dart';
import 'foundations/shadows_screen.dart';
import 'foundations/border_radius_screen.dart';
import 'foundations/animations_screen.dart';
import 'inputs/inputs_screen.dart';
import 'display/display_screen.dart';
import 'feedback/feedback_screen.dart';
import 'navigation/navigation_screen.dart';
import 'layout/layout_screen.dart';
import 'overlay/overlay_screen.dart';
import 'theme/theme_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        title: Text(
          'Garmisch',
          style: textTheme.headlineSmall.copyWith(
            color: colors.onSurface,
            fontWeight: GTypography.fontWeightBold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: colors.onSurface,
            ),
            onPressed: onThemeToggle,
            tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(GSpacing.xl),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors.primary,
                    colors.primary.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: GBorderRadius.allXl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Design System',
                    style: textTheme.displaySmall.copyWith(
                      color: colors.onPrimary,
                      fontWeight: GTypography.fontWeightBold,
                    ),
                  ),
                  const SizedBox(height: GSpacing.xs),
                  Text(
                    'A minimalistic design system based on Material Design for Flutter',
                    style: textTheme.bodyLarge.copyWith(
                      color: colors.onPrimary.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Foundations Section
            _SectionTitle(
              title: 'Foundations',
              subtitle: 'Design tokens and primitives',
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _CategoryGrid(
              items: [
                _CategoryItem(
                  title: 'Overview',
                  icon: Icons.dashboard_outlined,
                  color: colors.primary,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoundationsScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Colors',
                  icon: Icons.palette_outlined,
                  color: GColors.rose500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ColorsScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Typography',
                  icon: Icons.text_fields_outlined,
                  color: GColors.violet500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TypographyScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Spacing',
                  icon: Icons.space_bar_outlined,
                  color: GColors.teal500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SpacingScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Shadows',
                  icon: Icons.layers_outlined,
                  color: GColors.amber500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ShadowsScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Border Radius',
                  icon: Icons.rounded_corner_outlined,
                  color: GColors.cyan500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BorderRadiusScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Animations',
                  icon: Icons.animation_outlined,
                  color: GColors.pink500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AnimationsScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
              ],
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.xl),

            // Components Section
            _SectionTitle(
              title: 'Components',
              subtitle: 'UI building blocks',
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _CategoryGrid(
              items: [
                _CategoryItem(
                  title: 'Inputs',
                  icon: Icons.input_outlined,
                  color: GColors.blue500,
                  subtitle: 'Buttons, TextFields, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InputsScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Display',
                  icon: Icons.view_module_outlined,
                  color: GColors.green500,
                  subtitle: 'Avatar, Badge, Chip, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DisplayScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Feedback',
                  icon: Icons.feedback_outlined,
                  color: GColors.orange500,
                  subtitle: 'Alert, Toast, Snackbar, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FeedbackScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Navigation',
                  icon: Icons.navigation_outlined,
                  color: GColors.purple500,
                  subtitle: 'AppBar, TabBar, Drawer, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NavigationScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Layout',
                  icon: Icons.grid_view_outlined,
                  color: GColors.indigo500,
                  subtitle: 'Card, Grid, Container, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LayoutScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Overlay',
                  icon: Icons.layers_outlined,
                  color: GColors.red500,
                  subtitle: 'Dialog, Modal, BottomSheet, etc.',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OverlayScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
              ],
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.xl),

            // Theme Section
            _SectionTitle(
              title: 'Theme',
              subtitle: 'Theming and customization',
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.sm),
            _CategoryGrid(
              items: [
                _CategoryItem(
                  title: 'Color Scheme',
                  icon: Icons.color_lens_outlined,
                  color: GColors.emerald500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ThemeScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
                _CategoryItem(
                  title: 'Text Theme',
                  icon: Icons.format_size_outlined,
                  color: GColors.sky500,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ThemeScreen(
                        onThemeToggle: onThemeToggle,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  ),
                ),
              ],
              colors: colors,
              textTheme: textTheme,
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.subtitle,
    required this.colors,
    required this.textTheme,
  });

  final String title;
  final String subtitle;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headlineSmall.copyWith(
            color: colors.onBackground,
          ),
        ),
        Text(
          subtitle,
          style: textTheme.bodyMedium.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CategoryItem {
  const _CategoryItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
    this.subtitle,
  });

  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final String? subtitle;
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({
    required this.items,
    required this.colors,
    required this.textTheme,
  });

  final List<_CategoryItem> items;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 4 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: GSpacing.sm,
            crossAxisSpacing: GSpacing.sm,
            childAspectRatio: 1.1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _CategoryCard(
              item: item,
              colors: colors,
              textTheme: textTheme,
            );
          },
        );
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.item,
    required this.colors,
    required this.textTheme,
  });

  final _CategoryItem item;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colors.surface,
      borderRadius: GBorderRadius.allLg,
      child: InkWell(
        onTap: item.onTap,
        borderRadius: GBorderRadius.allLg,
        child: Container(
          padding: const EdgeInsets.all(GSpacing.md),
          decoration: BoxDecoration(
            borderRadius: GBorderRadius.allLg,
            border: Border.all(
              color: colors.outline.withOpacity(0.2),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(GSpacing.sm),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Icon(
                  item.icon,
                  color: item.color,
                  size: GSizing.iconLg,
                ),
              ),
              const SizedBox(height: GSpacing.sm),
              Text(
                item.title,
                style: textTheme.labelLarge.copyWith(
                  color: colors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              if (item.subtitle != null) ...[
                const SizedBox(height: GSpacing.xs3),
                Text(
                  item.subtitle!,
                  style: textTheme.labelSmall.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

