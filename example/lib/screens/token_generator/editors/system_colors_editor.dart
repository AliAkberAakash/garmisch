import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../token_state.dart';

class SystemColorsEditor extends StatelessWidget {
  const SystemColorsEditor({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final paletteNames = tokenState.colorPalettes.keys.toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'System Colors',
            style: textTheme.headlineSmall.copyWith(
              color: colors.onBackground,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          const SizedBox(height: GSpacing.xs),
          Text(
            'Map semantic color roles to color palettes. These mappings define your theme\'s primary, secondary, and feedback colors.',
            style: textTheme.bodyMedium.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.xl),

          // Brand Colors Section
          _SectionCard(
            title: 'Brand Colors',
            subtitle: 'Primary UI elements and branding',
            children: [
              _SystemColorDropdown(
                label: 'Primary',
                description: 'Main brand color for primary actions and highlights',
                value: tokenState.systemColors.primary,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('primary', value),
              ),
              const SizedBox(height: GSpacing.md),
              _SystemColorDropdown(
                label: 'Secondary',
                description: 'Secondary brand color for accents',
                value: tokenState.systemColors.secondary,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('secondary', value),
              ),
              const SizedBox(height: GSpacing.md),
              _SystemColorDropdown(
                label: 'Tertiary',
                description: 'Tertiary brand color for additional accents',
                value: tokenState.systemColors.tertiary,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('tertiary', value),
              ),
            ],
          ),
          const SizedBox(height: GSpacing.lg),

          // Neutral Colors Section
          _SectionCard(
            title: 'Neutral Colors',
            subtitle: 'Backgrounds, borders, and text',
            children: [
              _SystemColorDropdown(
                label: 'Neutral',
                description: 'Gray scale for backgrounds, borders, and text',
                value: tokenState.systemColors.neutral,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('neutral', value),
              ),
            ],
          ),
          const SizedBox(height: GSpacing.lg),

          // Feedback Colors Section
          _SectionCard(
            title: 'Feedback Colors',
            subtitle: 'Status and alert indicators',
            children: [
              _SystemColorDropdown(
                label: 'Error',
                description: 'Error states and destructive actions',
                value: tokenState.systemColors.error,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('error', value),
              ),
              const SizedBox(height: GSpacing.md),
              _SystemColorDropdown(
                label: 'Warning',
                description: 'Warning states and caution indicators',
                value: tokenState.systemColors.warning,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('warning', value),
              ),
              const SizedBox(height: GSpacing.md),
              _SystemColorDropdown(
                label: 'Success',
                description: 'Success states and positive actions',
                value: tokenState.systemColors.success,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('success', value),
              ),
              const SizedBox(height: GSpacing.md),
              _SystemColorDropdown(
                label: 'Info',
                description: 'Informational states and neutral messages',
                value: tokenState.systemColors.info,
                options: paletteNames,
                colorPalettes: tokenState.colorPalettes,
                onChanged: (value) => tokenState.updateSystemColor('info', value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.subtitle,
    required this.children,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(GSpacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: GBorderRadius.allLg,
        border: Border.all(color: colors.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleMedium.copyWith(
              color: colors.onSurface,
              fontWeight: GTypography.fontWeightSemiBold,
            ),
          ),
          Text(
            subtitle,
            style: textTheme.bodySmall.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GSpacing.md),
          ...children,
        ],
      ),
    );
  }
}

class _SystemColorDropdown extends StatelessWidget {
  const _SystemColorDropdown({
    required this.label,
    required this.description,
    required this.value,
    required this.options,
    required this.colorPalettes,
    required this.onChanged,
  });

  final String label;
  final String description;
  final String value;
  final List<String> options;
  final Map<String, ColorPaletteState> colorPalettes;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    // Get the 500 shade of the selected palette for preview
    final previewColor = colorPalettes[value]?.shades['500'] ?? Colors.grey;

    return Row(
      children: [
        // Color preview
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: previewColor,
            borderRadius: GBorderRadius.allMd,
            border: Border.all(color: colors.outline.withOpacity(0.3)),
          ),
        ),
        const SizedBox(width: GSpacing.sm),
        // Label and description
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.labelLarge.copyWith(
                  color: colors.onSurface,
                  fontWeight: GTypography.fontWeightMedium,
                ),
              ),
              Text(
                description,
                style: textTheme.bodySmall.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: GSpacing.sm),
        // Dropdown
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: GSpacing.sm,
            vertical: GSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: GBorderRadius.allMd,
            border: Border.all(color: colors.outline.withOpacity(0.3)),
          ),
          child: DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            isDense: true,
            icon: Icon(
              Icons.arrow_drop_down,
              color: colors.onSurface,
            ),
            dropdownColor: colors.surface,
            items: options.map((option) {
              final optionColor = colorPalettes[option]?.shades['500'] ?? Colors.grey;
              return DropdownMenuItem(
                value: option,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: optionColor,
                        borderRadius: GBorderRadius.allXs,
                      ),
                    ),
                    const SizedBox(width: GSpacing.xs),
                    Text(
                      option.substring(0, 1).toUpperCase() + option.substring(1),
                      style: textTheme.bodyMedium.copyWith(
                        color: colors.onSurface,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              if (newValue != null) {
                onChanged(newValue);
              }
            },
          ),
        ),
      ],
    );
  }
}

