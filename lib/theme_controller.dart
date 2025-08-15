// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';

// Simple ThemeController for Clean Architecture (without GetX dependency)
class ThemeController extends ChangeNotifier {
  static String theme = ThemeOptions.light;
  
  ThemeMode get themeMode {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> getThemeState() async {
    // Default to light theme
    return setTheme(ThemeOptions.light);
  }

  Future<void> setTheme(String value) async {
    theme = value;
    notifyListeners();
  }
}

class ThemeOptions {
  static String system = 'system';
  static String light = 'light';
  static String dark = 'dark';
}
