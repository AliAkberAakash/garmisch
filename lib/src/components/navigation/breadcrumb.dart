import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// A breadcrumb navigation component.
///
/// ```dart
/// GBreadcrumb(
///   items: [
///     GBreadcrumbItem(label: 'Home', onTap: () {}),
///     GBreadcrumbItem(label: 'Products', onTap: () {}),
///     GBreadcrumbItem(label: 'Category'),
///   ],
/// )
/// ```
class GBreadcrumb extends StatelessWidget {
  const GBreadcrumb({
    super.key,
    required this.items,
    this.separator,
    this.maxItems,
  });

  /// Breadcrumb items
  final List<GBreadcrumbItem> items;

  /// Custom separator widget
  final Widget? separator;

  /// Maximum visible items (shows ellipsis if exceeded)
  final int? maxItems;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final displayItems = maxItems != null && items.length > maxItems!
        ? [
            items.first,
            GBreadcrumbItem(label: '...'),
            ...items.skip(items.length - maxItems! + 1),
          ]
        : items;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < displayItems.length; i++) ...[
            _BreadcrumbItemWidget(
              item: displayItems[i],
              isLast: i == displayItems.length - 1,
              colors: colors,
              textTheme: textTheme,
            ),
            if (i < displayItems.length - 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: GSpacing.xs),
                child: separator ??
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: colors.onSurfaceVariant,
                    ),
              ),
          ],
        ],
      ),
    );
  }
}

/// Breadcrumb item data
class GBreadcrumbItem {
  const GBreadcrumbItem({
    required this.label,
    this.icon,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
}

class _BreadcrumbItemWidget extends StatefulWidget {
  const _BreadcrumbItemWidget({
    required this.item,
    required this.isLast,
    required this.colors,
    required this.textTheme,
  });

  final GBreadcrumbItem item;
  final bool isLast;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  State<_BreadcrumbItemWidget> createState() => _BreadcrumbItemWidgetState();
}

class _BreadcrumbItemWidgetState extends State<_BreadcrumbItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isClickable = widget.item.onTap != null && !widget.isLast;

    return MouseRegion(
      onEnter: isClickable ? (_) => setState(() => _isHovered = true) : null,
      onExit: isClickable ? (_) => setState(() => _isHovered = false) : null,
      cursor: isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: isClickable ? widget.item.onTap : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.item.icon != null) ...[
              Icon(
                widget.item.icon,
                size: 16,
                color: widget.isLast
                    ? widget.colors.onSurface
                    : widget.colors.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              widget.item.label,
              style: widget.textTheme.bodySmall.copyWith(
                color: widget.isLast
                    ? widget.colors.onSurface
                    : widget.colors.onSurfaceVariant,
                fontWeight: widget.isLast
                    ? GTypography.fontWeightMedium
                    : GTypography.fontWeightRegular,
                decoration: _isHovered ? TextDecoration.underline : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A pagination component.
///
/// ```dart
/// GPagination(
///   currentPage: 1,
///   totalPages: 10,
///   onPageChanged: (page) => setState(() => _currentPage = page),
/// )
/// ```
class GPagination extends StatelessWidget {
  const GPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.visiblePages = 5,
    this.showFirstLast = true,
    this.showPrevNext = true,
  });

  /// Current page (1-based)
  final int currentPage;

  /// Total number of pages
  final int totalPages;

  /// Called when page changes
  final ValueChanged<int> onPageChanged;

  /// Number of visible page buttons
  final int visiblePages;

  /// Whether to show first/last buttons
  final bool showFirstLast;

  /// Whether to show prev/next buttons
  final bool showPrevNext;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final pages = _getVisiblePages();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showFirstLast)
          _PaginationButton(
            icon: Icons.first_page,
            isEnabled: currentPage > 1,
            onTap: () => onPageChanged(1),
            colors: colors,
          ),
        if (showPrevNext)
          _PaginationButton(
            icon: Icons.chevron_left,
            isEnabled: currentPage > 1,
            onTap: () => onPageChanged(currentPage - 1),
            colors: colors,
          ),
        const SizedBox(width: GSpacing.xs),
        ...pages.map((page) {
          if (page == -1) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '...',
                style: TextStyle(color: colors.onSurfaceVariant),
              ),
            );
          }
          return _PaginationButton(
            label: '$page',
            isSelected: page == currentPage,
            onTap: () => onPageChanged(page),
            colors: colors,
          );
        }),
        const SizedBox(width: GSpacing.xs),
        if (showPrevNext)
          _PaginationButton(
            icon: Icons.chevron_right,
            isEnabled: currentPage < totalPages,
            onTap: () => onPageChanged(currentPage + 1),
            colors: colors,
          ),
        if (showFirstLast)
          _PaginationButton(
            icon: Icons.last_page,
            isEnabled: currentPage < totalPages,
            onTap: () => onPageChanged(totalPages),
            colors: colors,
          ),
      ],
    );
  }

  List<int> _getVisiblePages() {
    if (totalPages <= visiblePages) {
      return List.generate(totalPages, (i) => i + 1);
    }

    final pages = <int>[];
    final half = visiblePages ~/ 2;

    int start = currentPage - half;
    int end = currentPage + half;

    if (start < 1) {
      start = 1;
      end = visiblePages;
    }
    if (end > totalPages) {
      end = totalPages;
      start = totalPages - visiblePages + 1;
    }

    if (start > 1) {
      pages.add(1);
      if (start > 2) pages.add(-1); // ellipsis
    }

    for (int i = start; i <= end; i++) {
      pages.add(i);
    }

    if (end < totalPages) {
      if (end < totalPages - 1) pages.add(-1); // ellipsis
      pages.add(totalPages);
    }

    return pages;
  }
}

