import 'base_generator.dart';

/// Generates a theme integration class that wires all generated tokens
/// to the Garmisch theme system for easy consumer usage.
class ThemeIntegrationGenerator extends BaseGenerator {
  ThemeIntegrationGenerator({
    required super.parser,
    super.onWarning,
  });

  @override
  String get fileName => 'theme_integration.g.dart';

  @override
  String get className => 'GeneratedTheme';

  @override
  String generate(Map<String, dynamic> tokens) {
    final buffer = StringBuffer();

    buffer.write(generateHeader(
      imports: [
        'dart:ui',
        'package:flutter/widgets.dart',
        'package:garmisch/garmisch.dart',
        'colors.g.dart',
        'typography.g.dart',
        'spacing.g.dart',
        'sizing.g.dart',
        'border_radius.g.dart',
        'border_width.g.dart',
        'shadows.g.dart',
        'durations.g.dart',
        'easing.g.dart',
        'opacity.g.dart',
        'breakpoints.g.dart',
      ],
      description: 'Generated theme integration for easy setup',
    ));

    // Generate token override classes
    _generateSpacingTokens(buffer, tokens);
    _generateSizingTokens(buffer, tokens);
    _generateBorderRadiusTokens(buffer, tokens);
    _generateBorderWidthTokens(buffer, tokens);
    _generateShadowTokens(buffer, tokens);
    _generateDurationTokens(buffer, tokens);
    _generateEasingTokens(buffer, tokens);
    _generateOpacityTokens(buffer, tokens);
    _generateBreakpointTokens(buffer, tokens);

    // Generate the main theme class
    buffer.writeln('/// Generated theme configuration');
    buffer.writeln('///');
    buffer.writeln('/// Usage:');
    buffer.writeln('/// ```dart');
    buffer.writeln('/// GTheme(');
    buffer.writeln('///   data: GeneratedTheme.light(),');
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

  void _generateSpacingTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated spacing tokens');
    buffer.writeln('class GeneratedSpacingTokens extends GSpacingTokens {');
    buffer.writeln('  const GeneratedSpacingTokens();');
    buffer.writeln();

    final spacingTokens = parser.extractTokens(tokens, 'spacing');
    for (final token in spacingTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = parseDimension(token.value);
      if (value != null) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateSizingTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated sizing tokens');
    buffer.writeln('class GeneratedSizingTokens extends GSizingTokens {');
    buffer.writeln('  const GeneratedSizingTokens();');
    buffer.writeln();

    final sizingTokens = parser.extractTokens(tokens, 'sizing');
    for (final token in sizingTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = parseDimension(token.value);
      if (value != null) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateBorderRadiusTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated border radius tokens');
    buffer.writeln('class GeneratedBorderRadiusTokens extends GBorderRadiusTokens {');
    buffer.writeln('  const GeneratedBorderRadiusTokens();');
    buffer.writeln();

    final borderRadiusTokens = parser.extractTokens(tokens, 'borderRadius');
    for (final token in borderRadiusTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = parseDimension(token.value);
      if (value != null) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateBorderWidthTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated border width tokens');
    buffer.writeln('class GeneratedBorderWidthTokens extends GBorderWidthTokens {');
    buffer.writeln('  const GeneratedBorderWidthTokens();');
    buffer.writeln();

    final borderWidthTokens = parser.extractTokens(tokens, 'borderWidth');
    for (final token in borderWidthTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = parseDimension(token.value);
      if (value != null) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateShadowTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated shadow tokens');
    buffer.writeln('class GeneratedShadowTokens extends GShadowTokens {');
    buffer.writeln('  const GeneratedShadowTokens();');
    buffer.writeln();

    final shadowTokens = parser.extractTokens(tokens, 'shadow');
    for (final token in shadowTokens.values) {
      final identifier = toIdentifier(token.path);
      final shadows = _parseShadows(token.value);
      if (shadows != null) {
        buffer.writeln('  @override');
        if (shadows.isEmpty) {
          buffer.writeln('  List<BoxShadow> get $identifier => const [];');
        } else {
          buffer.writeln('  List<BoxShadow> get $identifier => const [');
          for (final shadow in shadows) {
            buffer.writeln('    $shadow,');
          }
          buffer.writeln('  ];');
        }
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateDurationTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated duration tokens');
    buffer.writeln('class GeneratedDurationTokens extends GDurationTokens {');
    buffer.writeln('  const GeneratedDurationTokens();');
    buffer.writeln();

    final durationTokens = parser.extractTokens(tokens, 'duration');
    for (final token in durationTokens.values) {
      final identifier = toIdentifier(token.path);
      final ms = parseDuration(token.value);
      if (ms != null) {
        buffer.writeln('  @override');
        if (ms == 0) {
          buffer.writeln('  Duration get $identifier => Duration.zero;');
        } else {
          buffer.writeln('  Duration get $identifier => const Duration(milliseconds: $ms);');
        }
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateEasingTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated easing curve tokens');
    buffer.writeln('class GeneratedEasingTokens extends GEasingTokens {');
    buffer.writeln('  const GeneratedEasingTokens();');
    buffer.writeln();

    final easingTokens = parser.extractTokens(tokens, 'easing');
    for (final token in easingTokens.values) {
      final identifier = toIdentifier(token.path);
      final bezier = _parseCubicBezier(token.value);
      if (bezier != null) {
        buffer.writeln('  @override');
        buffer.writeln('  Curve get $identifier => const Cubic(${bezier[0]}, ${bezier[1]}, ${bezier[2]}, ${bezier[3]});');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateOpacityTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated opacity tokens');
    buffer.writeln('class GeneratedOpacityTokens extends GOpacityTokens {');
    buffer.writeln('  const GeneratedOpacityTokens();');
    buffer.writeln();

    final opacityTokens = parser.extractTokens(tokens, 'opacity');
    for (final token in opacityTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = token.value;
      if (value is num) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => ${value.toDouble()};');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateBreakpointTokens(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('/// Generated breakpoint tokens');
    buffer.writeln('class GeneratedBreakpointTokens extends GBreakpointTokens {');
    buffer.writeln('  const GeneratedBreakpointTokens();');
    buffer.writeln();

    final breakpointTokens = parser.extractTokens(tokens, 'breakpoint');
    for (final token in breakpointTokens.values) {
      final identifier = toIdentifier(token.path);
      final value = parseDimension(token.value);
      if (value != null) {
        buffer.writeln('  @override');
        buffer.writeln('  double get $identifier => $value;');
        buffer.writeln();
      }
    }

    buffer.writeln('}');
    buffer.writeln();
  }

  void _generateTokenInstances(StringBuffer buffer) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Generated Token Instances');
    buffer.writeln('  // ============================================');
    buffer.writeln();
    buffer.writeln('  /// Generated spacing tokens');
    buffer.writeln('  static const spacing = GeneratedSpacingTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated sizing tokens');
    buffer.writeln('  static const sizing = GeneratedSizingTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated border radius tokens');
    buffer.writeln('  static const borderRadius = GeneratedBorderRadiusTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated border width tokens');
    buffer.writeln('  static const borderWidth = GeneratedBorderWidthTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated shadow tokens');
    buffer.writeln('  static const shadows = GeneratedShadowTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated duration tokens');
    buffer.writeln('  static const durations = GeneratedDurationTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated easing curve tokens');
    buffer.writeln('  static const easing = GeneratedEasingTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated opacity tokens');
    buffer.writeln('  static const opacity = GeneratedOpacityTokens();');
    buffer.writeln();
    buffer.writeln('  /// Generated breakpoint tokens');
    buffer.writeln('  static const breakpoints = GeneratedBreakpointTokens();');
    buffer.writeln();
  }

  void _generateSystemColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  /// Creates GSystemColors from generated tokens');
    buffer.writeln('  ///');
    buffer.writeln('  /// Override individual color scales by passing them as parameters.');
    buffer.writeln('  static GSystemColors systemColors({');
    buffer.writeln('    GBrandColors? brand,');
    buffer.writeln('    GNeutralColors? neutral,');
    buffer.writeln('    GFeedbackColors? feedback,');
    buffer.writeln('  }) {');
    buffer.writeln('    return GSystemColors(');
    buffer.writeln('      brand: brand ?? _defaultBrandColors(),');
    buffer.writeln('      neutral: neutral ?? _defaultNeutralColors(),');
    buffer.writeln('      feedback: feedback ?? _defaultFeedbackColors(),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();

    // Generate default brand colors
    _generateDefaultBrandColors(buffer, tokens);

    // Generate default neutral colors
    _generateDefaultNeutralColors(buffer, tokens);

    // Generate default feedback colors
    _generateDefaultFeedbackColors(buffer, tokens);
  }

  void _generateDefaultBrandColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  static GBrandColors _defaultBrandColors() {');
    buffer.writeln('    return GBrandColors(');
    buffer.writeln('      primary: GColorScale(');
    buffer.writeln('        shade50: GColors.blue50,');
    buffer.writeln('        shade100: GColors.blue100,');
    buffer.writeln('        shade200: GColors.blue200,');
    buffer.writeln('        shade300: GColors.blue300,');
    buffer.writeln('        shade400: GColors.blue400,');
    buffer.writeln('        shade500: GColors.blue500,');
    buffer.writeln('        shade600: GColors.blue600,');
    buffer.writeln('        shade700: GColors.blue700,');
    buffer.writeln('        shade800: GColors.blue800,');
    buffer.writeln('        shade900: GColors.blue900,');
    buffer.writeln('        shade950: GColors.blue950,');
    buffer.writeln('      ),');
    buffer.writeln('      secondary: GColorScale(');
    buffer.writeln('        shade50: GColors.purple50,');
    buffer.writeln('        shade100: GColors.purple100,');
    buffer.writeln('        shade200: GColors.purple200,');
    buffer.writeln('        shade300: GColors.purple300,');
    buffer.writeln('        shade400: GColors.purple400,');
    buffer.writeln('        shade500: GColors.purple500,');
    buffer.writeln('        shade600: GColors.purple600,');
    buffer.writeln('        shade700: GColors.purple700,');
    buffer.writeln('        shade800: GColors.purple800,');
    buffer.writeln('        shade900: GColors.purple900,');
    buffer.writeln('        shade950: GColors.purple950,');
    buffer.writeln('      ),');
    buffer.writeln('      tertiary: GColorScale(');
    buffer.writeln('        shade50: GColors.teal50,');
    buffer.writeln('        shade100: GColors.teal100,');
    buffer.writeln('        shade200: GColors.teal200,');
    buffer.writeln('        shade300: GColors.teal300,');
    buffer.writeln('        shade400: GColors.teal400,');
    buffer.writeln('        shade500: GColors.teal500,');
    buffer.writeln('        shade600: GColors.teal600,');
    buffer.writeln('        shade700: GColors.teal700,');
    buffer.writeln('        shade800: GColors.teal800,');
    buffer.writeln('        shade900: GColors.teal900,');
    buffer.writeln('        shade950: GColors.teal950,');
    buffer.writeln('      ),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateDefaultNeutralColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  static GNeutralColors _defaultNeutralColors() {');
    buffer.writeln('    return GNeutralColors(');
    buffer.writeln('      shade50: GColors.gray50,');
    buffer.writeln('      shade100: GColors.gray100,');
    buffer.writeln('      shade200: GColors.gray200,');
    buffer.writeln('      shade300: GColors.gray300,');
    buffer.writeln('      shade400: GColors.gray400,');
    buffer.writeln('      shade500: GColors.gray500,');
    buffer.writeln('      shade600: GColors.gray600,');
    buffer.writeln('      shade700: GColors.gray700,');
    buffer.writeln('      shade800: GColors.gray800,');
    buffer.writeln('      shade900: GColors.gray900,');
    buffer.writeln('      shade950: GColors.gray950,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateDefaultFeedbackColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  static GFeedbackColors _defaultFeedbackColors() {');
    buffer.writeln('    return GFeedbackColors(');
    buffer.writeln('      error: GColorScale(');
    buffer.writeln('        shade50: GColors.red50,');
    buffer.writeln('        shade100: GColors.red100,');
    buffer.writeln('        shade200: GColors.red200,');
    buffer.writeln('        shade300: GColors.red300,');
    buffer.writeln('        shade400: GColors.red400,');
    buffer.writeln('        shade500: GColors.red500,');
    buffer.writeln('        shade600: GColors.red600,');
    buffer.writeln('        shade700: GColors.red700,');
    buffer.writeln('        shade800: GColors.red800,');
    buffer.writeln('        shade900: GColors.red900,');
    buffer.writeln('        shade950: GColors.red950,');
    buffer.writeln('      ),');
    buffer.writeln('      warning: GColorScale(');
    buffer.writeln('        shade50: GColors.amber50,');
    buffer.writeln('        shade100: GColors.amber100,');
    buffer.writeln('        shade200: GColors.amber200,');
    buffer.writeln('        shade300: GColors.amber300,');
    buffer.writeln('        shade400: GColors.amber400,');
    buffer.writeln('        shade500: GColors.amber500,');
    buffer.writeln('        shade600: GColors.amber600,');
    buffer.writeln('        shade700: GColors.amber700,');
    buffer.writeln('        shade800: GColors.amber800,');
    buffer.writeln('        shade900: GColors.amber900,');
    buffer.writeln('        shade950: GColors.amber950,');
    buffer.writeln('      ),');
    buffer.writeln('      success: GColorScale(');
    buffer.writeln('        shade50: GColors.green50,');
    buffer.writeln('        shade100: GColors.green100,');
    buffer.writeln('        shade200: GColors.green200,');
    buffer.writeln('        shade300: GColors.green300,');
    buffer.writeln('        shade400: GColors.green400,');
    buffer.writeln('        shade500: GColors.green500,');
    buffer.writeln('        shade600: GColors.green600,');
    buffer.writeln('        shade700: GColors.green700,');
    buffer.writeln('        shade800: GColors.green800,');
    buffer.writeln('        shade900: GColors.green900,');
    buffer.writeln('        shade950: GColors.green950,');
    buffer.writeln('      ),');
    buffer.writeln('      info: GColorScale(');
    buffer.writeln('        shade50: GColors.sky50,');
    buffer.writeln('        shade100: GColors.sky100,');
    buffer.writeln('        shade200: GColors.sky200,');
    buffer.writeln('        shade300: GColors.sky300,');
    buffer.writeln('        shade400: GColors.sky400,');
    buffer.writeln('        shade500: GColors.sky500,');
    buffer.writeln('        shade600: GColors.sky600,');
    buffer.writeln('        shade700: GColors.sky700,');
    buffer.writeln('        shade800: GColors.sky800,');
    buffer.writeln('        shade900: GColors.sky900,');
    buffer.writeln('        shade950: GColors.sky950,');
    buffer.writeln('      ),');
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
    buffer.writeln('  /// GeneratedTheme.light(');
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
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? GTypography.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? GTypography.fontFamilyFallbackSans;');
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
    buffer.writeln('  /// GeneratedTheme.dark(');
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
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? GTypography.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? GTypography.fontFamilyFallbackSans;');
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
    buffer.writeln('  /// GeneratedTheme.fromBrightness(');
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

  // Helper methods for parsing token values

  List<String>? _parseShadows(dynamic value) {
    if (value is! List) {
      return null;
    }

    if (value.isEmpty) {
      return [];
    }

    final shadows = <String>[];
    for (final shadowDef in value) {
      if (shadowDef is! Map<String, dynamic>) {
        continue;
      }

      final color = _parseColorValue(shadowDef['color']);
      final offsetX = parseDimension(shadowDef['offsetX']) ?? 0;
      final offsetY = parseDimension(shadowDef['offsetY']) ?? 0;
      final blur = parseDimension(shadowDef['blur']) ?? 0;
      final spread = parseDimension(shadowDef['spread']) ?? 0;

      if (color != null) {
        shadows.add(
          'BoxShadow(color: Color($color), offset: Offset($offsetX, $offsetY), blurRadius: $blur, spreadRadius: $spread)',
        );
      }
    }

    return shadows;
  }

  String? _parseColorValue(dynamic value) {
    if (value == null) return null;
    if (value is! String) return null;

    final colorInt = parseColor(value);
    if (colorInt == null) return null;

    return '0x${colorInt.toRadixString(16).toUpperCase().padLeft(8, '0')}';
  }

  List<double>? _parseCubicBezier(dynamic value) {
    if (value is! List) {
      return null;
    }

    if (value.length != 4) {
      return null;
    }

    try {
      return value.map((v) => (v as num).toDouble()).toList();
    } catch (e) {
      return null;
    }
  }
}

