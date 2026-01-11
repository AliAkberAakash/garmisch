import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import 'token_state.dart';

class PreviewPanel extends StatelessWidget {
  const PreviewPanel({
    super.key,
    required this.tokenState,
  });

  final TokenState tokenState;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    // Get current primary and secondary colors from token state
    final primaryPalette = tokenState.colorPalettes[tokenState.systemColors.primary];
    final secondaryPalette = tokenState.colorPalettes[tokenState.systemColors.secondary];
    final errorPalette = tokenState.colorPalettes[tokenState.systemColors.error];
    final successPalette = tokenState.colorPalettes[tokenState.systemColors.success];
    final neutralPalette = tokenState.colorPalettes[tokenState.systemColors.neutral];

    final primaryColor = primaryPalette?.shades['500'] ?? Colors.blue;
    final secondaryColor = secondaryPalette?.shades['500'] ?? Colors.purple;
    final errorColor = errorPalette?.shades['500'] ?? Colors.red;
    final successColor = successPalette?.shades['500'] ?? Colors.green;
    final neutralBg = neutralPalette?.shades['100'] ?? Colors.grey.shade100;
    final neutralSurface = neutralPalette?.shades['50'] ?? Colors.white;
    final neutralText = neutralPalette?.shades['900'] ?? Colors.grey.shade900;
    final neutralSubtext = neutralPalette?.shades['500'] ?? Colors.grey.shade500;

    // Get spacing values
    final spacingMd = tokenState.spacing.values['md'] ?? 16.0;
    final spacingSm = tokenState.spacing.values['sm'] ?? 12.0;
    final spacingXs = tokenState.spacing.values['xs'] ?? 8.0;

    // Get border radius values
    final radiusMd = tokenState.borderRadius.values['md'] ?? 6.0;
    final radiusLg = tokenState.borderRadius.values['lg'] ?? 8.0;

    // Get shadow values
    final shadowMd = tokenState.shadows.values['md'] ?? [];
    final boxShadows = shadowMd
        .map((s) => BoxShadow(
              color: s.color,
              offset: Offset(s.offsetX, s.offsetY),
              blurRadius: s.blur,
              spreadRadius: s.spread,
            ))
        .toList();

