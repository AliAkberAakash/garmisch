/// Garmisch Design Token Generator
///
/// Provides tools to generate Dart code from DTCG (Design Tokens Community Group)
/// format JSON files.
///
/// Usage:
/// ```dart
/// import 'package:garmisch/generator.dart';
///
/// final parser = TokenParser();
/// final tokens = parser.parseFile('design-tokens.json');
/// final generator = ColorGenerator(parser: parser);
/// final code = generator.generate(tokens);
/// ```
library;

export 'token_parser.dart';
export 'base_generator.dart';
export 'color_generator.dart';
export 'dimension_generator.dart';
export 'duration_generator.dart';
export 'cubic_bezier_generator.dart';
export 'shadow_generator.dart';
export 'number_generator.dart';
export 'typography_generator.dart';
export 'theme_integration_generator.dart';

