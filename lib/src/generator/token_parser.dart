import 'dart:convert';
import 'dart:io';

/// DTCG (Design Tokens Community Group) token parser
///
/// Parses design tokens following the DTCG format specification:
/// https://tr.designtokens.org/format/
class TokenParser {
  TokenParser({
    this.onWarning,
  });

  /// Callback for warnings during parsing
  final void Function(String message)? onWarning;

  /// Parses a JSON file and returns the parsed tokens
  Map<String, dynamic> parseFile(String filePath) {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw FileSystemException('Token file not found', filePath);
    }

    final content = file.readAsStringSync();
    return parseJson(content);
  }

  /// Parses a JSON string and returns the parsed tokens
  Map<String, dynamic> parseJson(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return json;
    } catch (e) {
      throw FormatException('Invalid JSON: $e');
    }
  }

  /// Extracts all tokens of a specific type from the parsed JSON
  ///
  /// Returns a map of token paths to their values.
  /// For example: `{"gray.50": "#F9FAFB", "gray.100": "#F3F4F6"}`
  Map<String, TokenValue> extractTokens(
    Map<String, dynamic> json,
    String category, {
    String? expectedType,
  }) {
    final tokens = <String, TokenValue>{};
    final categoryData = json[category];

    if (categoryData == null) {
      _warn('Category "$category" not found in tokens');
      return tokens;
    }

    if (categoryData is! Map<String, dynamic>) {
      _warn('Category "$category" is not a valid object');
      return tokens;
    }

    _extractTokensRecursive(
      categoryData,
      '',
      tokens,
      expectedType: expectedType,
    );

    return tokens;
  }

  void _extractTokensRecursive(
    Map<String, dynamic> data,
    String prefix,
    Map<String, TokenValue> tokens, {
    String? expectedType,
  }) {
    for (final entry in data.entries) {
      final key = entry.key;
      final value = entry.value;

      // Skip DTCG metadata keys
      if (key.startsWith('\$')) continue;

      final path = prefix.isEmpty ? key : '$prefix.$key';

      if (value is Map<String, dynamic>) {
        // Check if this is a token (has $value) or a group
        if (value.containsKey('\$value')) {
          final type = value['\$type'] as String?;
          final tokenValue = value['\$value'];

          if (expectedType != null && type != expectedType) {
            _warn(
              'Token "$path" has type "$type" but expected "$expectedType"',
            );
          }

          tokens[path] = TokenValue(
            path: path,
            type: type ?? 'unknown',
            value: tokenValue,
            description: value['\$description'] as String?,
          );
        } else {
          // It's a group, recurse
          _extractTokensRecursive(
            value,
            path,
            tokens,
            expectedType: expectedType,
          );
        }
      }
    }
  }

  /// Resolves an alias reference to a Dart symbol name
  ///
  /// For example: `{color.blue.500}` → `GColors.blue500`
  String? resolveAlias(String value, String tokenType) {
    if (!value.startsWith('{') || !value.endsWith('}')) {
      return null;
    }

    final aliasPath = value.substring(1, value.length - 1);
    final parts = aliasPath.split('.');

    if (parts.isEmpty) {
      _warn('Invalid alias reference: $value');
      return null;
    }

    // Map category to class name
    final category = parts.first;
    final symbolParts = parts.sublist(1);

    switch (category) {
      case 'color':
        // {color.blue.500} → GColors.blue500
        if (symbolParts.length >= 2) {
          final colorName = symbolParts[0];
          final shade = symbolParts[1];
          return 'GColors.$colorName$shade';
        } else if (symbolParts.length == 1) {
          return 'GColors.${symbolParts[0]}';
        }
        break;
      case 'spacing':
        return 'GSpacing.${_toCamelCase(symbolParts)}';
      case 'sizing':
        return 'GSizing.${_toCamelCase(symbolParts)}';
      case 'borderRadius':
        return 'GBorderRadius.${_toCamelCase(symbolParts)}';
      case 'opacity':
        return 'GOpacity.${_toCamelCase(symbolParts)}';
      case 'duration':
        return 'GDurations.${_toCamelCase(symbolParts)}';
      case 'easing':
        return 'GEasing.${_toCamelCase(symbolParts)}';
      case 'fontFamily':
        return 'GTypography.fontFamily${_capitalize(symbolParts.join(''))}';
      case 'fontSize':
        return 'GTypography.fontSize${_capitalize(symbolParts.join(''))}';
      case 'fontWeight':
        return 'GTypography.fontWeight${_capitalize(symbolParts.join(''))}';
      case 'lineHeight':
        return 'GTypography.lineHeight${_capitalize(symbolParts.join(''))}';
      case 'letterSpacing':
        return 'GTypography.letterSpacing${_capitalize(symbolParts.join(''))}';
    }

    _warn('Unknown alias category: $category in $value');
    return null;
  }

  /// Checks if a value is an alias reference
  bool isAlias(dynamic value) {
    if (value is! String) return false;
    return value.startsWith('{') && value.endsWith('}');
  }

  String _toCamelCase(List<String> parts) {
    if (parts.isEmpty) return '';
    return parts.first +
        parts.skip(1).map((p) => _capitalize(p)).join('');
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  void _warn(String message) {
    onWarning?.call(message);
  }
}

/// Represents a parsed token value
class TokenValue {
  const TokenValue({
    required this.path,
    required this.type,
    required this.value,
    this.description,
  });

  /// The dot-separated path of the token (e.g., "gray.500")
  final String path;

  /// The DTCG type (e.g., "color", "dimension", "duration")
  final String type;

  /// The raw value from the JSON
  final dynamic value;

  /// Optional description
  final String? description;

  @override
  String toString() => 'TokenValue($path: $value [$type])';
}

