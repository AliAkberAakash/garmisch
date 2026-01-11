import 'base_generator.dart';
import 'token_parser.dart';

/// Configuration for system colors read from design tokens
class SystemColorsConfig {
  final Map<String, String> brand; // primary -> blue, secondary -> purple, etc.
  final String neutral; // gray
  final Map<String, String> feedback; // error -> red, warning -> amber, etc.

  const SystemColorsConfig({
    required this.brand,
    required this.neutral,
    required this.feedback,
  });

  /// Gets all referenced color palettes
  Set<String> get referencedPalettes => {
        ...brand.values,
        neutral,
        ...feedback.values,
      };

  /// Default configuration if no systemColors section is found
  static const SystemColorsConfig defaultConfig = SystemColorsConfig(
    brand: {
      'primary': 'blue',
      'secondary': 'purple',
      'tertiary': 'teal',
    },
    neutral: 'gray',
    feedback: {
      'error': 'red',
      'warning': 'amber',
      'success': 'green',
      'info': 'sky',
    },
  );
}

/// Generates Dart system color tokens from DTCG color tokens
///
/// This generator reads the `systemColors` configuration from design tokens
/// and creates color scales for the configured system colors:
/// - Brand colors (primary, secondary, tertiary)
/// - Neutral colors
/// - Feedback colors (error, warning, success, info)
///
/// The systemColors section in design-tokens.json maps semantic roles to color palettes:
/// ```json
/// "systemColors": {
///   "brand": {
///     "primary": { "$type": "reference", "$value": "blue" },
///     "secondary": { "$type": "reference", "$value": "purple" },
///     "tertiary": { "$type": "reference", "$value": "teal" }
///   },
///   "neutral": { "$type": "reference", "$value": "gray" },
///   "feedback": {
///     "error": { "$type": "reference", "$value": "red" },
///     "warning": { "$type": "reference", "$value": "amber" },
///     "success": { "$type": "reference", "$value": "green" },
///     "info": { "$type": "reference", "$value": "sky" }
///   }
/// }
/// ```
class ColorGenerator extends BaseGenerator {
  ColorGenerator({
    required super.parser,
    super.onWarning,
    super.prefix,
  });

  @override
  String get baseFileName => 'colors';

