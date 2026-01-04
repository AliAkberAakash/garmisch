import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class StackComponentsScreen extends StatelessWidget {
  const StackComponentsScreen({
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
      title: 'Stack',
      subtitle: 'GStackBadge, GOverlayContainer, GLayeredCard',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // GStackBadge
            const SectionHeader(
              title: 'Stack Badge',
              subtitle: 'GStackBadge for notification indicators',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Notification Badges',
              subtitle: 'Badges on icons',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GStackBadge(
                    position: GStackBadgePosition.topRight,
                    offset: const Offset(-4, -4),
                    badge: _NotificationDot(colors.error),
                    child: Icon(
                      Icons.notifications_outlined,
                      size: 32,
                      color: colors.onSurface,
                    ),
                  ),
                  GStackBadge(
                    position: GStackBadgePosition.topRight,
                    offset: const Offset(-8, -8),
                    badge: _CountBadge('3', colors),
                    child: Icon(
                      Icons.mail_outlined,
                      size: 32,
                      color: colors.onSurface,
                    ),
                  ),
                  GStackBadge(
                    position: GStackBadgePosition.topRight,
                    offset: const Offset(-8, -8),
                    badge: _CountBadge('99+', colors),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 32,
                      color: colors.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Avatar with Status',
              subtitle: 'Online/offline indicator',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GStackBadge(
                    position: GStackBadgePosition.bottomRight,
                    offset: const Offset(0, 0),
                    badge: _StatusDot(colors.success),
                    child: GAvatar(name: 'John Doe', size: GAvatarSize.lg),
                  ),
                  GStackBadge(
                    position: GStackBadgePosition.bottomRight,
                    offset: const Offset(0, 0),
                    badge: _StatusDot(colors.warning),
                    child: GAvatar(name: 'Jane Smith', size: GAvatarSize.lg),
                  ),
                  GStackBadge(
                    position: GStackBadgePosition.bottomRight,
                    offset: const Offset(0, 0),
                    badge: _StatusDot(colors.onSurfaceVariant),
                    child: GAvatar(name: 'Bob Wilson', size: GAvatarSize.lg),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Conditional Badge',
              subtitle: 'showBadge: false to hide',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GStackBadge(
                        showBadge: true,
                        badge: _NotificationDot(colors.error),
                        child: Icon(Icons.inbox, size: 28, color: colors.onSurface),
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('showBadge: true', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  Column(
                    children: [
                      GStackBadge(
                        showBadge: false,
                        badge: _NotificationDot(colors.error),
                        child: Icon(Icons.inbox, size: 28, color: colors.onSurface),
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('showBadge: false', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GOverlayContainer
            const SectionHeader(
              title: 'Overlay Container',
              subtitle: 'GOverlayContainer for image overlays',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Image with Caption',
              subtitle: 'Text overlay on image',
              child: GOverlayContainer(
                borderRadius: GBorderRadius.allMd,
                overlay: Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: const Text(
                      'Image Caption',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 48,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Multiple Overlays',
              subtitle: 'overlays property for multiple elements',
              child: GOverlayContainer(
                borderRadius: GBorderRadius.allMd,
                overlays: [
                  Positioned(
                    top: GSpacing.sm,
                    left: GSpacing.sm,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: GSpacing.sm,
                        vertical: GSpacing.xs3,
                      ),
                      decoration: BoxDecoration(
                        color: colors.error,
                        borderRadius: GBorderRadius.allSm,
                      ),
                      child: const Text(
                        'SALE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: GSpacing.sm,
                    right: GSpacing.sm,
                    child: Container(
                      padding: const EdgeInsets.all(GSpacing.xs),
                      decoration: BoxDecoration(
                        color: colors.surface.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 20,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(GSpacing.sm),
                      color: colors.surface.withValues(alpha: 0.95),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colors.onSurface,
                            ),
                          ),
                          Text(
                            '\$49.99',
                            style: TextStyle(
                              color: colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: colors.surfaceVariant,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 48,
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // GLayeredCard
            const SectionHeader(
              title: 'Layered Card',
              subtitle: 'GLayeredCard for visual depth',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: '2 Layer Stack',
              subtitle: 'layers: 2',
              child: Center(
                child: GLayeredCard(
                  layers: 2,
                  layerOffset: 6,
                  borderRadius: GBorderRadius.allMd,
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(GSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: GBorderRadius.allMd,
                      border: Border.all(color: colors.outline.withValues(alpha: 0.2)),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.credit_card, color: colors.primary, size: 32),
                        const SizedBox(height: GSpacing.sm),
                        Text(
                          'Credit Card',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                        Text(
                          '**** 1234',
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: '3 Layer Stack',
              subtitle: 'layers: 3',
              child: Center(
                child: GLayeredCard(
                  layers: 3,
                  layerOffset: 5,
                  borderRadius: GBorderRadius.allLg,
                  layerColor: colors.primary.withValues(alpha: 0.1),
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.all(GSpacing.lg),
                    decoration: BoxDecoration(
                      color: colors.primaryContainer,
                      borderRadius: GBorderRadius.allLg,
                    ),
                    child: Column(
                      children: [
                        Text(
                          '🎉',
                          style: TextStyle(fontSize: 32),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Examples
            const SectionHeader(
              title: 'Practical Examples',
              subtitle: 'Common stack patterns',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Profile Header',
              subtitle: 'Cover image with avatar',
              child: SizedBox(
                height: 160,
                child: Stack(
                  children: [
                    // Cover image
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [colors.primary, colors.secondary],
                          ),
                          borderRadius: GBorderRadius.allMd,
                        ),
                      ),
                    ),
                    // Avatar
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: colors.surface,
                          shape: BoxShape.circle,
                        ),
                        child: GAvatar(
                          name: 'John Doe',
                          size: GAvatarSize.xl,
                        ),
                      ),
                    ),
                    // Edit button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GIconButton(
                        icon: Icons.edit,
                        variant: GIconButtonVariant.filled,
                        size: GIconButtonSize.sm,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Card Actions',
              subtitle: 'Action buttons on card',
              child: SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(GSpacing.md),
                        decoration: BoxDecoration(
                          color: colors.surface,
                          borderRadius: GBorderRadius.allMd,
                          border: Border.all(
                            color: colors.outline.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: colors.surfaceVariant,
                                borderRadius: GBorderRadius.allSm,
                              ),
                              child: Icon(Icons.image, color: colors.onSurfaceVariant),
                            ),
                            const SizedBox(width: GSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Item Title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: colors.onSurface,
                                    ),
                                  ),
                                  Text(
                                    'Item description goes here',
                                    style: TextStyle(
                                      color: colors.onSurfaceVariant,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GPopupMenu(
                        items: const [
                          GPopupMenuItem(label: 'Edit', icon: Icons.edit, value: 'edit'),
                          GPopupMenuItem(label: 'Delete', icon: Icons.delete, value: 'delete'),
                        ],
                        child: Icon(Icons.more_vert, color: colors.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}


class _NotificationDot extends StatelessWidget {
  const _NotificationDot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge(this.count, this.colors);
  final String count;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: colors.error,
        borderRadius: GBorderRadius.allFull,
        border: Border.all(color: colors.surface, width: 2),
      ),
      child: Text(
        count,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot(this.color);
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: theme.colors.surface, width: 2),
      ),
    );
  }
}

