import 'base_generator.dart';
import 'token_parser.dart';

/// Generates Dart dimension constants from DTCG dimension tokens
class DimensionGenerator extends BaseGenerator {
  DimensionGenerator({
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

    final dimensionTokens = parser.extractTokens(tokens, category);

    for (final token in dimensionTokens.values) {
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

      // Parse dimension value
      final dimension = parseDimension(value);
      if (dimension != null) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        buffer.writeln('  static const double $identifier = $dimension;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// Creates a spacing generator
DimensionGenerator createSpacingGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return DimensionGenerator(
    parser: parser,
    category: 'spacing',
    generatedClassName: 'GSpacing',
    generatedFileName: 'spacing.g.dart',
    description: 'Generated spacing tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

/// Creates a sizing generator
DimensionGenerator createSizingGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return DimensionGenerator(
    parser: parser,
    category: 'sizing',
    generatedClassName: 'GSizing',
    generatedFileName: 'sizing.g.dart',
    description: 'Generated sizing tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

/// Creates a border radius generator
DimensionGenerator createBorderRadiusGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return DimensionGenerator(
    parser: parser,
    category: 'borderRadius',
    generatedClassName: 'GBorderRadius',
    generatedFileName: 'border_radius.g.dart',
    description: 'Generated border radius tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

/// Creates a border width generator
DimensionGenerator createBorderWidthGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return DimensionGenerator(
    parser: parser,
    category: 'borderWidth',
    generatedClassName: 'GBorderWidth',
    generatedFileName: 'border_width.g.dart',
    description: 'Generated border width tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

/// Creates a breakpoint generator
DimensionGenerator createBreakpointGenerator(TokenParser parser, {void Function(String)? onWarning}) {
  return DimensionGenerator(
    parser: parser,
    category: 'breakpoint',
    generatedClassName: 'GBreakpoints',
    generatedFileName: 'breakpoints.g.dart',
    description: 'Generated breakpoint tokens from design-tokens.json',
    onWarning: onWarning,
  );
}

