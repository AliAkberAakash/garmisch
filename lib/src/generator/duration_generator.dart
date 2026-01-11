import 'base_generator.dart';

/// Generates Dart duration constants from DTCG duration tokens
class DurationGenerator extends BaseGenerator {
  DurationGenerator({
    required super.parser,
    super.onWarning,
  });

  @override
  String get fileName => 'durations.g.dart';

  @override
  String get className => 'GDurations';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:garmisch/garmisch.dart'],
      description: 'Generated duration tokens from design-tokens.json',
    ));

    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    final durationTokens = parser.extractTokens(tokens, 'duration');

    for (final token in durationTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = token.value;

      // Check if it's an alias
      if (parser.isAlias(value)) {
        final resolved = parser.resolveAlias(value as String, 'duration');
        if (resolved != null) {
          buffer.writeln('  /// ${token.description ?? token.path}');
          buffer.writeln('  static const Duration $identifier = $resolved;');
          buffer.writeln();
          continue;
        }
      }

      // Parse duration value
      final ms = parseDuration(value);
      if (ms != null) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        if (ms == 0) {
          buffer.writeln('  static const Duration $identifier = Duration.zero;');
        } else {
          buffer.writeln('  static const Duration $identifier = Duration(milliseconds: $ms);');
        }
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

