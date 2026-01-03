import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SliderDropdownScreen extends StatefulWidget {
  const SliderDropdownScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<SliderDropdownScreen> createState() => _SliderDropdownScreenState();
}

class _SliderDropdownScreenState extends State<SliderDropdownScreen> {
  double _sliderValue = 0.5;
  RangeValues _rangeValues = const RangeValues(20, 80);
  String? _selectedCountry;
  String? _selectedSize;

  final _countries = ['United States', 'Canada', 'United Kingdom', 'Australia', 'Germany'];
  final _sizes = ['Small', 'Medium', 'Large', 'Extra Large'];

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Slider & Dropdown',
      subtitle: 'GSlider, GDropdown components',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slider
            const SectionHeader(
              title: 'Slider',
              subtitle: 'GSlider component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Slider',
              subtitle: 'Continuous value selection',
              child: Column(
                children: [
                  GSlider(
                    value: _sliderValue,
                    onChanged: (v) => setState(() => _sliderValue = v),
                    label: 'Volume',
                    showValue: true,
                  ),
                  const SizedBox(height: GSpacing.lg),
                  GSlider(
                    value: _sliderValue * 100,
                    min: 0,
                    max: 100,
                    onChanged: (v) => setState(() => _sliderValue = v / 100),
                    label: 'Brightness',
                    showValue: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Slider Sizes',
              subtitle: 'GSliderSize enum',
              child: Column(
                children: [
                  GSlider(
                    value: 0.7,
                    onChanged: (v) {},
                    size: GSliderSize.sm,
                    label: 'Small',
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSlider(
                    value: 0.7,
                    onChanged: (v) {},
                    size: GSliderSize.md,
                    label: 'Medium',
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSlider(
                    value: 0.7,
                    onChanged: (v) {},
                    size: GSliderSize.lg,
                    label: 'Large',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Discrete Slider',
              subtitle: 'With divisions',
              child: GSlider(
                value: 40,
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (v) {},
                label: 'Steps of 10',
                showValue: true,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Range Slider',
              subtitle: 'GRangeSlider for value ranges',
              child: GRangeSlider(
                values: _rangeValues,
                min: 0,
                max: 100,
                onChanged: (v) => setState(() => _rangeValues = v),
                label: 'Price Range',
                showValues: true,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Colors & Disabled',
              subtitle: 'activeColor, isDisabled props',
              child: Column(
                children: [
                  GSlider(
                    value: 0.6,
                    onChanged: (v) {},
                    activeColor: colors.success,
                    label: 'Custom Color',
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSlider(
                    value: 0.5,
                    onChanged: (v) {},
                    isDisabled: true,
                    label: 'Disabled',
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Dropdown
            const SectionHeader(
              title: 'Dropdown',
              subtitle: 'GDropdown component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Dropdown',
              subtitle: 'Single selection from list',
              child: Column(
                children: [
                  GDropdown<String>(
                    label: 'Country',
                    hint: 'Select a country',
                    value: _selectedCountry,
                    items: _countries,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) => setState(() => _selectedCountry = v),
                  ),
                  const SizedBox(height: GSpacing.md),
                  GDropdown<String>(
                    label: 'Size',
                    hint: 'Select a size',
                    value: _selectedSize,
                    items: _sizes,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) => setState(() => _selectedSize = v),
                    prefixIcon: Icons.straighten,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dropdown Sizes',
              subtitle: 'GDropdownSize enum',
              child: Column(
                children: [
                  GDropdown<String>(
                    label: 'Small',
                    hint: 'Select...',
                    items: _sizes,
                    size: GDropdownSize.sm,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GDropdown<String>(
                    label: 'Medium',
                    hint: 'Select...',
                    items: _sizes,
                    size: GDropdownSize.md,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GDropdown<String>(
                    label: 'Large',
                    hint: 'Select...',
                    items: _sizes,
                    size: GDropdownSize.lg,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Dropdown States',
              subtitle: 'Required, error, disabled',
              child: Column(
                children: [
                  GDropdown<String>(
                    label: 'Required Field',
                    hint: 'Select...',
                    items: _sizes,
                    isRequired: true,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GDropdown<String>(
                    label: 'With Error',
                    hint: 'Select...',
                    items: _sizes,
                    errorText: 'This field is required',
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GDropdown<String>(
                    label: 'Disabled',
                    hint: 'Cannot select',
                    items: _sizes,
                    isDisabled: true,
                    itemLabelBuilder: (item) => item,
                    onChanged: (v) {},
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

