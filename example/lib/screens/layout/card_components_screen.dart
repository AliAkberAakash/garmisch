import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class CardComponentsScreen extends StatelessWidget {
  const CardComponentsScreen({
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
      title: 'Card',
      subtitle: 'GCard component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Variants
            const SectionHeader(
              title: 'Card Variants',
              subtitle: 'Different visual styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Elevated Card',
              subtitle: 'GCardVariant.elevated - Has shadow',
              child: GCard(
                variant: GCardVariant.elevated,
                child: Text(
                  'Elevated Card - Has shadow for depth',
                  style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Filled Card',
              subtitle: 'GCardVariant.filled - Has background',
              child: GCard(
                variant: GCardVariant.filled,
                child: Text(
                  'Filled Card - Has background color',
                  style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Outlined Card',
              subtitle: 'GCardVariant.outlined - Has border',
              child: GCard(
                variant: GCardVariant.outlined,
                child: Text(
                  'Outlined Card - Has border only',
                  style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Interactive Cards
            const SectionHeader(
              title: 'Interactive Cards',
              subtitle: 'Clickable cards with hover effects',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Clickable Card',
              subtitle: 'onTap property',
              child: GCard(
                onTap: () {
                  GToastController.info(context, 'Card tapped!');
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(GSpacing.sm),
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.1),
                        borderRadius: GBorderRadius.allMd,
                      ),
                      child: Icon(Icons.star, color: colors.primary),
                    ),
                    const SizedBox(width: GSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Clickable Card',
                            style: textTheme.titleSmall.copyWith(
                              color: colors.onSurface,
                            ),
                          ),
                          Text(
                            'Tap to see hover effect',
                            style: textTheme.bodySmall.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Multiple Interactive Cards',
              subtitle: 'List of clickable cards',
              child: Column(
                children: [
                  GCard(
                    variant: GCardVariant.outlined,
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.inbox, color: colors.primary),
                        const SizedBox(width: GSpacing.md),
                        Expanded(
                          child: Text(
                            'Inbox',
                            style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                          ),
                        ),
                        GBadge(
                          label: '12',
                          color: GBadgeColor.primary,
                          size: GBadgeSize.sm,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCard(
                    variant: GCardVariant.outlined,
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.send, color: colors.secondary),
                        const SizedBox(width: GSpacing.md),
                        Expanded(
                          child: Text(
                            'Sent',
                            style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCard(
                    variant: GCardVariant.outlined,
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(Icons.drafts, color: colors.warning),
                        const SizedBox(width: GSpacing.md),
                        Expanded(
                          child: Text(
                            'Drafts',
                            style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                          ),
                        ),
                        GBadge(
                          label: '3',
                          color: GBadgeColor.warning,
                          size: GBadgeSize.sm,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Card with Sections
            const SectionHeader(
              title: 'Card with Sections',
              subtitle: 'GCardSection for structured layouts',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Header, Body, Footer',
              subtitle: 'GCardSection with showDividers',
              child: GCardSection(
                showDividers: true,
                header: Row(
                  children: [
                    Icon(Icons.credit_card, color: colors.primary),
                    const SizedBox(width: GSpacing.sm),
                    Text(
                      'Card Title',
                      style: textTheme.titleMedium.copyWith(color: colors.onSurface),
                    ),
                  ],
                ),
                body: Text(
                  'This is the card body content. It can contain any widget you want. '
                  'The card automatically handles the layout for you.',
                  style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                ),
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GButton(
                      label: 'Cancel',
                      variant: GButtonVariant.ghost,
                      size: GButtonSize.sm,
                      onPressed: () {},
                    ),
                    const SizedBox(width: GSpacing.xs),
                    GButton(
                      label: 'Save',
                      size: GButtonSize.sm,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Without Dividers',
              subtitle: 'showDividers: false',
              child: GCardSection(
                showDividers: false,
                header: Text(
                  'Settings',
                  style: textTheme.titleMedium.copyWith(color: colors.onSurface),
                ),
                body: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notifications', style: textTheme.bodyMedium),
                        const GSwitch(value: true),
                      ],
                    ),
                    const SizedBox(height: GSpacing.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dark Mode', style: textTheme.bodyMedium),
                        const GSwitch(value: false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Card Content Examples
            const SectionHeader(
              title: 'Card Content Examples',
              subtitle: 'Common card patterns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Profile Card',
              subtitle: 'User profile layout',
              child: GCard(
                child: Column(
                  children: [
                    Row(
                      children: [
                        GAvatar(
                          name: 'John Doe',
                          size: GAvatarSize.lg,
                        ),
                        const SizedBox(width: GSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: textTheme.titleMedium.copyWith(color: colors.onSurface),
                              ),
                              Text(
                                'john.doe@example.com',
                                style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: GSpacing.md),
                    Row(
                      children: [
                        Expanded(
                          child: GButton(
                            label: 'Message',
                            icon: Icons.message,
                            variant: GButtonVariant.outlined,
                            size: GButtonSize.sm,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: GSpacing.sm),
                        Expanded(
                          child: GButton(
                            label: 'Follow',
                            icon: Icons.person_add,
                            size: GButtonSize.sm,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Stats Card',
              subtitle: 'Dashboard statistics',
              child: Row(
                children: [
                  Expanded(
                    child: GCard(
                      variant: GCardVariant.filled,
                      child: Column(
                        children: [
                          Icon(Icons.visibility, color: colors.primary, size: 32),
                          const SizedBox(height: GSpacing.sm),
                          Text(
                            '12.5K',
                            style: textTheme.headlineSmall.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Views',
                            style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GCard(
                      variant: GCardVariant.filled,
                      child: Column(
                        children: [
                          Icon(Icons.favorite, color: colors.error, size: 32),
                          const SizedBox(height: GSpacing.sm),
                          Text(
                            '1.2K',
                            style: textTheme.headlineSmall.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Likes',
                            style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.sm),
                  Expanded(
                    child: GCard(
                      variant: GCardVariant.filled,
                      child: Column(
                        children: [
                          Icon(Icons.share, color: colors.success, size: 32),
                          const SizedBox(height: GSpacing.sm),
                          Text(
                            '856',
                            style: textTheme.headlineSmall.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Shares',
                            style: textTheme.bodySmall.copyWith(color: colors.onSurfaceVariant),
                          ),
                        ],
                      ),
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

