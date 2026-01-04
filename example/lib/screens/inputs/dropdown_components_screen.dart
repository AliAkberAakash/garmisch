import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class DropdownComponentsScreen extends StatefulWidget {
  const DropdownComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<DropdownComponentsScreen> createState() => _DropdownComponentsScreenState();
}

class _DropdownComponentsScreenState extends State<DropdownComponentsScreen> {
  String? _selectedCountry;
  String? _selectedSize;
  String? _selectedColor;

  final _countries = ['United States', 'Canada', 'United Kingdom', 'Australia', 'Germany', 'France', 'Japan'];
  final _sizes = ['Small', 'Medium', 'Large', 'Extra Large'];
  final _colors = ['Red', 'Green', 'Blue', 'Yellow', 'Purple', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Dropdown',
      subtitle: 'GDropdown component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Dropdown
            const SectionHeader(
              title: 'Basic Dropdown',
              subtitle: 'Single selection from list',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Simple Dropdown',
              subtitle: 'Select from options',
              child: GDropdown<String>(
                label: 'Country',
                hint: 'Select a country',
                value: _selectedCountry,
                items: _countries,
                itemLabelBuilder: (item) => item,
                onChanged: (v) => setState(() => _selectedCountry = v),
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'With Prefix Icon',
              subtitle: 'prefixIcon property',
              child: GDropdown<String>(
                label: 'Size',
                hint: 'Select a size',
                value: _selectedSize,
                items: _sizes,
                itemLabelBuilder: (item) => item,
                onChanged: (v) => setState(() => _selectedSize = v),
                prefixIcon: Icons.straighten,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Another Example',
              subtitle: 'Color selection',
              child: GDropdown<String>(
                label: 'Favorite Color',
                hint: 'Choose a color',
                value: _selectedColor,
                items: _colors,
                itemLabelBuilder: (item) => item,
                onChanged: (v) => setState(() => _selectedColor = v),
                prefixIcon: Icons.palette,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dropdown Sizes
            const SectionHeader(
              title: 'Dropdown Sizes',
              subtitle: 'GDropdownSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Small',
              subtitle: 'GDropdownSize.sm',
              child: GDropdown<String>(
                label: 'Small Dropdown',
                hint: 'Select...',
                items: _sizes,
                size: GDropdownSize.sm,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Medium',
              subtitle: 'GDropdownSize.md (default)',
              child: GDropdown<String>(
                label: 'Medium Dropdown',
                hint: 'Select...',
                items: _sizes,
                size: GDropdownSize.md,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Large',
              subtitle: 'GDropdownSize.lg',
              child: GDropdown<String>(
                label: 'Large Dropdown',
                hint: 'Select...',
                items: _sizes,
                size: GDropdownSize.lg,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Required Field
            const SectionHeader(
              title: 'Required Field',
              subtitle: 'isRequired: true',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Required Dropdown',
              subtitle: 'Shows required indicator',
              child: GDropdown<String>(
                label: 'Required Field',
                hint: 'This field is required',
                items: _sizes,
                isRequired: true,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Error State
            const SectionHeader(
              title: 'Error State',
              subtitle: 'errorText property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Error',
              subtitle: 'Shows error message',
              child: GDropdown<String>(
                label: 'Invalid Selection',
                hint: 'Select...',
                items: _sizes,
                errorText: 'Please select a valid option',
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Required with Error',
              subtitle: 'Combined states',
              child: GDropdown<String>(
                label: 'Required Field',
                hint: 'Select...',
                items: _countries,
                isRequired: true,
                errorText: 'This field is required',
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
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
              title: 'Disabled Dropdown',
              subtitle: 'Non-interactive',
              child: GDropdown<String>(
                label: 'Disabled',
                hint: 'Cannot select',
                items: _sizes,
                isDisabled: true,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Disabled with Value',
              subtitle: 'Shows selected value but disabled',
              child: GDropdown<String>(
                label: 'Read Only',
                hint: 'Select...',
                value: 'Medium',
                items: _sizes,
                isDisabled: true,
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Helper Text
            const SectionHeader(
              title: 'Helper Text',
              subtitle: 'helperText property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Helper',
              subtitle: 'Additional guidance',
              child: GDropdown<String>(
                label: 'Country',
                hint: 'Select your country',
                items: _countries,
                helperText: 'We use this to personalize your experience',
                itemLabelBuilder: (item) => item,
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

