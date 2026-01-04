import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AccordionComponentsScreen extends StatelessWidget {
  const AccordionComponentsScreen({
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

    return ShowcaseScaffold(
      title: 'Accordion',
      subtitle: 'GAccordion component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Accordion
            const SectionHeader(
              title: 'Basic Accordion',
              subtitle: 'Collapsible FAQ-style sections',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'FAQ Example',
              subtitle: 'Single expand mode',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  items: [
                    GAccordionItem(
                      title: 'What is Garmisch?',
                      content: Text(
                        'Garmisch is a minimalistic design system for Flutter, '
                        'providing a complete set of foundational tokens and UI components '
                        'to build beautiful, consistent applications.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'How do I get started?',
                      content: Text(
                        'Add garmisch to your pubspec.yaml, wrap your app with GTheme, '
                        'and start using the components! Check out the documentation '
                        'for detailed guides and examples.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Is it customizable?',
                      content: Text(
                        'Yes! You can customize colors, typography, spacing, and more '
                        'through the theme system. Create your own theme or extend '
                        'the default theme to match your brand.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'What platforms are supported?',
                      content: Text(
                        'Garmisch works on all platforms supported by Flutter: '
                        'iOS, Android, Web, macOS, Windows, and Linux.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                  initialExpandedIndex: 0,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Multi-Expand Accordion
            const SectionHeader(
              title: 'Multi-Expand Mode',
              subtitle: 'allowMultiple: true',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Multiple Sections Open',
              subtitle: 'Expand multiple items at once',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  allowMultiple: true,
                  items: [
                    GAccordionItem(
                      title: 'Section 1: Introduction',
                      leading: Icon(Icons.looks_one, color: colors.primary),
                      content: Text(
                        'This is the introduction section. Multiple sections can be '
                        'open at the same time when allowMultiple is set to true.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Section 2: Features',
                      leading: Icon(Icons.looks_two, color: colors.primary),
                      content: Text(
                        'Here are the features of the accordion component. '
                        'Try opening this section while keeping Section 1 open.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Section 3: Usage',
                      leading: Icon(Icons.looks_3, color: colors.primary),
                      content: Text(
                        'Learn how to use the accordion in your application. '
                        'You can open all three sections at once!',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Accordion with Icons
            const SectionHeader(
              title: 'With Leading Icons',
              subtitle: 'Visual indicators for each item',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Icon Accordion',
              subtitle: 'leading property on items',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  items: [
                    GAccordionItem(
                      title: 'Shipping Information',
                      leading: Icon(Icons.local_shipping, color: colors.info),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'We offer free shipping on orders over \$50. '
                            'Standard delivery takes 3-5 business days.',
                            style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: GSpacing.sm),
                          Row(
                            children: [
                              Icon(Icons.check_circle, size: 16, color: colors.success),
                              const SizedBox(width: GSpacing.xs),
                              Text('Free shipping over \$50', style: textTheme.bodySmall),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.check_circle, size: 16, color: colors.success),
                              const SizedBox(width: GSpacing.xs),
                              Text('Express delivery available', style: textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GAccordionItem(
                      title: 'Return Policy',
                      leading: Icon(Icons.assignment_return, color: colors.warning),
                      content: Text(
                        '30-day return policy on all items. Items must be unused '
                        'and in original packaging. Contact support to initiate a return.',
                        style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                      ),
                    ),
                    GAccordionItem(
                      title: 'Payment Methods',
                      leading: Icon(Icons.payment, color: colors.success),
                      content: Wrap(
                        spacing: GSpacing.sm,
                        runSpacing: GSpacing.sm,
                        children: [
                          GChip(label: 'Visa', leadingIcon: Icons.credit_card),
                          GChip(label: 'Mastercard', leadingIcon: Icons.credit_card),
                          GChip(label: 'PayPal', leadingIcon: Icons.account_balance_wallet),
                          GChip(label: 'Apple Pay', leadingIcon: Icons.apple),
                        ],
                      ),
                    ),
                    GAccordionItem(
                      title: 'Customer Support',
                      leading: Icon(Icons.support_agent, color: colors.error),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our support team is available 24/7.',
                            style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                          ),
                          const SizedBox(height: GSpacing.md),
                          GButton(
                            label: 'Contact Support',
                            icon: Icons.chat,
                            size: GButtonSize.sm,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Rich Content Accordion
            const SectionHeader(
              title: 'Rich Content',
              subtitle: 'Complex widgets as content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Settings Accordion',
              subtitle: 'Forms and controls inside',
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GAccordion(
                  allowMultiple: true,
                  items: [
                    GAccordionItem(
                      title: 'Appearance',
                      leading: Icon(Icons.palette, color: colors.primary),
                      content: Column(
                        children: [
                          GListTile(
                            title: 'Dark Mode',
                            trailing: GSwitch(
                              value: isDarkMode,
                              onChanged: (v) => onThemeToggle(),
                            ),
                          ),
                          GListTile(
                            title: 'Compact Mode',
                            trailing: GSwitch(value: false, onChanged: (v) {}),
                          ),
                        ],
                      ),
                    ),
                    GAccordionItem(
                      title: 'Notifications',
                      leading: Icon(Icons.notifications, color: colors.warning),
                      content: Column(
                        children: [
                          GListTile(
                            title: 'Push Notifications',
                            trailing: GSwitch(value: true, onChanged: (v) {}),
                          ),
                          GListTile(
                            title: 'Email Notifications',
                            trailing: GSwitch(value: true, onChanged: (v) {}),
                          ),
                          GListTile(
                            title: 'SMS Notifications',
                            trailing: GSwitch(value: false, onChanged: (v) {}),
                          ),
                        ],
                      ),
                    ),
                    GAccordionItem(
                      title: 'Privacy',
                      leading: Icon(Icons.security, color: colors.success),
                      content: Column(
                        children: [
                          GListTile(
                            title: 'Profile Visibility',
                            subtitle: 'Who can see your profile',
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          GListTile(
                            title: 'Activity Status',
                            trailing: GSwitch(value: true, onChanged: (v) {}),
                          ),
                          GListTile(
                            title: 'Read Receipts',
                            trailing: GSwitch(value: true, onChanged: (v) {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Borderless Accordion
            const SectionHeader(
              title: 'Without Border',
              subtitle: 'Clean look without container',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Borderless Style',
              subtitle: 'No container decoration',
              child: GAccordion(
                items: [
                  GAccordionItem(
                    title: 'First Item',
                    content: Text(
                      'Content for the first item without any border styling.',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                    ),
                  ),
                  GAccordionItem(
                    title: 'Second Item',
                    content: Text(
                      'Content for the second item. The accordion integrates seamlessly.',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                    ),
                  ),
                  GAccordionItem(
                    title: 'Third Item',
                    content: Text(
                      'Content for the third item. Clean and minimal design.',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                    ),
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

