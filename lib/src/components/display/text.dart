import 'package:flutter/material.dart';

import '../../theme/theme.dart';

/// A styled text component for the Garmisch design system.
///
/// ```dart
/// GText('Hello World', style: GTextStyleToken.titleLarge)
/// GText.displayLarge('Hero Text')
/// GText.bodyMedium('Body text')
/// ```
class GText extends StatelessWidget {
  const GText(
    this.data, {
    super.key,
    this.style,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  });

  /// Display Large text
  const GText.displayLarge(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.displayLarge;

  /// Display Medium text
  const GText.displayMedium(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.displayMedium;

  /// Display Small text
  const GText.displaySmall(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.displaySmall;

  /// Headline Large text
  const GText.headlineLarge(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.headlineLarge;

  /// Headline Medium text
  const GText.headlineMedium(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.headlineMedium;

  /// Headline Small text
  const GText.headlineSmall(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.headlineSmall;

  /// Title Large text
  const GText.titleLarge(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.titleLarge;

  /// Title Medium text
  const GText.titleMedium(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.titleMedium;

  /// Title Small text
  const GText.titleSmall(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.titleSmall;

  /// Body Large text
  const GText.bodyLarge(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.bodyLarge;

  /// Body Medium text
  const GText.bodyMedium(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.bodyMedium;

  /// Body Small text
  const GText.bodySmall(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.bodySmall;

  /// Label Large text
  const GText.labelLarge(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.labelLarge;

  /// Label Medium text
  const GText.labelMedium(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.labelMedium;

  /// Label Small text
  const GText.labelSmall(
    this.data, {
    super.key,
    this.color,
    this.align,
    this.overflow,
    this.maxLines,
    this.selectable = false,
    this.softWrap,
  }) : style = GTextStyleToken.labelSmall;

  /// Text content
  final String data;

  /// Text style token
  final GTextStyleToken? style;

  /// Text color override
  final Color? color;

  /// Text alignment
  final TextAlign? align;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Maximum number of lines
  final int? maxLines;

  /// Whether text is selectable
  final bool selectable;

  /// Whether text should soft wrap
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    final theme = GTheme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colors;

    final resolvedStyle = _resolveStyle(textTheme);
    final styledText = resolvedStyle.copyWith(
      color: color ?? colors.onSurface,
    );

    if (selectable) {
      return SelectableText(
        data,
        style: styledText,
        textAlign: align,
        maxLines: maxLines,
      );
    }

    return Text(
      data,
      style: styledText,
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  TextStyle _resolveStyle(GTextTheme textTheme) {
    switch (style) {
      case GTextStyleToken.displayLarge:
        return textTheme.displayLarge;
      case GTextStyleToken.displayMedium:
        return textTheme.displayMedium;
      case GTextStyleToken.displaySmall:
        return textTheme.displaySmall;
      case GTextStyleToken.headlineLarge:
        return textTheme.headlineLarge;
      case GTextStyleToken.headlineMedium:
        return textTheme.headlineMedium;
      case GTextStyleToken.headlineSmall:
        return textTheme.headlineSmall;
      case GTextStyleToken.titleLarge:
        return textTheme.titleLarge;
      case GTextStyleToken.titleMedium:
        return textTheme.titleMedium;
      case GTextStyleToken.titleSmall:
        return textTheme.titleSmall;
      case GTextStyleToken.bodyLarge:
        return textTheme.bodyLarge;
      case GTextStyleToken.bodyMedium:
        return textTheme.bodyMedium;
      case GTextStyleToken.bodySmall:
        return textTheme.bodySmall;
      case GTextStyleToken.labelLarge:
        return textTheme.labelLarge;
      case GTextStyleToken.labelMedium:
        return textTheme.labelMedium;
      case GTextStyleToken.labelSmall:
        return textTheme.labelSmall;
      case null:
        return textTheme.bodyMedium;
    }
  }
}