class _PaginationButton extends StatefulWidget {
  const _PaginationButton({
    this.label,
    this.icon,
    this.isSelected = false,
    this.isEnabled = true,
    required this.onTap,
    required this.colors,
  });

  final String? label;
  final IconData? icon;
  final bool isSelected;
  final bool isEnabled;
  final VoidCallback onTap;
  final GColorScheme colors;

  @override
  State<_PaginationButton> createState() => _PaginationButtonState();
}

class _PaginationButtonState extends State<_PaginationButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: widget.isEnabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: widget.isEnabled ? (_) => setState(() => _isHovered = false) : null,
      cursor: widget.isEnabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.isEnabled ? widget.onTap : null,
        child: AnimatedContainer(
          duration: GDurations.fast,
          width: 32,
          height: 32,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? widget.colors.primary
                : _isHovered
                    ? widget.colors.surfaceVariant
                    : Colors.transparent,
            borderRadius: GBorderRadius.allSm,
          ),
          child: Center(
            child: widget.icon != null
                ? Icon(
                    widget.icon,
                    size: 18,
                    color: widget.isEnabled
                        ? widget.colors.onSurfaceVariant
                        : widget.colors.onSurface.withValues(alpha: 0.3),
                  )
                : Text(
                    widget.label ?? '',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: widget.isSelected
                          ? GTypography.fontWeightMedium
                          : GTypography.fontWeightRegular,
                      color: widget.isSelected
                          ? widget.colors.onPrimary
                          : widget.colors.onSurfaceVariant,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

/// A stepper component for multi-step flows.
///
/// ```dart
/// GStepper(
///   currentStep: 1,
///   steps: [
///     GStepData(title: 'Step 1'),
///     GStepData(title: 'Step 2'),
///     GStepData(title: 'Step 3'),
///   ],
/// )
/// ```
class GStepper extends StatelessWidget {
  const GStepper({
    super.key,
    required this.currentStep,
    required this.steps,
    this.onStepTapped,
    this.orientation = Axis.horizontal,
  });

  /// Current step (0-based)
  final int currentStep;

  /// Step data
  final List<GStepData> steps;

  /// Called when a step is tapped
  final ValueChanged<int>? onStepTapped;

  /// Stepper orientation
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    if (orientation == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(steps.length, (index) {
          return _VerticalStep(
            step: steps[index],
            index: index,
            isActive: index == currentStep,
            isCompleted: index < currentStep,
            isLast: index == steps.length - 1,
            onTap: onStepTapped != null ? () => onStepTapped!(index) : null,
            colors: colors,
            textTheme: textTheme,
          );
        }),
      );
    }

    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          final stepIndex = index ~/ 2;
          final isCompleted = stepIndex < currentStep;
          return Expanded(
            child: Container(
              height: 2,
              color: isCompleted
                  ? colors.primary
                  : colors.outline.withValues(alpha: 0.3),
            ),
          );
        }

        final stepIndex = index ~/ 2;
        return _HorizontalStep(
          step: steps[stepIndex],
          index: stepIndex,
          isActive: stepIndex == currentStep,
          isCompleted: stepIndex < currentStep,
          onTap: onStepTapped != null ? () => onStepTapped!(stepIndex) : null,
          colors: colors,
          textTheme: textTheme,
        );
      }),
    );
  }
}

