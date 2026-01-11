import 'dart:convert';

import 'package:flutter/material.dart';

/// Represents a color with shade values (50-950)
class ColorPaletteState {
  final Map<String, Color> shades;

  ColorPaletteState(this.shades);

  factory ColorPaletteState.fromHexMap(Map<String, String> hexMap) {
    return ColorPaletteState(
      hexMap.map((key, value) => MapEntry(key, _hexToColor(value))),
    );
  }

  Map<String, String> toHexMap() {
    return shades.map((key, value) => MapEntry(key, _colorToHex(value)));
  }

  ColorPaletteState copyWith({Map<String, Color>? shades}) {
    return ColorPaletteState(shades ?? Map.from(this.shades));
  }

  static Color _hexToColor(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex';
    }
    return Color(int.parse(hex, radix: 16));
  }

  static String _colorToHex(Color color) {
    final argb = color.toARGB32();
    return '#${argb.toRadixString(16).substring(2).toUpperCase()}';
  }
}

/// System color mappings (semantic -> palette name)
class SystemColorsState {
  String primary;
  String secondary;
  String tertiary;
  String neutral;
  String error;
  String warning;
  String success;
  String info;

  SystemColorsState({
    this.primary = 'blue',
    this.secondary = 'purple',
    this.tertiary = 'teal',
    this.neutral = 'gray',
    this.error = 'red',
    this.warning = 'amber',
    this.success = 'green',
    this.info = 'sky',
  });

  SystemColorsState copyWith({
    String? primary,
    String? secondary,
    String? tertiary,
    String? neutral,
    String? error,
    String? warning,
    String? success,
    String? info,
  }) {
    return SystemColorsState(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      neutral: neutral ?? this.neutral,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }
}

/// Spacing token values
class SpacingState {
  final Map<String, double> values;

  SpacingState(this.values);

  factory SpacingState.defaults() {
    return SpacingState({
      'none': 0,
      'px': 1,
      'xs4': 2,
      'xs3': 4,
      'xs2': 6,
      'xs': 8,
      'sm': 12,
      'md': 16,
      'lg': 20,
      'xl': 24,
      'xl2': 32,
      'xl3': 40,
      'xl4': 48,
      'xl5': 56,
      'xl6': 64,
      'xl7': 80,
      'xl8': 96,
      'xl9': 112,
      'xl10': 128,
      'xl11': 144,
      'xl12': 160,
    });
  }

  SpacingState copyWith({Map<String, double>? values}) {
    return SpacingState(values ?? Map.from(this.values));
  }
}

/// Border radius token values
class BorderRadiusState {
  final Map<String, double> values;

  BorderRadiusState(this.values);

  factory BorderRadiusState.defaults() {
    return BorderRadiusState({
      'none': 0,
      'xs': 2,
      'sm': 4,
      'md': 6,
      'lg': 8,
      'xl': 12,
      'xl2': 16,
      'xl3': 24,
      'full': 9999,
    });
  }

  BorderRadiusState copyWith({Map<String, double>? values}) {
    return BorderRadiusState(values ?? Map.from(this.values));
  }
}

/// Sizing token values (similar to spacing but with extended values)
class SizingState {
  final Map<String, double> values;

  SizingState(this.values);

  factory SizingState.defaults() {
    return SizingState({
      'none': 0,
      'px': 1,
      'xs4': 2,
      'xs3': 4,
      'xs2': 6,
      'xs': 8,
      'sm': 12,
      'md': 16,
      'lg': 20,
      'xl': 24,
      'xl2': 32,
      'xl3': 40,
      'xl4': 48,
      'xl5': 56,
      'xl6': 64,
      'xl7': 80,
      'xl8': 96,
      'xl9': 112,
      'xl10': 128,
      'xl11': 144,
      'xl12': 160,
      'xl13': 176,
      'xl14': 192,
      'xl15': 208,
      'xl16': 224,
      'xl17': 240,
      'xl18': 256,
      'xl19': 288,
      'xl20': 320,
      'xl21': 384,
    });
  }

  SizingState copyWith({Map<String, double>? values}) {
    return SizingState(values ?? Map.from(this.values));
  }
}

/// Border width token values
class BorderWidthState {
  final Map<String, double> values;

