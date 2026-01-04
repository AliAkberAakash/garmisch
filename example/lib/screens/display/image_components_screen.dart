import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import '../../widgets/showcase_widgets.dart';

class ImageComponentsScreen extends StatelessWidget {
  const ImageComponentsScreen({
    super.key,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return ShowcaseScaffold(
      title: 'Image',
      subtitle: 'GImage component',
      onThemeToggle: onThemeToggle,
      isDarkMode: isDarkMode,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(GSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Network Image
            const SectionHeader(
              title: 'Network Image',
              subtitle: 'Load images from URLs',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Basic Network Image',
              subtitle: 'With loading indicator',
              child: Row(
                children: const [
                  GImage(
                    src: 'https://picsum.photos/120/120',
                    width: 120,
                    height: 120,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  SizedBox(width: GSpacing.md),
                  GImage(
                    src: 'https://picsum.photos/120/121',
                    width: 120,
                    height: 120,
                    borderRadius: GBorderRadius.allMd,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Border Radius
            const SectionHeader(
              title: 'Border Radius',
              subtitle: 'Different corner styles',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Rounded Corners',
              subtitle: 'borderRadius property',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const GImage(
                        src: 'https://picsum.photos/80/80',
                        width: 80,
                        height: 80,
                        borderRadius: GBorderRadius.allNone,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('None', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  Column(
                    children: [
                      const GImage(
                        src: 'https://picsum.photos/80/81',
                        width: 80,
                        height: 80,
                        borderRadius: GBorderRadius.allSm,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('Small', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  Column(
                    children: [
                      const GImage(
                        src: 'https://picsum.photos/80/82',
                        width: 80,
                        height: 80,
                        borderRadius: GBorderRadius.allMd,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('Medium', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                  Column(
                    children: [
                      const GImage(
                        src: 'https://picsum.photos/80/83',
                        width: 80,
                        height: 80,
                        borderRadius: GBorderRadius.allFull,
                      ),
                      const SizedBox(height: GSpacing.xs),
                      Text('Full', style: TextStyle(fontSize: 10, color: colors.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Box Fit Options
            const SectionHeader(
              title: 'Box Fit Options',
              subtitle: 'How image fills its container',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'BoxFit.cover',
              subtitle: 'Fills container, may crop',
              child: Row(
                children: [
                  const GImage(
                    src: 'https://picsum.photos/200/100',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  const SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'Cover fills the entire container while maintaining aspect ratio. Parts of the image may be cropped.',
                      style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'BoxFit.contain',
              subtitle: 'Shows entire image, may letterbox',
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: colors.surfaceVariant,
                      borderRadius: GBorderRadius.allMd,
                    ),
                    child: const GImage(
                      src: 'https://picsum.photos/200/101',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                      borderRadius: GBorderRadius.allMd,
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'Contain shows the entire image within the container. May show empty space (letterboxing).',
                      style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'BoxFit.fill',
              subtitle: 'Stretches to fill',
              child: Row(
                children: [
                  const GImage(
                    src: 'https://picsum.photos/200/102',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  const SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'Fill stretches the image to fill the container. May distort the aspect ratio.',
                      style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'BoxFit.fitWidth',
              subtitle: 'Fits width, may overflow height',
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: GBorderRadius.allMd,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: colors.surfaceVariant,
                      child: const GImage(
                        src: 'https://picsum.photos/100/200',
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'FitWidth ensures the image fills the width. Height may overflow or underflow.',
                      style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Error State
            const SectionHeader(
              title: 'Error State',
              subtitle: 'Fallback on load failure',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Default Error Widget',
              subtitle: 'Built-in error display',
              child: Row(
                children: const [
                  GImage(
                    src: 'https://invalid-url.example/image.jpg',
                    width: 100,
                    height: 100,
                    borderRadius: GBorderRadius.allMd,
                  ),
                  SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'When an image fails to load, a default error widget is shown.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.md),
            ShowcaseCard(
              title: 'Custom Error Widget',
              subtitle: 'errorWidget property',
              child: Row(
                children: [
                  GImage(
                    src: 'https://invalid-url.example/image2.jpg',
                    width: 100,
                    height: 100,
                    borderRadius: GBorderRadius.allMd,
                    errorWidget: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: colors.errorContainer,
                        borderRadius: GBorderRadius.allMd,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, color: colors.error),
                          const SizedBox(height: 4),
                          Text(
                            'Not Found',
                            style: TextStyle(color: colors.error, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: GSpacing.md),
                  Expanded(
                    child: Text(
                      'You can provide a custom widget to display when an image fails to load.',
                      style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Loading State
            const SectionHeader(
              title: 'Loading State',
              subtitle: 'While image loads',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Loading Indicator',
              subtitle: 'Shown while fetching image',
              child: Text(
                'GImage displays a loading indicator (skeleton or spinner) while the network image is being fetched. Try refreshing the page to see the loading state.',
                style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
              ),
            ),
            const SizedBox(height: GSpacing.xl),

            // Multiple Images
            const SectionHeader(
              title: 'Gallery Example',
              subtitle: 'Multiple images in a grid',
            ),
            const SizedBox(height: GSpacing.sm),
            ShowcaseCard(
              title: 'Image Grid',
              subtitle: 'Gallery layout',
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: GSpacing.sm,
                crossAxisSpacing: GSpacing.sm,
                children: List.generate(
                  6,
                  (index) => GImage(
                    src: 'https://picsum.photos/150/15${index}',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    borderRadius: GBorderRadius.allSm,
                  ),
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

