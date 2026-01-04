import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class BannerComponentsScreen extends StatefulWidget {
  const BannerComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<BannerComponentsScreen> createState() => _BannerComponentsScreenState();
}

class _BannerComponentsScreenState extends State<BannerComponentsScreen> {
  bool _showInfoBanner = true;
  bool _showSuccessBanner = true;
  bool _showWarningBanner = true;
  bool _showErrorBanner = true;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Banner',
      subtitle: 'GBanner component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Variants
            const SectionHeader(
              title: 'Banner Variants',
              subtitle: 'Different semantic banner types',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Info Banner',
              subtitle: 'GBannerVariant.info',
              child: const GBanner(
                message: 'This is an informational banner message.',
                variant: GBannerVariant.info,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Success Banner',
              subtitle: 'GBannerVariant.success',
              child: const GBanner(
                message: 'Your profile has been updated successfully.',
                variant: GBannerVariant.success,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Banner',
              subtitle: 'GBannerVariant.warning',
              child: const GBanner(
                message: 'Your subscription will expire in 3 days.',
                variant: GBannerVariant.warning,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error Banner',
              subtitle: 'GBannerVariant.error',
              child: const GBanner(
                message: 'There was an error processing your request.',
                variant: GBannerVariant.error,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dismissible Banners
            const SectionHeader(
              title: 'Dismissible Banners',
              subtitle: 'Banners with dismiss button',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Dismissible Info',
              subtitle: 'isDismissible: true',
              child: Column(
                children: [
                  if (_showInfoBanner)
                    GBanner(
                      message: 'This info banner can be dismissed.',
                      variant: GBannerVariant.info,
                      isDismissible: true,
                      onDismiss: () => setState(() => _showInfoBanner = false),
                    )
                  else
                    GButton(
                      label: 'Show Info Banner',
                      size: GButtonSize.sm,
                      onPressed: () => setState(() => _showInfoBanner = true),
                    ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dismissible Success',
              subtitle: 'isDismissible: true',
              child: Column(
                children: [
                  if (_showSuccessBanner)
                    GBanner(
                      message: 'Operation completed! Dismiss when ready.',
                      variant: GBannerVariant.success,
                      isDismissible: true,
                      onDismiss: () => setState(() => _showSuccessBanner = false),
                    )
                  else
                    GButton(
                      label: 'Show Success Banner',
                      size: GButtonSize.sm,
                      onPressed: () => setState(() => _showSuccessBanner = true),
                    ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dismissible Warning',
              subtitle: 'isDismissible: true',
              child: Column(
                children: [
                  if (_showWarningBanner)
                    GBanner(
                      message: 'Please review this warning before dismissing.',
                      variant: GBannerVariant.warning,
                      isDismissible: true,
                      onDismiss: () => setState(() => _showWarningBanner = false),
                    )
                  else
                    GButton(
                      label: 'Show Warning Banner',
                      size: GButtonSize.sm,
                      onPressed: () => setState(() => _showWarningBanner = true),
                    ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dismissible Error',
              subtitle: 'isDismissible: true',
              child: Column(
                children: [
                  if (_showErrorBanner)
                    GBanner(
                      message: 'Error occurred. Dismiss to acknowledge.',
                      variant: GBannerVariant.error,
                      isDismissible: true,
                      onDismiss: () => setState(() => _showErrorBanner = false),
                    )
                  else
                    GButton(
                      label: 'Show Error Banner',
                      size: GButtonSize.sm,
                      onPressed: () => setState(() => _showErrorBanner = true),
                    ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Banner with Action
            const SectionHeader(
              title: 'Banner with Action',
              subtitle: 'Banners with action buttons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Update Available',
              subtitle: 'Action button to update',
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
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Verify Email',
              subtitle: 'Action button to verify',
              child: GBanner(
                message: 'Please verify your email address to continue.',
                variant: GBannerVariant.warning,
                action: GButton(
                  label: 'Verify Now',
                  size: GButtonSize.sm,
                  variant: GButtonVariant.outlined,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Payment Failed',
              subtitle: 'Action button to retry',
              child: GBanner(
                message: 'Payment failed. Please update your payment method.',
                variant: GBannerVariant.error,
                action: GButton(
                  label: 'Update Payment',
                  size: GButtonSize.sm,
                  variant: GButtonVariant.outlined,
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Backup Complete',
              subtitle: 'Action button to view',
              child: GBanner(
                message: 'Your data has been backed up successfully.',
                variant: GBannerVariant.success,
                action: GButton(
                  label: 'View Details',
                  size: GButtonSize.sm,
                  variant: GButtonVariant.ghost,
                  onPressed: () {},
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