  BorderWidthState(this.values);

  factory BorderWidthState.defaults() {
    return BorderWidthState({
      'none': 0,
      'thin': 1,
      'medium': 2,
      'thick': 4,
    });
  }

  BorderWidthState copyWith({Map<String, double>? values}) {
    return BorderWidthState(values ?? Map.from(this.values));
  }
}

/// Opacity token values
class OpacityState {
  final Map<String, double> values;

  OpacityState(this.values);

  factory OpacityState.defaults() {
    return OpacityState({
      'transparent': 0,
      'o5': 0.05,
      'o10': 0.10,
      'o20': 0.20,
      'o25': 0.25,
      'o30': 0.30,
      'o40': 0.40,
      'o50': 0.50,
      'o60': 0.60,
      'o70': 0.70,
      'o75': 0.75,
      'o80': 0.80,
      'o90': 0.90,
      'o95': 0.95,
      'opaque': 1.0,
    });
  }

  OpacityState copyWith({Map<String, double>? values}) {
    return OpacityState(values ?? Map.from(this.values));
  }
}

/// Duration token values (in milliseconds)
class DurationState {
  final Map<String, int> values;

  DurationState(this.values);

  factory DurationState.defaults() {
    return DurationState({
      'instant': 0,
      'fastest': 50,
      'faster': 100,
      'fast': 150,
      'normal': 200,
      'slow': 300,
      'slower': 400,
      'slowest': 500,
    });
  }

  DurationState copyWith({Map<String, int>? values}) {
    return DurationState(values ?? Map.from(this.values));
  }
}

/// Breakpoint token values
class BreakpointState {
  final Map<String, double> values;

  BreakpointState(this.values);

  factory BreakpointState.defaults() {
    return BreakpointState({
      'xs': 0,
      'sm': 576,
      'md': 768,
      'lg': 992,
      'xl': 1200,
      'xl2': 1400,
    });
  }

  BreakpointState copyWith({Map<String, double>? values}) {
    return BreakpointState(values ?? Map.from(this.values));
  }
}

/// Font family token values
class FontFamilyState {
  final Map<String, String> values;

  FontFamilyState(this.values);

  factory FontFamilyState.defaults() {
    return FontFamilyState({
      'sans': 'Inter',
      'serif': 'Georgia',
      'mono': 'JetBrains Mono',
    });
  }

  FontFamilyState copyWith({Map<String, String>? values}) {
    return FontFamilyState(values ?? Map.from(this.values));
  }
}

/// Shadow token values
class ShadowValue {
  final Color color;
  final double offsetX;
  final double offsetY;
  final double blur;
  final double spread;

  ShadowValue({
    required this.color,
    required this.offsetX,
    required this.offsetY,
    required this.blur,
    required this.spread,
  });

  ShadowValue copyWith({
    Color? color,
    double? offsetX,
    double? offsetY,
    double? blur,
    double? spread,
  }) {
    return ShadowValue(
      color: color ?? this.color,
      offsetX: offsetX ?? this.offsetX,
      offsetY: offsetY ?? this.offsetY,
      blur: blur ?? this.blur,
      spread: spread ?? this.spread,
    );
  }

  Map<String, dynamic> toJson() {
    final argb = color.toARGB32();
    return {
      'color': '#${argb.toRadixString(16).padLeft(8, '0').toUpperCase()}',
      'offsetX': '${offsetX}px',
      'offsetY': '${offsetY}px',
      'blur': '${blur}px',
      'spread': '${spread}px',
    };
  }
}

class ShadowState {
  final Map<String, List<ShadowValue>> values;

  ShadowState(this.values);

