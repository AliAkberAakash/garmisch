import 'package:flutter/material.dart' hide ColorSwatch;
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Colors',
      subtitle: 'Color scales and semantic colors',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              title: 'Base Colors',
              subtitle: 'Fundamental colors',
            ),
            const SizedBox(height: GSpacing.sm),
            _ColorRow(name: 'white', color: GColors.white, hex: '#FFFFFF'),
            _ColorRow(name: 'black', color: GColors.black, hex: '#000000'),
            _ColorRow(
              name: 'transparent',
              color: GColors.transparent,
              hex: 'transparent',
            ),
            const SizedBox(height: GSpacing.xl),

            // Gray Scale
            const SectionHeader(
              title: 'Gray Scale',
              subtitle: 'Neutral colors for text and backgrounds',
            ),
            const SizedBox(height: GSpacing.sm),
            _ColorPalette(
              name: 'gray',
              colors: [
                ('50', GColors.gray50),
                ('100', GColors.gray100),
                ('200', GColors.gray200),
                ('300', GColors.gray300),
                ('400', GColors.gray400),
                ('500', GColors.gray500),
                ('600', GColors.gray600),
                ('700', GColors.gray700),
                ('800', GColors.gray800),
                ('900', GColors.gray900),
                ('950', GColors.gray950),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            // Primary Colors
            const SectionHeader(
              title: 'Primary Colors',
              subtitle: 'Blue scale - Default primary color',
            ),
            const SizedBox(height: GSpacing.sm),
            _ColorPalette(
              name: 'blue',
              colors: [
                ('50', GColors.blue50),
                ('100', GColors.blue100),
                ('200', GColors.blue200),
                ('300', GColors.blue300),
                ('400', GColors.blue400),
                ('500', GColors.blue500),
                ('600', GColors.blue600),
                ('700', GColors.blue700),
                ('800', GColors.blue800),
                ('900', GColors.blue900),
                ('950', GColors.blue950),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            // Semantic Colors
            const SectionHeader(
              title: 'Semantic Colors',
              subtitle: 'Colors with meaning',
            ),
            const SizedBox(height: GSpacing.sm),

            // Red - Error
            _ColorPalette(
              name: 'red (error)',
              colors: [
                ('50', GColors.red50),
                ('100', GColors.red100),
                ('200', GColors.red200),
                ('300', GColors.red300),
                ('400', GColors.red400),
                ('500', GColors.red500),
                ('600', GColors.red600),
                ('700', GColors.red700),
                ('800', GColors.red800),
                ('900', GColors.red900),
                ('950', GColors.red950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            // Green - Success
            _ColorPalette(
              name: 'green (success)',
              colors: [
                ('50', GColors.green50),
                ('100', GColors.green100),
                ('200', GColors.green200),
                ('300', GColors.green300),
                ('400', GColors.green400),
                ('500', GColors.green500),
                ('600', GColors.green600),
                ('700', GColors.green700),
                ('800', GColors.green800),
                ('900', GColors.green900),
                ('950', GColors.green950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            // Amber - Warning
            _ColorPalette(
              name: 'amber (warning)',
              colors: [
                ('50', GColors.amber50),
                ('100', GColors.amber100),
                ('200', GColors.amber200),
                ('300', GColors.amber300),
                ('400', GColors.amber400),
                ('500', GColors.amber500),
                ('600', GColors.amber600),
                ('700', GColors.amber700),
                ('800', GColors.amber800),
                ('900', GColors.amber900),
                ('950', GColors.amber950),
              ],
            ),
            const SizedBox(height: GSpacing.xl),

            // Other Colors
            const SectionHeader(
              title: 'Extended Palette',
              subtitle: 'Additional color options',
            ),
            const SizedBox(height: GSpacing.sm),

            _ColorPalette(
              name: 'orange',
              colors: [
                ('50', GColors.orange50),
                ('100', GColors.orange100),
                ('200', GColors.orange200),
                ('300', GColors.orange300),
                ('400', GColors.orange400),
                ('500', GColors.orange500),
                ('600', GColors.orange600),
                ('700', GColors.orange700),
                ('800', GColors.orange800),
                ('900', GColors.orange900),
                ('950', GColors.orange950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'yellow',
              colors: [
                ('50', GColors.yellow50),
                ('100', GColors.yellow100),
                ('200', GColors.yellow200),
                ('300', GColors.yellow300),
                ('400', GColors.yellow400),
                ('500', GColors.yellow500),
                ('600', GColors.yellow600),
                ('700', GColors.yellow700),
                ('800', GColors.yellow800),
                ('900', GColors.yellow900),
                ('950', GColors.yellow950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'teal',
              colors: [
                ('50', GColors.teal50),
                ('100', GColors.teal100),
                ('200', GColors.teal200),
                ('300', GColors.teal300),
                ('400', GColors.teal400),
                ('500', GColors.teal500),
                ('600', GColors.teal600),
                ('700', GColors.teal700),
                ('800', GColors.teal800),
                ('900', GColors.teal900),
                ('950', GColors.teal950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'cyan',
              colors: [
                ('50', GColors.cyan50),
                ('100', GColors.cyan100),
                ('200', GColors.cyan200),
                ('300', GColors.cyan300),
                ('400', GColors.cyan400),
                ('500', GColors.cyan500),
                ('600', GColors.cyan600),
                ('700', GColors.cyan700),
                ('800', GColors.cyan800),
                ('900', GColors.cyan900),
                ('950', GColors.cyan950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'indigo',
              colors: [
                ('50', GColors.indigo50),
                ('100', GColors.indigo100),
                ('200', GColors.indigo200),
                ('300', GColors.indigo300),
                ('400', GColors.indigo400),
                ('500', GColors.indigo500),
                ('600', GColors.indigo600),
                ('700', GColors.indigo700),
                ('800', GColors.indigo800),
                ('900', GColors.indigo900),
                ('950', GColors.indigo950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'violet',
              colors: [
                ('50', GColors.violet50),
                ('100', GColors.violet100),
                ('200', GColors.violet200),
                ('300', GColors.violet300),
                ('400', GColors.violet400),
                ('500', GColors.violet500),
                ('600', GColors.violet600),
                ('700', GColors.violet700),
                ('800', GColors.violet800),
                ('900', GColors.violet900),
                ('950', GColors.violet950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'purple',
              colors: [
                ('50', GColors.purple50),
                ('100', GColors.purple100),
                ('200', GColors.purple200),
                ('300', GColors.purple300),
                ('400', GColors.purple400),
                ('500', GColors.purple500),
                ('600', GColors.purple600),
                ('700', GColors.purple700),
                ('800', GColors.purple800),
                ('900', GColors.purple900),
                ('950', GColors.purple950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'pink',
              colors: [
                ('50', GColors.pink50),
                ('100', GColors.pink100),
                ('200', GColors.pink200),
                ('300', GColors.pink300),
                ('400', GColors.pink400),
                ('500', GColors.pink500),
                ('600', GColors.pink600),
                ('700', GColors.pink700),
                ('800', GColors.pink800),
                ('900', GColors.pink900),
                ('950', GColors.pink950),
              ],
            ),
            const SizedBox(height: GSpacing.md),

            _ColorPalette(
              name: 'rose',
              colors: [
                ('50', GColors.rose50),
                ('100', GColors.rose100),
                ('200', GColors.rose200),
                ('300', GColors.rose300),
                ('400', GColors.rose400),
                ('500', GColors.rose500),
                ('600', GColors.rose600),
                ('700', GColors.rose700),
                ('800', GColors.rose800),
                ('900', GColors.rose900),
                ('950', GColors.rose950),
              ],
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

class _ColorRow extends StatelessWidget {
  const _ColorRow({
    required this.name,
    required this.color,
    required this.hex,
  });

  final String name;
  final Color color;
  final String hex;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.xs2),
      child: Row(
        children: [
          ColorSwatch(color: color),
          const SizedBox(width: GSpacing.sm),
          Expanded(
            child: Text(
              'GColors.$name',
              style: textTheme.bodyMedium.copyWith(
                color: colors.onSurface,
                fontFamily: GTypography.fontFamilyMono,
              ),
            ),
          ),
          Text(
            hex,
            style: textTheme.bodySmall.copyWith(
              color: colors.onSurfaceVariant,
              fontFamily: GTypography.fontFamilyMono,
            ),
          ),
        ],
      ),
    );
  }
}

class _ColorPalette extends StatelessWidget {
  const _ColorPalette({
    required this.name,
    required this.colors,
  });

  final String name;
  final List<(String, Color)> colors;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final themeColors = theme.colors;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: textTheme.labelLarge.copyWith(
            color: themeColors.onSurface,
          ),
        ),
        const SizedBox(height: GSpacing.xs),
        SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            separatorBuilder: (_, __) => const SizedBox(width: GSpacing.xs3),
            itemBuilder: (context, index) {
              final (shade, color) = colors[index];
              return _ColorChip(
                shade: shade,
                color: color,
                colorName: name.split(' ').first,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ColorChip extends StatelessWidget {
  const _ColorChip({
    required this.shade,
    required this.color,
    required this.colorName,
  });

  final String shade;
  final Color color;
  final String colorName;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    // Determine if text should be light or dark based on background
    final luminance = color.computeLuminance();
    final textColor = luminance > 0.5 ? GColors.gray900 : GColors.white;

    return GestureDetector(
      onTap: () {
        final hexCode =
            '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
        Clipboard.setData(ClipboardData(text: 'GColors.$colorName$shade'));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Copied GColors.$colorName$shade ($hexCode)'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: GBorderRadius.allSm,
          border: Border.all(
            color: colors.outline.withOpacity(0.2),
          ),
        ),
        child: Center(
          child: Text(
            shade,
            style: textTheme.labelSmall.copyWith(
              color: textColor,
              fontWeight: GTypography.fontWeightMedium,
            ),
          ),
        ),
      ),
    );
  }
}