/// Step data
class GStepData {
  const GStepData({
    required this.title,
    this.subtitle,
    this.icon,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
}

class _HorizontalStep extends StatelessWidget {
  const _HorizontalStep({
    required this.step,
    required this.index,
    required this.isActive,
    required this.isCompleted,
    required this.onTap,
    required this.colors,
    required this.textTheme,
  });

  final GStepData step;
  final int index;
  final bool isActive;
  final bool isCompleted;
  final VoidCallback? onTap;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted || isActive
                  ? colors.primary
                  : colors.surfaceVariant,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isCompleted
                  ? Icon(Icons.check, size: 18, color: colors.onPrimary)
                  : step.icon != null
                      ? Icon(
                          step.icon,
                          size: 18,
                          color: isActive
                              ? colors.onPrimary
                              : colors.onSurfaceVariant,
                        )
                      : Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: GTypography.fontWeightMedium,
                            color: isActive
                                ? colors.onPrimary
                                : colors.onSurfaceVariant,
                          ),
                        ),
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            step.title,
            style: textTheme.labelSmall.copyWith(
              color: isActive || isCompleted
                  ? colors.onSurface
                  : colors.onSurfaceVariant,
              fontWeight: isActive
                  ? GTypography.fontWeightMedium
                  : GTypography.fontWeightRegular,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _VerticalStep extends StatelessWidget {
  const _VerticalStep({
    required this.step,
    required this.index,
    required this.isActive,
    required this.isCompleted,
    required this.isLast,
    required this.onTap,
    required this.colors,
    required this.textTheme,
  });

  final GStepData step;
  final int index;
  final bool isActive;
  final bool isCompleted;
  final bool isLast;
  final VoidCallback? onTap;
  final GColorScheme colors;
  final GTextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: isCompleted || isActive
                        ? colors.primary
                        : colors.surfaceVariant,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(Icons.check, size: 16, color: colors.onPrimary)
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: GTypography.fontWeightMedium,
                              color: isActive
                                  ? colors.onPrimary
                                  : colors.onSurfaceVariant,
                            ),
                          ),
                  ),
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    color: isCompleted
                        ? colors.primary
                        : colors.outline.withValues(alpha: 0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: GSpacing.sm),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : GSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: textTheme.titleSmall.copyWith(
                      color: isActive || isCompleted
                          ? colors.onSurface
                          : colors.onSurfaceVariant,
                      fontWeight: isActive
                          ? GTypography.fontWeightMedium
                          : GTypography.fontWeightRegular,
                    ),
                  ),
                  if (step.subtitle != null)
                    Text(
                      step.subtitle!,
                      style: textTheme.bodySmall.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

