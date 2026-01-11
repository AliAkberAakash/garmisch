import 'base_generator.dart';

/// Generates Dart cubic bezier curve constants from DTCG cubicBezier tokens
class CubicBezierGenerator extends BaseGenerator {
  CubicBezierGenerator({
    required super.parser,
    super.onWarning,
  });

  @override
  String get fileName => 'easing.g.dart';

  @override
  String get className => 'GEasing';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:flutter/widgets.dart'],
      description: 'Generated easing curve tokens from design-tokens.json',
    ));

    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    final easingTokens = parser.extractTokens(tokens, 'easing');

    for (final token in easingTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = token.value;

      // Check if it's an alias
      if (parser.isAlias(value)) {
        final resolved = parser.resolveAlias(value as String, 'easing');
        if (resolved != null) {
          buffer.writeln('  /// ${token.description ?? token.path}');
          buffer.writeln('  static const Curve $identifier = $resolved;');
          buffer.writeln();
          continue;
        }
      }

      // Parse cubic bezier value
      final bezier = _parseCubicBezier(value);
      if (bezier != null) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        buffer.writeln('  static const Curve $identifier = Cubic(${bezier[0]}, ${bezier[1]}, ${bezier[2]}, ${bezier[3]});');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  List<double>? _parseCubicBezier(dynamic value) {
    if (value is! List) {
      onWarning?.call('Invalid cubicBezier value: $value');
      return null;
    }

    if (value.length != 4) {
      onWarning?.call('cubicBezier must have exactly 4 values: $value');
      return null;
    }

    try {
      return value.map((v) => (v as num).toDouble()).toList();
    } catch (e) {
      onWarning?.call('Invalid cubicBezier values: $value');
      return null;
    }
  }
}

