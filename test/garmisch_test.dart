import 'package:flutter_test/flutter_test.dart';

import 'package:garmisch/garmisch.dart';

void main() {
  group('GColors', () {
    test('has correct gray scale values', () {
      expect(GColors.gray50.toARGB32(), 0xFFF9FAFB);
      expect(GColors.gray500.toARGB32(), 0xFF6B7280);
      expect(GColors.gray900.toARGB32(), 0xFF111827);
    });

    test('has correct base colors', () {
      expect(GColors.white.toARGB32(), 0xFFFFFFFF);
      expect(GColors.black.toARGB32(), 0xFF000000);
      expect(GColors.transparent.toARGB32(), 0x00000000);
    });

    test('has correct blue scale values', () {
      expect(GColors.blue500.toARGB32(), 0xFF3B82F6);
      expect(GColors.blue600.toARGB32(), 0xFF2563EB);
    });
  });

  group('GSpacing', () {
    test('has correct spacing values', () {
      expect(GSpacing.none, 0.0);
      expect(GSpacing.xs, 8.0);
      expect(GSpacing.sm, 12.0);
      expect(GSpacing.md, 16.0);
      expect(GSpacing.lg, 20.0);
      expect(GSpacing.xl, 24.0);
    });
  });

  group('GBorderRadius', () {
    test('has correct radius values', () {
      expect(GBorderRadius.none, 0.0);
      expect(GBorderRadius.sm, 4.0);
      expect(GBorderRadius.md, 6.0);
      expect(GBorderRadius.lg, 8.0);
      expect(GBorderRadius.full, 9999.0);
    });
  });

  group('GTypography', () {
    test('has correct font size values', () {
      expect(GTypography.fontSizeXs, 12.0);
      expect(GTypography.fontSizeSm, 14.0);
      expect(GTypography.fontSizeBase, 16.0);
      expect(GTypography.fontSizeLg, 18.0);
    });
  });

  group('GColorScheme', () {
    test('light theme has correct brightness', () {
      final scheme = GColorScheme.light();
      expect(scheme.isLight, true);
      expect(scheme.isDark, false);
    });

    test('dark theme has correct brightness', () {
      final scheme = GColorScheme.dark();
      expect(scheme.isLight, false);
      expect(scheme.isDark, true);
    });

    test('light theme has correct primary colors', () {
      final scheme = GColorScheme.light();
      expect(scheme.primary, GColors.blue600);
      expect(scheme.onPrimary, GColors.white);
    });
  });

  group('GThemeData', () {
    test('light theme factory works correctly', () {
      final theme = GThemeData.light();
      expect(theme.isLight, true);
      expect(theme.isDark, false);
    });

    test('dark theme factory works correctly', () {
      final theme = GThemeData.dark();
      expect(theme.isLight, false);
      expect(theme.isDark, true);
    });

    test('copyWith preserves values', () {
      final theme = GThemeData.light();
      final newColors = GColorScheme.dark();
      final copied = theme.copyWith(colors: newColors);
      expect(copied.colors, newColors);
      expect(copied.textTheme, theme.textTheme);
    });
  });

  group('GBreakpoints', () {
    test('has correct breakpoint values', () {
      expect(GBreakpoints.xs, 0.0);
      expect(GBreakpoints.sm, 576.0);
      expect(GBreakpoints.md, 768.0);
      expect(GBreakpoints.lg, 992.0);
      expect(GBreakpoints.xl, 1200.0);
      expect(GBreakpoints.xl2, 1400.0);
    });

    test('breakpoint detection works correctly', () {
      expect(GBreakpoints.isXs(400), true);
      expect(GBreakpoints.isSm(600), true);
      expect(GBreakpoints.isMd(800), true);
      expect(GBreakpoints.isLg(1000), true);
      expect(GBreakpoints.isXl(1300), true);
      expect(GBreakpoints.isXl2(1500), true);
    });

    test('current breakpoint detection works', () {
      expect(GBreakpoints.current(400), GBreakpointToken.xs);
      expect(GBreakpoints.current(600), GBreakpointToken.sm);
      expect(GBreakpoints.current(800), GBreakpointToken.md);
      expect(GBreakpoints.current(1000), GBreakpointToken.lg);
      expect(GBreakpoints.current(1300), GBreakpointToken.xl);
      expect(GBreakpoints.current(1500), GBreakpointToken.xl2);
    });
  });
}
