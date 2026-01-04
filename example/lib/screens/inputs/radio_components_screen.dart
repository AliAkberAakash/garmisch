import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class RadioComponentsScreen extends StatefulWidget {
  const RadioComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<RadioComponentsScreen> createState() => _RadioComponentsScreenState();
}

class _RadioComponentsScreenState extends State<RadioComponentsScreen> {
  String? _selectedOption = 'option1';
  String? _selectedPlan = 'basic';
  String? _selectedPayment;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Radio',
      subtitle: 'GRadio component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Radio Group
            const SectionHeader(
              title: 'Basic Radio Group',
              subtitle: 'Single selection from options',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Radio Group',
              subtitle: 'value, groupValue, onChanged props',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GRadio<String>(
                    value: 'option1',
                    groupValue: _selectedOption,
                    onChanged: (v) => setState(() => _selectedOption = v),
                    label: 'Option 1',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'option2',
                    groupValue: _selectedOption,
                    onChanged: (v) => setState(() => _selectedOption = v),
                    label: 'Option 2',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'option3',
                    groupValue: _selectedOption,
                    onChanged: (v) => setState(() => _selectedOption = v),
                    label: 'Option 3',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Radio Sizes
            const SectionHeader(
              title: 'Radio Sizes',
              subtitle: 'GRadioSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Options',
              subtitle: 'sm, md, lg',
              child: Row(
                children: [
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    size: GRadioSize.sm,
                    onChanged: (v) {},
                    label: 'Small',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    size: GRadioSize.md,
                    onChanged: (v) {},
                    label: 'Medium',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    size: GRadioSize.lg,
                    onChanged: (v) {},
                    label: 'Large',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Disabled State
            const SectionHeader(
              title: 'Disabled State',
              subtitle: 'isDisabled: true',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Disabled Radios',
              subtitle: 'Non-interactive states',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GRadio<String>(
                    value: 'enabled',
                    groupValue: 'enabled',
                    onChanged: (v) {},
                    label: 'Enabled and selected',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'disabled_selected',
                    groupValue: 'disabled_selected',
                    isDisabled: true,
                    label: 'Disabled and selected',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'disabled_unselected',
                    groupValue: null,
                    isDisabled: true,
                    label: 'Disabled and unselected',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'activeColor property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Colored Radios',
              subtitle: 'Different active colors',
              child: Row(
                children: [
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    onChanged: (v) {},
                    activeColor: colors.success,
                    label: 'Success',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    onChanged: (v) {},
                    activeColor: colors.warning,
                    label: 'Warning',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GRadio<int>(
                    value: 1,
                    groupValue: 1,
                    onChanged: (v) {},
                    activeColor: colors.error,
                    label: 'Error',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example - Plan Selection
            const SectionHeader(
              title: 'Practical Example',
              subtitle: 'Plan selection',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Subscription Plans',
              subtitle: 'Common radio pattern',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PlanOption(
                    value: 'basic',
                    groupValue: _selectedPlan,
                    onChanged: (v) => setState(() => _selectedPlan = v),
                    title: 'Basic Plan',
                    description: 'Perfect for individuals',
                    price: '\$9.99/mo',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _PlanOption(
                    value: 'pro',
                    groupValue: _selectedPlan,
                    onChanged: (v) => setState(() => _selectedPlan = v),
                    title: 'Pro Plan',
                    description: 'Great for small teams',
                    price: '\$29.99/mo',
                    colors: colors,
                  ),
                  const SizedBox(height: GSpacing.sm),
                  _PlanOption(
                    value: 'enterprise',
                    groupValue: _selectedPlan,
                    onChanged: (v) => setState(() => _selectedPlan = v),
                    title: 'Enterprise Plan',
                    description: 'For large organizations',
                    price: '\$99.99/mo',
                    colors: colors,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Payment Method',
              subtitle: 'Horizontal radio group',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: GSpacing.md,
                    runSpacing: GSpacing.sm,
                    children: [
                      GRadio<String>(
                        value: 'card',
                        groupValue: _selectedPayment,
                        onChanged: (v) => setState(() => _selectedPayment = v),
                        label: 'Credit Card',
                      ),
                      GRadio<String>(
                        value: 'paypal',
                        groupValue: _selectedPayment,
                        onChanged: (v) => setState(() => _selectedPayment = v),
                        label: 'PayPal',
                      ),
                      GRadio<String>(
                        value: 'bank',
                        groupValue: _selectedPayment,
                        onChanged: (v) => setState(() => _selectedPayment = v),
                        label: 'Bank Transfer',
                      ),
                    ],
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

class _PlanOption extends StatelessWidget {
  const _PlanOption({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.description,
    required this.price,
    required this.colors,
  });

  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;
  final String title;
  final String description;
  final String price;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.all(GSpacing.md),
        decoration: BoxDecoration(
          color: isSelected ? colors.primaryContainer : colors.surface,
          borderRadius: GBorderRadius.allMd,
          border: Border.all(
            color: isSelected ? colors.primary : colors.outline.withValues(alpha: 0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            GRadio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            const SizedBox(width: GSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? colors.onPrimaryContainer : colors.onSurface,
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? colors.onPrimaryContainer : colors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

