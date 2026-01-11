import 'base_generator.dart';

/// Generates a theme integration class that wires all generated tokens
/// to the Garmisch theme system for easy consumer usage.
class ThemeIntegrationGenerator extends BaseGenerator {
  ThemeIntegrationGenerator({
    required super.parser,
    super.onWarning,
    super.prefix,
  });

  @override
  String get baseFileName => 'theme_integration';

  @override
  String get baseClassName => 'Theme';

  /// Helper to create prefixed file names
  String _prefixedFileName(String baseName) {
    final snakePrefix = prefix
        .replaceAllMapped(
          RegExp(r'([A-Z])'),
          (match) => '_${match.group(1)!.toLowerCase()}',
        )
        .replaceFirst(RegExp(r'^_'), '')
        .toLowerCase();
    return '${snakePrefix}_$baseName.g.dart';
  }

  /// Helper to create prefixed class names
  String _prefixedClassName(String baseName) => '$prefix$baseName';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: [
        'dart:ui',
        'package:flutter/widgets.dart',
        'package:garmisch/garmisch.dart',
        _prefixedFileName('colors'),
        _prefixedFileName('typography'),
        _prefixedFileName('spacing'),
        _prefixedFileName('sizing'),
        _prefixedFileName('border_radius'),
        _prefixedFileName('border_width'),
        _prefixedFileName('shadows'),
        _prefixedFileName('durations'),
        _prefixedFileName('easing'),
        _prefixedFileName('opacity'),
        _prefixedFileName('breakpoints'),
      ],
      description: 'Generated theme integration for easy setup',
    ));


    // Generate the main theme class
    buffer.writeln('/// Generated theme configuration');
    buffer.writeln('///');
    buffer.writeln('/// Usage:');
    buffer.writeln('/// ```dart');
    buffer.writeln('/// GTheme(');
    buffer.writeln('///   data: $className.light(),');
    buffer.writeln('///   child: MyApp(),');
    buffer.writeln('/// )');
    buffer.writeln('/// ```');
    buffer.writeln('///');
    buffer.writeln('/// Access tokens via context:');
    buffer.writeln('/// ```dart');
    buffer.writeln('/// context.gSpacing.md');
    buffer.writeln('/// context.gShadows.lg');
    buffer.writeln('/// context.gDurations.normal');
    buffer.writeln('/// ```');
    buffer.writeln('abstract final class $className {');
    buffer.writeln('  $className._();');
    buffer.writeln();

    // Generate token instances
    _generateTokenInstances(buffer);

    // Generate systemColors method
    _generateSystemColors(buffer, tokens);

    // Generate light theme factory
    _generateLightTheme(buffer, tokens);

    // Generate dark theme factory
    _generateDarkTheme(buffer, tokens);

    // Generate fromBrightness factory
    _generateFromBrightness(buffer);

    buffer.writeln('}');

    return buffer.toString();
  }


  void _generateTokenInstances(StringBuffer buffer) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Token Instances from Generated Files');
    buffer.writeln('  // ============================================');
    buffer.writeln();
    buffer.writeln('  /// Generated spacing tokens');
    buffer.writeln('  static const spacing = ${_prefixedClassName('Spacing')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated sizing tokens');
    buffer.writeln('  static const sizing = ${_prefixedClassName('Sizing')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated border radius tokens');
    buffer.writeln('  static const borderRadius = ${_prefixedClassName('BorderRadius')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated border width tokens');
    buffer.writeln('  static const borderWidth = ${_prefixedClassName('BorderWidth')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated shadow tokens');
    buffer.writeln('  static const shadows = ${_prefixedClassName('Shadows')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated duration tokens');
    buffer.writeln('  static const durations = ${_prefixedClassName('Durations')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated easing curve tokens');
    buffer.writeln('  static const easing = ${_prefixedClassName('Easing')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated opacity tokens');
    buffer.writeln('  static const opacity = ${_prefixedClassName('Opacity')}();');
    buffer.writeln();
    buffer.writeln('  /// Generated breakpoint tokens');
    buffer.writeln('  static const breakpoints = ${_prefixedClassName('Breakpoints')}();');
    buffer.writeln();
  }

  void _generateSystemColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  /// Creates GSystemColors from generated tokens');
    buffer.writeln('  ///');
    buffer.writeln('  /// Override individual color scales by passing them as parameters.');
    buffer.writeln('  /// Uses ${_prefixedClassName('SystemColors')} which maps design token palettes to semantic colors.');
    buffer.writeln('  static GSystemColors systemColors({');
    buffer.writeln('    GBrandColors? brand,');
    buffer.writeln('    GNeutralColors? neutral,');
    buffer.writeln('    GFeedbackColors? feedback,');
    buffer.writeln('  }) {');
    buffer.writeln('    return ${_prefixedClassName('SystemColors')}.create(');
    buffer.writeln('      brand: brand,');
    buffer.writeln('      neutral: neutral,');
    buffer.writeln('      feedback: feedback,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateLightTheme(StringBuffer buffer, Map<String, dynamic> tokens) {
    // Check for custom font family
    final fontFamilyTokens = parser.extractTokens(tokens, 'fontFamily');
    final hasSansFont = fontFamilyTokens.containsKey('sans');

    buffer.writeln('  /// Creates a light theme with generated tokens');
    buffer.writeln('  ///');
    buffer.writeln('  /// All generated tokens are automatically wired into the theme.');
    buffer.writeln('  /// Access them via context:');
    buffer.writeln('  /// ```dart');
    buffer.writeln('  /// context.gSpacing.md');
    buffer.writeln('  /// context.gShadows.lg');
    buffer.writeln('  /// context.gDurations.normal');
    buffer.writeln('  /// ```');
    buffer.writeln('  ///');
    buffer.writeln('  /// Override specific parts by passing parameters:');
    buffer.writeln('  /// ```dart');
    buffer.writeln('  /// $className.light(');
    buffer.writeln('  ///   fontFamily: "CustomFont",');
    buffer.writeln('  ///   systemColors: customSystemColors,');
    buffer.writeln('  /// )');
    buffer.writeln('  /// ```');
    buffer.writeln('  static GThemeData light({');
    buffer.writeln('    GSystemColors? systemColors,');
    buffer.writeln('    GColorScheme? colors,');
    buffer.writeln('    GTextTheme? textTheme,');
    buffer.writeln('    String? fontFamily,');
    buffer.writeln('    List<String>? fontFamilyFallback,');
    buffer.writeln('  }) {');
    buffer.writeln('    final effectiveSystemColors = systemColors ?? $className.systemColors();');
    buffer.writeln('    final effectiveColors = colors ?? GColorScheme.light(systemColors: effectiveSystemColors);');
    buffer.writeln('');
    if (hasSansFont) {
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? ${_prefixedClassName('Typography')}.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? ${_prefixedClassName('Typography')}.fontFamilyFallbackSans;');
    } else {
      buffer.writeln('    final effectiveFontFamily = fontFamily;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback;');
    }
    buffer.writeln('');
    buffer.writeln('    return GThemeData(');
    buffer.writeln('      colors: effectiveColors,');
    buffer.writeln('      textTheme: textTheme ?? GTextTheme.standard(');
    buffer.writeln('        fontFamily: effectiveFontFamily,');
    buffer.writeln('        fontFamilyFallback: effectiveFallback,');
    buffer.writeln('      ),');
    buffer.writeln('      fontFamily: effectiveFontFamily,');
    buffer.writeln('      // Generated token overrides');
    buffer.writeln('      spacing: spacing,');
    buffer.writeln('      sizing: sizing,');
    buffer.writeln('      borderRadius: borderRadius,');
    buffer.writeln('      borderWidth: borderWidth,');
    buffer.writeln('      shadows: shadows,');
    buffer.writeln('      durations: durations,');
    buffer.writeln('      easing: easing,');
    buffer.writeln('      opacity: opacity,');
    buffer.writeln('      breakpoints: breakpoints,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateDarkTheme(StringBuffer buffer, Map<String, dynamic> tokens) {
    final fontFamilyTokens = parser.extractTokens(tokens, 'fontFamily');
    final hasSansFont = fontFamilyTokens.containsKey('sans');

    buffer.writeln('  /// Creates a dark theme with generated tokens');
    buffer.writeln('  ///');
    buffer.writeln('  /// All generated tokens are automatically wired into the theme.');
    buffer.writeln('  /// Access them via context:');
    buffer.writeln('  /// ```dart');
    buffer.writeln('  /// context.gSpacing.md');
    buffer.writeln('  /// context.gShadows.lg');
    buffer.writeln('  /// context.gDurations.normal');
    buffer.writeln('  /// ```');
    buffer.writeln('  ///');
    buffer.writeln('  /// Override specific parts by passing parameters:');
    buffer.writeln('  /// ```dart');
    buffer.writeln('  /// $className.dark(');
    buffer.writeln('  ///   fontFamily: "CustomFont",');
    buffer.writeln('  /// )');
    buffer.writeln('  /// ```');
    buffer.writeln('  static GThemeData dark({');
    buffer.writeln('    GSystemColors? systemColors,');
    buffer.writeln('    GColorScheme? colors,');
    buffer.writeln('    GTextTheme? textTheme,');
    buffer.writeln('    String? fontFamily,');
    buffer.writeln('    List<String>? fontFamilyFallback,');
    buffer.writeln('  }) {');
    buffer.writeln('    final effectiveSystemColors = systemColors ?? $className.systemColors();');
    buffer.writeln('    final effectiveColors = colors ?? GColorScheme.dark(systemColors: effectiveSystemColors);');
    buffer.writeln('');
    if (hasSansFont) {
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? ${_prefixedClassName('Typography')}.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? ${_prefixedClassName('Typography')}.fontFamilyFallbackSans;');
    } else {
      buffer.writeln('    final effectiveFontFamily = fontFamily;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback;');
    }
    buffer.writeln('');
    buffer.writeln('    return GThemeData(');
    buffer.writeln('      colors: effectiveColors,');
    buffer.writeln('      textTheme: textTheme ?? GTextTheme.standard(');
    buffer.writeln('        fontFamily: effectiveFontFamily,');
    buffer.writeln('        fontFamilyFallback: effectiveFallback,');
    buffer.writeln('      ),');
    buffer.writeln('      fontFamily: effectiveFontFamily,');
    buffer.writeln('      // Generated token overrides');
    buffer.writeln('      spacing: spacing,');
    buffer.writeln('      sizing: sizing,');
    buffer.writeln('      borderRadius: borderRadius,');
    buffer.writeln('      borderWidth: borderWidth,');
    buffer.writeln('      shadows: shadows,');
    buffer.writeln('      durations: durations,');
    buffer.writeln('      easing: easing,');
    buffer.writeln('      opacity: opacity,');
    buffer.writeln('      breakpoints: breakpoints,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateFromBrightness(StringBuffer buffer) {
    buffer.writeln('  /// Creates a theme based on brightness');
    buffer.writeln('  ///');
    buffer.writeln('  /// Useful for system theme following:');
    buffer.writeln('  /// ```dart');
    buffer.writeln('  /// $className.fromBrightness(');
    buffer.writeln('  ///   brightness: MediaQuery.platformBrightnessOf(context),');
    buffer.writeln('  /// )');
    buffer.writeln('  /// ```');
    buffer.writeln('  static GThemeData fromBrightness({');
    buffer.writeln('    required Brightness brightness,');
    buffer.writeln('    GSystemColors? systemColors,');
    buffer.writeln('    GColorScheme? colors,');
    buffer.writeln('    GTextTheme? textTheme,');
    buffer.writeln('    String? fontFamily,');
    buffer.writeln('    List<String>? fontFamilyFallback,');
    buffer.writeln('  }) {');
    buffer.writeln('    return brightness == Brightness.light');
    buffer.writeln('        ? light(');
    buffer.writeln('            systemColors: systemColors,');
    buffer.writeln('            colors: colors,');
    buffer.writeln('            textTheme: textTheme,');
    buffer.writeln('            fontFamily: fontFamily,');
    buffer.writeln('            fontFamilyFallback: fontFamilyFallback,');
    buffer.writeln('          )');
    buffer.writeln('        : dark(');
    buffer.writeln('            systemColors: systemColors,');
    buffer.writeln('            colors: colors,');
    buffer.writeln('            textTheme: textTheme,');
    buffer.writeln('            fontFamily: fontFamily,');
    buffer.writeln('            fontFamilyFallback: fontFamilyFallback,');
    buffer.writeln('          );');
    buffer.writeln('  }');
  }
}

