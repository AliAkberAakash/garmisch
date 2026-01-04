import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class DialogComponentsScreen extends StatelessWidget {
  const DialogComponentsScreen({
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
      title: 'Dialog',
      subtitle: 'GDialog component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alert Dialog
            const SectionHeader(
              title: 'Alert Dialog',
              subtitle: 'Simple confirmation dialogs',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Alert',
              subtitle: 'GDialog.alert()',
              child: GButton(
                label: 'Show Alert Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.alert(
                    context,
                    title: 'Alert',
                    message: 'This is an alert dialog with a simple message.',
                    buttonLabel: 'OK',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Confirm Dialog
            const SectionHeader(
              title: 'Confirm Dialog',
              subtitle: 'Dialogs with confirm/cancel actions',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Confirmation Dialog',
              subtitle: 'GDialog.confirm()',
              child: GButton(
                label: 'Show Confirm Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () async {
                  final result = await GDialog.confirm(
                    context,
                    title: 'Confirm Action',
                    message: 'Are you sure you want to proceed with this action?',
                    confirmLabel: 'Confirm',
                    cancelLabel: 'Cancel',
                  );
                  if (context.mounted) {
                    GToastController.info(
                      context,
                      result ? 'Confirmed!' : 'Cancelled',
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Destructive Confirm',
              subtitle: 'GDialog.confirmDestructive()',
              child: GButton(
                label: 'Show Delete Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () async {
                  final result = await GDialog.confirmDestructive(
                    context,
                    title: 'Delete Item',
                    message: 'Are you sure you want to delete this item? This action cannot be undone.',
                    confirmLabel: 'Delete',
                    cancelLabel: 'Cancel',
                  );
                  if (context.mounted) {
                    GToastController.info(
                      context,
                      result ? 'Item deleted' : 'Cancelled',
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dialog with Icon
            const SectionHeader(
              title: 'Dialog with Icon',
              subtitle: 'Add visual context with icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Success Icon',
              subtitle: 'icon and iconColor properties',
              child: GButton(
                label: 'Show Success Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    icon: Icons.check_circle_outline,
                    iconColor: colors.success,
                    title: 'Success!',
                    message: 'Your changes have been saved successfully.',
                    confirmLabel: 'Great',
                    onConfirm: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Icon',
              subtitle: 'Warning dialog with icon',
              child: GButton(
                label: 'Show Warning Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    icon: Icons.warning_amber_outlined,
                    iconColor: colors.warning,
                    title: 'Warning',
                    message: 'This action may have unintended consequences. Please proceed with caution.',
                    confirmLabel: 'Proceed',
                    cancelLabel: 'Cancel',
                    onConfirm: () => Navigator.of(context).pop(),
                    onCancel: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Info Icon',
              subtitle: 'Informational dialog',
              child: GButton(
                label: 'Show Info Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    icon: Icons.info_outline,
                    iconColor: colors.info,
                    title: 'Did you know?',
                    message: 'You can customize dialogs with icons, custom content, and multiple actions.',
                    confirmLabel: 'Got it',
                    onConfirm: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Content Dialog
            const SectionHeader(
              title: 'Custom Content',
              subtitle: 'Dialog with custom widgets',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Form Dialog',
              subtitle: 'content property for custom widgets',
              child: GButton(
                label: 'Show Form Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    title: 'Enter Details',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const GTextField(
                          label: 'Name',
                          hint: 'Enter your name',
                        ),
                        const SizedBox(height: GSpacing.md),
                        const GTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                        ),
                      ],
                    ),
                    confirmLabel: 'Submit',
                    cancelLabel: 'Cancel',
                    onConfirm: () {
                      Navigator.of(context).pop();
                      GToastController.success(context, 'Form submitted!');
                    },
                    onCancel: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Rich Content Dialog',
              subtitle: 'Complex content layout',
              child: GButton(
                label: 'Show Rich Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    title: 'Upgrade to Pro',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(GSpacing.md),
                          decoration: BoxDecoration(
                            color: colors.primaryContainer,
                            borderRadius: GBorderRadius.allMd,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.workspace_premium, color: colors.primary, size: 40),
                              const SizedBox(width: GSpacing.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Pro Plan',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: colors.onPrimaryContainer,
                                      ),
                                    ),
                                    Text(
                                      '\$9.99/month',
                                      style: TextStyle(color: colors.onPrimaryContainer),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: GSpacing.md),
                        _FeatureItem(icon: Icons.check, text: 'Unlimited projects', colors: colors),
                        _FeatureItem(icon: Icons.check, text: 'Priority support', colors: colors),
                        _FeatureItem(icon: Icons.check, text: 'Advanced analytics', colors: colors),
                      ],
                    ),
                    confirmLabel: 'Upgrade Now',
                    cancelLabel: 'Maybe Later',
                    onConfirm: () {
                      Navigator.of(context).pop();
                      GToastController.success(context, 'Welcome to Pro!');
                    },
                    onCancel: () => Navigator.of(context).pop(),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dialog Sizes
            const SectionHeader(
              title: 'Dialog Sizes',
              subtitle: 'Different dialog widths',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Options',
              subtitle: 'Small, Medium, Large',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Small',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GDialog.show(
                        context,
                        title: 'Small Dialog',
                        size: GDialogSize.sm,
                        message: 'This is a small dialog.',
                      );
                    },
                  ),
                  GButton(
                    label: 'Medium',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GDialog.show(
                        context,
                        title: 'Medium Dialog',
                        size: GDialogSize.md,
                        message: 'This is a medium dialog (default size).',
                      );
                    },
                  ),
                  GButton(
                    label: 'Large',
                    variant: GButtonVariant.outlined,
                    size: GButtonSize.sm,
                    onPressed: () {
                      GDialog.show(
                        context,
                        title: 'Large Dialog',
                        size: GDialogSize.lg,
                        message: 'This is a large dialog with more space for content.',
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

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.icon,
    required this.text,
    required this.colors,
  });

  final IconData icon;
  final String text;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: 18, color: colors.success),
          const SizedBox(width: GSpacing.sm),
          Text(text, style: TextStyle(color: colors.onSurface)),
        ],
      ),
    );
  }
}

