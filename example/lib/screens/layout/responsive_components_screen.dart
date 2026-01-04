import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ResponsiveComponentsScreen extends StatelessWidget {
  const ResponsiveComponentsScreen({
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
      title: 'Responsive',
      subtitle: 'GResponsive, GBreakpointBuilder',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Current Breakpoint
            const SectionHeader(
              title: 'Current Breakpoint',
              subtitle: 'GBreakpointBuilder detects screen size',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Breakpoint Detection',
              subtitle: 'Resize window to see changes',
              child: GBreakpointBuilder(
                builder: (context, breakpoint) {
                  final breakpointInfo = _getBreakpointInfo(breakpoint, colors);
                  return Container(
                    padding: const EdgeInsets.all(GSpacing.lg),
                    decoration: BoxDecoration(
                      color: breakpointInfo.color.withValues(alpha: 0.1),
                      borderRadius: GBorderRadius.allMd,
                      border: Border.all(color: breakpointInfo.color),
                    ),
                    child: Column(
                      children: [
                        Icon(breakpointInfo.icon, size: 48, color: breakpointInfo.color),
                        const SizedBox(height: GSpacing.md),
                        Text(
                          breakpoint.name.toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: breakpointInfo.color,
                          ),
                        ),
                        const SizedBox(height: GSpacing.xs),
                        Text(
                          breakpointInfo.label,
                          style: TextStyle(color: colors.onSurfaceVariant),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Text(
                          breakpointInfo.range,
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Breakpoint Reference
            const SectionHeader(
              title: 'Breakpoint Reference',
              subtitle: 'Available breakpoint values',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GBreakpoint Values',
              subtitle: 'Width ranges for each breakpoint',
              child: Column(
                children: [
                  _BreakpointRow('xs', '0 - 599px', 'Mobile phones', colors),
                  _BreakpointRow('sm', '600 - 904px', 'Small tablets', colors),
                  _BreakpointRow('md', '905 - 1239px', 'Large tablets', colors),
                  _BreakpointRow('lg', '1240 - 1439px', 'Desktop', colors),
                  _BreakpointRow('xl', '1440 - 1919px', 'Large desktop', colors),
                  _BreakpointRow('xl2', '1920px+', 'Extra large desktop', colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GResponsive Widget
            const SectionHeader(
              title: 'Responsive Widget',
              subtitle: 'GResponsive shows different widgets per breakpoint',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GResponsive',
              subtitle: 'Different layouts for each breakpoint',
              child: GResponsive(
                xs: _ResponsiveDemo(
                  label: 'Mobile (XS)',
                  description: '1 column layout',
                  color: colors.error,
                  columns: 1,
                ),
                sm: _ResponsiveDemo(
                  label: 'Small (SM)',
                  description: '2 column layout',
                  color: colors.warning,
                  columns: 2,
                ),
                md: _ResponsiveDemo(
                  label: 'Tablet (MD)',
                  description: '3 column layout',
                  color: colors.success,
                  columns: 3,
                ),
                lg: _ResponsiveDemo(
                  label: 'Desktop (LG)',
                  description: '4 column layout',
                  color: colors.info,
                  columns: 4,
                ),
                xl: _ResponsiveDemo(
                  label: 'Large (XL)',
                  description: '6 column layout',
                  color: colors.primary,
                  columns: 6,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GResponsiveValue
            const SectionHeader(
              title: 'Responsive Values',
              subtitle: 'GResponsiveValue<T> for any type',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GResponsiveValue<int>',
              subtitle: 'Dynamic column count',
              child: Builder(
                builder: (context) {
                  final columns = GResponsiveValue<int>(
                    xs: 2,
                    sm: 3,
                    md: 4,
                    lg: 6,
                    xl: 8,
                  ).resolve(context);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current columns: $columns',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                      const SizedBox(height: GSpacing.md),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          columns,
                          (i) => Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: GBorderRadius.allSm,
                            ),
                            child: Center(
                              child: Text(
                                '${i + 1}',
                                style: TextStyle(
                                  color: colors.onPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'GResponsiveValue<double>',
              subtitle: 'Dynamic padding/sizing',
              child: Builder(
                builder: (context) {
                  final padding = GResponsiveValue<double>(
                    xs: 8,
                    sm: 12,
                    md: 16,
                    lg: 24,
                    xl: 32,
                  ).resolve(context);

                  final fontSize = GResponsiveValue<double>(
                    xs: 14,
                    sm: 16,
                    md: 18,
                    lg: 20,
                    xl: 24,
                  ).resolve(context);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Padding: ${padding}px | Font: ${fontSize}px',
                        style: TextStyle(
                          color: colors.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: GSpacing.sm),
                      Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          color: colors.primaryContainer,
                          borderRadius: GBorderRadius.allMd,
                        ),
                        child: Text(
                          'Responsive Content',
                          style: TextStyle(
                            fontSize: fontSize,
                            color: colors.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Breakpoint Helpers
            const SectionHeader(
              title: 'Breakpoint Helpers',
              subtitle: 'Convenience getters',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Helper Properties',
              subtitle: 'isMobile, isTablet, isDesktop',
              child: GBreakpointBuilder(
                builder: (context, breakpoint) {
                  return Column(
                    children: [
                      _HelperRow('breakpoint.isMobile', breakpoint.isMobile, colors),
                      _HelperRow('breakpoint.isTablet', breakpoint.isTablet, colors),
                      _HelperRow('breakpoint.isDesktop', breakpoint.isDesktop, colors),
                      const GDivider(),
                      const SizedBox(height: GSpacing.sm),
                      Text(
                        'Use these to simplify conditional logic',
                        style: TextStyle(
                          fontSize: 12,
                          color: colors.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example
            const SectionHeader(
              title: 'Practical Example',
              subtitle: 'Responsive card grid',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Responsive Grid',
              subtitle: 'Card layout adapts to screen size',
              child: Builder(
                builder: (context) {
                  final crossAxisCount = GResponsiveValue<int>(
                    xs: 1,
                    sm: 2,
                    md: 3,
                    lg: 4,
                  ).resolve(context);

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: GSpacing.sm,
                      mainAxisSpacing: GSpacing.sm,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: colors.surfaceVariant,
                          borderRadius: GBorderRadius.allMd,
                        ),
                        child: Center(
                          child: Text(
                            'Card ${index + 1}',
                            style: TextStyle(
                              color: colors.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }

  _BreakpointInfo _getBreakpointInfo(GBreakpoint breakpoint, GColorScheme colors) {
    switch (breakpoint) {
      case GBreakpoint.xs:
        return _BreakpointInfo(
          icon: Icons.phone_android,
          label: 'Mobile Phone',
          range: '0 - 599px',
          color: colors.error,
        );
      case GBreakpoint.sm:
        return _BreakpointInfo(
          icon: Icons.phone_android,
          label: 'Small Tablet',
          range: '600 - 904px',
          color: colors.warning,
        );
      case GBreakpoint.md:
        return _BreakpointInfo(
          icon: Icons.tablet_android,
          label: 'Large Tablet',
          range: '905 - 1239px',
          color: colors.success,
        );
      case GBreakpoint.lg:
        return _BreakpointInfo(
          icon: Icons.laptop,
          label: 'Desktop',
          range: '1240 - 1439px',
          color: colors.info,
        );
      case GBreakpoint.xl:
        return _BreakpointInfo(
          icon: Icons.desktop_windows,
          label: 'Large Desktop',
          range: '1440px+',
          color: colors.primary,
        );
      case GBreakpoint.xl2:
        return _BreakpointInfo(
          icon: Icons.desktop_windows,
          label: 'Extra Large Desktop',
          range: '1920px+',
          color: colors.secondary,
        );
    }
  }
}

class _BreakpointInfo {
  final IconData icon;
  final String label;
  final String range;
  final Color color;

  _BreakpointInfo({
    required this.icon,
    required this.label,
    required this.range,
    required this.color,
  });
}

class _BreakpointRow extends StatelessWidget {
  const _BreakpointRow(this.name, this.range, this.description, this.colors);
  final String name;
  final String range;
  final String description;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: Row(
        children: [
          Container(
            width: 32,
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.1),
              borderRadius: GBorderRadius.allSm,
            ),
            child: Text(
              name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: GSpacing.sm),
          SizedBox(
            width: 100,
            child: Text(
              range,
              style: TextStyle(fontSize: 12, color: colors.onSurface),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResponsiveDemo extends StatelessWidget {
  const _ResponsiveDemo({
    required this.label,
    required this.description,
    required this.color,
    required this.columns,
  });

  final String label;
  final String description;
  final Color color;
  final int columns;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(GSpacing.sm),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: GBorderRadius.allMd,
            border: Border.all(color: color),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.devices, color: color, size: 20),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: color,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: GSpacing.sm),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            columns,
            (i) => Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                borderRadius: GBorderRadius.allSm,
              ),
              child: Center(
                child: Text(
                  '${i + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HelperRow extends StatelessWidget {
  const _HelperRow(this.property, this.value, this.colors);
  final String property;
  final bool value;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: Row(
        children: [
          Expanded(
            child: Text(
              property,
              style: TextStyle(fontSize: 13, color: colors.onSurface),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: GSpacing.sm, vertical: 2),
            decoration: BoxDecoration(
              color: value ? colors.success.withValues(alpha: 0.1) : colors.error.withValues(alpha: 0.1),
              borderRadius: GBorderRadius.allFull,
            ),
            child: Text(
              value ? 'true' : 'false',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: value ? colors.success : colors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

