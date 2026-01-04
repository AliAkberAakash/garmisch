import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class PaginationComponentsScreen extends StatefulWidget {
  const PaginationComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  State<PaginationComponentsScreen> createState() =>
      _PaginationComponentsScreenState();
}

class _PaginationComponentsScreenState extends State<PaginationComponentsScreen> {
  int _basicPage = 1;
  int _customPage = 5;
  int _minimalPage = 1;
  int _largePage = 10;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Pagination',
      subtitle: 'Page navigation component',
      onThemeToggle: widget.onThemeToggle,
      isDarkMode: widget.isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Pagination
            const SectionHeader(
              title: 'Basic Pagination',
              subtitle: 'Standard pagination controls',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Standard Pagination',
              subtitle: 'With all controls',
              child: Column(
                children: [
                  GPagination(
                    currentPage: _basicPage,
                    totalPages: 10,
                    onPageChanged: (page) => setState(() => _basicPage = page),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Page: $_basicPage of 10',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Large Dataset
            const SectionHeader(
              title: 'Large Dataset',
              subtitle: 'Pagination with many pages',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Many Pages',
              subtitle: '100 pages total',
              child: Column(
                children: [
                  GPagination(
                    currentPage: _largePage,
                    totalPages: 100,
                    onPageChanged: (page) => setState(() => _largePage = page),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Page: $_largePage of 100',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Custom Visible Pages
            const SectionHeader(
              title: 'Custom Visible Pages',
              subtitle: 'Control number of visible page buttons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Visible Pages: 7',
              subtitle: 'visiblePages: 7',
              child: Column(
                children: [
                  GPagination(
                    currentPage: _customPage,
                    totalPages: 20,
                    visiblePages: 7,
                    onPageChanged: (page) => setState(() => _customPage = page),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Page: $_customPage of 20',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Minimal Pagination
            const SectionHeader(
              title: 'Minimal Pagination',
              subtitle: 'Without first/last buttons',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Minimal',
              subtitle: 'showFirstLast: false',
              child: Column(
                children: [
                  GPagination(
                    currentPage: _minimalPage,
                    totalPages: 15,
                    showFirstLast: false,
                    onPageChanged: (page) => setState(() => _minimalPage = page),
                  ),
                  const SizedBox(height: GSpacing.sm),
                  Text(
                    'Current Page: $_minimalPage of 15',
                    style: TextStyle(color: colors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Edge Cases
            const SectionHeader(
              title: 'Edge Cases',
              subtitle: 'First and last page states',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'First Page',
              subtitle: 'Previous/First buttons disabled',
              child: GPagination(
                currentPage: 1,
                totalPages: 10,
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Last Page',
              subtitle: 'Next/Last buttons disabled',
              child: GPagination(
                currentPage: 10,
                totalPages: 10,
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Single Page',
              subtitle: 'Only one page available',
              child: GPagination(
                currentPage: 1,
                totalPages: 1,
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Few Pages
            const SectionHeader(
              title: 'Few Pages',
              subtitle: 'Pagination with limited pages',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Three Pages',
              subtitle: 'Small dataset',
              child: GPagination(
                currentPage: 2,
                totalPages: 3,
                onPageChanged: (page) {},
              ),
            ),
            const SizedBox(height: GSpacing.xl2),
          ],
        ),
      ),
    );
  }
}

