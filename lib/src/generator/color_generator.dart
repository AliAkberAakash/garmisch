import 'base_generator.dart';
import 'token_parser.dart';

/// Generates Dart color constants from DTCG color tokens
class ColorGenerator extends BaseGenerator {
  ColorGenerator({
    required super.parser,
    super.onWarning,
  });

  @override
  String get fileName => 'colors.g.dart';

  @override
  String get className => 'GColors';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['dart:ui'],
      description: 'Generated color tokens from design-tokens.json',
    ));

    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    final colorTokens = parser.extractTokens(tokens, 'color');

    // Group tokens by color family
    final colorFamilies = <String, List<TokenValue>>{};
    for (final token in colorTokens.values) {
      final parts = token.path.split('.');
      final family = parts.first;
      colorFamilies.putIfAbsent(family, () => []).add(token);
    }

    // Generate constants for each color family
    for (final family in colorFamilies.keys) {
      buffer.writeln('  // ============================================');
      buffer.writeln('  // ${_capitalize(family)} Colors');
      buffer.writeln('  // ============================================');
      buffer.writeln();

      for (final token in colorFamilies[family]!) {
        final identifier = _getColorIdentifier(token.path);
        final value = token.value;

        // Check if it's an alias
        if (parser.isAlias(value)) {
          final resolved = parser.resolveAlias(value as String, 'color');
          if (resolved != null) {
            buffer.writeln('  /// ${token.description ?? token.path}');
            buffer.writeln('  static const Color $identifier = $resolved;');
            buffer.writeln();
            continue;
          }
        }

        // Parse direct color value
        final colorInt = parseColor(value);
        if (colorInt != null) {
          final hex = colorInt.toRadixString(16).toUpperCase().padLeft(8, '0');
          buffer.writeln('  /// ${token.description ?? token.path}');
          buffer.writeln('  static const Color $identifier = Color(0x$hex);');
          buffer.writeln();
        }
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  String _getColorIdentifier(String path) {
    final parts = path.split('.');
    if (parts.length == 1) {
      return parts.first;
    }
    // "gray.500" → "gray500", "base.white" → "white"
    if (parts.first == 'base') {
      return parts.last;
    }
    return '${parts.first}${parts.sublist(1).join('')}';
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}

