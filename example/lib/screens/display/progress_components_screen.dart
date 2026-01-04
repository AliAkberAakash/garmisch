import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ProgressComponentsScreen extends StatefulWidget {
  const ProgressComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ProgressComponentsScreen> createState() => _ProgressComponentsScreenState();
}

class _ProgressComponentsScreenState extends State<ProgressComponentsScreen> {
  double _progressValue = 0.65;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Progress',
      subtitle: 'Progress indicators',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar
            const SectionHeader(
              title: 'Progress Bar',
              subtitle: 'Linear progress indicator',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Progress Bar',
              subtitle: 'GProgressBar with value',
              child: Column(
                children: [
                  GProgressBar(value: _progressValue),
                  const SizedBox(height: GSpacing.lg),
                  Slider(
                    value: _progressValue,
                    onChanged: (v) => setState(() => _progressValue = v),
                  ),
                  Text(
                    'Value: ${(_progressValue * 100).toInt()}%',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'With Label',
              subtitle: 'showLabel: true',
              child: Column(
                children: [
                  GProgressBar(
                    value: _progressValue,
                    showLabel: true,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.35,
                    showLabel: true,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 1.0,
                    showLabel: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Colors',
              subtitle: 'color property',
              child: Column(
                children: [
                  GProgressBar(
                    value: 0.4,
                    color: colors.success,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.6,
                    color: colors.warning,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.8,
                    color: colors.error,
                  ),
                  const SizedBox(height: GSpacing.md),
                  GProgressBar(
                    value: 0.5,
                    color: colors.secondary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Sizes',
              subtitle: 'GProgressSize enum',
              child: Column(
                children: [
                  const Text('Small (sm)'),
                  const SizedBox(height: GSpacing.xs),
                  GProgressBar(
                    value: 0.5,
                    size: GProgressSize.sm,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const Text('Medium (md) - Default'),
                  const SizedBox(height: GSpacing.xs),
                  GProgressBar(
                    value: 0.5,
                    size: GProgressSize.md,
                  ),
                  const SizedBox(height: GSpacing.md),
                  const Text('Large (lg)'),
                  const SizedBox(height: GSpacing.xs),
                  GProgressBar(
                    value: 0.5,
                    size: GProgressSize.lg,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Indeterminate Progress
            const SectionHeader(
              title: 'Indeterminate Progress',
              subtitle: 'Loading state without known progress',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Indeterminate Bar',
              subtitle: 'GProgressBar.indeterminate()',
              child: Column(
                children: const [
                  GProgressBar.indeterminate(),
                  SizedBox(height: GSpacing.md),
                  GProgressBar.indeterminate(size: GProgressSize.sm),
                  SizedBox(height: GSpacing.md),
                  GProgressBar.indeterminate(size: GProgressSize.lg),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Progress Circle
            const SectionHeader(
              title: 'Progress Circle',
              subtitle: 'Circular progress indicator',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Circle',
              subtitle: 'GProgressCircle with value',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GProgressCircle(
                    value: _progressValue,
                  ),
                  GProgressCircle(
                    value: _progressValue,
                    showLabel: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Size & Stroke',
              subtitle: 'size and strokeWidth properties',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GProgressCircle(
                    value: 0.5,
                    size: 40,
                    strokeWidth: 3,
                    showLabel: true,
                  ),
                  GProgressCircle(
                    value: 0.65,
                    size: 60,
                    strokeWidth: 5,
                    showLabel: true,
                  ),
                  GProgressCircle(
                    value: 0.8,
                    size: 80,
                    strokeWidth: 8,
                    showLabel: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Colors',
              subtitle: 'color property',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GProgressCircle(
                    value: 0.6,
                    color: colors.success,
                    size: 50,
                    showLabel: true,
                  ),
                  GProgressCircle(
                    value: 0.75,
                    color: colors.warning,
                    size: 50,
                    showLabel: true,
                  ),
                  GProgressCircle(
                    value: 0.4,
                    color: colors.error,
                    size: 50,
                    showLabel: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Indeterminate Circle',
              subtitle: 'GProgressCircle.indeterminate()',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  GProgressCircle.indeterminate(size: 40),
                  GProgressCircle.indeterminate(size: 50),
                  GProgressCircle.indeterminate(size: 60),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Spinner
            const SectionHeader(
              title: 'Spinner',
              subtitle: 'Simple loading spinner',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GSpinner',
              subtitle: 'Simple spinning indicator',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const GSpinner(size: 16),
                  const GSpinner(size: 24),
                  const GSpinner(size: 32),
                  const GSpinner(size: 48),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Colors',
              subtitle: 'color property',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GSpinner(size: 32, color: colors.primary),
                  GSpinner(size: 32, color: colors.secondary),
                  GSpinner(size: 32, color: colors.success),
                  GSpinner(size: 32, color: colors.warning),
                  GSpinner(size: 32, color: colors.error),
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

