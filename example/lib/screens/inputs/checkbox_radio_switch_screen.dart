import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class CheckboxRadioSwitchScreen extends StatefulWidget {
  const CheckboxRadioSwitchScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<CheckboxRadioSwitchScreen> createState() => _CheckboxRadioSwitchScreenState();
}

class _CheckboxRadioSwitchScreenState extends State<CheckboxRadioSwitchScreen> {
  // Checkbox states
  bool _checkbox1 = false;
  bool _checkbox2 = true;
  bool _checkbox3 = false;

  // Radio state
  String? _selectedRadio = 'option1';

  // Switch states
  bool _switch1 = false;
  bool _switch2 = true;
  bool _switch3 = false;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Selection Controls',
      subtitle: 'Checkbox, Radio, Switch',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            const SectionHeader(
              title: 'Checkbox',
              subtitle: 'GCheckbox component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Checkbox States',
              subtitle: 'value, onChanged, isIndeterminate props',
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
                    value: false,
                    isIndeterminate: true,
                    onChanged: (v) {},
                    label: 'Indeterminate checkbox',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GCheckbox(
                    value: _checkbox3,
                    isDisabled: true,
                    label: 'Disabled checkbox',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Checkbox Sizes',
              subtitle: 'GCheckboxSize enum',
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

            // Radio
            const SectionHeader(
              title: 'Radio',
              subtitle: 'GRadio component',
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
                    groupValue: _selectedRadio,
                    onChanged: (v) => setState(() => _selectedRadio = v),
                    label: 'Option 1',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'option2',
                    groupValue: _selectedRadio,
                    onChanged: (v) => setState(() => _selectedRadio = v),
                    label: 'Option 2',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'option3',
                    groupValue: _selectedRadio,
                    onChanged: (v) => setState(() => _selectedRadio = v),
                    label: 'Option 3',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GRadio<String>(
                    value: 'disabled',
                    groupValue: _selectedRadio,
                    isDisabled: true,
                    label: 'Disabled option',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Radio Sizes',
              subtitle: 'GRadioSize enum',
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

            // Switch
            const SectionHeader(
              title: 'Switch',
              subtitle: 'GSwitch component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Switch States',
              subtitle: 'value, onChanged props',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSwitch(
                    value: _switch1,
                    onChanged: (v) => setState(() => _switch1 = v),
                    label: 'Off switch',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: _switch2,
                    onChanged: (v) => setState(() => _switch2 = v),
                    label: 'On switch',
                  ),
                  const SizedBox(height: GSpacing.sm),
                  GSwitch(
                    value: _switch3,
                    isDisabled: true,
                    label: 'Disabled switch',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Switch Sizes',
              subtitle: 'GSwitchSize enum',
              child: Row(
                children: [
                  GSwitch(
                    value: true,
                    size: GSwitchSize.sm,
                    onChanged: (v) {},
                    label: 'Small',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GSwitch(
                    value: true,
                    size: GSwitchSize.md,
                    onChanged: (v) {},
                    label: 'Medium',
                  ),
                  const SizedBox(width: GSpacing.lg),
                  GSwitch(
                    value: true,
                    size: GSwitchSize.lg,
                    onChanged: (v) {},
                    label: 'Large',
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

