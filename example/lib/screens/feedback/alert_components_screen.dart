import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AlertComponentsScreen extends StatelessWidget {
  const AlertComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {

    return ShowcaseScaffold(
      title: 'Alert',
      subtitle: 'GAlert component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alert Types
            const SectionHeader(
              title: 'Alert Types',
              subtitle: 'Different semantic alert types',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Info Alert',
              subtitle: 'GAlertType.info',
              child: const GAlert(
                title: 'Information',
                message: 'This is an informational alert message.',
                type: GAlertType.info,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Success Alert',
              subtitle: 'GAlertType.success',
              child: const GAlert(
                title: 'Success',
                message: 'Your action was completed successfully.',
                type: GAlertType.success,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Alert',
              subtitle: 'GAlertType.warning',
              child: const GAlert(
                title: 'Warning',
                message: 'Please review before proceeding.',
                type: GAlertType.warning,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error Alert',
              subtitle: 'GAlertType.error',
              child: const GAlert(
                title: 'Error',
                message: 'Something went wrong. Please try again.',
                type: GAlertType.error,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Alert Variants
            const SectionHeader(
              title: 'Alert Variants',
              subtitle: 'Different visual styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Soft Variant',
              subtitle: 'GAlertVariant.soft (default)',
              child: Column(
                children: const [
                  GAlert(
                    message: 'Info soft variant',
                    type: GAlertType.info,
                    variant: GAlertVariant.soft,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Success soft variant',
                    type: GAlertType.success,
                    variant: GAlertVariant.soft,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Warning soft variant',
                    type: GAlertType.warning,
                    variant: GAlertVariant.soft,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Error soft variant',
                    type: GAlertType.error,
                    variant: GAlertVariant.soft,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Solid Variant',
              subtitle: 'GAlertVariant.solid',
              child: Column(
                children: const [
                  GAlert(
                    message: 'Info solid variant',
                    type: GAlertType.info,
                    variant: GAlertVariant.solid,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Success solid variant',
                    type: GAlertType.success,
                    variant: GAlertVariant.solid,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Warning solid variant',
                    type: GAlertType.warning,
                    variant: GAlertVariant.solid,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Error solid variant',
                    type: GAlertType.error,
                    variant: GAlertVariant.solid,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Outlined Variant',
              subtitle: 'GAlertVariant.outlined',
              child: Column(
                children: const [
                  GAlert(
                    message: 'Info outlined variant',
                    type: GAlertType.info,
                    variant: GAlertVariant.outlined,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Success outlined variant',
                    type: GAlertType.success,
                    variant: GAlertVariant.outlined,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Warning outlined variant',
                    type: GAlertType.warning,
                    variant: GAlertVariant.outlined,
                  ),
                  SizedBox(height: GSpacing.sm),
                  GAlert(
                    message: 'Error outlined variant',
                    type: GAlertType.error,
                    variant: GAlertVariant.outlined,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dismissible Alert
            const SectionHeader(
              title: 'Dismissible Alert',
              subtitle: 'Alert with close button',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Dismiss Button',
              subtitle: 'onDismiss callback',
              child: Column(
                children: [
                  GAlert(
                    title: 'Dismissible Info',
                    message: 'You can close this alert.',
                    type: GAlertType.info,
                    onDismiss: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GAlert(
                    title: 'Dismissible Success',
                    message: 'This success message can be dismissed.',
                    type: GAlertType.success,
                    onDismiss: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GAlert(
                    title: 'Dismissible Warning',
                    message: 'Tap the close button to dismiss.',
                    type: GAlertType.warning,
                    onDismiss: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Alert with Action
            const SectionHeader(
              title: 'Alert with Action',
              subtitle: 'Alert with action button',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Action Button',
              subtitle: 'actionLabel and onAction',
              child: Column(
                children: [
                  GAlert(
                    title: 'Learn More',
                    message: 'Click the action for more details.',
                    type: GAlertType.info,
                    actionLabel: 'Learn more',
                    onAction: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GAlert(
                    title: 'Upgrade Available',
                    message: 'A new version is available.',
                    type: GAlertType.warning,
                    actionLabel: 'Upgrade now',
                    onAction: () {},
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GAlert(
                    title: 'Connection Lost',
                    message: 'Please check your internet connection.',
                    type: GAlertType.error,
                    actionLabel: 'Retry',
                    onAction: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Alert with Action and Dismiss
            const SectionHeader(
              title: 'Full Featured Alert',
              subtitle: 'Action + Dismiss combined',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'All Features',
              subtitle: 'Title, message, action, and dismiss',
              child: GAlert(
                title: 'Account Verification',
                message: 'Please verify your email address to continue using all features.',
                type: GAlertType.warning,
                actionLabel: 'Verify now',
                onAction: () {},
                onDismiss: () {},
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

