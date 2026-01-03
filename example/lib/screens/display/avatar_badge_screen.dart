import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AvatarBadgeScreen extends StatelessWidget {
  const AvatarBadgeScreen({
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
      title: 'Avatar & Badge',
      subtitle: 'GAvatar, GBadge components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            const SectionHeader(
              title: 'Avatar',
              subtitle: 'GAvatar component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Avatar Sizes',
              subtitle: 'GAvatarSize enum',
              child: Row(
                children: [
                  const GAvatar(name: 'XS', size: GAvatarSize.xs),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(name: 'SM', size: GAvatarSize.sm),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(name: 'MD', size: GAvatarSize.md),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(name: 'LG', size: GAvatarSize.lg),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(name: 'XL', size: GAvatarSize.xl),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(name: '2X', size: GAvatarSize.xl2),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Avatar Content',
              subtitle: 'Image, initials, or icon',
              child: Row(
                children: [
                  GAvatar(
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                    size: GAvatarSize.lg,
                  ),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(
                    name: 'John Doe',
                    size: GAvatarSize.lg,
                  ),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(
                    icon: Icons.person,
                    size: GAvatarSize.lg,
                  ),
                  const SizedBox(width: GSpacing.sm),
                  GAvatar(
                    name: 'Custom',
                    size: GAvatarSize.lg,
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Avatar Shapes',
              subtitle: 'GAvatarShape enum',
              child: Row(
                children: [
                  const GAvatar(
                    name: 'Circle',
                    size: GAvatarSize.lg,
                    shape: GAvatarShape.circle,
                  ),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(
                    name: 'Rounded',
                    size: GAvatarSize.lg,
                    shape: GAvatarShape.rounded,
                  ),
                  const SizedBox(width: GSpacing.sm),
                  const GAvatar(
                    name: 'Square',
                    size: GAvatarSize.lg,
                    shape: GAvatarShape.square,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Avatar Group',
              subtitle: 'GAvatarGroup for multiple avatars',
              child: const GAvatarGroup(
                avatars: [
                  GAvatarData(name: 'Alice'),
                  GAvatarData(name: 'Bob'),
                  GAvatarData(name: 'Charlie'),
                  GAvatarData(name: 'David'),
                  GAvatarData(name: 'Eve'),
                  GAvatarData(name: 'Frank'),
                ],
                max: 4,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Badge
            const SectionHeader(
              title: 'Badge',
              subtitle: 'GBadge component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Badge Colors',
              subtitle: 'GBadgeColor enum',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  const GBadge(label: 'Primary', color: GBadgeColor.primary),
                  const GBadge(label: 'Secondary', color: GBadgeColor.secondary),
                  const GBadge(label: 'Success', color: GBadgeColor.success),
                  const GBadge(label: 'Warning', color: GBadgeColor.warning),
                  const GBadge(label: 'Error', color: GBadgeColor.error),
                  const GBadge(label: 'Info', color: GBadgeColor.info),
                  const GBadge(label: 'Neutral', color: GBadgeColor.neutral),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Badge Variants',
              subtitle: 'GBadgeVariant enum',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: GSpacing.sm,
                    runSpacing: GSpacing.sm,
                    children: const [
                      GBadge(label: 'Solid', variant: GBadgeVariant.solid),
                      GBadge(label: 'Soft', variant: GBadgeVariant.soft),
                      GBadge(label: 'Outlined', variant: GBadgeVariant.outlined),
                    ],
                  ),
                  const SizedBox(height: GSpacing.md),
                  Wrap(
                    spacing: GSpacing.sm,
                    runSpacing: GSpacing.sm,
                    children: const [
                      GBadge(
                        label: 'Success',
                        color: GBadgeColor.success,
                        variant: GBadgeVariant.solid,
                      ),
                      GBadge(
                        label: 'Success',
                        color: GBadgeColor.success,
                        variant: GBadgeVariant.soft,
                      ),
                      GBadge(
                        label: 'Success',
                        color: GBadgeColor.success,
                        variant: GBadgeVariant.outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Badge with Icons',
              subtitle: 'icon and onDismiss props',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  const GBadge(
                    label: 'New',
                    icon: Icons.star,
                    color: GBadgeColor.warning,
                  ),
                  GBadge(
                    label: 'Dismissible',
                    onDismiss: () {},
                  ),
                  const GBadge(
                    label: 'Rounded',
                    isRounded: true,
                    color: GBadgeColor.success,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Notification Badge',
              subtitle: 'GNotificationBadge wrapper',
              child: Row(
                children: [
                  GNotificationBadge(
                    count: 3,
                    child: GIconButton(
                      icon: Icons.notifications_outlined,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GNotificationBadge(
                    count: 99,
                    child: GIconButton(
                      icon: Icons.mail_outlined,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GNotificationBadge(
                    count: 150,
                    maxCount: 99,
                    child: GIconButton(
                      icon: Icons.shopping_cart_outlined,
                      onPressed: () {},
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

