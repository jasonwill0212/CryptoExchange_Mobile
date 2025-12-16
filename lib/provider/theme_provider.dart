import 'package:cryptoexchange/core/theme/app_theme.dart';
import 'package:cryptoexchange/services/storage_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeProvider() {
    _initThemeData();
  }

  ThemeData? themeData;

  bool get isDark {
    return themeData == AppTheme.darkTheme;
  }

  void _initThemeData() {
    final isDarkMode = StorageService.instance.getThemeMode();
    _setThemeDataHelper(isDarkMode);
  }

  void toggleTheme(bool isDarkMode) {
    _setThemeDataHelper(isDarkMode);
    StorageService.instance.setThemeMode(isDarkMode);
  }

  void _setThemeDataHelper(bool isDarkMode) {
    if (isDarkMode) {
      themeData = AppTheme.darkTheme;
    } else {
      themeData = AppTheme.lightTheme;
    }
    notifyListeners();
  }
}
