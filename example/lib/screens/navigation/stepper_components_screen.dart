import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class StepperComponentsScreen extends StatefulWidget {
  const StepperComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<StepperComponentsScreen> createState() =>
      _StepperComponentsScreenState();
}

class _StepperComponentsScreenState extends State<StepperComponentsScreen> {
  int _horizontalStep = 1;
  int _verticalStep = 1;
  int _iconStep = 1;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Stepper',
      subtitle: 'Multi-step progress component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Stepper
            const SectionHeader(
              title: 'Horizontal Stepper',
              subtitle: 'Standard horizontal step indicator',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Horizontal Steps',
              subtitle: 'Default orientation',
              child: Column(
                children: [
                  GStepper(
                    currentStep: _horizontalStep,
                    steps: const [
                      GStepData(title: 'Account'),
                      GStepData(title: 'Details'),
                      GStepData(title: 'Review'),
                      GStepData(title: 'Complete'),
                    ],
                    onStepTapped: (step) => setState(() => _horizontalStep = step),
                  ),
                  const SizedBox(height: GSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GButton(
                        label: 'Previous',
                        variant: GButtonVariant.outlined,
                        size: GButtonSize.sm,
                        isDisabled: _horizontalStep == 0,
                        onPressed: () => setState(
                          () => _horizontalStep = (_horizontalStep - 1).clamp(0, 3),
                        ),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Next',
                        size: GButtonSize.sm,
                        isDisabled: _horizontalStep == 3,
                        onPressed: () => setState(
                          () => _horizontalStep = (_horizontalStep + 1).clamp(0, 3),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Step: ${_horizontalStep + 1} of 4',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Vertical Stepper
            const SectionHeader(
              title: 'Vertical Stepper',
              subtitle: 'Vertical step indicator with subtitles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Vertical Steps',
              subtitle: 'orientation: Axis.vertical',
              child: Column(
                children: [
                  GStepper(
                    currentStep: _verticalStep,
                    orientation: Axis.vertical,
                    steps: const [
                      GStepData(
                        title: 'Create Account',
                        subtitle: 'Enter your email and password',
                      ),
                      GStepData(
                        title: 'Personal Details',
                        subtitle: 'Fill in your information',
                      ),
                      GStepData(
                        title: 'Review',
                        subtitle: 'Review your information',
                      ),
                      GStepData(
                        title: 'Complete',
                        subtitle: 'You\'re all set!',
                      ),
                    ],
                    onStepTapped: (step) => setState(() => _verticalStep = step),
                  ),
                  const SizedBox(height: GSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GButton(
                        label: 'Previous',
                        variant: GButtonVariant.outlined,
                        size: GButtonSize.sm,
                        isDisabled: _verticalStep == 0,
                        onPressed: () => setState(
                          () => _verticalStep = (_verticalStep - 1).clamp(0, 3),
                        ),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Next',
                        size: GButtonSize.sm,
                        isDisabled: _verticalStep == 3,
                        onPressed: () => setState(
                          () => _verticalStep = (_verticalStep + 1).clamp(0, 3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Stepper with Icons
            const SectionHeader(
              title: 'With Custom Icons',
              subtitle: 'Steps with custom icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Custom Icons',
              subtitle: 'Using icon property in GStepData',
              child: Column(
                children: [
                  GStepper(
                    currentStep: _iconStep,
                    steps: const [
                      GStepData(
                        title: 'Cart',
                        icon: Icons.shopping_cart,
                      ),
                      GStepData(
                        title: 'Shipping',
                        icon: Icons.local_shipping,
                      ),
                      GStepData(
                        title: 'Payment',
                        icon: Icons.payment,
                      ),
                      GStepData(
                        title: 'Done',
                        icon: Icons.check_circle,
                      ),
                    ],
                    onStepTapped: (step) => setState(() => _iconStep = step),
                  ),
                  const SizedBox(height: GSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GButton(
                        label: 'Previous',
                        variant: GButtonVariant.outlined,
                        size: GButtonSize.sm,
                        isDisabled: _iconStep == 0,
                        onPressed: () => setState(
                          () => _iconStep = (_iconStep - 1).clamp(0, 3),
                        ),
                      ),
                      const SizedBox(width: GSpacing.sm),
                      GButton(
                        label: 'Next',
                        size: GButtonSize.sm,
                        isDisabled: _iconStep == 3,
                        onPressed: () => setState(
                          () => _iconStep = (_iconStep + 1).clamp(0, 3),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Step States
            const SectionHeader(
              title: 'Step States',
              subtitle: 'Different step state examples',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'All Completed',
              subtitle: 'currentStep = 3 (last step)',
              child: GStepper(
                currentStep: 3,
                steps: const [
                  GStepData(title: 'Step 1'),
                  GStepData(title: 'Step 2'),
                  GStepData(title: 'Step 3'),
                  GStepData(title: 'Done'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'First Step',
              subtitle: 'currentStep = 0',
              child: GStepper(
                currentStep: 0,
                steps: const [
                  GStepData(title: 'Start'),
                  GStepData(title: 'Middle'),
                  GStepData(title: 'End'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Two Steps',
              subtitle: 'Simple two-step process',
              child: GStepper(
                currentStep: 0,
                steps: const [
                  GStepData(title: 'Setup'),
                  GStepData(title: 'Finish'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Vertical with Icons
            const SectionHeader(
              title: 'Vertical with Icons',
              subtitle: 'Vertical stepper with custom icons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Checkout Flow',
              subtitle: 'E-commerce checkout example',
              child: GStepper(
                currentStep: 1,
                orientation: Axis.vertical,
                steps: const [
                  GStepData(
                    title: 'Select Items',
                    subtitle: 'Choose products from catalog',
                    icon: Icons.shopping_bag,
                  ),
                  GStepData(
                    title: 'Add Address',
                    subtitle: 'Enter shipping details',
                    icon: Icons.location_on,
                  ),
                  GStepData(
                    title: 'Make Payment',
                    subtitle: 'Complete your purchase',
                    icon: Icons.credit_card,
                  ),
                  GStepData(
                    title: 'Order Placed',
                    subtitle: 'Track your delivery',
                    icon: Icons.celebration,
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

