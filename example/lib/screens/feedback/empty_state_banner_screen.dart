import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class EmptyStateBannerScreen extends StatefulWidget {
  const EmptyStateBannerScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<EmptyStateBannerScreen> createState() => _EmptyStateBannerScreenState();
}

class _EmptyStateBannerScreenState extends State<EmptyStateBannerScreen> {
  bool _showBanner = true;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Empty State & Banner',
      subtitle: 'GEmptyState, GBanner, GSnackbar',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Empty State
            const SectionHeader(
              title: 'Empty State',
              subtitle: 'GEmptyState component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Empty State',
              subtitle: 'With icon, title, description',
              child: Container(
                height: 280,
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
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Compact Empty State',
              subtitle: 'compact: true',
              child: Container(
                height: 180,
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
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Various Empty States',
              subtitle: 'Different use cases',
              child: Column(
                children: [
                  Container(
                    height: 160,
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant.withValues(alpha: 0.3),
                      borderRadius: GBorderRadius.allMd,
                    ),
                    child: const GEmptyState(
                      icon: Icons.cloud_off_outlined,
                      title: 'No internet connection',
                      description: 'Please check your connection and try again.',
                      compact: true,
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  Container(
                    height: 160,
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
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Banner
            const SectionHeader(
              title: 'Banner',
              subtitle: 'GBanner component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Banner Variants',
              subtitle: 'GBannerVariant enum',
              child: Column(
                children: [
                  if (_showBanner)
                    GBanner(
                      message: 'This is an info banner with a dismiss button.',
                      variant: GBannerVariant.info,
                      isDismissible: true,
                      onDismiss: () => setState(() => _showBanner = false),
                    ),
                  if (!_showBanner)
                    GButton(
                      label: 'Show Banner Again',
                      size: GButtonSize.sm,
                      onPressed: () => setState(() => _showBanner = true),
                    ),
                  const SizedBox(height: GSpacing.sm),
                  const GBanner(
                    message: 'Your profile has been updated successfully.',
                    variant: GBannerVariant.success,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GBanner(
                    message: 'Your subscription will expire in 3 days.',
                    variant: GBannerVariant.warning,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GBanner(
                    message: 'There was an error processing your request.',
                    variant: GBannerVariant.error,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Banner with Action',
              subtitle: 'Custom action button',
              child: GBanner(
                message: 'New version available! Update now for latest features.',
                variant: GBannerVariant.info,
                action: GButton(
                  label: 'Update',
                  size: GButtonSize.sm,
                  variant: GButtonVariant.primary,
                  onPressed: () => GToastController.success(context, 'Updating...'),
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Snackbar
            const SectionHeader(
              title: 'Snackbar',
              subtitle: 'GSnackbar static methods',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Snackbar Types',
              subtitle: 'Tap buttons to show',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Neutral',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GSnackbar.show(
                        context,
                        message: 'This is a neutral snackbar message.',
                      );
                    },
                  ),
                  GButton(
                    label: 'Success',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GSnackbar.success(
                        context,
                        message: 'Operation completed successfully!',
                      );
                    },
                  ),
                  GButton(
                    label: 'Error',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GSnackbar.error(
                        context,
                        message: 'Something went wrong. Please try again.',
                      );
                    },
                  ),
                  GButton(
                    label: 'Warning',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GSnackbar.warning(
                        context,
                        message: 'Please review your input before continuing.',
                      );
                    },
                  ),
                  GButton(
                    label: 'Info',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GSnackbar.info(
                        context,
                        message: 'Here\'s some helpful information.',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Snackbar with Action',
              subtitle: 'actionLabel prop',
              child: GButton(
                label: 'Show with Action',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.show(
                    context,
                    message: 'Item deleted.',
                    actionLabel: 'Undo',
                    onAction: () {
                      GToastController.success(context, 'Item restored!');
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
}

