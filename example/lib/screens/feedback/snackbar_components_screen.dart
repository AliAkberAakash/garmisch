import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SnackbarComponentsScreen extends StatelessWidget {
  const SnackbarComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Snackbar',
      subtitle: 'GSnackbar static methods',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Snackbar Types
            const SectionHeader(
              title: 'Snackbar Types',
              subtitle: 'Different semantic snackbar types',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Neutral Snackbar',
              subtitle: 'GSnackbar.show()',
              child: GButton(
                label: 'Show Neutral Snackbar',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.show(
                    context,
                    message: 'This is a neutral snackbar message.',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Info Snackbar',
              subtitle: 'GSnackbar.info()',
              child: GButton(
                label: 'Show Info Snackbar',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.info(
                    context,
                    message: 'Here\'s some helpful information.',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Success Snackbar',
              subtitle: 'GSnackbar.success()',
              child: GButton(
                label: 'Show Success Snackbar',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.success(
                    context,
                    message: 'Operation completed successfully!',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Snackbar',
              subtitle: 'GSnackbar.warning()',
              child: GButton(
                label: 'Show Warning Snackbar',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.warning(
                    context,
                    message: 'Please review your input before continuing.',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error Snackbar',
              subtitle: 'GSnackbar.error()',
              child: GButton(
                label: 'Show Error Snackbar',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.error(
                    context,
                    message: 'Something went wrong. Please try again.',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Snackbar with Action
            const SectionHeader(
              title: 'Snackbar with Action',
              subtitle: 'Interactive snackbar with action button',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Undo Action',
              subtitle: 'actionLabel and onAction',
              child: GButton(
                label: 'Delete Item (with Undo)',
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
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'View Details Action',
              subtitle: 'Navigate to details',
              child: GButton(
                label: 'Show with View Action',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.info(
                    context,
                    message: 'New message received.',
                    actionLabel: 'View',
                    onAction: () {
                      GToastController.info(context, 'Opening message...');
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Retry Action',
              subtitle: 'Retry failed operation',
              child: GButton(
                label: 'Show with Retry Action',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GSnackbar.error(
                    context,
                    message: 'Failed to save changes.',
                    actionLabel: 'Retry',
                    onAction: () {
                      GToastController.info(context, 'Retrying...');
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // All Types Demo
            const SectionHeader(
              title: 'Quick Demo',
              subtitle: 'Show all snackbar types',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'All Types',
              subtitle: 'Tap buttons to show different types',
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
                        message: 'Neutral snackbar message.',
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
                        message: 'Info snackbar message.',
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
                        message: 'Success snackbar message.',
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
                        message: 'Warning snackbar message.',
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
                        message: 'Error snackbar message.',
                      );
                    },
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

