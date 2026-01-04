import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SearchComponentsScreen extends StatefulWidget {
  const SearchComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<SearchComponentsScreen> createState() => _SearchComponentsScreenState();
}

class _SearchComponentsScreenState extends State<SearchComponentsScreen> {
  bool _isSearching = false;
  String _searchQuery = '';
  final _searchController = TextEditingController();

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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Search Field',
      subtitle: 'GSearchField component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Search
            const SectionHeader(
              title: 'Basic Search',
              subtitle: 'Interactive search input',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Search with Loading',
              subtitle: 'Type and submit to search',
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
            const SizedBox(height: GSpacing.xl),

            // Search Sizes
            const SectionHeader(
              title: 'Search Sizes',
              subtitle: 'GSearchFieldSize enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Small',
              subtitle: 'GSearchFieldSize.sm',
              child: GSearchField(
                hint: 'Small search...',
                size: GSearchFieldSize.sm,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Medium',
              subtitle: 'GSearchFieldSize.md (default)',
              child: GSearchField(
                hint: 'Medium search...',
                size: GSearchFieldSize.md,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Large',
              subtitle: 'GSearchFieldSize.lg',
              child: GSearchField(
                hint: 'Large search...',
                size: GSearchFieldSize.lg,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Search Variants
            const SectionHeader(
              title: 'Search Variants',
              subtitle: 'GSearchFieldVariant enum',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Filled Variant',
              subtitle: 'GSearchFieldVariant.filled',
              child: GSearchField(
                hint: 'Filled search...',
                variant: GSearchFieldVariant.filled,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Outlined Variant',
              subtitle: 'GSearchFieldVariant.outlined',
              child: GSearchField(
                hint: 'Outlined search...',
                variant: GSearchFieldVariant.outlined,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Loading State
            const SectionHeader(
              title: 'Loading State',
              subtitle: 'isLoading property',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Search Loading',
              subtitle: 'Shows spinner while searching',
              child: GSearchField(
                hint: 'Searching...',
                isLoading: true,
                onChanged: (_) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // With Clear Button
            const SectionHeader(
              title: 'With Controller',
              subtitle: 'Using TextEditingController',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Controlled Search',
              subtitle: 'Access input value programmatically',
              child: GSearchField(
                controller: _searchController,
                hint: 'Type something...',
                onChanged: (_) => setState(() {}),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Practical Example
            const SectionHeader(
              title: 'Practical Example',
              subtitle: 'Search results pattern',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Product Search',
              subtitle: 'Search with results list',
              child: Column(
                children: [
                  GSearchField(
                    hint: 'Search products...',
                    variant: GSearchFieldVariant.outlined,
                    onChanged: (_) {},
                  ),
                  const SizedBox(height: GSpacing.md),
                  Container(
                    padding: const EdgeInsets.all(GSpacing.md),
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant.withValues(alpha: 0.3),
                      borderRadius: GBorderRadius.allMd,
                    ),
                    child: Column(
                      children: [
                        _SearchResultItem(
                          title: 'Product 1',
                          subtitle: 'Description for product 1',
                          colors: colors,
                        ),
                        const GDivider(),
                        _SearchResultItem(
                          title: 'Product 2',
                          subtitle: 'Description for product 2',
                          colors: colors,
                        ),
                        const GDivider(),
                        _SearchResultItem(
                          title: 'Product 3',
                          subtitle: 'Description for product 3',
                          colors: colors,
                        ),
                      ],
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

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  final String title;
  final String subtitle;
  final GColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GSpacing.sm),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.surfaceVariant,
              borderRadius: GBorderRadius.allSm,
            ),
            child: Icon(Icons.shopping_bag, size: 20, color: colors.onSurfaceVariant),
          ),
          const SizedBox(width: GSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colors.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colors.onSurfaceVariant),
        ],
      ),
    );
  }
}

