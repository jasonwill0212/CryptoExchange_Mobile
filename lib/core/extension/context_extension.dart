import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  /// screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// theme data
  ThemeData get theme => Theme.of(this);

  /// scaffold background color
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// text theme
  TextTheme get textTheme => theme.textTheme;

  /// displayMedium
  TextStyle? get displayMedium => textTheme.displayMedium;

  /// color scheme
  ColorScheme get colorScheme => theme.colorScheme;
}
