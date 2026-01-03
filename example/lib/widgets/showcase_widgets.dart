import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

/// A reusable screen scaffold for the example app
class ShowcaseScaffold extends StatelessWidget {
  const ShowcaseScaffold({
    super.key,
    required this.title,
    required this.onThemeToggle,
    required this.isDarkMode,
    required this.body,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;
  final Widget body;

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightSemiBold,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle!,
                style: textTheme.labelSmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
          ],
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
      body: body,
    );
  }
}

/// Section header widget
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.padding,
  });

  final String title;
  final String? subtitle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: GSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: GSpacing.xs3),
            Text(
              subtitle!,
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// A card that displays a component or token example
class ShowcaseCard extends StatelessWidget {
  const ShowcaseCard({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.padding,
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(
          color: colors.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(GSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleSmall.copyWith(
                    color: colors.onSurface,
                    fontWeight: GTypography.fontWeightSemiBold,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: GSpacing.xs3),
                  Text(
                    subtitle!,
                    style: textTheme.bodySmall.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Divider(
            height: 1,
            color: colors.outline.withOpacity(0.2),
          ),
          Padding(
            padding: padding ?? const EdgeInsets.all(GSpacing.md),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// A simple token display row
class TokenRow extends StatelessWidget {
  const TokenRow({
    super.key,
    required this.name,
    required this.value,
    this.preview,
  });

  final String name;
  final String value;
  final Widget? preview;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          if (preview != null) ...[
            preview!,
            const SizedBox(width: GSpacing.sm),
          ],
          Expanded(
            child: Text(
              name,
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          Text(
            value,
            style: textTheme.bodySmall.copyWith(
              color: colors.onSurfaceVariant,
              fontFamily: GTypography.fontFamilyMono,
            ),
          ),
        ],
      ),
    );
  }
}

/// Color swatch preview
class ColorSwatch extends StatelessWidget {
  const ColorSwatch({
    super.key,
    required this.color,
    this.size = 40,
    this.borderRadius,
  });

  final Color color;
  final double size;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? GBorderRadius.allSm,
        border: Border.all(
          color: colors.outline.withOpacity(0.2),
        ),
      ),
    );
  }
}