    return Container(
      decoration: BoxDecoration(
        color: neutralBg,
        border: Border(
          left: BorderSide(color: colors.outline.withOpacity(0.2)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(spacingMd),
            decoration: BoxDecoration(
              color: neutralSurface,
              border: Border(
                bottom: BorderSide(color: colors.outline.withOpacity(0.2)),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.visibility, color: primaryColor, size: 20),
                SizedBox(width: spacingXs),
                Text(
                  'Live Preview',
                  style: textTheme.titleSmall.copyWith(
                    color: neutralText,
                    fontWeight: GTypography.fontWeightSemiBold,
                  ),
                ),
              ],
            ),
          ),
          // Preview content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Color Swatches
                  _PreviewSection(
                    title: 'System Colors',
                    textColor: neutralText,
                    child: Wrap(
                      spacing: spacingXs,
                      runSpacing: spacingXs,
                      children: [
                        _ColorSwatch(label: 'Primary', color: primaryColor),
                        _ColorSwatch(label: 'Secondary', color: secondaryColor),
                        _ColorSwatch(label: 'Error', color: errorColor),
                        _ColorSwatch(label: 'Success', color: successColor),
                      ],
                    ),
                  ),
                  SizedBox(height: spacingMd),

                  // Button Preview
                  _PreviewSection(
                    title: 'Buttons',
                    textColor: neutralText,
                    child: Wrap(
                      spacing: spacingXs,
                      runSpacing: spacingXs,
                      children: [
                        _PreviewButton(
                          label: 'Primary',
                          backgroundColor: primaryColor,
                          textColor: Colors.white,
                          borderRadius: radiusMd,
                        ),
                        _PreviewButton(
                          label: 'Secondary',
                          backgroundColor: secondaryColor,
                          textColor: Colors.white,
                          borderRadius: radiusMd,
                        ),
                        _PreviewButton(
                          label: 'Outlined',
                          backgroundColor: Colors.transparent,
                          textColor: primaryColor,
                          borderRadius: radiusMd,
                          borderColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacingMd),

                  // Card Preview
                  _PreviewSection(
                    title: 'Card with Shadow',
                    textColor: neutralText,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(spacingMd),
                      decoration: BoxDecoration(
                        color: neutralSurface,
                        borderRadius: BorderRadius.circular(radiusLg),
                        boxShadow: boxShadows.isEmpty ? null : boxShadows,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Title',
                            style: TextStyle(
                              fontSize: tokenState.typography.fontSizes['lg'] ?? 18,
                              fontWeight: FontWeight.w600,
                              color: neutralText,
                            ),
                          ),
                          SizedBox(height: spacingXs),
                          Text(
                            'This card uses your spacing, border radius, and shadow tokens.',
                            style: TextStyle(
                              fontSize: tokenState.typography.fontSizes['sm'] ?? 14,
                              color: neutralSubtext,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: spacingMd),

                  // Typography Preview
                  _PreviewSection(
                    title: 'Typography',
                    textColor: neutralText,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Heading Large',
                          style: TextStyle(
                            fontSize: tokenState.typography.fontSizes['xl2'] ?? 24,
                            fontWeight: FontWeight.w700,
                            color: neutralText,
                          ),
                        ),
                        SizedBox(height: spacingXs),
                        Text(
                          'Body text example',
                          style: TextStyle(
                            fontSize: tokenState.typography.fontSizes['base'] ?? 16,
                            fontWeight: FontWeight.w400,
                            color: neutralText,
                          ),
                        ),
                        SizedBox(height: spacingXs),
                        Text(
                          'Small caption text',
                          style: TextStyle(
                            fontSize: tokenState.typography.fontSizes['sm'] ?? 14,
                            fontWeight: FontWeight.w400,
                            color: neutralSubtext,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacingMd),

                  // Spacing Preview
                  _PreviewSection(
                    title: 'Spacing Scale',
                    textColor: neutralText,
                    child: Column(
                      children: ['xs', 'sm', 'md', 'lg', 'xl'].map((key) {
                        final value = tokenState.spacing.values[key] ?? 8;
                        return Padding(
                          padding: EdgeInsets.only(bottom: spacingXs),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                child: Text(
                                  key,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: neutralSubtext,
                                  ),
                                ),
                              ),
                              Container(
                                width: value.clamp(0, 150).toDouble(),
                                height: 12,
                                decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.3),
                                  border: Border.all(color: primaryColor),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              SizedBox(width: spacingXs),
                              Text(
                                '${value.toInt()}px',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: neutralSubtext,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: spacingMd),

                  // Border Radius Preview
                  _PreviewSection(
                    title: 'Border Radius',
                    textColor: neutralText,
                    child: Wrap(
                      spacing: spacingSm,
                      runSpacing: spacingSm,
                      children: ['sm', 'md', 'lg', 'xl'].map((key) {
                        final value = tokenState.borderRadius.values[key] ?? 4;
                        return Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.2),
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(
                                  value.clamp(0, 24).toDouble(),
                                ),
                              ),
                            ),
                            SizedBox(height: spacingXs / 2),
                            Text(
                              key,
                              style: TextStyle(
                                fontSize: 10,
                                color: neutralSubtext,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
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

class _PreviewSection extends StatelessWidget {
  const _PreviewSection({
    required this.title,
    required this.child,
    required this.textColor,
  });

  final String title;
  final Widget child;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: textColor.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
        ),
      ],
    );
  }
}

class _PreviewButton extends StatelessWidget {
  const _PreviewButton({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    this.borderColor,
  });

  final String label;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

