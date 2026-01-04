import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ToastComponentsScreen extends StatelessWidget {
  const ToastComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {

    return ShowcaseScaffold(
      title: 'Toast',
      subtitle: 'GToastController notifications',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toast Types
            const SectionHeader(
              title: 'Toast Types',
              subtitle: 'Different semantic toast types',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Info Toast',
              subtitle: 'GToastController.info()',
              child: GButton(
                label: 'Show Info Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.info(
                    context,
                    'This is an informational message',
                    title: 'Information',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Success Toast',
              subtitle: 'GToastController.success()',
              child: GButton(
                label: 'Show Success Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.success(
                    context,
                    'Action completed successfully!',
                    title: 'Success',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Toast',
              subtitle: 'GToastController.warning()',
              child: GButton(
                label: 'Show Warning Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.warning(
                    context,
                    'Please review your input before continuing',
                    title: 'Warning',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error Toast',
              subtitle: 'GToastController.error()',
              child: GButton(
                label: 'Show Error Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.error(
                    context,
                    'Something went wrong. Please try again.',
                    title: 'Error',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Neutral Toast
            const SectionHeader(
              title: 'Neutral Toast',
              subtitle: 'Non-semantic toast message',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Neutral Type',
              subtitle: 'GToastType.neutral',
              child: GButton(
                label: 'Show Neutral Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'This is a neutral notification',
                    type: GToastType.neutral,
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Toast Positions
            const SectionHeader(
              title: 'Toast Positions',
              subtitle: 'Top or bottom of screen',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Top Position',
              subtitle: 'GToastPosition.top',
              child: GButton(
                label: 'Show Top Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'This toast appears at the top',
                    position: GToastPosition.top,
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Bottom Position',
              subtitle: 'GToastPosition.bottom (default)',
              child: GButton(
                label: 'Show Bottom Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'This toast appears at the bottom',
                    position: GToastPosition.bottom,
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Toast with Action
            const SectionHeader(
              title: 'Toast with Action',
              subtitle: 'Interactive toast with action button',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Undo Action',
              subtitle: 'actionLabel and onAction',
              child: GButton(
                label: 'Show Toast with Undo',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'Item deleted',
                    type: GToastType.neutral,
                    actionLabel: 'Undo',
                    onAction: () {
                      GToastController.success(context, 'Action undone');
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'View Details Action',
              subtitle: 'Navigate or show more info',
              child: GButton(
                label: 'Show Toast with Details',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.info(
                    context,
                    'New message received',
                    title: 'Notification',
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Toast Duration
            const SectionHeader(
              title: 'Toast Duration',
              subtitle: 'How long toast stays visible',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Short Duration',
              subtitle: '2 seconds',
              child: GButton(
                label: 'Show Short Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'This disappears quickly',
                    duration: const Duration(seconds: 2),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Long Duration',
              subtitle: '5 seconds',
              child: GButton(
                label: 'Show Long Toast',
                variant: GButtonVariant.outlined,
                onPressed: () {
                  GToastController.show(
                    context,
                    message: 'This stays visible longer',
                    duration: const Duration(seconds: 5),
                  );
                },
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Multiple Toasts
            const SectionHeader(
              title: 'Multiple Toasts',
              subtitle: 'Queue multiple notifications',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Show Multiple',
              subtitle: 'Tap to queue 3 toasts',
              child: GButton(
                label: 'Show 3 Toasts',
                onPressed: () {
                  GToastController.info(context, 'First notification');
                  Future.delayed(const Duration(milliseconds: 300), () {
                    GToastController.success(context, 'Second notification');
                  });
                  Future.delayed(const Duration(milliseconds: 600), () {
                    GToastController.warning(context, 'Third notification');
                  });
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

