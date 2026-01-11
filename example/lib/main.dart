import 'package:flutter/material.dart';
import 'package:garmisch/garmisch.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const GarmischShowcaseApp());
}

class GarmischShowcaseApp extends StatefulWidget {
  const GarmischShowcaseApp({super.key});

  @override
  State<GarmischShowcaseApp> createState() => _GarmischShowcaseAppState();
}

class _GarmischShowcaseAppState extends State<GarmischShowcaseApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _themeMode == ThemeMode.dark;
    final gTheme = isDark ? GThemeData.dark() : GThemeData.light();

    return GTheme(
      data: gTheme,
      child: MaterialApp(
        title: 'Garmisch Design System',
        debugShowCheckedModeBanner: false,
        themeMode: _themeMode,
        theme: GThemeData.light().toThemeData(),
        darkTheme: GThemeData.dark().toThemeData(),
        home: HomeScreen(
          onThemeToggle: _toggleTheme,
          isDarkMode: isDark,
        ),
      ),
    );
  }
}

