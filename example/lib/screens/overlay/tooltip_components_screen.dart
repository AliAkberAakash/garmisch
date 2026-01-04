import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class TooltipComponentsScreen extends StatelessWidget {
  const TooltipComponentsScreen({
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
      title: 'Tooltip',
      subtitle: 'GTooltip component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Tooltip
            const SectionHeader(
              title: 'Basic Tooltip',
              subtitle: 'Hover or long-press to show',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Tooltip',
              subtitle: 'Text message on hover',
              child: Row(
                children: [
                  GTooltip(
                    message: 'This is a tooltip',
                    child: GIconButton(
                      icon: Icons.info_outline,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Help information',
                    child: GIconButton(
                      icon: Icons.help_outline,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Settings',
                    child: GIconButton(
                      icon: Icons.settings,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Tooltip on Buttons
            const SectionHeader(
              title: 'Tooltip on Buttons',
              subtitle: 'Describe button actions',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Action Buttons',
              subtitle: 'Tooltip describes the action',
              child: Row(
                children: [
                  GTooltip(
                    message: 'Add new item',
                    child: GButton(
                      label: 'Add',
                      icon: Icons.add,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Save changes',
                    child: GButton(
                      label: 'Save',
                      icon: Icons.save,
                      variant: GButtonVariant.outlined,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  GTooltip(
                    message: 'Cancel and go back',
                    child: GButton(
                      label: 'Cancel',
                      variant: GButtonVariant.ghost,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Icon Button Tooltips
            const SectionHeader(
              title: 'Icon Button Tooltips',
              subtitle: 'Essential for accessibility',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Toolbar Icons',
              subtitle: 'Describe icon meanings',
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.sm,
                  vertical: GSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: colors.surfaceVariant,
                  borderRadius: GBorderRadius.allMd,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GTooltip(
                      message: 'Bold',
                      child: GIconButton(
                        icon: Icons.format_bold,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                    GTooltip(
                      message: 'Italic',
                      child: GIconButton(
                        icon: Icons.format_italic,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                    GTooltip(
                      message: 'Underline',
                      child: GIconButton(
                        icon: Icons.format_underline,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: colors.outline.withValues(alpha: 0.3),
                      margin: const EdgeInsets.symmetric(horizontal: GSpacing.xs),
                    ),
                    GTooltip(
                      message: 'Align left',
                      child: GIconButton(
                        icon: Icons.format_align_left,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                    GTooltip(
                      message: 'Align center',
                      child: GIconButton(
                        icon: Icons.format_align_center,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                    GTooltip(
                      message: 'Align right',
                      child: GIconButton(
                        icon: Icons.format_align_right,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Long Text Tooltips
            const SectionHeader(
              title: 'Detailed Tooltips',
              subtitle: 'Longer descriptive messages',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Descriptive Messages',
              subtitle: 'Provide more context',
              child: Row(
                children: [
                  GTooltip(
                    message: 'Delete this item permanently. This action cannot be undone.',
                    child: GIconButton(
                      icon: Icons.delete_outline,
                      variant: GIconButtonVariant.standard,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GTooltip(
                    message: 'Share this content with others via email, social media, or link.',
                    child: GIconButton(
                      icon: Icons.share,
                      variant: GIconButtonVariant.standard,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GTooltip(
                    message: 'Download file to your device. Requires storage permission.',
                    child: GIconButton(
                      icon: Icons.download,
                      variant: GIconButtonVariant.standard,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Tooltip on Various Elements
            const SectionHeader(
              title: 'Tooltip on Any Element',
              subtitle: 'Wrap any widget with tooltip',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Various Elements',
              subtitle: 'Tooltip can wrap any widget',
              child: Row(
                children: [
                  GTooltip(
                    message: 'User profile',
                    child: GAvatar(
                      name: 'John Doe',
                      size: GAvatarSize.md,
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GTooltip(
                    message: 'Active status badge',
                    child: GBadge(
                      label: 'Active',
                      variant: GBadgeVariant.soft,
                      color: GBadgeColor.success,
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GTooltip(
                    message: 'Click to select this tag',
                    child: GChip(
                      label: 'Flutter',
                      leadingIcon: Icons.flutter_dash,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Tooltip Usage Tips
            const SectionHeader(
              title: 'Usage Tips',
              subtitle: 'Best practices for tooltips',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Best Practices',
              subtitle: 'When to use tooltips',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TipItem(
                    icon: Icons.check_circle,
                    color: colors.success,
                    text: 'Use for icon buttons without visible labels',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _TipItem(
                    icon: Icons.check_circle,
                    color: colors.success,
                    text: 'Provide additional context for actions',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _TipItem(
                    icon: Icons.check_circle,
                    color: colors.success,
                    text: 'Keep messages concise and helpful',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _TipItem(
                    icon: Icons.cancel,
                    color: colors.error,
                    text: 'Don\'t use for essential information',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _TipItem(
                    icon: Icons.cancel,
                    color: colors.error,
                    text: 'Don\'t duplicate visible labels',
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

class _TipItem extends StatelessWidget {
  const _TipItem({
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: GSpacing.sm),
        Expanded(
          child: Text(text),
        ),
      ],
    );
  }
}

