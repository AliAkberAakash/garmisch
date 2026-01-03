import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Button',
      subtitle: 'GButton component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Variants
            const SectionHeader(
              title: 'Variants',
              subtitle: 'Different button styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Button Variants',
              subtitle: 'GButtonVariant enum',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Primary',
                    variant: GButtonVariant.primary,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Secondary',
                    variant: GButtonVariant.secondary,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Tertiary',
                    variant: GButtonVariant.tertiary,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Outlined',
                    variant: GButtonVariant.outlined,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Ghost',
                    variant: GButtonVariant.ghost,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Destructive',
                    variant: GButtonVariant.destructive,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Link',
                    variant: GButtonVariant.link,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Sizes
            const SectionHeader(
              title: 'Sizes',
              subtitle: 'Different button sizes',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Button Sizes',
              subtitle: 'GButtonSize enum',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  GButton(
                    label: 'Extra Small',
                    size: GButtonSize.xs,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Small',
                    size: GButtonSize.sm,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Medium',
                    size: GButtonSize.md,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Large',
                    size: GButtonSize.lg,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Extra Large',
                    size: GButtonSize.xl,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Icons
            const SectionHeader(
              title: 'With Icons',
              subtitle: 'Leading and trailing icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icon Buttons',
              subtitle: 'icon and trailingIcon props',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Leading Icon',
                    icon: Icons.add,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Trailing Icon',
                    trailingIcon: Icons.arrow_forward,
                    onPressed: () {},
                  ),
                  GButton(
                    label: 'Both Icons',
                    icon: Icons.download,
                    trailingIcon: Icons.arrow_downward,
                    variant: GButtonVariant.outlined,
                    onPressed: () {},
                  ),
                  GButton(
                    icon: Icons.favorite,
                    variant: GButtonVariant.destructive,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // States
            const SectionHeader(
              title: 'States',
              subtitle: 'Loading and disabled states',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Button States',
              subtitle: 'isLoading and isDisabled props',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: GSpacing.sm,
                    runSpacing: GSpacing.sm,
                    children: [
                      GButton(
                        label: 'Disabled',
                        isDisabled: true,
                        onPressed: () {},
                      ),
                      GButton(
                        label: 'Loading',
                        isLoading: true,
                        onPressed: () {},
                      ),
                      GButton(
                        label: 'Disabled Outlined',
                        variant: GButtonVariant.outlined,
                        isDisabled: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.md),
                  GButton(
                    label: _isLoading ? 'Saving...' : 'Click to Load',
                    isLoading: _isLoading,
                    onPressed: () async {
                      setState(() => _isLoading = true);
                      await Future.delayed(const Duration(seconds: 2));
                      if (mounted) setState(() => _isLoading = false);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Full Width
            const SectionHeader(
              title: 'Full Width',
              subtitle: 'Buttons that span full width',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Full Width Button',
              subtitle: 'isFullWidth prop',
              child: Column(
                children: [
                  GButton(
                    label: 'Full Width Primary',
                    isFullWidth: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GButton(
                    label: 'Full Width Outlined',
                    variant: GButtonVariant.outlined,
                    isFullWidth: true,
                    onPressed: () {},
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

