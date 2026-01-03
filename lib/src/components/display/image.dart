import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// An image component with loading and error states.
///
/// ```dart
/// GImage(
///   src: 'https://example.com/image.jpg',
///   width: 200,
///   height: 150,
/// )
/// ```
class GImage extends StatelessWidget {
  const GImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.alignment = Alignment.center,
    this.color,
    this.colorBlendMode,
  });

  /// Image source URL or asset path
  final String src;

  /// Image width
  final double? width;

  /// Image height
  final double? height;

  /// How to fit the image
  final BoxFit fit;

  /// Border radius
  final BorderRadius? borderRadius;

  /// Placeholder widget while loading
  final Widget? placeholder;

  /// Error widget when image fails
  final Widget? errorWidget;

  /// Image alignment
  final Alignment alignment;

  /// Color filter
  final Color? color;

  /// Color blend mode
  final BlendMode? colorBlendMode;

  bool get _isNetwork =>
      src.startsWith('http://') || src.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    Widget image;

    if (_isNetwork) {
      image = Image.network(
        src,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        colorBlendMode: colorBlendMode,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildPlaceholder(colors, loadingProgress);
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildError(colors);
        },
      );
    } else {
      image = Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        color: color,
        colorBlendMode: colorBlendMode,
        errorBuilder: (context, error, stackTrace) {
          return _buildError(colors);
        },
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }

  Widget _buildPlaceholder(GColorScheme colors, ImageChunkEvent? progress) {
    if (placeholder != null) return placeholder!;

    return Container(
      width: width,
      height: height,
      color: colors.surfaceVariant,
      child: Center(
        child: progress != null && progress.expectedTotalBytes != null
            ? CircularProgressIndicator(
                value: progress.cumulativeBytesLoaded /
                    progress.expectedTotalBytes!,
                strokeWidth: 2,
                color: colors.primary,
              )
            : CircularProgressIndicator(
                strokeWidth: 2,
                color: colors.primary,
              ),
      ),
    );
  }

  Widget _buildError(GColorScheme colors) {
    if (errorWidget != null) return errorWidget!;

    return Container(
      width: width,
      height: height,
      color: colors.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: colors.onSurfaceVariant,
          size: 32,
        ),
      ),
    );
  }
}

/// A themed icon component.
///
/// ```dart
/// GIcon(Icons.star, size: GIconSize.lg, color: colors.primary)
/// ```
class GIcon extends StatelessWidget {
  const GIcon(
    this.icon, {
    super.key,
    this.size = GIconSize.md,
    this.color,
    this.semanticLabel,
  });

  /// The icon to display
  final IconData icon;

  /// Icon size
  final GIconSize size;

  /// Icon color
  final Color? color;

  /// Semantic label for accessibility
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    return Icon(
      icon,
      size: size.value,
      color: color ?? colors.onSurface,
      semanticLabel: semanticLabel,
    );
  }
}

/// Icon size options
enum GIconSize {
  /// Extra small - 16px
  xs(16),

  /// Small - 20px
  sm(20),

  /// Medium - 24px
  md(24),

  /// Large - 28px
  lg(28),

  /// Extra large - 32px
  xl(32),

  /// 2XL - 40px
  xl2(40),

  /// 3XL - 48px
  xl3(48);

  const GIconSize(this.value);
  final double value;
}

