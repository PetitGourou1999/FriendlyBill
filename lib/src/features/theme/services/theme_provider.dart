import 'dart:convert'; // For jsonDecode

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:json_theme/json_theme.dart';

class ThemeProvider {
  static late ThemeData theme;
  static ThemeProvider? _instance;

  static Future<ThemeProvider> get instance async {
    if (_instance == null) {
      final loadedTheme = await _loadTheme();
      _instance = ThemeProvider._internal(loadedTheme);
    }
    return _instance!;
  }

  ThemeProvider._internal(ThemeData anotherTheme) {
    theme = anotherTheme;
  }

  static _loadTheme() async {
    final themeStr = await rootBundle.loadString('assets/dark_theme.json');
    final themeJson = jsonDecode(themeStr);
    final decodedTheme = ThemeDecoder.decodeThemeData(themeJson);
    return decodedTheme;
  }
}