  factory ShadowState.defaults() {
    return ShadowState({
      'none': [],
      'xs': [
        ShadowValue(
          color: const Color(0x0D000000),
          offsetX: 0,
          offsetY: 1,
          blur: 1,
          spread: 0,
        ),
      ],
      'sm': [
        ShadowValue(
          color: const Color(0x0D000000),
          offsetX: 0,
          offsetY: 1,
          blur: 2,
          spread: 0,
        ),
        ShadowValue(
          color: const Color(0x0A000000),
          offsetX: 0,
          offsetY: 1,
          blur: 1,
          spread: 0,
        ),
      ],
      'md': [
        ShadowValue(
          color: const Color(0x1A000000),
          offsetX: 0,
          offsetY: 4,
          blur: 6,
          spread: -1,
        ),
        ShadowValue(
          color: const Color(0x0D000000),
          offsetX: 0,
          offsetY: 2,
          blur: 4,
          spread: -2,
        ),
      ],
      'lg': [
        ShadowValue(
          color: const Color(0x1A000000),
          offsetX: 0,
          offsetY: 10,
          blur: 15,
          spread: -3,
        ),
        ShadowValue(
          color: const Color(0x0D000000),
          offsetX: 0,
          offsetY: 4,
          blur: 6,
          spread: -4,
        ),
      ],
      'xl': [
        ShadowValue(
          color: const Color(0x1A000000),
          offsetX: 0,
          offsetY: 20,
          blur: 25,
          spread: -5,
        ),
        ShadowValue(
          color: const Color(0x0D000000),
          offsetX: 0,
          offsetY: 8,
          blur: 10,
          spread: -6,
        ),
      ],
      'xl2': [
        ShadowValue(
          color: const Color(0x40000000),
          offsetX: 0,
          offsetY: 25,
          blur: 50,
          spread: -12,
        ),
      ],
    });
  }

  ShadowState copyWith({Map<String, List<ShadowValue>>? values}) {
    return ShadowState(values ?? Map.from(this.values));
  }
}

/// Typography token values
class TypographyState {
  final Map<String, double> fontSizes;
  final Map<String, int> fontWeights;
  final Map<String, double> lineHeights;
  final Map<String, double> letterSpacing;

  TypographyState({
    required this.fontSizes,
    required this.fontWeights,
    required this.lineHeights,
    required this.letterSpacing,
  });

  factory TypographyState.defaults() {
    return TypographyState(
      fontSizes: {
        'xs': 12,
        'sm': 14,
        'base': 16,
        'lg': 18,
        'xl': 20,
        'xl2': 24,
        'xl3': 30,
        'xl4': 36,
        'xl5': 48,
        'xl6': 60,
        'xl7': 72,
        'xl8': 96,
        'xl9': 128,
      },
      fontWeights: {
        'thin': 100,
        'extraLight': 200,
        'light': 300,
        'regular': 400,
        'medium': 500,
        'semiBold': 600,
        'bold': 700,
        'extraBold': 800,
        'black': 900,
      },
      lineHeights: {
        'xs': 16,
        'sm': 20,
        'base': 24,
        'lg': 28,
        'xl': 28,
        'xl2': 32,
        'xl3': 36,
        'xl4': 40,
        'xl5': 48,
        'xl6': 60,
        'xl7': 72,
        'xl8': 96,
        'xl9': 128,
      },
      letterSpacing: {
        'tighter': -0.8,
        'tight': -0.4,
        'normal': 0,
        'wide': 0.4,
        'wider': 0.8,
        'widest': 1.6,
      },
    );
  }

  TypographyState copyWith({
    Map<String, double>? fontSizes,
    Map<String, int>? fontWeights,
    Map<String, double>? lineHeights,
    Map<String, double>? letterSpacing,
  }) {
    return TypographyState(
      fontSizes: fontSizes ?? Map.from(this.fontSizes),
      fontWeights: fontWeights ?? Map.from(this.fontWeights),
      lineHeights: lineHeights ?? Map.from(this.lineHeights),
      letterSpacing: letterSpacing ?? Map.from(this.letterSpacing),
    );
  }
}

/// Main state class for all design tokens
class TokenState extends ChangeNotifier {
  Map<String, ColorPaletteState> colorPalettes;
  SystemColorsState systemColors;
  SpacingState spacing;
  SizingState sizing;
  BorderRadiusState borderRadius;
  BorderWidthState borderWidth;
  OpacityState opacity;
  DurationState duration;
  BreakpointState breakpoints;
  FontFamilyState fontFamily;
  ShadowState shadows;
  TypographyState typography;

  TokenState({
    required this.colorPalettes,
    required this.systemColors,
    required this.spacing,
    required this.sizing,
    required this.borderRadius,
    required this.borderWidth,
    required this.opacity,
    required this.duration,
    required this.breakpoints,
    required this.fontFamily,
    required this.shadows,
    required this.typography,
  });

