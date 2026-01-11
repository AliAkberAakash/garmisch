import 'base_generator.dart';
import 'token_parser.dart';

/// Generates Dart dimension constants from DTCG dimension tokens
class DimensionGenerator extends BaseGenerator {
  DimensionGenerator({
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

    final dimensionTokens = parser.extractTokens(tokens, category);

    for (final token in dimensionTokens.values) {
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

      // Parse dimension value
      final dimension = parseDimension(value);
      if (dimension != null) {
        buffer.writeln('  /// ${token.description ?? token.path}');
        if (extendsClassName != null) {
          buffer.writeln('  @override');
        }
        buffer.writeln('  double get $identifier => $dimension;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');

    return buffer.toString();
  }
}

/// Creates a spacing generator
DimensionGenerator createSpacingGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return DimensionGenerator(
    parser: parser,
    category: 'spacing',
    baseClassName: 'Spacing',
    baseFileName: 'spacing',
    extendsClassName: 'GSpacingTokens',
    description: 'Generated spacing tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

/// Creates a sizing generator
DimensionGenerator createSizingGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return DimensionGenerator(
    parser: parser,
    category: 'sizing',
    baseClassName: 'Sizing',
    baseFileName: 'sizing',
    extendsClassName: 'GSizingTokens',
    description: 'Generated sizing tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

/// Creates a border radius generator
DimensionGenerator createBorderRadiusGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return DimensionGenerator(
    parser: parser,
    category: 'borderRadius',
    baseClassName: 'BorderRadius',
    baseFileName: 'border_radius',
    extendsClassName: 'GBorderRadiusTokens',
    description: 'Generated border radius tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

/// Creates a border width generator
DimensionGenerator createBorderWidthGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return DimensionGenerator(
    parser: parser,
    category: 'borderWidth',
    baseClassName: 'BorderWidth',
    baseFileName: 'border_width',
    extendsClassName: 'GBorderWidthTokens',
    description: 'Generated border width tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

/// Creates a breakpoint generator
DimensionGenerator createBreakpointGenerator(TokenParser parser, {void Function(String)? onWarning, String? prefix}) {
  return DimensionGenerator(
    parser: parser,
    category: 'breakpoint',
    baseClassName: 'Breakpoints',
    baseFileName: 'breakpoints',
    extendsClassName: 'GBreakpointTokens',
    description: 'Generated breakpoint tokens from design-tokens.json',
    onWarning: onWarning,
    prefix: prefix,
  );
}

