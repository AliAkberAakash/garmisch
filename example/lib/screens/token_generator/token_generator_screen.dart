import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garmisch/garmisch.dart';

import 'editors/border_radius_editor.dart';
import 'editors/border_width_editor.dart';
import 'editors/breakpoint_editor.dart';
import 'editors/color_editor.dart';
import 'editors/duration_editor.dart';
import 'editors/font_family_editor.dart';
import 'editors/opacity_editor.dart';
import 'editors/shadow_editor.dart';
import 'editors/sizing_editor.dart';
import 'editors/spacing_editor.dart';
import 'editors/system_colors_editor.dart';
import 'editors/typography_editor.dart';
import 'preview_panel.dart';
import 'token_state.dart';

class TokenGeneratorScreen extends StatefulWidget {
  const TokenGeneratorScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<TokenGeneratorScreen> createState() => _TokenGeneratorScreenState();
}

class _TokenGeneratorScreenState extends State<TokenGeneratorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TokenState _tokenState;

  final List<_TabInfo> _tabs = [
    _TabInfo('Colors', Icons.palette_outlined),
    _TabInfo('System', Icons.tune_outlined),
    _TabInfo('Spacing', Icons.space_bar_outlined),
    _TabInfo('Sizing', Icons.straighten_outlined),
    _TabInfo('Radius', Icons.rounded_corner_outlined),
    _TabInfo('Border', Icons.border_style_outlined),
    _TabInfo('Opacity', Icons.opacity_outlined),
    _TabInfo('Duration', Icons.timer_outlined),
    _TabInfo('Shadows', Icons.layers_outlined),
    _TabInfo('Breakpoints', Icons.devices_outlined),
    _TabInfo('Fonts', Icons.font_download_outlined),
    _TabInfo('Typography', Icons.text_fields_outlined),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tokenState = TokenState.defaults();
    _tokenState.addListener(_onTokenStateChanged);
  }

  void _onTokenStateChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tokenState.removeListener(_onTokenStateChanged);
    _tokenState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Token Generator',
              style: textTheme.titleMedium.copyWith(
                color: colors.onSurface,
                fontWeight: GTypography.fontWeightSemiBold,
              ),
            ),
            Text(
              'Customize design tokens and export JSON',
              style: textTheme.labelSmall.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        actions: [
          // Reset button
          IconButton(
            icon: Icon(Icons.refresh, color: colors.onSurface),
            onPressed: _showResetConfirmation,
            tooltip: 'Reset to defaults',
          ),
          // Theme toggle
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: colors.onSurface,
            ),
            onPressed: widget.onThemeToggle,
            tooltip: widget.isDarkMode ? 'Light Mode' : 'Dark Mode',
          ),
          const SizedBox(width: GSpacing.xs),
          // Export button
          Padding(
            padding: const EdgeInsets.only(right: GSpacing.sm),
            child: FilledButton.icon(
              onPressed: _exportTokens,
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Export JSON'),
              style: FilledButton.styleFrom(
                backgroundColor: colors.primary,
                foregroundColor: colors.onPrimary,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: colors.primary,
          unselectedLabelColor: colors.onSurfaceVariant,
          indicatorColor: colors.primary,
          tabs: _tabs.map((tab) {
            return Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(tab.icon, size: 18),
                  const SizedBox(width: GSpacing.xs),
                  Text(tab.label),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 900;

          if (isWide) {
            // Side-by-side layout for wide screens
            return Row(
              children: [
                // Editor panel
                Expanded(
                  flex: 3,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ColorEditor(tokenState: _tokenState),
                      SystemColorsEditor(tokenState: _tokenState),
                      SpacingEditor(tokenState: _tokenState),
                      SizingEditor(tokenState: _tokenState),
                      BorderRadiusEditor(tokenState: _tokenState),
                      BorderWidthEditor(tokenState: _tokenState),
                      OpacityEditor(tokenState: _tokenState),
                      DurationEditor(tokenState: _tokenState),
                      ShadowEditor(tokenState: _tokenState),
                      BreakpointEditor(tokenState: _tokenState),
                      FontFamilyEditor(tokenState: _tokenState),
                      TypographyEditor(tokenState: _tokenState),
                    ],
                  ),
                ),
                // Preview panel
                SizedBox(
                  width: 320,
                  child: PreviewPanel(tokenState: _tokenState),
                ),
              ],
            );
          } else {
            // Stacked layout for narrow screens
            return Column(
              children: [
                // Editor panel
                Expanded(
                  flex: 2,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ColorEditor(tokenState: _tokenState),
                      SystemColorsEditor(tokenState: _tokenState),
                      SpacingEditor(tokenState: _tokenState),
                      SizingEditor(tokenState: _tokenState),
                      BorderRadiusEditor(tokenState: _tokenState),
                      BorderWidthEditor(tokenState: _tokenState),
                      OpacityEditor(tokenState: _tokenState),
                      DurationEditor(tokenState: _tokenState),
                      ShadowEditor(tokenState: _tokenState),
                      BreakpointEditor(tokenState: _tokenState),
                      FontFamilyEditor(tokenState: _tokenState),
                      TypographyEditor(tokenState: _tokenState),
                    ],
                  ),
                ),
                // Preview panel (collapsible)
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: colors.outline.withOpacity(0.2)),
                    ),
                  ),
                  child: PreviewPanel(tokenState: _tokenState),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _showResetConfirmation() {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: colors.surface,
          title: const Text('Reset Tokens?'),
          content: const Text(
            'This will reset all token values to their defaults. This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                _tokenState.reset();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tokens reset to defaults'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              child: const Text('Reset'),
            ),
          ],
        );
      },
    );
  }

  void _exportTokens() async {
    final json = _tokenState.exportToJson();

    if (kIsWeb) {
      // On web, copy to clipboard and show dialog with JSON
      await Clipboard.setData(ClipboardData(text: json));
      if (mounted) {
        _showExportDialog(json, copiedToClipboard: true);
      }
    } else {
      // On desktop/mobile, try to save to file
      try {
        final file = File('design-tokens.json');
        await file.writeAsString(json);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Saved to ${file.absolute.path}'),
              behavior: SnackBarBehavior.floating,
              action: SnackBarAction(
                label: 'View',
                onPressed: () => _showExportDialog(json),
              ),
            ),
          );
        }
      } catch (e) {
        // If file save fails, show dialog instead
        if (mounted) {
          await Clipboard.setData(ClipboardData(text: json));
          _showExportDialog(json, copiedToClipboard: true);
        }
      }
    }
  }

  void _showExportDialog(String json, {bool copiedToClipboard = false}) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: colors.surface,
          title: Row(
            children: [
              Icon(
                copiedToClipboard ? Icons.check_circle : Icons.code,
                color: copiedToClipboard ? colors.primary : colors.onSurface,
              ),
              const SizedBox(width: GSpacing.xs),
              Text(copiedToClipboard ? 'Copied to Clipboard!' : 'Export JSON'),
            ],
          ),
          content: SizedBox(
            width: 600,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (copiedToClipboard)
                  Padding(
                    padding: const EdgeInsets.only(bottom: GSpacing.sm),
                    child: Text(
                      'The JSON has been copied to your clipboard. You can also view and copy it below.',
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(GSpacing.sm),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerHighest,
                      borderRadius: GBorderRadius.allMd,
                      border: Border.all(color: colors.outline.withOpacity(0.2)),
                    ),
                    child: SelectableText(
                      json,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: json));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied to clipboard'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: const Text('Copy'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _TabInfo {
  const _TabInfo(this.label, this.icon);
  final String label;
  final IconData icon;
}

