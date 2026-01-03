import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ChipProgressScreen extends StatefulWidget {
  const ChipProgressScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ChipProgressScreen> createState() => _ChipProgressScreenState();
}

class _ChipProgressScreenState extends State<ChipProgressScreen> {
  Set<String> _selectedChips = {'flutter'};
  double _progressValue = 0.65;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Chip & Progress',
      subtitle: 'GChip, GProgressBar components',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chip
            const SectionHeader(
              title: 'Chip',
              subtitle: 'GChip component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Chip Variants',
              subtitle: 'GChipVariant enum',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Soft',
                    variant: GChipVariant.soft,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Solid',
                    variant: GChipVariant.solid,
                    selected: true,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Outlined',
                    variant: GChipVariant.outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Chip Features',
              subtitle: 'Icons, delete, colors',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'With Icon',
                    leadingIcon: Icons.star,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Deletable',
                    onTap: () {},
                    onDelete: () {},
                  ),
                  GChip(
                    label: 'Custom Color',
                    color: colors.success,
                    onTap: () {},
                  ),
                  const GChip(
                    label: 'Disabled',
                    disabled: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Chip Group',
              subtitle: 'Selectable chip group',
              child: GChipGroup(
                chips: const [
                  GChipData(value: 'flutter', label: 'Flutter', icon: Icons.flutter_dash),
                  GChipData(value: 'dart', label: 'Dart'),
                  GChipData(value: 'react', label: 'React'),
                  GChipData(value: 'vue', label: 'Vue'),
                  GChipData(value: 'angular', label: 'Angular'),
                ],
                selectedValues: _selectedChips,
                onChanged: (values) => setState(() => _selectedChips = values),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Progress
            const SectionHeader(
              title: 'Progress',
              subtitle: 'GProgressBar, GProgressCircle components',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Progress Bar',
              subtitle: 'Linear progress indicator',
              child: Column(
                children: [
                  GProgressBar(value: _progressValue),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: _progressValue,
                    showLabel: true,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.4,
                    color: colors.success,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.8,
                    color: colors.warning,
                    size: GProgressSize.lg,
                  ),
                  const SizedBox(height: GSpacing.md),
                  Slider(
                    value: _progressValue,
                    onChanged: (v) => setState(() => _progressValue = v),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Indeterminate Progress',
              subtitle: 'GProgressBar.indeterminate()',
              child: Column(
                children: const [
                  GProgressBar.indeterminate(),
                  SizedBox(height: GSpacing.md),
                  GProgressBar.indeterminate(size: GProgressSize.sm),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Progress Circle',
              subtitle: 'Circular progress indicator',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GProgressCircle(
                    value: _progressValue,
                    showLabel: true,
                  ),
                  GProgressCircle(
                    value: 0.75,
                    color: colors.success,
                    size: 60,
                    strokeWidth: 6,
                    showLabel: true,
                  ),
                  const GProgressCircle.indeterminate(
                    size: 48,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Spinner',
              subtitle: 'GSpinner component',
              child: Row(
                children: [
                  const GSpinner(size: 16),
                  const SizedBox(width: GSpacing.lg),
                  const GSpinner(size: 24),
                  const SizedBox(width: GSpacing.lg),
                  const GSpinner(size: 32),
                  const SizedBox(width: GSpacing.lg),
                  GSpinner(size: 32, color: colors.success),
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