  factory TokenState.defaults() {
    return TokenState(
      colorPalettes: _defaultColorPalettes(),
      systemColors: SystemColorsState(),
      spacing: SpacingState.defaults(),
      sizing: SizingState.defaults(),
      borderRadius: BorderRadiusState.defaults(),
      borderWidth: BorderWidthState.defaults(),
      opacity: OpacityState.defaults(),
      duration: DurationState.defaults(),
      breakpoints: BreakpointState.defaults(),
      fontFamily: FontFamilyState.defaults(),
      shadows: ShadowState.defaults(),
      typography: TypographyState.defaults(),
    );
  }

  static Map<String, ColorPaletteState> _defaultColorPalettes() {
    return {
      'gray': ColorPaletteState.fromHexMap({
        '50': '#F9FAFB',
        '100': '#F3F4F6',
        '200': '#E5E7EB',
        '300': '#D1D5DB',
        '400': '#9CA3AF',
        '500': '#6B7280',
        '600': '#4B5563',
        '700': '#374151',
        '800': '#1F2937',
        '900': '#111827',
        '950': '#030712',
      }),
      'red': ColorPaletteState.fromHexMap({
        '50': '#FEF2F2',
        '100': '#FEE2E2',
        '200': '#FECACA',
        '300': '#FCA5A5',
        '400': '#F87171',
        '500': '#EF4444',
        '600': '#DC2626',
        '700': '#B91C1C',
        '800': '#991B1B',
        '900': '#7F1D1D',
        '950': '#450A0A',
      }),
      'orange': ColorPaletteState.fromHexMap({
        '50': '#FFF7ED',
        '100': '#FFEDD5',
        '200': '#FED7AA',
        '300': '#FDBA74',
        '400': '#FB923C',
        '500': '#F97316',
        '600': '#EA580C',
        '700': '#C2410C',
        '800': '#9A3412',
        '900': '#7C2D12',
        '950': '#431407',
      }),
      'amber': ColorPaletteState.fromHexMap({
        '50': '#FFFBEB',
        '100': '#FEF3C7',
        '200': '#FDE68A',
        '300': '#FCD34D',
        '400': '#FBBF24',
        '500': '#F59E0B',
        '600': '#D97706',
        '700': '#B45309',
        '800': '#92400E',
        '900': '#78350F',
        '950': '#451A03',
      }),
      'yellow': ColorPaletteState.fromHexMap({
        '50': '#FEFCE8',
        '100': '#FEF9C3',
        '200': '#FEF08A',
        '300': '#FDE047',
        '400': '#FACC15',
        '500': '#EAB308',
        '600': '#CA8A04',
        '700': '#A16207',
        '800': '#854D0E',
        '900': '#713F12',
        '950': '#422006',
      }),
      'lime': ColorPaletteState.fromHexMap({
        '50': '#F7FEE7',
        '100': '#ECFCCB',
        '200': '#D9F99D',
        '300': '#BEF264',
        '400': '#A3E635',
        '500': '#84CC16',
        '600': '#65A30D',
        '700': '#4D7C0F',
        '800': '#3F6212',
        '900': '#365314',
        '950': '#1A2E05',
      }),
      'green': ColorPaletteState.fromHexMap({
        '50': '#F0FDF4',
        '100': '#DCFCE7',
        '200': '#BBF7D0',
        '300': '#86EFAC',
        '400': '#4ADE80',
        '500': '#22C55E',
        '600': '#16A34A',
        '700': '#15803D',
        '800': '#166534',
        '900': '#14532D',
        '950': '#052E16',
      }),
      'emerald': ColorPaletteState.fromHexMap({
        '50': '#ECFDF5',
        '100': '#D1FAE5',
        '200': '#A7F3D0',
        '300': '#6EE7B7',
        '400': '#34D399',
        '500': '#10B981',
        '600': '#059669',
        '700': '#047857',
        '800': '#065F46',
        '900': '#064E3B',
        '950': '#022C22',
      }),
      'teal': ColorPaletteState.fromHexMap({
        '50': '#F0FDFA',
        '100': '#CCFBF1',
        '200': '#99F6E4',
        '300': '#5EEAD4',
        '400': '#2DD4BF',
        '500': '#14B8A6',
        '600': '#0D9488',
        '700': '#0F766E',
        '800': '#115E59',
        '900': '#134E4A',
        '950': '#042F2E',
      }),
      'cyan': ColorPaletteState.fromHexMap({
        '50': '#ECFEFF',
        '100': '#CFFAFE',
        '200': '#A5F3FC',
        '300': '#67E8F9',
        '400': '#22D3EE',
        '500': '#06B6D4',
        '600': '#0891B2',
        '700': '#0E7490',
        '800': '#155E75',
        '900': '#164E63',
        '950': '#083344',
      }),
      'sky': ColorPaletteState.fromHexMap({
        '50': '#F0F9FF',
        '100': '#E0F2FE',
        '200': '#BAE6FD',
        '300': '#7DD3FC',
        '400': '#38BDF8',
        '500': '#0EA5E9',
        '600': '#0284C7',
        '700': '#0369A1',
        '800': '#075985',
        '900': '#0C4A6E',
        '950': '#082F49',
      }),
      'blue': ColorPaletteState.fromHexMap({
        '50': '#EFF6FF',
        '100': '#DBEAFE',
        '200': '#BFDBFE',
        '300': '#93C5FD',
        '400': '#60A5FA',
        '500': '#3B82F6',
        '600': '#2563EB',
        '700': '#1D4ED8',
        '800': '#1E40AF',
        '900': '#1E3A8A',
        '950': '#172554',
      }),
      'indigo': ColorPaletteState.fromHexMap({
        '50': '#EEF2FF',
        '100': '#E0E7FF',
        '200': '#C7D2FE',
        '300': '#A5B4FC',
        '400': '#818CF8',
        '500': '#6366F1',
        '600': '#4F46E5',
        '700': '#4338CA',
        '800': '#3730A3',
        '900': '#312E81',
        '950': '#1E1B4B',
      }),
      'violet': ColorPaletteState.fromHexMap({
        '50': '#F5F3FF',
        '100': '#EDE9FE',
        '200': '#DDD6FE',
        '300': '#C4B5FD',
        '400': '#A78BFA',
        '500': '#8B5CF6',
        '600': '#7C3AED',
        '700': '#6D28D9',
        '800': '#5B21B6',
        '900': '#4C1D95',
        '950': '#2E1065',
      }),
      'purple': ColorPaletteState.fromHexMap({
        '50': '#FAF5FF',
        '100': '#F3E8FF',
        '200': '#E9D5FF',
        '300': '#D8B4FE',
        '400': '#C084FC',
        '500': '#A855F7',
        '600': '#9333EA',
        '700': '#7E22CE',
        '800': '#6B21A8',
        '900': '#581C87',
        '950': '#3B0764',
      }),
      'fuchsia': ColorPaletteState.fromHexMap({
        '50': '#FDF4FF',
        '100': '#FAE8FF',
        '200': '#F5D0FE',
        '300': '#F0ABFC',
        '400': '#E879F9',
        '500': '#D946EF',
        '600': '#C026D3',
        '700': '#A21CAF',
        '800': '#86198F',
        '900': '#701A75',
        '950': '#4A044E',
      }),
      'pink': ColorPaletteState.fromHexMap({
        '50': '#FDF2F8',
        '100': '#FCE7F3',
        '200': '#FBCFE8',
        '300': '#F9A8D4',
        '400': '#F472B6',
        '500': '#EC4899',
        '600': '#DB2777',
        '700': '#BE185D',
        '800': '#9D174D',
        '900': '#831843',
        '950': '#500724',
      }),
      'rose': ColorPaletteState.fromHexMap({
        '50': '#FFF1F2',
        '100': '#FFE4E6',
        '200': '#FECDD3',
        '300': '#FDA4AF',
        '400': '#FB7185',
        '500': '#F43F5E',
        '600': '#E11D48',
        '700': '#BE123C',
        '800': '#9F1239',
        '900': '#881337',
        '950': '#4C0519',
      }),
    };
  }

