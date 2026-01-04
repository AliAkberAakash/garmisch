import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class LinkComponentsScreen extends StatelessWidget {
  const LinkComponentsScreen({
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
      title: 'Link',
      subtitle: 'GLink component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Link Variants
            const SectionHeader(
              title: 'Link Variants',
              subtitle: 'GLinkVariant enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Primary',
              subtitle: 'GLinkVariant.primary (default)',
              child: GLink(
                text: 'Primary Link',
                variant: GLinkVariant.primary,
                onTap: () => GToastController.info(context, 'Primary link tapped!'),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Secondary',
              subtitle: 'GLinkVariant.secondary',
              child: GLink(
                text: 'Secondary Link',
                variant: GLinkVariant.secondary,
                onTap: () => GToastController.info(context, 'Secondary link tapped!'),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Neutral',
              subtitle: 'GLinkVariant.neutral',
              child: GLink(
                text: 'Neutral Link',
                variant: GLinkVariant.neutral,
                onTap: () => GToastController.info(context, 'Neutral link tapped!'),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Link Sizes
            const SectionHeader(
              title: 'Link Sizes',
              subtitle: 'GLinkSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Options',
              subtitle: 'sm, md, lg',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.md,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  GLink(
                    text: 'Small Link',
                    size: GLinkSize.sm,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Medium Link',
                    size: GLinkSize.md,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Large Link',
                    size: GLinkSize.lg,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // External Link
            const SectionHeader(
              title: 'External Link',
              subtitle: 'isExternal property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With External Icon',
              subtitle: 'Shows icon indicating external link',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GLink(
                    text: 'Visit Our Website',
                    isExternal: true,
                    onTap: () => GToastController.info(context, 'Opens in browser'),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GLink(
                    text: 'View Documentation',
                    isExternal: true,
                    variant: GLinkVariant.secondary,
                    onTap: () => GToastController.info(context, 'Opens in browser'),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GLink(
                    text: 'GitHub Repository',
                    isExternal: true,
                    variant: GLinkVariant.neutral,
                    onTap: () => GToastController.info(context, 'Opens in browser'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Disabled State
            const SectionHeader(
              title: 'Disabled State',
              subtitle: 'isDisabled property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Disabled Links',
              subtitle: 'Non-interactive',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.md,
                children: [
                  GLink(
                    text: 'Disabled Primary',
                    variant: GLinkVariant.primary,
                    isDisabled: true,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Disabled Secondary',
                    variant: GLinkVariant.secondary,
                    isDisabled: true,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Disabled Neutral',
                    variant: GLinkVariant.neutral,
                    isDisabled: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Inline Links
            const SectionHeader(
              title: 'Inline Links',
              subtitle: 'Links within text content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Terms Agreement',
              subtitle: 'Common inline link pattern',
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onSurface,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to our '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Terms of Service',
                        size: GLinkSize.sm,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Privacy Policy',
                        size: GLinkSize.sm,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Help Text',
              subtitle: 'Link in description',
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onSurfaceVariant,
                  ),
                  children: [
                    const TextSpan(text: 'Having trouble? '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Contact Support',
                        size: GLinkSize.sm,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: ' or visit our '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Help Center',
                        size: GLinkSize.sm,
                        isExternal: true,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Examples
            const SectionHeader(
              title: 'Practical Examples',
              subtitle: 'Common link patterns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Navigation Links',
              subtitle: 'Menu-style links',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _NavLink(icon: Icons.home, text: 'Home', colors: colors),
                  _NavLink(icon: Icons.info, text: 'About Us', colors: colors),
                  _NavLink(icon: Icons.work, text: 'Services', colors: colors),
                  _NavLink(icon: Icons.mail, text: 'Contact', colors: colors),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Footer Links',
              subtitle: 'Small neutral links',
              child: Wrap(
                spacing: GSpacing.md,
                runSpacing: GSpacing.sm,
                children: [
                  GLink(text: 'Privacy', size: GLinkSize.sm, variant: GLinkVariant.neutral, onTap: () {}),
                  GLink(text: 'Terms', size: GLinkSize.sm, variant: GLinkVariant.neutral, onTap: () {}),
                  GLink(text: 'Cookies', size: GLinkSize.sm, variant: GLinkVariant.neutral, onTap: () {}),
                  GLink(text: 'Sitemap', size: GLinkSize.sm, variant: GLinkVariant.neutral, onTap: () {}),
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

class _NavLink extends StatelessWidget {
  const _NavLink({
    required this.icon,
    required this.text,
    required this.colors,
  });

  final IconData icon;
  final String text;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colors.primary),
          const SizedBox(width: GSpacing.sm),
          GLink(
            text: text,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

