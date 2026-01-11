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


  void _generateTokenInstances(StringBuffer buffer) {
    buffer.writeln('  // ============================================');
    buffer.writeln('  // Token Instances from Generated Files');
    buffer.writeln('  // ============================================');
    buffer.writeln();
    buffer.writeln('  /// Generated spacing tokens');
    buffer.writeln('  static const spacing = GeneratedSpacing();');
    buffer.writeln();
    buffer.writeln('  /// Generated sizing tokens');
    buffer.writeln('  static const sizing = GeneratedSizing();');
    buffer.writeln();
    buffer.writeln('  /// Generated border radius tokens');
    buffer.writeln('  static const borderRadius = GeneratedBorderRadius();');
    buffer.writeln();
    buffer.writeln('  /// Generated border width tokens');
    buffer.writeln('  static const borderWidth = GeneratedBorderWidth();');
    buffer.writeln();
    buffer.writeln('  /// Generated shadow tokens');
    buffer.writeln('  static const shadows = GeneratedShadows();');
    buffer.writeln();
    buffer.writeln('  /// Generated duration tokens');
    buffer.writeln('  static const durations = GeneratedDurations();');
    buffer.writeln();
    buffer.writeln('  /// Generated easing curve tokens');
    buffer.writeln('  static const easing = GeneratedEasing();');
    buffer.writeln();
    buffer.writeln('  /// Generated opacity tokens');
    buffer.writeln('  static const opacity = GeneratedOpacity();');
    buffer.writeln();
    buffer.writeln('  /// Generated breakpoint tokens');
    buffer.writeln('  static const breakpoints = GeneratedBreakpoints();');
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
    buffer.writeln('        shade50: GeneratedColors.blue50,');
    buffer.writeln('        shade100: GeneratedColors.blue100,');
    buffer.writeln('        shade200: GeneratedColors.blue200,');
    buffer.writeln('        shade300: GeneratedColors.blue300,');
    buffer.writeln('        shade400: GeneratedColors.blue400,');
    buffer.writeln('        shade500: GeneratedColors.blue500,');
    buffer.writeln('        shade600: GeneratedColors.blue600,');
    buffer.writeln('        shade700: GeneratedColors.blue700,');
    buffer.writeln('        shade800: GeneratedColors.blue800,');
    buffer.writeln('        shade900: GeneratedColors.blue900,');
    buffer.writeln('        shade950: GeneratedColors.blue950,');
    buffer.writeln('      ),');
    buffer.writeln('      secondary: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.purple50,');
    buffer.writeln('        shade100: GeneratedColors.purple100,');
    buffer.writeln('        shade200: GeneratedColors.purple200,');
    buffer.writeln('        shade300: GeneratedColors.purple300,');
    buffer.writeln('        shade400: GeneratedColors.purple400,');
    buffer.writeln('        shade500: GeneratedColors.purple500,');
    buffer.writeln('        shade600: GeneratedColors.purple600,');
    buffer.writeln('        shade700: GeneratedColors.purple700,');
    buffer.writeln('        shade800: GeneratedColors.purple800,');
    buffer.writeln('        shade900: GeneratedColors.purple900,');
    buffer.writeln('        shade950: GeneratedColors.purple950,');
    buffer.writeln('      ),');
    buffer.writeln('      tertiary: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.teal50,');
    buffer.writeln('        shade100: GeneratedColors.teal100,');
    buffer.writeln('        shade200: GeneratedColors.teal200,');
    buffer.writeln('        shade300: GeneratedColors.teal300,');
    buffer.writeln('        shade400: GeneratedColors.teal400,');
    buffer.writeln('        shade500: GeneratedColors.teal500,');
    buffer.writeln('        shade600: GeneratedColors.teal600,');
    buffer.writeln('        shade700: GeneratedColors.teal700,');
    buffer.writeln('        shade800: GeneratedColors.teal800,');
    buffer.writeln('        shade900: GeneratedColors.teal900,');
    buffer.writeln('        shade950: GeneratedColors.teal950,');
    buffer.writeln('      ),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateDefaultNeutralColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  static GNeutralColors _defaultNeutralColors() {');
    buffer.writeln('    return GNeutralColors(');
    buffer.writeln('      shade50: GeneratedColors.gray50,');
    buffer.writeln('      shade100: GeneratedColors.gray100,');
    buffer.writeln('      shade200: GeneratedColors.gray200,');
    buffer.writeln('      shade300: GeneratedColors.gray300,');
    buffer.writeln('      shade400: GeneratedColors.gray400,');
    buffer.writeln('      shade500: GeneratedColors.gray500,');
    buffer.writeln('      shade600: GeneratedColors.gray600,');
    buffer.writeln('      shade700: GeneratedColors.gray700,');
    buffer.writeln('      shade800: GeneratedColors.gray800,');
    buffer.writeln('      shade900: GeneratedColors.gray900,');
    buffer.writeln('      shade950: GeneratedColors.gray950,');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln();
  }

  void _generateDefaultFeedbackColors(StringBuffer buffer, Map<String, dynamic> tokens) {
    buffer.writeln('  static GFeedbackColors _defaultFeedbackColors() {');
    buffer.writeln('    return GFeedbackColors(');
    buffer.writeln('      error: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.red50,');
    buffer.writeln('        shade100: GeneratedColors.red100,');
    buffer.writeln('        shade200: GeneratedColors.red200,');
    buffer.writeln('        shade300: GeneratedColors.red300,');
    buffer.writeln('        shade400: GeneratedColors.red400,');
    buffer.writeln('        shade500: GeneratedColors.red500,');
    buffer.writeln('        shade600: GeneratedColors.red600,');
    buffer.writeln('        shade700: GeneratedColors.red700,');
    buffer.writeln('        shade800: GeneratedColors.red800,');
    buffer.writeln('        shade900: GeneratedColors.red900,');
    buffer.writeln('        shade950: GeneratedColors.red950,');
    buffer.writeln('      ),');
    buffer.writeln('      warning: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.amber50,');
    buffer.writeln('        shade100: GeneratedColors.amber100,');
    buffer.writeln('        shade200: GeneratedColors.amber200,');
    buffer.writeln('        shade300: GeneratedColors.amber300,');
    buffer.writeln('        shade400: GeneratedColors.amber400,');
    buffer.writeln('        shade500: GeneratedColors.amber500,');
    buffer.writeln('        shade600: GeneratedColors.amber600,');
    buffer.writeln('        shade700: GeneratedColors.amber700,');
    buffer.writeln('        shade800: GeneratedColors.amber800,');
    buffer.writeln('        shade900: GeneratedColors.amber900,');
    buffer.writeln('        shade950: GeneratedColors.amber950,');
    buffer.writeln('      ),');
    buffer.writeln('      success: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.green50,');
    buffer.writeln('        shade100: GeneratedColors.green100,');
    buffer.writeln('        shade200: GeneratedColors.green200,');
    buffer.writeln('        shade300: GeneratedColors.green300,');
    buffer.writeln('        shade400: GeneratedColors.green400,');
    buffer.writeln('        shade500: GeneratedColors.green500,');
    buffer.writeln('        shade600: GeneratedColors.green600,');
    buffer.writeln('        shade700: GeneratedColors.green700,');
    buffer.writeln('        shade800: GeneratedColors.green800,');
    buffer.writeln('        shade900: GeneratedColors.green900,');
    buffer.writeln('        shade950: GeneratedColors.green950,');
    buffer.writeln('      ),');
    buffer.writeln('      info: GColorScale(');
    buffer.writeln('        shade50: GeneratedColors.sky50,');
    buffer.writeln('        shade100: GeneratedColors.sky100,');
    buffer.writeln('        shade200: GeneratedColors.sky200,');
    buffer.writeln('        shade300: GeneratedColors.sky300,');
    buffer.writeln('        shade400: GeneratedColors.sky400,');
    buffer.writeln('        shade500: GeneratedColors.sky500,');
    buffer.writeln('        shade600: GeneratedColors.sky600,');
    buffer.writeln('        shade700: GeneratedColors.sky700,');
    buffer.writeln('        shade800: GeneratedColors.sky800,');
    buffer.writeln('        shade900: GeneratedColors.sky900,');
    buffer.writeln('        shade950: GeneratedColors.sky950,');
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
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? GeneratedTypography.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? GeneratedTypography.fontFamilyFallbackSans;');
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
      buffer.writeln('    final effectiveFontFamily = fontFamily ?? GeneratedTypography.fontFamilySans;');
      buffer.writeln('    final effectiveFallback = fontFamilyFallback ?? GeneratedTypography.fontFamilyFallbackSans;');
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
}

