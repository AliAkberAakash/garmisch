import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class CheckboxComponentsScreen extends StatefulWidget {
  const CheckboxComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<CheckboxComponentsScreen> createState() => _CheckboxComponentsScreenState();
}

class _CheckboxComponentsScreenState extends State<CheckboxComponentsScreen> {
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  bool _checkbox3 = false;
  bool _checkAll = false;
  List<bool> _items = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Checkbox',
      subtitle: 'GCheckbox component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Checkbox
            const SectionHeader(
              title: 'Basic Checkbox',
              subtitle: 'Toggle checked state',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Checkbox States',
              subtitle: 'value, onChanged props',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GCheckbox(
                    value: _checkbox1,
                    onChanged: (v) => setState(() => _checkbox1 = v),
                    label: 'Unchecked checkbox',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: _checkbox2,
                    onChanged: (v) => setState(() => _checkbox2 = v),
                    label: 'Checked checkbox',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: _checkbox3,
                    onChanged: (v) => setState(() => _checkbox3 = v),
                    label: 'Another checkbox',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Checkbox Sizes
            const SectionHeader(
              title: 'Checkbox Sizes',
              subtitle: 'GCheckboxSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Size Options',
              subtitle: 'sm, md, lg',
              child: Row(
                children: [
                  GCheckbox(
                    value: true,
                    size: GCheckboxSize.sm,
                    onChanged: (v) {},
                    label: 'Small',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GCheckbox(
                    value: true,
                    size: GCheckboxSize.md,
                    onChanged: (v) {},
                    label: 'Medium',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GCheckbox(
                    value: true,
                    size: GCheckboxSize.lg,
                    onChanged: (v) {},
                    label: 'Large',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Indeterminate State
            const SectionHeader(
              title: 'Indeterminate State',
              subtitle: 'isIndeterminate: true',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Select All Pattern',
              subtitle: 'Parent checkbox with children',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GCheckbox(
                    value: _checkAll,
                    isIndeterminate: _items.any((e) => e) && !_items.every((e) => e),
                    onChanged: (v) => setState(() {
                      _checkAll = v;
                      _items = List.filled(3, v);
                    }),
                    label: 'Select All',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: GSpacing.lg),
                    child: Column(
                      children: [
                        GCheckbox(
                          value: _items[0],
                          onChanged: (v) => setState(() {
                            _items[0] = v;
                            _checkAll = _items.every((e) => e);
                          }),
                          label: 'Item 1',
                        ),
                        GCheckbox(
                          value: _items[1],
                          onChanged: (v) => setState(() {
                            _items[1] = v;
                            _checkAll = _items.every((e) => e);
                          }),
                          label: 'Item 2',
                        ),
                        GCheckbox(
                          value: _items[2],
                          onChanged: (v) => setState(() {
                            _items[2] = v;
                            _checkAll = _items.every((e) => e);
                          }),
                          label: 'Item 3',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Standalone Indeterminate',
              subtitle: 'Mixed state indicator',
              child: GCheckbox(
                value: false,
                isIndeterminate: true,
                onChanged: (v) {},
                label: 'Indeterminate checkbox',
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
              title: 'Disabled Checkboxes',
              subtitle: 'Non-interactive states',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GCheckbox(
                    value: false,
                    isDisabled: true,
                    label: 'Disabled unchecked',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: true,
                    isDisabled: true,
                    label: 'Disabled checked',
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
              title: 'Colored Checkboxes',
              subtitle: 'Different active colors',
              child: Row(
                children: [
                  GCheckbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.success,
                    label: 'Success',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GCheckbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.warning,
                    label: 'Warning',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GCheckbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: colors.error,
                    label: 'Error',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example
            const SectionHeader(
              title: 'Practical Example',
              subtitle: 'Terms and conditions',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Form Agreement',
              subtitle: 'Common checkbox pattern',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GCheckbox(
                    value: false,
                    onChanged: (v) {},
                    label: 'I agree to the Terms of Service',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: false,
                    onChanged: (v) {},
                    label: 'I agree to the Privacy Policy',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: true,
                    onChanged: (v) {},
                    label: 'Subscribe to newsletter (optional)',
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

