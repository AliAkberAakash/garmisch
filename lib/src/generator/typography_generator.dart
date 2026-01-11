import 'base_generator.dart';

/// Generates Dart typography constants from DTCG typography tokens
class TypographyGenerator extends BaseGenerator {
  TypographyGenerator({
    required super.parser,
    super.onWarning,
  });

  @override
  String get fileName => 'typography.g.dart';

  @override
  String get className => 'GTypography';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:flutter/widgets.dart'],
      description: 'Generated typography tokens from design-tokens.json',
    ));

    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    // Font Families
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Font Families');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final fontFamilyTokens = parser.extractTokens(tokens, 'fontFamily');
    for (final token in fontFamilyTokens.values) {
      final identifier = 'fontFamily${_capitalize(toIdentifier(token.path))}';
      final value = token.value;

      if (value is String) {
        buffer.writeln("  /// ${token.description ?? 'Font family: $value'}");
        buffer.writeln("  static const String $identifier = '$value';");
        buffer.writeln();
      }
    }

    // Font Family Fallbacks
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Font Family Fallbacks');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final fontFallbackTokens = parser.extractTokens(tokens, 'fontFamilyFallback');
    for (final token in fontFallbackTokens.values) {
      final identifier = 'fontFamilyFallback${_capitalize(toIdentifier(token.path))}';
      final value = token.value;

      if (value is List) {
        final fallbacks = value.map((v) => "'$v'").join(', ');
        buffer.writeln("  /// ${token.description ?? 'Font family fallback stack'}");
        buffer.writeln("  static const List<String> $identifier = [$fallbacks];");
        buffer.writeln();
      }
    }

    // Font Sizes
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Font Sizes');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final fontSizeTokens = parser.extractTokens(tokens, 'fontSize');
    for (final token in fontSizeTokens.values) {
      final identifier = 'fontSize${_capitalize(toIdentifier(token.path))}';
      final value = parseDimension(token.value);

      if (value != null) {
        buffer.writeln('  /// ${token.description ?? 'Font size: ${value}px'}');
        buffer.writeln('  static const double $identifier = $value;');
        buffer.writeln();
      }
    }

    // Line Heights
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Line Heights');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final lineHeightTokens = parser.extractTokens(tokens, 'lineHeight');
    for (final token in lineHeightTokens.values) {
      final identifier = 'lineHeight${_capitalize(toIdentifier(token.path))}';
      final value = token.value;

      if (value is num) {
        buffer.writeln('  /// ${token.description ?? 'Line height multiplier: $value'}');
        buffer.writeln('  static const double $identifier = ${value.toDouble()};');
        buffer.writeln();
      } else {
        final dimension = parseDimension(value);
        if (dimension != null) {
          buffer.writeln('  /// ${token.description ?? 'Line height: ${dimension}px'}');
          buffer.writeln('  static const double $identifier = $dimension;');
          buffer.writeln();
        }
      }
    }

    // Font Weights
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Font Weights');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final fontWeightTokens = parser.extractTokens(tokens, 'fontWeight');
    for (final token in fontWeightTokens.values) {
      final identifier = 'fontWeight${_capitalize(toIdentifier(token.path))}';
      final value = token.value;

      if (value is int) {
        final weightClass = _fontWeightClass(value);
        buffer.writeln('  /// ${token.description ?? 'Font weight: $value'}');
        buffer.writeln('  static const FontWeight $identifier = FontWeight.$weightClass;');
        buffer.writeln();
      }
    }

    // Letter Spacing
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Letter Spacing');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final letterSpacingTokens = parser.extractTokens(tokens, 'letterSpacing');
    for (final token in letterSpacingTokens.values) {
      final identifier = 'letterSpacing${_capitalize(toIdentifier(token.path))}';
      final value = parseDimension(token.value);

      if (value != null) {
        buffer.writeln('  /// ${token.description ?? 'Letter spacing: ${value}px'}');
        buffer.writeln('  static const double $identifier = $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  String _fontWeightClass(int weight) {
    switch (weight) {
      case 100:
        return 'w100';
      case 200:
        return 'w200';
      case 300:
        return 'w300';
      case 400:
        return 'w400';
      case 500:
        return 'w500';
      case 600:
        return 'w600';
      case 700:
        return 'w700';
      case 800:
        return 'w800';
      case 900:
        return 'w900';
      default:
        return 'w400';
    }
  }
}

