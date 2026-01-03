import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SearchLinkScreen extends StatefulWidget {
  const SearchLinkScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<SearchLinkScreen> createState() => _SearchLinkScreenState();
}

class _SearchLinkScreenState extends State<SearchLinkScreen> {
  bool _isSearching = false;
  String _searchQuery = '';

  void _simulateSearch(String query) {
    setState(() {
      _isSearching = true;
      _searchQuery = query;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _isSearching = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Search & Link',
      subtitle: 'GSearchField, GLink components',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            const SectionHeader(
              title: 'Search Field',
              subtitle: 'GSearchField component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Search',
              subtitle: 'Type to search',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GSearchField(
                    hint: 'Search products...',
                    onChanged: (value) => setState(() => _searchQuery = value),
                    onSubmitted: _simulateSearch,
                    isLoading: _isSearching,
                  ),
                  if (_searchQuery.isNotEmpty) ...[
                    const SizedBox(height: GSpacing.sm),
                    Text(
                      'Query: "$_searchQuery"',
                      style: TextStyle(color: colors.onSurfaceVariant),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Search Field Sizes',
              subtitle: 'GSearchFieldSize enum',
              child: Column(
                children: [
                  GSearchField(
                    hint: 'Small search...',
                    size: GSearchFieldSize.sm,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSearchField(
                    hint: 'Medium search...',
                    size: GSearchFieldSize.md,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSearchField(
                    hint: 'Large search...',
                    size: GSearchFieldSize.lg,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Search Field Variants',
              subtitle: 'GSearchFieldVariant enum',
              child: Column(
                children: [
                  GSearchField(
                    hint: 'Filled variant...',
                    variant: GSearchFieldVariant.filled,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  GSearchField(
                    hint: 'Outlined variant...',
                    variant: GSearchFieldVariant.outlined,
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Link
            const SectionHeader(
              title: 'Link',
              subtitle: 'GLink component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Link Variants',
              subtitle: 'GLinkVariant enum',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.md,
                children: [
                  GLink(
                    text: 'Primary Link',
                    variant: GLinkVariant.primary,
                    onTap: () => GToastController.info(context, 'Link tapped!'),
                  ),
                  GLink(
                    text: 'Secondary Link',
                    variant: GLinkVariant.secondary,
                    onTap: () => GToastController.info(context, 'Link tapped!'),
                  ),
                  GLink(
                    text: 'Neutral Link',
                    variant: GLinkVariant.neutral,
                    onTap: () => GToastController.info(context, 'Link tapped!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Link Sizes',
              subtitle: 'GLinkSize enum',
              child: Wrap(
                spacing: GSpacing.lg,
                runSpacing: GSpacing.md,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  GLink(
                    text: 'Small Link',
                    size: GLinkSize.sm,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Medium Link',
                    size: GLinkSize.md,
                    onTap: () {},
                  ),
                  GLink(
                    text: 'Large Link',
                    size: GLinkSize.lg,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'External Link',
              subtitle: 'isExternal prop',
              child: Row(
                children: [
                  GLink(
                    text: 'Visit Website',
                    isExternal: true,
                    onTap: () => GToastController.info(context, 'Opens in browser'),
                  ),
                  const SizedBox(width: GSpacing.xl),
                  GLink(
                    text: 'Disabled Link',
                    isDisabled: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Inline Links',
              subtitle: 'Links in text context',
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.onSurface,
                  ),
                  children: [
                    const TextSpan(text: 'By continuing, you agree to our '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Terms of Service',
                        size: GLinkSize.sm,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    WidgetSpan(
                      child: GLink(
                        text: 'Privacy Policy',
                        size: GLinkSize.sm,
                        onTap: () {},
                      ),
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

