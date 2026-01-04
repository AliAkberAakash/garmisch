import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ChipComponentsScreen extends StatefulWidget {
  const ChipComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<ChipComponentsScreen> createState() => _ChipComponentsScreenState();
}

class _ChipComponentsScreenState extends State<ChipComponentsScreen> {
  Set<String> _selectedChips = {'flutter'};

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Chip',
      subtitle: 'GChip component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chip Variants
            const SectionHeader(
              title: 'Chip Variants',
              subtitle: 'Different visual styles for chips',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Soft Variant',
              subtitle: 'GChipVariant.soft - Subtle background',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Soft Chip',
                    variant: GChipVariant.soft,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Selected',
                    variant: GChipVariant.soft,
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Solid Variant',
              subtitle: 'GChipVariant.solid - Filled background',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Solid Chip',
                    variant: GChipVariant.solid,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Selected',
                    variant: GChipVariant.solid,
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Outlined Variant',
              subtitle: 'GChipVariant.outlined - Border only',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Outlined Chip',
                    variant: GChipVariant.outlined,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Selected',
                    variant: GChipVariant.outlined,
                    selected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Chip with Icons
            const SectionHeader(
              title: 'Chips with Icons',
              subtitle: 'Add leading icons to chips',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Leading Icon',
              subtitle: 'leadingIcon property',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Star',
                    leadingIcon: Icons.star,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Favorite',
                    leadingIcon: Icons.favorite,
                    variant: GChipVariant.solid,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Check',
                    leadingIcon: Icons.check_circle,
                    variant: GChipVariant.outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Deletable Chips
            const SectionHeader(
              title: 'Deletable Chips',
              subtitle: 'Chips with delete action',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'With Delete Button',
              subtitle: 'onDelete callback',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Removable',
                    onTap: () {},
                    onDelete: () {},
                  ),
                  GChip(
                    label: 'Tag Item',
                    leadingIcon: Icons.tag,
                    onTap: () {},
                    onDelete: () {},
                  ),
                  GChip(
                    label: 'Filter',
                    variant: GChipVariant.outlined,
                    onTap: () {},
                    onDelete: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Colors
            const SectionHeader(
              title: 'Custom Colors',
              subtitle: 'Chips with custom color schemes',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Color Property',
              subtitle: 'Custom chip colors',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: [
                  GChip(
                    label: 'Success',
                    color: colors.success,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Warning',
                    color: colors.warning,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Error',
                    color: colors.error,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Primary',
                    color: colors.primary,
                    variant: GChipVariant.solid,
                    onTap: () {},
                  ),
                  GChip(
                    label: 'Secondary',
                    color: colors.secondary,
                    variant: GChipVariant.solid,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Disabled State
            const SectionHeader(
              title: 'Disabled State',
              subtitle: 'Non-interactive chips',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Disabled Chips',
              subtitle: 'disabled: true',
              child: Wrap(
                spacing: GSpacing.sm,
                runSpacing: GSpacing.sm,
                children: const [
                  GChip(
                    label: 'Disabled Soft',
                    variant: GChipVariant.soft,
                    disabled: true,
                  ),
                  GChip(
                    label: 'Disabled Solid',
                    variant: GChipVariant.solid,
                    disabled: true,
                  ),
                  GChip(
                    label: 'Disabled Outlined',
                    variant: GChipVariant.outlined,
                    disabled: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Chip Group
            const SectionHeader(
              title: 'Chip Group',
              subtitle: 'Multi-select chip group',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'GChipGroup',
              subtitle: 'Selectable chip group with state',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GChipGroup(
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
                  const SizedBox(height: GSpacing.md),
                  Text(
                    'Selected: ${_selectedChips.join(", ")}',
                    style: TextStyle(
                      color: colors.onSurfaceVariant,
                      fontSize: 12,
                    ),
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