  /// Updates a color in a palette
  void updateColor(String paletteName, String shade, Color color) {
    if (colorPalettes.containsKey(paletteName)) {
      colorPalettes[paletteName]!.shades[shade] = color;
      notifyListeners();
    }
  }

  /// Updates system color mapping
  void updateSystemColor(String role, String paletteName) {
    switch (role) {
      case 'primary':
        systemColors.primary = paletteName;
        break;
      case 'secondary':
        systemColors.secondary = paletteName;
        break;
      case 'tertiary':
        systemColors.tertiary = paletteName;
        break;
      case 'neutral':
        systemColors.neutral = paletteName;
        break;
      case 'error':
        systemColors.error = paletteName;
        break;
      case 'warning':
        systemColors.warning = paletteName;
        break;
      case 'success':
        systemColors.success = paletteName;
        break;
      case 'info':
        systemColors.info = paletteName;
        break;
    }
    notifyListeners();
  }

  /// Updates a spacing value
  void updateSpacing(String key, double value) {
    spacing.values[key] = value;
    notifyListeners();
  }

  /// Updates a sizing value
  void updateSizing(String key, double value) {
    sizing.values[key] = value;
    notifyListeners();
  }

  /// Updates a border radius value
  void updateBorderRadius(String key, double value) {
    borderRadius.values[key] = value;
    notifyListeners();
  }

