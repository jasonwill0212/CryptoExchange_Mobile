import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDark = false;

  void toggleTheme(bool value) {
    isDark = value;
    notifyListeners();
  }
}
