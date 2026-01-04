import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SliderComponentsScreen extends StatefulWidget {
  const SliderComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<SliderComponentsScreen> createState() => _SliderComponentsScreenState();
}

class _SliderComponentsScreenState extends State<SliderComponentsScreen> {
  double _sliderValue = 0.5;
  RangeValues _rangeValues = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Slider',
      subtitle: 'GSlider, GRangeSlider components',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Slider
            const SectionHeader(
              title: 'Basic Slider',
              subtitle: 'Continuous value selection',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Interactive Slider',
              subtitle: 'Drag to change value',
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
            const SizedBox(height: GSpacing.xl),

            // Slider Sizes
            const SectionHeader(
              title: 'Slider Sizes',
              subtitle: 'GSliderSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Small',
              subtitle: 'GSliderSize.sm',
              child: GSlider(
                value: 0.7,
                onChanged: (v) {},
                size: GSliderSize.sm,
                label: 'Small Slider',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Medium',
              subtitle: 'GSliderSize.md (default)',
              child: GSlider(
                value: 0.7,
                onChanged: (v) {},
                size: GSliderSize.md,
                label: 'Medium Slider',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Large',
              subtitle: 'GSliderSize.lg',
              child: GSlider(
                value: 0.7,
                onChanged: (v) {},
                size: GSliderSize.lg,
                label: 'Large Slider',
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Discrete Slider
            const SectionHeader(
              title: 'Discrete Slider',
              subtitle: 'With divisions for stepped values',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Steps of 10',
              subtitle: 'divisions: 10',
              child: GSlider(
                value: 40,
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (v) {},
                label: 'Discrete Value',
                showValue: true,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Steps of 5',
              subtitle: 'divisions: 20',
              child: GSlider(
                value: 25,
                min: 0,
                max: 100,
                divisions: 20,
                onChanged: (v) {},
                label: 'Fine Steps',
                showValue: true,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Range Slider
            const SectionHeader(
              title: 'Range Slider',
              subtitle: 'GRangeSlider for value ranges',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Price Range',
              subtitle: 'Select min and max values',
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
              title: 'Range with Divisions',
              subtitle: 'Discrete range selection',
              child: GRangeSlider(
                values: const RangeValues(20, 60),
                min: 0,
                max: 100,
                divisions: 10,
                onChanged: (v) {},
                label: 'Age Range',
                showValues: true,
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
              title: 'Success Color',
              subtitle: 'activeColor: colors.success',
              child: GSlider(
                value: 0.6,
                onChanged: (v) {},
                activeColor: colors.success,
                label: 'Success Slider',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Warning Color',
              subtitle: 'activeColor: colors.warning',
              child: GSlider(
                value: 0.4,
                onChanged: (v) {},
                activeColor: colors.warning,
                label: 'Warning Slider',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Error Color',
              subtitle: 'activeColor: colors.error',
              child: GSlider(
                value: 0.8,
                onChanged: (v) {},
                activeColor: colors.error,
                label: 'Error Slider',
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
              title: 'Disabled Slider',
              subtitle: 'Non-interactive',
              child: GSlider(
                value: 0.5,
                onChanged: (v) {},
                isDisabled: true,
                label: 'Disabled',
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Disabled Range Slider',
              subtitle: 'Non-interactive range',
              child: GRangeSlider(
                values: const RangeValues(30, 70),
                min: 0,
                max: 100,
                onChanged: (v) {},
                isDisabled: true,
                label: 'Disabled Range',
                showValues: true,
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