  @override
  String get baseClassName => 'SystemColors';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: ['dart:ui', 'package:garmisch/garmisch.dart'],
      description: 'Generated system color tokens from design-tokens.json',
    ));

    // Parse system colors configuration
    final config = _parseSystemColorsConfig(tokens);

    // Parse color tokens
    final colorTokens = parser.extractTokens(tokens, 'color');

    // Group tokens by color family
    final colorFamilies = <String, Map<String, TokenValue>>{};
    for (final token in colorTokens.values) {
      final parts = token.path.split('.');
      final family = parts.first;
      final shade = parts.length > 1 ? parts[1] : null;
      if (shade != null) {
        colorFamilies.putIfAbsent(family, () => {})[shade] = token;
      }
    }

    // Get only the referenced palettes
    final referencedPalettes = config.referencedPalettes;

    // Generate the main class
    buffer.writeln('/// Generated system colors from design tokens');
    buffer.writeln('///');
    buffer.writeln('/// This class is generated based on the systemColors configuration');
    buffer.writeln('/// in your design-tokens.json file. To change the color mappings,');
    buffer.writeln('/// update the systemColors section in your tokens file.');
    buffer.writeln('///');
    buffer.writeln('/// Current configuration:');
    buffer.writeln('/// - Primary: ${config.brand['primary']}');
    buffer.writeln('/// - Secondary: ${config.brand['secondary']}');
    buffer.writeln('/// - Tertiary: ${config.brand['tertiary']}');
    buffer.writeln('/// - Neutral: ${config.neutral}');
    buffer.writeln('/// - Error: ${config.feedback['error']}');
    buffer.writeln('/// - Warning: ${config.feedback['warning']}');
    buffer.writeln('/// - Success: ${config.feedback['success']}');
    buffer.writeln('/// - Info: ${config.feedback['info']}');
    buffer.writeln('///');
    buffer.writeln('/// Usage:');
    buffer.writeln('/// ```dart');
    buffer.writeln('/// final colors = $className.create();');
    buffer.writeln('/// ```');
    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    // Generate color scale helper method (only for referenced palettes)
    _generateColorScaleMethod(buffer, colorFamilies, referencedPalettes);

    // Generate brand colors
    _generateBrandColors(buffer, config, colorFamilies);

    // Generate neutral colors
    _generateNeutralColors(buffer, config, colorFamilies);

    // Generate feedback colors
    _generateFeedbackColors(buffer, config, colorFamilies);

    // Generate the create method
    _generateCreateMethod(buffer, config);

    buffer.writeln('}');

    return buffer.toString();
  }

  /// Parses the systemColors configuration from design tokens
  SystemColorsConfig _parseSystemColorsConfig(Map<String, dynamic> tokens) {
    final systemColors = tokens['systemColors'];
    if (systemColors == null || systemColors is! Map<String, dynamic>) {
      onWarning?.call(
          'No systemColors configuration found in design tokens. Using default mappings.');
      return SystemColorsConfig.defaultConfig;
    }

    // Parse brand colors
    final brandConfig = <String, String>{};
    final brand = systemColors['brand'];
    if (brand is Map<String, dynamic>) {
      for (final entry in brand.entries) {
        if (entry.key.startsWith('\$')) continue; // Skip $description, $type, etc.
        final value = entry.value;
        if (value is Map<String, dynamic> && value['\$value'] != null) {
          brandConfig[entry.key] = value['\$value'] as String;
        } else if (value is String) {
          brandConfig[entry.key] = value;
        }
      }
    }

    // Parse neutral color
    String neutralPalette = 'gray';
    final neutral = systemColors['neutral'];
    if (neutral is Map<String, dynamic> && neutral['\$value'] != null) {
      neutralPalette = neutral['\$value'] as String;
    } else if (neutral is String) {
      neutralPalette = neutral;
    }

    // Parse feedback colors
    final feedbackConfig = <String, String>{};
    final feedback = systemColors['feedback'];
    if (feedback is Map<String, dynamic>) {
      for (final entry in feedback.entries) {
        if (entry.key.startsWith('\$')) continue; // Skip $description, $type, etc.
        final value = entry.value;
        if (value is Map<String, dynamic> && value['\$value'] != null) {
          feedbackConfig[entry.key] = value['\$value'] as String;
        } else if (value is String) {
          feedbackConfig[entry.key] = value;
        }
      }
    }

    // Use defaults for any missing values
    return SystemColorsConfig(
      brand: brandConfig.isEmpty
          ? SystemColorsConfig.defaultConfig.brand
          : {
              'primary': brandConfig['primary'] ?? 'blue',
              'secondary': brandConfig['secondary'] ?? 'purple',
              'tertiary': brandConfig['tertiary'] ?? 'teal',
            },
      neutral: neutralPalette,
      feedback: feedbackConfig.isEmpty
          ? SystemColorsConfig.defaultConfig.feedback
          : {
              'error': feedbackConfig['error'] ?? 'red',
              'warning': feedbackConfig['warning'] ?? 'amber',
              'success': feedbackConfig['success'] ?? 'green',
              'info': feedbackConfig['info'] ?? 'sky',
            },
    );
  }

  void _generateColorScaleMethod(
    StringBuffer buffer,
    Map<String, Map<String, TokenValue>> colorFamilies,
    Set<String> referencedPalettes,
  ) {
    final requiredShades = [
      '50',
      '100',
      '200',
      '300',
      '400',
      '500',
      '600',
      '700',
      '800',
      '900',
      '950'
    ];

    buffer.writeln('  /// Creates a color scale from a color family');
    buffer.writeln('  static GColorScale _colorScale(String family) {');
    buffer.writeln('    switch (family) {');

    for (final family in colorFamilies.keys) {
      // Only include referenced palettes
      if (!referencedPalettes.contains(family)) {
        continue;
      }

      final shades = colorFamilies[family]!;

      // Skip families that don't have all required shades
      final hasAllShades =
          requiredShades.every((shade) => shades.containsKey(shade));
      if (!hasAllShades) {
        onWarning?.call(
            'Color family "$family" is missing some shade values. Skipping.');
        continue;
      }

      buffer.writeln("      case '$family':");
      buffer.writeln('        return GColorScale(');
      for (final shade in requiredShades) {
        final token = shades[shade]!;
        final colorInt = parseColor(token.value);
        if (colorInt != null) {
          final hex = colorInt.toRadixString(16).toUpperCase().padLeft(8, '0');
          buffer.writeln('          shade$shade: const Color(0x$hex),');
        }
      }
      buffer.writeln('        );');
    }

    buffer.writeln('      default:');
    buffer.writeln(
        '        throw ArgumentError(\'Unknown color family: \$family\');');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateBrandColors(
    StringBuffer buffer,
    SystemColorsConfig config,
    Map<String, Map<String, TokenValue>> colorFamilies,
  ) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Brand Colors');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    for (final entry in config.brand.entries) {
      final semantic = entry.key;
      final palette = entry.value;
      if (colorFamilies.containsKey(palette)) {
        buffer.writeln(
            '  /// ${_capitalize(semantic)} brand color scale (mapped from $palette)');
        buffer.writeln("  static GColorScale get $semantic => _colorScale('$palette');");
        buffer.writeln();
      } else {
        onWarning?.call(
            'Brand color "$semantic" references unknown palette "$palette"');
      }
    }
  }

  void _generateNeutralColors(
    StringBuffer buffer,
    SystemColorsConfig config,
    Map<String, Map<String, TokenValue>> colorFamilies,
  ) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Neutral Colors');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    final palette = config.neutral;
    if (colorFamilies.containsKey(palette)) {
      buffer.writeln('  /// Neutral color scale (mapped from $palette)');
      buffer.writeln("  static GColorScale get neutral => _colorScale('$palette');");
      buffer.writeln();

      // Also generate GNeutralColors helper
      buffer.writeln('  /// Creates GNeutralColors from the neutral palette');
      buffer.writeln('  static GNeutralColors get neutralColors {');
      buffer.writeln('    final scale = neutral;');
      buffer.writeln('    return GNeutralColors(');
      buffer.writeln('      shade50: scale.shade50,');
      buffer.writeln('      shade100: scale.shade100,');
      buffer.writeln('      shade200: scale.shade200,');
      buffer.writeln('      shade300: scale.shade300,');
      buffer.writeln('      shade400: scale.shade400,');
      buffer.writeln('      shade500: scale.shade500,');
      buffer.writeln('      shade600: scale.shade600,');
      buffer.writeln('      shade700: scale.shade700,');
      buffer.writeln('      shade800: scale.shade800,');
      buffer.writeln('      shade900: scale.shade900,');
      buffer.writeln('      shade950: scale.shade950,');
      buffer.writeln('    );');
      buffer.writeln('  }');
      buffer.writeln();
    } else {
      onWarning?.call('Neutral color references unknown palette "$palette"');
    }
  }

  void _generateFeedbackColors(
    StringBuffer buffer,
    SystemColorsConfig config,
    Map<String, Map<String, TokenValue>> colorFamilies,
  ) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Feedback Colors');
    buffer.writeln('  // ============================================');
    buffer.writeln();

    for (final entry in config.feedback.entries) {
      final semantic = entry.key;
      final palette = entry.value;
      if (colorFamilies.containsKey(palette)) {
        buffer.writeln(
            '  /// ${_capitalize(semantic)} feedback color scale (mapped from $palette)');
        buffer.writeln("  static GColorScale get $semantic => _colorScale('$palette');");
        buffer.writeln();
      } else {
        onWarning?.call(
            'Feedback color "$semantic" references unknown palette "$palette"');
      }
    }
  }

  void _generateCreateMethod(StringBuffer buffer, SystemColorsConfig config) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Factory Method');
    buffer.writeln('  // ============================================');
    buffer.writeln();
    buffer.writeln(
        '  /// Creates a complete GSystemColors instance from generated tokens');
    buffer.writeln('  ///');
    buffer.writeln(
        '  /// Override individual color scales by passing them as parameters.');
    buffer.writeln('  static GSystemColors create({');
    buffer.writeln('    GBrandColors? brand,');
    buffer.writeln('    GNeutralColors? neutral,');
    buffer.writeln('    GFeedbackColors? feedback,');
    buffer.writeln('  }) {');
    buffer.writeln('    return GSystemColors(');
    buffer.writeln('      brand: brand ?? GBrandColors(');

    // Use the actual brand config
    for (final entry in config.brand.entries) {
      buffer.writeln('        ${entry.key}: ${entry.key},');
    }

    buffer.writeln('      ),');
    buffer.writeln('      neutral: neutral ?? neutralColors,');
    buffer.writeln('      feedback: feedback ?? GFeedbackColors(');

    // Use the actual feedback config
    for (final entry in config.feedback.entries) {
      buffer.writeln('        ${entry.key}: ${entry.key},');
    }

    buffer.writeln('      ),');
    buffer.writeln('    );');
    buffer.writeln('  }');
  }

  String _capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }
}

