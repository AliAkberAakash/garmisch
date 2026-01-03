import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class CardDialogScreen extends StatelessWidget {
  const CardDialogScreen({
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
    final textTheme = theme.textTheme;

    return ShowcaseScaffold(
      title: 'Card & Dialog',
      subtitle: 'GCard, GDialog components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card
            const SectionHeader(
              title: 'Card',
              subtitle: 'GCard component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Card Variants',
              subtitle: 'GCardVariant enum',
              child: Column(
                children: [
                  GCard(
                    variant: GCardVariant.elevated,
                    child: Text(
                      'Elevated Card - Has shadow',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GCard(
                    variant: GCardVariant.filled,
                    child: Text(
                      'Filled Card - Has background',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                    ),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GCard(
                    variant: GCardVariant.outlined,
                    child: Text(
                      'Outlined Card - Has border',
                      style: textTheme.bodyMedium.copyWith(color: colors.onSurface),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Interactive Cards',
              subtitle: 'onTap prop for clickable cards',
              child: Column(
                children: [
                  GCard(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(GSpacing.sm),
                          decoration: BoxDecoration(
                            color: colors.primary.withValues(alpha: 0.1),
                            borderRadius: GBorderRadius.allMd,
                          ),
                          child: Icon(Icons.star, color: colors.primary),
                        ),
                        const SizedBox(width: GSpacing.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Clickable Card',
                                style: textTheme.titleSmall.copyWith(
                                  color: colors.onSurface,
                                ),
                              ),
                              Text(
                                'Tap to see hover effect',
                                style: textTheme.bodySmall.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Card with Sections',
              subtitle: 'GCardSection for header/body/footer',
              child: GCardSection(
                showDividers: true,
                header: Row(
                  children: [
                    Icon(Icons.credit_card, color: colors.primary),
                    const SizedBox(width: GSpacing.sm),
                    Text(
                      'Card Title',
                      style: textTheme.titleMedium.copyWith(color: colors.onSurface),
                    ),
                  ],
                ),
                body: Text(
                  'This is the card body content. It can contain any widget you want. '
                  'The card automatically handles the layout for you.',
                  style: textTheme.bodyMedium.copyWith(color: colors.onSurfaceVariant),
                ),
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GButton(
                      label: 'Cancel',
                      variant: GButtonVariant.ghost,
                      size: GButtonSize.sm,
                      onPressed: () {},
                    ),
                    const SizedBox(width: GSpacing.xs),
                    GButton(
                      label: 'Save',
                      size: GButtonSize.sm,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dialog
            const SectionHeader(
              title: 'Dialog',
              subtitle: 'GDialog component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Dialog Types',
              subtitle: 'Tap buttons to open dialogs',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GButton(
                    label: 'Alert Dialog',
                    variant: GButtonVariant.outlined,
                    onPressed: () {
                      GDialog.alert(
                        context,
                        title: 'Alert',
                        message: 'This is an alert dialog with a single action button.',
                      );
                    },
                  ),
                  GButton(
                    label: 'Confirm Dialog',
                    variant: GButtonVariant.outlined,
                    onPressed: () async {
                      final result = await GDialog.confirm(
                        context,
                        title: 'Confirm Action',
                        message: 'Are you sure you want to proceed with this action?',
                      );
                      if (context.mounted && result) {
                        GToastController.success(context, 'Confirmed!');
                      }
                    },
                  ),
                  GButton(
                    label: 'Destructive Dialog',
                    variant: GButtonVariant.destructive,
                    onPressed: () async {
                      final result = await GDialog.confirmDestructive(
                        context,
                        message: 'This action cannot be undone. Are you sure?',
                      );
                      if (context.mounted && result) {
                        GToastController.error(context, 'Deleted!');
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dialog with Icon',
              subtitle: 'icon prop for visual context',
              child: GButton(
                label: 'Show Dialog with Icon',
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
              title: 'Custom Content Dialog',
              subtitle: 'content prop for custom widgets',
              child: GButton(
                label: 'Show Custom Dialog',
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
                    onConfirm: () => Navigator.of(context).pop(),
                    onCancel: () => Navigator.of(context).pop(),
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