  /// Updates a border width value
  void updateBorderWidth(String key, double value) {
    borderWidth.values[key] = value;
    notifyListeners();
  }

  /// Updates an opacity value
  void updateOpacity(String key, double value) {
    opacity.values[key] = value;
    notifyListeners();
  }

  /// Updates a duration value
  void updateDuration(String key, int value) {
    duration.values[key] = value;
    notifyListeners();
  }

  /// Updates a breakpoint value
  void updateBreakpoint(String key, double value) {
    breakpoints.values[key] = value;
    notifyListeners();
  }

  /// Updates a font family value
  void updateFontFamily(String key, String value) {
    fontFamily.values[key] = value;
    notifyListeners();
  }

  /// Updates a shadow value
  void updateShadow(String key, int index, ShadowValue value) {
    if (shadows.values.containsKey(key) && index < shadows.values[key]!.length) {
      shadows.values[key]![index] = value;
      notifyListeners();
    }
  }

  /// Updates typography values
  void updateFontSize(String key, double value) {
    typography.fontSizes[key] = value;
    notifyListeners();
  }

  void updateFontWeight(String key, int value) {
    typography.fontWeights[key] = value;
    notifyListeners();
  }

  void updateLineHeight(String key, double value) {
    typography.lineHeights[key] = value;
    notifyListeners();
  }

  void updateLetterSpacing(String key, double value) {
    typography.letterSpacing[key] = value;
    notifyListeners();
  }

  /// Resets all tokens to defaults
  void reset() {
    colorPalettes = _defaultColorPalettes();
    systemColors = SystemColorsState();
    spacing = SpacingState.defaults();
    sizing = SizingState.defaults();
    borderRadius = BorderRadiusState.defaults();
    borderWidth = BorderWidthState.defaults();
    opacity = OpacityState.defaults();
    duration = DurationState.defaults();
    breakpoints = BreakpointState.defaults();
    fontFamily = FontFamilyState.defaults();
    shadows = ShadowState.defaults();
    typography = TypographyState.defaults();
    notifyListeners();
  }

  /// Exports all tokens to JSON format
  String exportToJson() {
    final json = <String, dynamic>{
      '\$schema': 'https://tr.designtokens.org/format/',
      'color': _exportColors(),
      'spacing': _exportSpacing(),
      'sizing': _exportSizing(),
      'borderRadius': _exportBorderRadius(),
      'borderWidth': _exportBorderWidth(),
      'opacity': _exportOpacity(),
      'duration': _exportDuration(),
      'easing': _exportEasing(),
      'shadow': _exportShadows(),
      'breakpoint': _exportBreakpoints(),
      'fontFamily': _exportFontFamily(),
      'fontFamilyFallback': _exportFontFamilyFallback(),
      'fontSize': _exportFontSize(),
      'lineHeight': _exportLineHeight(),
      'fontWeight': _exportFontWeight(),
      'letterSpacing': _exportLetterSpacing(),
      'systemColors': _exportSystemColors(),
    };

    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }

