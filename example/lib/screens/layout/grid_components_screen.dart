import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class GridComponentsScreen extends StatelessWidget {
  const GridComponentsScreen({
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
      title: 'Grid',
      subtitle: 'GGrid, GAutoGrid, GWrapGrid',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Grid
            const SectionHeader(
              title: 'Basic Grid',
              subtitle: 'GGrid with fixed columns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: '2 Columns',
              subtitle: 'crossAxisCount: 2',
              child: GGrid(
                crossAxisCount: 2,
                spacing: GSpacing.sm,
                childAspectRatio: 1.5,
                children: List.generate(
                  4,
                  (i) => _GridCell(
                    label: '${i + 1}',
                    color: colors.primaryContainer,
                    textColor: colors.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: '3 Columns',
              subtitle: 'crossAxisCount: 3',
              child: GGrid(
                crossAxisCount: 3,
                spacing: GSpacing.sm,
                childAspectRatio: 1,
                children: List.generate(
                  6,
                  (i) => _GridCell(
                    label: '${i + 1}',
                    color: colors.secondaryContainer,
                    textColor: colors.onSecondaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: '4 Columns',
              subtitle: 'crossAxisCount: 4',
              child: GGrid(
                crossAxisCount: 4,
                spacing: GSpacing.sm,
                childAspectRatio: 1,
                children: List.generate(
                  8,
                  (i) => _GridCell(
                    label: '${i + 1}',
                    color: colors.tertiaryContainer,
                    textColor: colors.onTertiaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Responsive Grid
            const SectionHeader(
              title: 'Responsive Grid',
              subtitle: 'Columns change with screen size',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GResponsiveValue Columns',
              subtitle: 'xs:1, sm:2, md:3, lg:4',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GBreakpointBuilder(
                    builder: (context, breakpoint) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: GSpacing.sm),
                        child: Text(
                          'Current: ${breakpoint.name.toUpperCase()} → ${_getColumnCount(breakpoint)} columns',
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  GGrid(
                    columns: GResponsiveValue(xs: 1, sm: 2, md: 3, lg: 4),
                    spacing: GSpacing.sm,
                    childAspectRatio: 2,
                    children: List.generate(
                      8,
                      (i) => _GridCell(
                        label: 'Item ${i + 1}',
                        color: colors.primaryContainer,
                        textColor: colors.onPrimaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Auto Grid
            const SectionHeader(
              title: 'Auto Grid',
              subtitle: 'GAutoGrid auto-fits based on min width',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Min Width: 100px',
              subtitle: 'Columns adjust automatically',
              child: GAutoGrid(
                minItemWidth: 100,
                spacing: GSpacing.sm,
                childAspectRatio: 1,
                children: List.generate(
                  12,
                  (i) => _GridCell(
                    label: '${i + 1}',
                    color: colors.surfaceVariant,
                    textColor: colors.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Min Width: 150px',
              subtitle: 'Fewer columns as min width increases',
              child: GAutoGrid(
                minItemWidth: 150,
                spacing: GSpacing.sm,
                mainAxisExtent: 80,
                children: List.generate(
                  6,
                  (i) => _GridCell(
                    label: 'Card ${i + 1}',
                    color: colors.secondaryContainer,
                    textColor: colors.onSecondaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Wrap Grid
            const SectionHeader(
              title: 'Wrap Grid',
              subtitle: 'GWrapGrid for flexible item sizes',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Variable Width Items',
              subtitle: 'Items wrap to next line',
              child: GWrapGrid(
                spacing: GSpacing.sm,
                children: [
                  _TagItem('Flutter', colors),
                  _TagItem('Dart', colors),
                  _TagItem('Design System', colors),
                  _TagItem('UI', colors),
                  _TagItem('Components', colors),
                  _TagItem('Responsive', colors),
                  _TagItem('Grid', colors),
                  _TagItem('Layout', colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Centered Alignment',
              subtitle: 'alignment: WrapAlignment.center',
              child: GWrapGrid(
                spacing: GSpacing.sm,
                alignment: WrapAlignment.center,
                children: [
                  _IconBox(Icons.home, colors),
                  _IconBox(Icons.search, colors),
                  _IconBox(Icons.favorite, colors),
                  _IconBox(Icons.settings, colors),
                  _IconBox(Icons.person, colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Grid Item
            const SectionHeader(
              title: 'Grid Item',
              subtitle: 'GGridItem styled container',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Interactive Grid Items',
              subtitle: 'With onTap callback',
              child: GGrid(
                crossAxisCount: 2,
                spacing: GSpacing.sm,
                mainAxisExtent: 100,
                children: [
                  GGridItem(
                    onTap: () => GToastController.info(context, 'Tapped Item 1'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.folder, color: colors.primary, size: 32),
                        const SizedBox(height: GSpacing.xs),
                        Text('Documents', style: TextStyle(color: colors.onSurface)),
                      ],
                    ),
                  ),
                  GGridItem(
                    onTap: () => GToastController.info(context, 'Tapped Item 2'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image, color: colors.success, size: 32),
                        const SizedBox(height: GSpacing.xs),
                        Text('Photos', style: TextStyle(color: colors.onSurface)),
                      ],
                    ),
                  ),
                  GGridItem(
                    onTap: () => GToastController.info(context, 'Tapped Item 3'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.music_note, color: colors.warning, size: 32),
                        const SizedBox(height: GSpacing.xs),
                        Text('Music', style: TextStyle(color: colors.onSurface)),
                      ],
                    ),
                  ),
                  GGridItem(
                    onTap: () => GToastController.info(context, 'Tapped Item 4'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_library, color: colors.error, size: 32),
                        const SizedBox(height: GSpacing.xs),
                        Text('Videos', style: TextStyle(color: colors.onSurface)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Masonry Grid
            const SectionHeader(
              title: 'Masonry Grid',
              subtitle: 'GMasonryGrid for varying heights',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: '2 Column Masonry',
              subtitle: 'Items with different heights',
              child: GMasonryGrid(
                crossAxisCount: 2,
                spacing: GSpacing.sm,
                children: [
                  _MasonryItem(height: 100, label: '1', colors: colors),
                  _MasonryItem(height: 150, label: '2', colors: colors),
                  _MasonryItem(height: 80, label: '3', colors: colors),
                  _MasonryItem(height: 120, label: '4', colors: colors),
                  _MasonryItem(height: 90, label: '5', colors: colors),
                  _MasonryItem(height: 140, label: '6', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: '3 Column Masonry',
              subtitle: 'More columns for wider screens',
              child: GMasonryGrid(
                crossAxisCount: 3,
                spacing: GSpacing.sm,
                children: [
                  _MasonryItem(height: 80, label: '1', colors: colors),
                  _MasonryItem(height: 120, label: '2', colors: colors),
                  _MasonryItem(height: 100, label: '3', colors: colors),
                  _MasonryItem(height: 140, label: '4', colors: colors),
                  _MasonryItem(height: 90, label: '5', colors: colors),
                  _MasonryItem(height: 110, label: '6', colors: colors),
                  _MasonryItem(height: 130, label: '7', colors: colors),
                  _MasonryItem(height: 85, label: '8', colors: colors),
                  _MasonryItem(height: 95, label: '9', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example
            const SectionHeader(
              title: 'Practical Examples',
              subtitle: 'Common grid patterns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Product Grid',
              subtitle: 'E-commerce style layout',
              child: GGrid(
                columns: GResponsiveValue(xs: 2, md: 3, lg: 4),
                spacing: GSpacing.sm,
                mainAxisExtent: 180,
                children: List.generate(
                  4,
                  (i) => _ProductCard(
                    name: 'Product ${i + 1}',
                    price: '\$${(i + 1) * 29.99}',
                    colors: colors,
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Image Gallery',
              subtitle: 'Photo grid layout',
              child: GGrid(
                crossAxisCount: 3,
                spacing: GSpacing.xs,
                childAspectRatio: 1,
                children: List.generate(
                  9,
                  (i) => Container(
                    decoration: BoxDecoration(
                      color: _getGalleryColor(i, colors),
                      borderRadius: GBorderRadius.allSm,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
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

  int _getColumnCount(GBreakpoint breakpoint) {
    return switch (breakpoint) {
      GBreakpoint.xs => 1,
      GBreakpoint.sm => 2,
      GBreakpoint.md => 3,
      _ => 4,
    };
  }

  Color _getGalleryColor(int index, GColorScheme colors) {
    final colorList = [
      colors.primary,
      colors.secondary,
      colors.tertiary,
      colors.success,
      colors.warning,
      colors.error,
      colors.info,
      colors.primary.withValues(alpha: 0.7),
      colors.secondary.withValues(alpha: 0.7),
    ];
    return colorList[index % colorList.length];
  }
}

class _GridCell extends StatelessWidget {
  const _GridCell({
    required this.label,
    required this.color,
    required this.textColor,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: GBorderRadius.allMd,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  const _TagItem(this.label, this.colors);
  final String label;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GSpacing.md,
        vertical: GSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: GBorderRadius.allFull,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: colors.onPrimaryContainer,
          fontSize: 13,
        ),
      ),
    );
  }
}

class _IconBox extends StatelessWidget {
  const _IconBox(this.icon, this.colors);
  final IconData icon;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: GBorderRadius.allMd,
      ),
      child: Icon(icon, color: colors.onSurfaceVariant),
    );
  }
}

class _MasonryItem extends StatelessWidget {
  const _MasonryItem({
    required this.height,
    required this.label,
    required this.colors,
  });

  final double height;
  final String label;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: GBorderRadius.allMd,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: colors.onPrimaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.name,
    required this.price,
    required this.colors,
  });

  final String name;
  final String price;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allMd,
        border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_bag,
                  size: 40,
                  color: colors.onSurfaceVariant,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(GSpacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

