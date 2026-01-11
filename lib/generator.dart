/// Garmisch Design Token Generator
///
/// Provides tools to generate Dart code from DTCG (Design Tokens Community Group)
/// format JSON files.
///
/// This is a separate entry point for the generator tools. Use this for
/// code generation tasks, not for runtime theming.
///
/// ## Usage
///
/// ### CLI (Recommended)
///
/// Run the generator from your project root:
///
/// ```bash
/// dart run garmisch:generate_tokens --input design-tokens.json --output lib/generated/
/// ```
///
/// ### Programmatic
///
/// ```dart
/// import 'package:garmisch/generator.dart';
///
/// void main() {
///   final parser = TokenParser();
///   final tokens = parser.parseFile('design-tokens.json');
///
///   final colorGenerator = ColorGenerator(parser: parser);
///   final colorCode = colorGenerator.generate(tokens);
///
///   File('lib/generated/colors.g.dart').writeAsStringSync(colorCode);
/// }
/// ```
///
/// ## DTCG Format
///
/// The input file should follow the Design Tokens Community Group format:
/// https://tr.designtokens.org/format/
///
/// Example token structure:
///
/// ```json
/// {
///   "color": {
///     "primary": {
///       "$type": "color",
///       "$value": "#3B82F6"
///     }
///   },
///   "spacing": {
///     "md": {
///       "$type": "dimension",
///       "$value": "16px"
///     }
///   }
/// }
/// ```
library generator;

export 'src/generator/generator.dart';

