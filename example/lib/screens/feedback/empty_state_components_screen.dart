import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class EmptyStateComponentsScreen extends StatelessWidget {
  const EmptyStateComponentsScreen({
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
      title: 'Empty State',
      subtitle: 'GEmptyState component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Empty State
            const SectionHeader(
              title: 'Basic Empty State',
              subtitle: 'With icon, title, and description',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Standard Empty State',
              subtitle: 'Icon, title, description, and action',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GEmptyState(
                  icon: Icons.inbox_outlined,
                  title: 'No messages',
                  description: 'You don\'t have any messages yet. Start a conversation!',
                  action: GButton(
                    label: 'Compose Message',
                    icon: Icons.add,
                    size: GButtonSize.sm,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Compact Empty State
            const SectionHeader(
              title: 'Compact Empty State',
              subtitle: 'Smaller version for limited space',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Compact Mode',
              subtitle: 'compact: true',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: const GEmptyState(
                  icon: Icons.search_off,
                  title: 'No results found',
                  description: 'Try adjusting your search terms.',
                  compact: true,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Various Use Cases
            const SectionHeader(
              title: 'Common Use Cases',
              subtitle: 'Different empty state scenarios',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'No Internet Connection',
              subtitle: 'Network error state',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GEmptyState(
                  icon: Icons.cloud_off_outlined,
                  title: 'No internet connection',
                  description: 'Please check your connection and try again.',
                  compact: true,
                  action: GButton(
                    label: 'Retry',
                    icon: Icons.refresh,
                    size: GButtonSize.sm,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Empty Folder',
              subtitle: 'No content state',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: const GEmptyState(
                  icon: Icons.folder_open_outlined,
                  title: 'Folder is empty',
                  compact: true,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'No Notifications',
              subtitle: 'Notification empty state',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: const GEmptyState(
                  icon: Icons.notifications_off_outlined,
                  title: 'No notifications',
                  description: 'You\'re all caught up!',
                  compact: true,
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'No Favorites',
              subtitle: 'Empty favorites list',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GEmptyState(
                  icon: Icons.favorite_outline,
                  title: 'No favorites yet',
                  description: 'Items you mark as favorite will appear here.',
                  compact: true,
                  action: GButton(
                    label: 'Browse Items',
                    size: GButtonSize.sm,
                    variant: GButtonVariant.outlined,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Cart Empty',
              subtitle: 'Shopping cart empty state',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GEmptyState(
                  icon: Icons.shopping_cart_outlined,
                  title: 'Your cart is empty',
                  description: 'Looks like you haven\'t added any items to your cart yet.',
                  action: GButton(
                    label: 'Start Shopping',
                    icon: Icons.shopping_bag,
                    size: GButtonSize.sm,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error State',
              subtitle: 'Something went wrong',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surfaceVariant.withValues(alpha: 0.3),
                  borderRadius: GBorderRadius.allMd,
                ),
                child: GEmptyState(
                  icon: Icons.error_outline,
                  title: 'Something went wrong',
                  description: 'We couldn\'t load this content. Please try again.',
                  compact: true,
                  action: GButton(
                    label: 'Try Again',
                    icon: Icons.refresh,
                    size: GButtonSize.sm,
                    onPressed: () {},
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
}

