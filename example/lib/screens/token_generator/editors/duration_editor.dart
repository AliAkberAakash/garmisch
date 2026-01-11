import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class DurationEditor extends StatelessWidget {
  const DurationEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final durationEntries = tokenState.duration.values.entries.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Duration Tokens',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Define animation and transition duration values in milliseconds.',
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.lg),
          Container(
            padding: const EdgeInsets.all(GSpacing.md),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: GBorderRadius.allLg,
              border: Border.all(color: colors.outline.withOpacity(0.2)),
            ),
            child: Column(
              children: durationEntries.map((entry) {
                return _DurationRow(
                  name: entry.key,
                  value: entry.value,
                  onChanged: (value) => tokenState.updateDuration(entry.key, value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _DurationRow extends StatefulWidget {
  const _DurationRow({
    required this.name,
    required this.value,
    required this.onChanged,
  });

  final String name;
  final int value;
  final void Function(int) onChanged;

  @override
  State<_DurationRow> createState() => _DurationRowState();
}

class _DurationRowState extends State<_DurationRow> with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value.toString());
    _animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.value),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(_DurationRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value.toString();
      _animController.duration = Duration(milliseconds: widget.value);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _playAnimation() {
    _animController.reset();
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.sm),
      child: Row(
        children: [
          // Name
          SizedBox(
            width: 80,
            child: Text(
              widget.name,
              style: textTheme.labelLarge.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightMedium,
              ),
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Animation preview
          GestureDetector(
            onTap: _playAnimation,
            child: Container(
              width: 120,
              height: 32,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
                borderRadius: GBorderRadius.allMd,
              ),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Positioned(
                        left: _animation.value * 88,
                        top: 4,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: GBorderRadius.allSm,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: GSpacing.xs),
          // Play button
          IconButton(
            onPressed: _playAnimation,
            icon: Icon(Icons.play_arrow, color: colors.primary, size: 20),
            tooltip: 'Preview animation',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          ),
          const SizedBox(width: GSpacing.md),
          // Slider
          Expanded(
            child: Slider(
              value: widget.value.toDouble().clamp(0, 1000),
              min: 0,
              max: 1000,
              divisions: 100,
              activeColor: colors.primary,
              inactiveColor: colors.primary.withOpacity(0.2),
              onChanged: (value) {
                widget.onChanged(value.toInt());
              },
            ),
          ),
          const SizedBox(width: GSpacing.md),
          // Value input
          SizedBox(
            width: 80,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurface,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: GSpacing.xs,
                  vertical: GSpacing.xs,
                ),
                border: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.outline.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: GBorderRadius.allMd,
                  borderSide: BorderSide(color: colors.primary),
                ),
                suffixText: 'ms',
                suffixStyle: textTheme.labelSmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              onChanged: (value) {
                final parsed = int.tryParse(value);
                if (parsed != null) {
                  widget.onChanged(parsed);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

