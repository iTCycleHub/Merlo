// Copyright 2025 iTCycle. All rights reserved.
// Developed by iTCycle
// Project: Merlo

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Instancia global del ThemeController
final ThemeController globalThemeController = ThemeController();

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
    // Cargar tema guardado
    try {
      final prefs = await SharedPreferences.getInstance();
      theme = prefs.getString('theme_mode') ?? ThemeOptions.light;
      notifyListeners();
    } catch (e) {
      theme = ThemeOptions.light;
    }
  }

  Future<void> setTheme(String value) async {
    theme = value;
    // Guardar tema
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme_mode', value);
    } catch (e) {
      // Manejar error
    }
    notifyListeners();
  }
}

class ThemeOptions {
  static String system = 'system';
  static String light = 'light';
  static String dark = 'dark';
}
