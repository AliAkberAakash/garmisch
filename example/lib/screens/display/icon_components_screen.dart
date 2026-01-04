import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class IconComponentsScreen extends StatelessWidget {
  const IconComponentsScreen({
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
      title: 'Icon',
      subtitle: 'GIcon component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Sizes
            const SectionHeader(
              title: 'Icon Sizes',
              subtitle: 'GIconSize enum values',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'All Sizes',
              subtitle: 'xs, sm, md, lg, xl, xl2',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.xs,
                    label: 'xs',
                    colors: colors,
                  ),
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.sm,
                    label: 'sm',
                    colors: colors,
                  ),
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.md,
                    label: 'md',
                    colors: colors,
                  ),
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.lg,
                    label: 'lg',
                    colors: colors,
                  ),
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.xl,
                    label: 'xl',
                    colors: colors,
                  ),
                  _IconSizeDemo(
                    icon: Icons.star,
                    size: GIconSize.xl2,
                    label: 'xl2',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Icon Colors
            const SectionHeader(
              title: 'Icon Colors',
              subtitle: 'Custom color property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Semantic Colors',
              subtitle: 'Using theme colors',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GIcon(Icons.favorite, size: GIconSize.lg, color: colors.error),
                      const SizedBox(height: GSpacing.xs),
                      Text('Error', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.check_circle, size: GIconSize.lg, color: colors.success),
                      const SizedBox(height: GSpacing.xs),
                      Text('Success', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.warning, size: GIconSize.lg, color: colors.warning),
                      const SizedBox(height: GSpacing.xs),
                      Text('Warning', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.info, size: GIconSize.lg, color: colors.info),
                      const SizedBox(height: GSpacing.xs),
                      Text('Info', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                  Column(
                    children: [
                      GIcon(Icons.star, size: GIconSize.lg, color: colors.primary),
                      const SizedBox(height: GSpacing.xs),
                      Text('Primary', style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Secondary Color',
              subtitle: 'More color options',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GIcon(Icons.bookmark, size: GIconSize.lg, color: colors.secondary),
                  GIcon(Icons.palette, size: GIconSize.lg, color: colors.tertiary),
                  GIcon(Icons.lightbulb, size: GIconSize.lg, color: colors.onSurfaceVariant),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Common Icons
            const SectionHeader(
              title: 'Common Icons',
              subtitle: 'Frequently used icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Navigation Icons',
              subtitle: 'Menu, arrows, navigation',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.lg,
                children: [
                  _IconWithLabel(icon: Icons.menu, label: 'menu', colors: colors),
                  _IconWithLabel(icon: Icons.arrow_back, label: 'arrow_back', colors: colors),
                  _IconWithLabel(icon: Icons.arrow_forward, label: 'arrow_forward', colors: colors),
                  _IconWithLabel(icon: Icons.close, label: 'close', colors: colors),
                  _IconWithLabel(icon: Icons.home, label: 'home', colors: colors),
                  _IconWithLabel(icon: Icons.search, label: 'search', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Action Icons',
              subtitle: 'Common actions',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.lg,
                children: [
                  _IconWithLabel(icon: Icons.add, label: 'add', colors: colors),
                  _IconWithLabel(icon: Icons.edit, label: 'edit', colors: colors),
                  _IconWithLabel(icon: Icons.delete, label: 'delete', colors: colors),
                  _IconWithLabel(icon: Icons.share, label: 'share', colors: colors),
                  _IconWithLabel(icon: Icons.copy, label: 'copy', colors: colors),
                  _IconWithLabel(icon: Icons.save, label: 'save', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Status Icons',
              subtitle: 'Feedback and status',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.lg,
                children: [
                  _IconWithLabel(icon: Icons.check, label: 'check', colors: colors),
                  _IconWithLabel(icon: Icons.error, label: 'error', colors: colors),
                  _IconWithLabel(icon: Icons.warning, label: 'warning', colors: colors),
                  _IconWithLabel(icon: Icons.info, label: 'info', colors: colors),
                  _IconWithLabel(icon: Icons.help, label: 'help', colors: colors),
                  _IconWithLabel(icon: Icons.notifications, label: 'notifications', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Content Icons',
              subtitle: 'Media and content',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.lg,
                children: [
                  _IconWithLabel(icon: Icons.image, label: 'image', colors: colors),
                  _IconWithLabel(icon: Icons.videocam, label: 'videocam', colors: colors),
                  _IconWithLabel(icon: Icons.attach_file, label: 'attach_file', colors: colors),
                  _IconWithLabel(icon: Icons.folder, label: 'folder', colors: colors),
                  _IconWithLabel(icon: Icons.description, label: 'description', colors: colors),
                  _IconWithLabel(icon: Icons.cloud, label: 'cloud', colors: colors),
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

class _IconSizeDemo extends StatelessWidget {
  const _IconSizeDemo({
    required this.icon,
    required this.size,
    required this.label,
    required this.colors,
  });

  final IconData icon;
  final GIconSize size;
  final String label;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GIcon(icon, size: size),
        const SizedBox(height: GSpacing.xs),
        Text(label, style: TextStyle(color: colors.onSurfaceVariant, fontSize: 10)),
      ],
    );
  }
}

class _IconWithLabel extends StatelessWidget {
  const _IconWithLabel({
    required this.icon,
    required this.label,
    required this.colors,
  });

  final IconData icon;
  final String label;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          GIcon(icon, size: GIconSize.lg),
          const SizedBox(height: GSpacing.xs3),
          Text(
            label,
            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 9),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