  Map<String, dynamic> _exportColors() {
    final colors = <String, dynamic>{
      '\$description': 'Color tokens for the design system',
    };

    for (final entry in colorPalettes.entries) {
      final palette = <String, dynamic>{};
      for (final shade in entry.value.shades.entries) {
        palette[shade.key] = {
          '\$type': 'color',
          '\$value': _colorToHex(shade.value),
        };
      }
      colors[entry.key] = palette;
    }

    colors['base'] = {
      'white': {'\$type': 'color', '\$value': '#FFFFFF'},
      'black': {'\$type': 'color', '\$value': '#000000'},
      'transparent': {'\$type': 'color', '\$value': '#00000000'},
    };

    return colors;
  }

  Map<String, dynamic> _exportSpacing() {
    final result = <String, dynamic>{
      '\$description': 'Spacing tokens for margins, paddings, and gaps',
    };
    for (final entry in spacing.values.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportSizing() {
    final result = <String, dynamic>{
      '\$description': 'Size tokens for widths, heights, and dimensions',
    };
    for (final entry in sizing.values.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportBorderRadius() {
    final result = <String, dynamic>{
      '\$description': 'Border radius tokens for rounded corners',
    };
    for (final entry in borderRadius.values.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportBorderWidth() {
    final result = <String, dynamic>{
      '\$description': 'Border width tokens',
    };
    for (final entry in borderWidth.values.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportOpacity() {
    final result = <String, dynamic>{
      '\$description': 'Opacity tokens for transparency levels',
    };
    for (final entry in opacity.values.entries) {
      result[entry.key] = {
        '\$type': 'number',
        '\$value': entry.value,
      };
    }
    return result;
  }

  Map<String, dynamic> _exportDuration() {
    final result = <String, dynamic>{
      '\$description': 'Animation and transition duration tokens',
    };
    for (final entry in duration.values.entries) {
      result[entry.key] = {
        '\$type': 'duration',
        '\$value': '${entry.value}ms',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportEasing() {
    return {
      '\$description': 'Animation easing curve tokens',
      'linear': {
        '\$type': 'cubicBezier',
        '\$value': [0, 0, 1, 1]
      },
      'ease': {
        '\$type': 'cubicBezier',
        '\$value': [0.25, 0.1, 0.25, 1]
      },
      'easeIn': {
        '\$type': 'cubicBezier',
        '\$value': [0.42, 0, 1, 1]
      },
      'easeOut': {
        '\$type': 'cubicBezier',
        '\$value': [0, 0, 0.58, 1]
      },
      'easeInOut': {
        '\$type': 'cubicBezier',
        '\$value': [0.42, 0, 0.58, 1]
      },
      'easeInSine': {
        '\$type': 'cubicBezier',
        '\$value': [0.12, 0, 0.39, 0]
      },
      'easeOutSine': {
        '\$type': 'cubicBezier',
        '\$value': [0.61, 1, 0.88, 1]
      },
      'easeInOutSine': {
        '\$type': 'cubicBezier',
        '\$value': [0.37, 0, 0.63, 1]
      },
      'easeInQuad': {
        '\$type': 'cubicBezier',
        '\$value': [0.11, 0, 0.5, 0]
      },
      'easeOutQuad': {
        '\$type': 'cubicBezier',
        '\$value': [0.5, 1, 0.89, 1]
      },
      'easeInOutQuad': {
        '\$type': 'cubicBezier',
        '\$value': [0.45, 0, 0.55, 1]
      },
      'easeInCubic': {
        '\$type': 'cubicBezier',
        '\$value': [0.32, 0, 0.67, 0]
      },
      'easeOutCubic': {
        '\$type': 'cubicBezier',
        '\$value': [0.33, 1, 0.68, 1]
      },
      'easeInOutCubic': {
        '\$type': 'cubicBezier',
        '\$value': [0.65, 0, 0.35, 1]
      },
    };
  }

  Map<String, dynamic> _exportShadows() {
    final result = <String, dynamic>{
      '\$description': 'Shadow/elevation tokens for depth and layering',
    };
    for (final entry in shadows.values.entries) {
      if (entry.value.isEmpty) {
        result[entry.key] = {'\$type': 'shadow', '\$value': []};
      } else {
        result[entry.key] = {
          '\$type': 'shadow',
          '\$value': entry.value.map((s) => s.toJson()).toList(),
        };
      }
    }
    return result;
  }

  Map<String, dynamic> _exportBreakpoints() {
    final result = <String, dynamic>{
      '\$description': 'Responsive breakpoint tokens',
    };
    for (final entry in breakpoints.values.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportFontFamily() {
    final result = <String, dynamic>{
      '\$description': 'Font family tokens',
    };
    for (final entry in fontFamily.values.entries) {
      result[entry.key] = {
        '\$type': 'fontFamily',
        '\$value': entry.value,
      };
    }
    return result;
  }

  Map<String, dynamic> _exportFontFamilyFallback() {
    return {
      '\$description': 'Font family fallback stacks',
      'sans': {
        '\$type': 'fontFamily',
        '\$value': [
          'system-ui',
          '-apple-system',
          'BlinkMacSystemFont',
          'Segoe UI',
          'Roboto',
          'sans-serif'
        ],
      },
      'serif': {
        '\$type': 'fontFamily',
        '\$value': [
          'Georgia',
          'Cambria',
          'Times New Roman',
          'Times',
          'serif'
        ],
      },
      'mono': {
        '\$type': 'fontFamily',
        '\$value': [
          'JetBrains Mono',
          'Menlo',
          'Monaco',
          'Consolas',
          'Liberation Mono',
          'Courier New',
          'monospace'
        ],
      },
    };
  }

  Map<String, dynamic> _exportFontSize() {
    final result = <String, dynamic>{
      '\$description': 'Font size tokens',
    };
    for (final entry in typography.fontSizes.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportLineHeight() {
    final result = <String, dynamic>{
      '\$description': 'Line height tokens',
    };
    for (final entry in typography.lineHeights.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value.toInt()}px',
      };
    }
    // Add relative line heights
    result['none'] = {'\$type': 'number', '\$value': 1.0};
    result['tight'] = {'\$type': 'number', '\$value': 1.25};
    result['snug'] = {'\$type': 'number', '\$value': 1.375};
    result['normal'] = {'\$type': 'number', '\$value': 1.5};
    result['relaxed'] = {'\$type': 'number', '\$value': 1.625};
    result['loose'] = {'\$type': 'number', '\$value': 2.0};
    return result;
  }

  Map<String, dynamic> _exportFontWeight() {
    final result = <String, dynamic>{
      '\$description': 'Font weight tokens',
    };
    for (final entry in typography.fontWeights.entries) {
      result[entry.key] = {
        '\$type': 'fontWeight',
        '\$value': entry.value,
      };
    }
    return result;
  }

  Map<String, dynamic> _exportLetterSpacing() {
    final result = <String, dynamic>{
      '\$description': 'Letter spacing tokens',
    };
    for (final entry in typography.letterSpacing.entries) {
      result[entry.key] = {
        '\$type': 'dimension',
        '\$value': '${entry.value}px',
      };
    }
    return result;
  }

  Map<String, dynamic> _exportSystemColors() {
    return {
      '\$description':
          'Maps color palettes to semantic system color roles. Change these to customize your theme colors.',
      'brand': {
        '\$description': 'Brand colors for primary UI elements',
        'primary': {'\$type': 'reference', '\$value': systemColors.primary},
        'secondary': {'\$type': 'reference', '\$value': systemColors.secondary},
        'tertiary': {'\$type': 'reference', '\$value': systemColors.tertiary},
      },
      'neutral': {
        '\$description': 'Neutral colors for backgrounds, borders, and text',
        '\$type': 'reference',
        '\$value': systemColors.neutral,
      },
      'feedback': {
        '\$description': 'Feedback colors for status and alerts',
        'error': {'\$type': 'reference', '\$value': systemColors.error},
        'warning': {'\$type': 'reference', '\$value': systemColors.warning},
        'success': {'\$type': 'reference', '\$value': systemColors.success},
        'info': {'\$type': 'reference', '\$value': systemColors.info},
      },
    };
  }

  String _colorToHex(Color color) {
    final argb = color.toARGB32();
    return '#${argb.toRadixString(16).substring(2).toUpperCase()}';
  }
}

