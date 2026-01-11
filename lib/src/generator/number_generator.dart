import 'base_generator.dart';
import 'token_parser.dart';

/// Generates Dart number constants from DTCG number tokens (e.g., opacity)
class NumberGenerator extends BaseGenerator {
  NumberGenerator({
    required super.parser,
    required this.category,
    required this.generatedClassName,
    required this.generatedFileName,
    this.description,
    super.onWarning,
  });

  final String category;
  final String generatedClassName;
  final String generatedFileName;
  final String? description;

  @override
  String get fileName => generatedFileName;

  @override
  String get className => generatedClassName;

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:garmisch/garmisch.dart'],
      description: description ?? 'Generated $category tokens from design-tokens.json',
    ));

    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    final numberTokens = parser.extractTokens(tokens, category);

    for (final token in numberTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = token.value;

      // Check if it's an alias
      if (parser.isAlias(value)) {
        final resolved = parser.resolveAlias(value as String, category);
        if (resolved != null) {
          buffer.writeln('  /// ${token.description ?? token.path}');
          buffer.writeln('  static const double $identifier = $resolved;');
          buffer.writeln();
          continue;
        }
      }

      // Parse number value
      if (value is num) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        buffer.writeln('  static const double $identifier = ${value.toDouble()};');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// Creates an opacity generator
NumberGenerator createOpacityGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return NumberGenerator(
    parser: parser,
    category: 'opacity',
    generatedClassName: 'GOpacity',
    generatedFileName: 'opacity.g.dart',
    description: 'Generated opacity tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

