import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class SkeletonDividerScreen extends StatelessWidget {
  const SkeletonDividerScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return ShowcaseScaffold(
      title: 'Skeleton & Divider',
      subtitle: 'GSkeleton, GDivider components',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skeleton
            const SectionHeader(
              title: 'Skeleton',
              subtitle: 'Loading placeholder with shimmer',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Skeleton',
              subtitle: 'GSkeleton component',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  GSkeleton(width: 200, height: 20),
                  SizedBox(height: GSpacing.sm),
                  GSkeleton(width: 150, height: 20),
                  SizedBox(height: GSpacing.sm),
                  GSkeleton(width: 100, height: 20),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Skeleton Shapes',
              subtitle: 'Different skeleton variants',
              child: Row(
                children: const [
                  GSkeleton(
                    width: 80,
                    height: 80,
                    variant: GSkeletonVariant.rectangular,
                  ),
                  SizedBox(width: GSpacing.md),
                  GSkeleton.circular(size: 80),
                  SizedBox(width: GSpacing.md),
                  GSkeleton.rounded(width: 80, height: 80),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Skeleton Text',
              subtitle: 'GSkeletonText for text placeholders',
              child: const GSkeletonText(
                lines: 4,
                lastLineWidth: 0.7,
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Skeleton Avatar',
              subtitle: 'GSkeletonAvatar for user items',
              child: Column(
                children: const [
                  GSkeletonAvatar(),
                  SizedBox(height: GSpacing.md),
                  GSkeletonAvatar(avatarSize: 48, showSubtitle: true),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Skeleton Card',
              subtitle: 'GSkeletonCard for card placeholders',
              child: const GSkeletonCard(
                imageHeight: 100,
                textLines: 2,
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Divider
            const SectionHeader(
              title: 'Divider',
              subtitle: 'GDivider component',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Divider',
              subtitle: 'Simple horizontal line',
              child: Column(
                children: [
                  const Text('Content above'),
                  const SizedBox(height: GSpacing.sm),
                  const GDivider(),
                  const SizedBox(height: GSpacing.sm),
                  const Text('Content below'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Divider with Label',
              subtitle: 'label prop for text dividers',
              child: Column(
                children: [
                  const GDivider(label: 'OR'),
                  const SizedBox(height: GSpacing.md),
                  const GDivider(label: 'Continue with'),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Divider with Indent',
              subtitle: 'indent and endIndent props',
              child: Column(
                children: const [
                  GDivider(indent: 20, endIndent: 20),
                  SizedBox(height: GSpacing.md),
                  GDivider(indent: 50),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Vertical Divider',
              subtitle: 'GDivider.vertical()',
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Left'),
                    SizedBox(width: GSpacing.md),
                    GDivider.vertical(height: 30),
                    SizedBox(width: GSpacing.md),
                    Text('Right'),
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

