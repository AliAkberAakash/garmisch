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

            // Custom Dialog
            const SectionHeader(
              title: 'Custom Dialog',
              subtitle: 'Dialog with custom content',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Content',
              subtitle: 'GDialog.show() with content',
              child: GButton(
                label: 'Show Custom Dialog',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GDialog.show(
                    context,
                    title: 'Custom Dialog',
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.celebration,
                          size: 64,
                          color: colors.primary,
                        ),
                        const SizedBox(height: GSpacing.md),
                        Text(
                          'Welcome!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                        const SizedBox(height: GSpacing.sm),
                        Text(
                          'This is a custom dialog with rich content.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: GSpacing.lg),
                        GButton(
                          label: 'Get Started',
                          isFullWidth: true,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Form Dialog',
              subtitle: 'Dialog with form inputs',
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
                        const SizedBox(height: GSpacing.lg),
                        Row(
                          children: [
                            Expanded(
                              child: GButton(
                                label: 'Cancel',
                                variant: GButtonVariant.outlined,
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            const SizedBox(width: GSpacing.sm),
                            Expanded(
                              child: GButton(
                                label: 'Submit',
                                onPressed: () {
                                  Navigator.pop(context);
                                  GToastController.success(context, 'Form submitted!');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

