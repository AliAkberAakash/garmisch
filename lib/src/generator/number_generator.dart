import 'base_generator.dart';
import 'token_parser.dart';

/// Generates Dart number constants from DTCG number tokens (e.g., opacity)
class NumberGenerator extends BaseGenerator {
  NumberGenerator({
    required super.parser,
    required this.category,
    required String baseClassName,
    required String baseFileName,
    this.extendsClassName,
    this.description,
    super.onWarning,
    super.prefix,
  }) : _baseClassName = baseClassName, _baseFileName = baseFileName;

  final String category;
  final String _baseClassName;
  final String _baseFileName;
  final String? extendsClassName;
  final String? description;

  @override
  String get baseFileName => _baseFileName;

  @override
  String get baseClassName => _baseClassName;

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['package:garmisch/garmisch.dart'],
      description: description ?? 'Generated $category tokens from design-tokens.json',
    ));

    final extendsClause = extendsClassName != null ? ' extends $extendsClassName' : '';
    buffer.writeln('class $className$extendsClause {');
    buffer.writeln('  const $className();');
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
          if (extendsClassName != null) {
            buffer.writeln('  @override');
          }
          buffer.writeln('  double get $identifier => $resolved;');
          buffer.writeln();
          continue;
        }
      }

      // Parse number value
      if (value is num) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        if (extendsClassName != null) {
          buffer.writeln('  @override');
        }
        buffer.writeln('  double get $identifier => ${value.toDouble()};');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// Creates an opacity generator
NumberGenerator createOpacityGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return NumberGenerator(
    parser: parser,
    category: 'opacity',
    baseClassName: 'Opacity',
    baseFileName: 'opacity',
    extendsClassName: 'GOpacityTokens',
    description: 'Generated opacity tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

