import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class AnimationsScreen extends StatefulWidget {
  const AnimationsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<AnimationsScreen> createState() => _AnimationsScreenState();
}

class _AnimationsScreenState extends State<AnimationsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return ShowcaseScaffold(
      title: 'Animations',
      subtitle: 'Durations and easing curves',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Animation tokens ensure consistent motion across your app. '
              'Use appropriate durations and easing curves for different interactions.',
              style: textTheme.bodyLarge.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Durations',
              subtitle: 'GDurations.* tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Duration Scale',
              subtitle: 'From instant to slowest',
              child: Column(
                children: [
                  _DurationRow('instant', GDurations.instant, 'No animation', colors, textTheme),
                  _DurationRow('fastest', GDurations.fastest, 'Micro-interactions', colors, textTheme),
                  _DurationRow('faster', GDurations.faster, 'Quick feedback', colors, textTheme),
                  _DurationRow('fast', GDurations.fast, 'Button states', colors, textTheme),
                  _DurationRow('normal', GDurations.normal, 'Default', colors, textTheme),
                  _DurationRow('slow', GDurations.slow, 'Page transitions', colors, textTheme),
                  _DurationRow('slower', GDurations.slower, 'Complex animations', colors, textTheme),
                  _DurationRow('slowest', GDurations.slowest, 'Elaborate', colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Semantic Durations',
              subtitle: 'Purpose-specific timings',
              child: Column(
                children: [
                  _DurationRow('tooltip', GDurations.tooltip, '200ms', colors, textTheme),
                  _DurationRow('snackbar', GDurations.snackbar, '4s display', colors, textTheme),
                  _DurationRow('ripple', GDurations.ripple, '300ms', colors, textTheme),
                  _DurationRow('pageTransition', GDurations.pageTransition, '300ms', colors, textTheme),
                  _DurationRow('modal', GDurations.modal, '250ms', colors, textTheme),
                  _DurationRow('bottomSheet', GDurations.bottomSheet, '250ms', colors, textTheme),
                  _DurationRow('drawer', GDurations.drawer, '250ms', colors, textTheme),
                  _DurationRow('debounce', GDurations.debounce, 'Input delay', colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Easing Curves',
              subtitle: 'GEasing.* tokens',
            ),
            const SizedBox(height: GSpacing.sm),

            ShowcaseCard(
              title: 'Standard Curves',
              subtitle: 'Common animation curves',
              child: Column(
                children: [
                  _CurveDemo('linear', GEasing.linear, colors, textTheme),
                  _CurveDemo('easeIn', GEasing.easeIn, colors, textTheme),
                  _CurveDemo('easeOut', GEasing.easeOut, colors, textTheme),
                  _CurveDemo('easeInOut', GEasing.easeInOut, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Cubic Curves',
              subtitle: 'Strong acceleration/deceleration',
              child: Column(
                children: [
                  _CurveDemo('easeInCubic', GEasing.easeInCubic, colors, textTheme),
                  _CurveDemo('easeOutCubic', GEasing.easeOutCubic, colors, textTheme),
                  _CurveDemo('easeInOutCubic', GEasing.easeInOutCubic, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),

            ShowcaseCard(
              title: 'Special Curves',
              subtitle: 'Bounce and overshoot effects',
              child: Column(
                children: [
                  _CurveDemo('easeOutBack', GEasing.easeOutBack, colors, textTheme),
                  _CurveDemo('spring', GEasing.spring, colors, textTheme),
                  _CurveDemo('bounceOut', GEasing.bounceOut, colors, textTheme),
                  _CurveDemo('elasticOut', GEasing.elasticOut, colors, textTheme),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            const SectionHeader(
              title: 'Interactive Demo',
              subtitle: 'Tap to see animations',
            ),
            const SizedBox(height: GSpacing.sm),

            _InteractiveDemo(colors: colors, textTheme: textTheme),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _DurationRow extends StatelessWidget {
  const _DurationRow(
    this.name,
    this.duration,
    this.description,
    this.colors,
    this.textTheme,
  );

  final String name;
  final Duration duration;
  final String description;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          SizedBox(
            width: 60,
            child: Text(
              '${duration.inMilliseconds}ms',
              style: textTheme.bodySmall.copyWith(
                color: colors.primary,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: textTheme.bodySmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurveDemo extends StatefulWidget {
  const _CurveDemo(this.name, this.curve, this.colors, this.textTheme);

  final String name;
  final Curve curve;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  State<_CurveDemo> createState() => _CurveDemoState();
}

class _CurveDemoState extends State<_CurveDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: GDurations.slow,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs),
      child: GestureDetector(
        onTap: _runAnimation,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.sm,
            vertical: GSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: widget.colors.surfaceVariant,
            borderRadius: GBorderRadius.allSm,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  widget.name,
                  style: widget.textTheme.bodySmall.copyWith(
                    color: widget.colors.onSurface,
                    fontFamily: GTypography.fontFamilyMono,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 24,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Align(
                        alignment: Alignment(
                          -1 + (_animation.value * 2),
                          0,
                        ),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: widget.colors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Icon(
                Icons.touch_app,
                size: 16,
                color: widget.colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InteractiveDemo extends StatefulWidget {
  const _InteractiveDemo({
    required this.colors,
    required this.textTheme,
  });

  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  State<_InteractiveDemo> createState() => _InteractiveDemoState();
}

class _InteractiveDemoState extends State<_InteractiveDemo> {
  bool _isExpanded = false;
  Duration _selectedDuration = GDurations.normal;
  Curve _selectedCurve = GEasing.easeOutCubic;

  final List<(String, Duration)> _durations = [
    ('fast', GDurations.fast),
    ('normal', GDurations.normal),
    ('slow', GDurations.slow),
    ('slower', GDurations.slower),
  ];

  final List<(String, Curve)> _curves = [
    ('linear', GEasing.linear),
    ('easeOut', GEasing.easeOut),
    ('easeOutCubic', GEasing.easeOutCubic),
    ('easeOutBack', GEasing.easeOutBack),
    ('spring', GEasing.spring),
  ];

  @override
  Widget build(BuildContext context) {
    return ShowcaseCard(
      title: 'Try Different Combinations',
      subtitle: 'Select duration and curve, then tap the box',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Duration',
            style: widget.textTheme.labelMedium.copyWith(
              color: widget.colors.onSurface,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Wrap(
            spacing: GSpacing.xs,
            children: _durations.map((d) {
              final isSelected = d.$2 == _selectedDuration;
              return GestureDetector(
                onTap: () => setState(() => _selectedDuration = d.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GSpacing.sm,
                    vertical: GSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? widget.colors.primary
                        : widget.colors.surfaceVariant,
                    borderRadius: GBorderRadius.allSm,
                  ),
                  child: Text(
                    d.$1,
                    style: widget.textTheme.labelSmall.copyWith(
                      color: isSelected
                          ? widget.colors.onPrimary
                          : widget.colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: GSpacing.md),
          Text(
            'Curve',
            style: widget.textTheme.labelMedium.copyWith(
              color: widget.colors.onSurface,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Wrap(
            spacing: GSpacing.xs,
            runSpacing: GSpacing.xs,
            children: _curves.map((c) {
              final isSelected = c.$2 == _selectedCurve;
              return GestureDetector(
                onTap: () => setState(() => _selectedCurve = c.$2),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: GSpacing.sm,
                    vertical: GSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? widget.colors.primary
                        : widget.colors.surfaceVariant,
                    borderRadius: GBorderRadius.allSm,
                  ),
                  child: Text(
                    c.$1,
                    style: widget.textTheme.labelSmall.copyWith(
                      color: isSelected
                          ? widget.colors.onPrimary
                          : widget.colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: GSpacing.lg),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: AnimatedContainer(
              duration: _selectedDuration,
              curve: _selectedCurve,
              width: _isExpanded ? double.infinity : 100,
              height: _isExpanded ? 120 : 60,
              decoration: BoxDecoration(
                color: widget.colors.primary,
                borderRadius: _isExpanded
                    ? GBorderRadius.allXl
                    : GBorderRadius.allMd,
              ),
              child: Center(
                child: Text(
                  _isExpanded ? 'Tap to collapse' : 'Tap me!',
                  style: widget.textTheme.labelLarge.copyWith(
                    color: widget.colors.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

