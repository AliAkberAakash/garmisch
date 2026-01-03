import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AlertToastScreen extends StatelessWidget {
  const AlertToastScreen({
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
      title: 'Alert & Toast',
      subtitle: 'GAlert, GToast components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alert
            const SectionHeader(
              title: 'Alert',
              subtitle: 'GAlert component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Alert Types',
              subtitle: 'GAlertType enum',
              child: Column(
                children: [
                  const GAlert(
                    title: 'Information',
                    message: 'This is an informational alert message.',
                    type: GAlertType.info,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GAlert(
                    title: 'Success',
                    message: 'Your action was completed successfully.',
                    type: GAlertType.success,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GAlert(
                    title: 'Warning',
                    message: 'Please review before proceeding.',
                    type: GAlertType.warning,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GAlert(
                    title: 'Error',
                    message: 'Something went wrong. Please try again.',
                    type: GAlertType.error,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Alert Variants',
              subtitle: 'GAlertVariant enum',
              child: Column(
                children: [
                  const GAlert(
                    message: 'Soft variant (default)',
                    type: GAlertType.info,
                    variant: GAlertVariant.soft,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GAlert(
                    message: 'Solid variant',
                    type: GAlertType.info,
                    variant: GAlertVariant.solid,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  const GAlert(
                    message: 'Outlined variant',
                    type: GAlertType.info,
                    variant: GAlertVariant.outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Alert Features',
              subtitle: 'Dismissible and with action',
              child: Column(
                children: [
                  GAlert(
                    title: 'Dismissible Alert',
                    message: 'You can close this alert.',
                    type: GAlertType.info,
                    onDismiss: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GAlert(
                    title: 'Alert with Action',
                    message: 'Click learn more for details.',
                    type: GAlertType.warning,
                    actionLabel: 'Learn more',
                    onAction: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Toast
            const SectionHeader(
              title: 'Toast',
              subtitle: 'GToastController for notifications',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Toast Types',
              subtitle: 'Tap buttons to show toasts',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Info Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.info(
                        context,
                        'This is an info message',
                        title: 'Information',
                      );
                    },
                  ),
                  GButton(
                    label: 'Success Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.success(
                        context,
                        'Action completed successfully!',
                      );
                    },
                  ),
                  GButton(
                    label: 'Warning Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.warning(
                        context,
                        'Please check your input',
                      );
                    },
                  ),
                  GButton(
                    label: 'Error Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.error(
                        context,
                        'Something went wrong',
                        title: 'Error',
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Toast with Action',
              subtitle: 'Custom action button',
              child: GButton(
                label: 'Show Toast with Action',
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'File deleted',
                    type: GToastType.neutral,
                    actionLabel: 'Undo',
                    onAction: () {},
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Toast Positions',
              subtitle: 'Top or bottom of screen',
              child: Row(
                children: [
                  GButton(
                    label: 'Top Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.show(
                        context,
                        message: 'Toast at top',
                        position: GToastPosition.top,
                      );
                    },
                  ),
                  const SizedBox(width: GSpacing.sm),
                  GButton(
                    label: 'Bottom Toast',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GToastController.show(
                        context,
                        message: 'Toast at bottom',
                        position: GToastPosition.bottom,
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

