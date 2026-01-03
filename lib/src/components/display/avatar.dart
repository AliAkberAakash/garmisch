import 'package:flutter/material.dart';

import '../../foundations/foundations.dart';
import '../../theme/theme.dart';

/// Avatar size options
enum GAvatarSize {
  /// Extra small (24px)
  xs,

  /// Small (32px)
  sm,

  /// Medium (40px) - Default
  md,

  /// Large (48px)
  lg,

  /// Extra large (64px)
  xl,

  /// 2XL (96px)
  xl2,
}

/// Avatar shape options
enum GAvatarShape {
  /// Circular shape
  circle,

  /// Rounded square
  rounded,

  /// Square shape
  square,
}

/// A customizable avatar component for the Garmisch design system.
///
/// ```dart
/// GAvatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   name: 'John Doe',
///   size: GAvatarSize.md,
/// )
/// ```
class GAvatar extends StatelessWidget {
  const GAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.icon,
    this.size = GAvatarSize.md,
    this.shape = GAvatarShape.circle,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.badge,
  });

  /// URL of the avatar image
  final String? imageUrl;

  /// Name for fallback initials
  final String? name;

  /// Custom icon (used when no image or name)
  final IconData? icon;

  /// Size of the avatar
  final GAvatarSize size;

  /// Shape of the avatar
  final GAvatarShape shape;

  /// Custom background color
  final Color? backgroundColor;

  /// Custom foreground color (text/icon)
  final Color? foregroundColor;

  /// Border color
  final Color? borderColor;

  /// Border width
  final double? borderWidth;

  /// Called when avatar is tapped
  final VoidCallback? onTap;

  /// Optional badge widget
  final Widget? badge;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;
    final textTheme = theme.textTheme;

    final dimensions = _getDimensions();
    final bgColor = backgroundColor ?? colors.primaryContainer;
    final fgColor = foregroundColor ?? colors.onPrimaryContainer;

    Widget avatar = Container(
      width: dimensions.size,
      height: dimensions.size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: shape == GAvatarShape.circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: shape == GAvatarShape.circle
            ? null
            : BorderRadius.circular(
                shape == GAvatarShape.rounded ? dimensions.borderRadius : 0,
              ),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth ?? GBorderWidth.medium,
              )
            : null,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
                onError: (_, __) {},
              )
            : null,
      ),
      child: imageUrl == null ? _buildFallback(fgColor, dimensions, textTheme) : null,
    );

    if (onTap != null) {
      avatar = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: avatar,
        ),
      );
    }

    if (badge != null) {
      avatar = Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: badge!,
          ),
        ],
      );
    }

    return avatar;
  }

  Widget _buildFallback(Color fgColor, _AvatarDimensions dimensions, GTextTheme textTheme) {
    if (name != null && name!.isNotEmpty) {
      final initials = _getInitials(name!);
      return Center(
        child: Text(
          initials,
          style: TextStyle(
            fontSize: dimensions.fontSize,
            fontWeight: GTypography.fontWeightSemiBold,
            color: fgColor,
          ),
        ),
      );
    }

    return Center(
      child: Icon(
        icon ?? Icons.person_outline,
        size: dimensions.iconSize,
        color: fgColor,
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }
    return '${parts[0].substring(0, 1)}${parts[parts.length - 1].substring(0, 1)}'.toUpperCase();
  }

  _AvatarDimensions _getDimensions() {
    switch (size) {
      case GAvatarSize.xs:
        return const _AvatarDimensions(
          size: GSizing.avatarXs,
          fontSize: 10,
          iconSize: 14,
          borderRadius: 4,
        );
      case GAvatarSize.sm:
        return const _AvatarDimensions(
          size: GSizing.avatarSm,
          fontSize: 12,
          iconSize: 16,
          borderRadius: 6,
        );
      case GAvatarSize.md:
        return const _AvatarDimensions(
          size: GSizing.avatarMd,
          fontSize: 14,
          iconSize: 20,
          borderRadius: 8,
        );
      case GAvatarSize.lg:
        return const _AvatarDimensions(
          size: GSizing.avatarLg,
          fontSize: 16,
          iconSize: 24,
          borderRadius: 10,
        );
      case GAvatarSize.xl:
        return const _AvatarDimensions(
          size: GSizing.avatarXl,
          fontSize: 20,
          iconSize: 32,
          borderRadius: 12,
        );
      case GAvatarSize.xl2:
        return const _AvatarDimensions(
          size: GSizing.avatarXl2,
          fontSize: 28,
          iconSize: 40,
          borderRadius: 16,
        );
    }
  }
}

class _AvatarDimensions {
  const _AvatarDimensions({
    required this.size,
    required this.fontSize,
    required this.iconSize,
    required this.borderRadius,
  });

  final double size;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
}

/// Avatar group component to display multiple avatars with overlap
class GAvatarGroup extends StatelessWidget {
  const GAvatarGroup({
    super.key,
    required this.avatars,
    this.max = 4,
    this.size = GAvatarSize.md,
    this.overlapAmount = 0.3,
  });

  /// List of avatar data
  final List<GAvatarData> avatars;

  /// Maximum avatars to show
  final int max;

  /// Size of avatars
  final GAvatarSize size;

  /// Overlap amount (0.0 to 1.0)
  final double overlapAmount;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final colors = theme.colors;

    final displayAvatars = avatars.take(max).toList();
    final remaining = avatars.length - max;
    final dimensions = _getDimensionsForSize(size);
    final overlap = dimensions * overlapAmount;

    return SizedBox(
      height: dimensions,
      child: Stack(
        children: [
          for (int i = 0; i < displayAvatars.length; i++)
            Positioned(
              left: i * (dimensions - overlap),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.surface,
                    width: 2,
                  ),
                ),
                child: GAvatar(
                  imageUrl: displayAvatars[i].imageUrl,
                  name: displayAvatars[i].name,
                  size: size,
                ),
              ),
            ),
          if (remaining > 0)
            Positioned(
              left: displayAvatars.length * (dimensions - overlap),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.surface,
                    width: 2,
                  ),
                ),
                child: GAvatar(
                  name: '+$remaining',
                  size: size,
                  backgroundColor: colors.surfaceVariant,
                  foregroundColor: colors.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }

  double _getDimensionsForSize(GAvatarSize size) {
    switch (size) {
      case GAvatarSize.xs:
        return GSizing.avatarXs;
      case GAvatarSize.sm:
        return GSizing.avatarSm;
      case GAvatarSize.md:
        return GSizing.avatarMd;
      case GAvatarSize.lg:
        return GSizing.avatarLg;
      case GAvatarSize.xl:
        return GSizing.avatarXl;
      case GAvatarSize.xl2:
        return GSizing.avatarXl2;
    }
  }
}

/// Data class for avatar information
class GAvatarData {
  const GAvatarData({
    this.imageUrl,
    this.name,
  });

  final String? imageUrl;
  final String? name;
}

