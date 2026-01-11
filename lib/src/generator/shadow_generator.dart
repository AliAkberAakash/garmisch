import 'base_generator.dart';

/// Generates Dart shadow constants from DTCG shadow tokens
class ShadowGenerator extends BaseGenerator {
  ShadowGenerator({
    required super.parser,
    super.onWarning,
    super.prefix,
  });

  @override
  String get baseFileName => 'shadows';

  @override
  String get baseClassName => 'Shadows';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:flutter/widgets.dart', 'package:garmisch/garmisch.dart'],
      description: 'Generated shadow tokens from design-tokens.json',
    ));

    buffer.writeln('class $className extends GShadowTokens {');
    buffer.writeln('  const $className();');
    buffer.writeln();

    final shadowTokens = parser.extractTokens(tokens, 'shadow');

    for (final token in shadowTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = token.value;

      // Check if it's an alias
      if (parser.isAlias(value)) {
        final resolved = parser.resolveAlias(value as String, 'shadow');
        if (resolved != null) {
          buffer.writeln('  /// ${token.description ?? token.path}');
          buffer.writeln('  @override');
          buffer.writeln('  List<BoxShadow> get $identifier => $resolved;');
          buffer.writeln();
          continue;
        }
      }

      // Parse shadow value
      final shadows = _parseShadows(value);
      if (shadows != null) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        buffer.writeln('  @override');
        if (shadows.isEmpty) {
          buffer.writeln('  List<BoxShadow> get $identifier => const [];');
        } else {
          buffer.writeln('  List<BoxShadow> get $identifier => const [');
          for (final shadow in shadows) {
            buffer.writeln('    $shadow,');
          }
          buffer.writeln('  ];');
        }
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  List<String>? _parseShadows(dynamic value) {
    if (value is! List) {
      onWarning?.call('Invalid shadow value: $value');
      return null;
    }

    if (value.isEmpty) {
      return [];
    }

    final shadows = <String>[];
    for (final shadowDef in value) {
      if (shadowDef is! Map<String, dynamic>) {
        onWarning?.call('Invalid shadow definition: $shadowDef');
        continue;
      }

      final color = _parseColorValue(shadowDef['color']);
      final offsetX = parseDimension(shadowDef['offsetX']) ?? 0;
      final offsetY = parseDimension(shadowDef['offsetY']) ?? 0;
      final blur = parseDimension(shadowDef['blur']) ?? 0;
      final spread = parseDimension(shadowDef['spread']) ?? 0;

      if (color != null) {
        shadows.add(
          'BoxShadow(color: Color($color), offset: Offset($offsetX, $offsetY), blurRadius: $blur, spreadRadius: $spread)',
        );
      }
    }

    return shadows;
  }

  String? _parseColorValue(dynamic value) {
    if (value == null) return null;
    if (value is! String) return null;

    final colorInt = parseColor(value);
    if (colorInt == null) return null;

    return '0x${colorInt.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }
}

