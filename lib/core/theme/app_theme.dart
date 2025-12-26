import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Dark Theme Data - Chế độ tối
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.brightBlue,
    scaffoldBackgroundColor: AppColor.darkNavyBlue,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.darkNavyBlue,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.white,
      ),
      iconTheme: IconThemeData(color: AppColor.white),
    ),

    /// Card Theme
    cardTheme: CardThemeData(
      color: AppColor.darkSurface,
      elevation: 2,
      shadowColor: AppColor.brightBlue.withOpacity(0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    /// Text Style - Màu sắc cho chế độ tối
    textTheme: TextTheme(
      // Tiêu đề lớn
      displayLarge: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(
        color: AppColor.white,
      ),
      // Tiêu đề vừa
      displayMedium: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.white,
      ),
      // Tiêu đề nhỏ
      displaySmall: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.white,
      ),
      // Title
      titleLarge: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(
        color: AppColor.white,
      ),
      titleMedium: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.white,
      ),
      titleSmall: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.white,
      ),
      // Body text
      bodyLarge: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.white,
      ),
      bodyMedium: AppTextStyle.tsRegulargrayishNavy14.copyWith(
        color: AppColor.grayishNavy,
      ),
      bodySmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.grayishNavy,
      ),
      // Label
      labelLarge: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.brightBlue,
      ),
      labelMedium: AppTextStyle.tsRegulardarkNavyBlue14.copyWith(
        color: AppColor.brightBlue,
      ),
      labelSmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.brightBlue,
      ),
    ),

    /// Color Scheme - Chế độ tối
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColor.brightBlue,
      secondary: AppColor.brightBlue,
      surface: AppColor.darkSurface,
      error: AppColor.red,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      onSurface: AppColor.white,
      onError: AppColor.white,
      primaryContainer: AppColor.darkSurface,
      secondaryContainer: AppColor.darkNavyBlue,
    ),

    /// Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColor.grayishNavy.withOpacity(0.3),
      thickness: 1,
    ),

    /// Icon Theme
    iconTheme: IconThemeData(color: AppColor.white, size: 24),
  );

  /// Light Theme Data - Chế độ sáng
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.brightBlue,
    scaffoldBackgroundColor: AppColor.almostWhite,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.almostWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      iconTheme: IconThemeData(color: AppColor.darkNavyBlue),
    ),

    /// Card Theme
    cardTheme: CardThemeData(
      color: AppColor.white,
      elevation: 2,
      shadowColor: AppColor.brightBlue.withOpacity(0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    /// Text Style - Màu sắc cho chế độ sáng
    textTheme: TextTheme(
      // Tiêu đề lớn
      displayLarge: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      // Tiêu đề vừa
      displayMedium: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      // Tiêu đề nhỏ
      displaySmall: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      // Title
      titleLarge: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      titleMedium: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      titleSmall: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      // Body text
      bodyLarge: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      bodyMedium: AppTextStyle.tsRegulargrayishNavy14.copyWith(
        color: AppColor.grayishNavy,
      ),
      bodySmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.grayishNavy,
      ),
      // Label
      labelLarge: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.brightBlue,
      ),
      labelMedium: AppTextStyle.tsRegulardarkNavyBlue14.copyWith(
        color: AppColor.brightBlue,
      ),
      labelSmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.brightBlue,
      ),
    ),

    /// Color Scheme - Chế độ sáng
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColor.brightBlue,
      secondary: AppColor.brightBlue,
      surface: AppColor.white,
      error: AppColor.red,
      onPrimary: AppColor.white,
      onSecondary: AppColor.white,
      onSurface: AppColor.darkNavyBlue,
      onError: AppColor.white,
      primaryContainer: AppColor.almostWhite,
      secondaryContainer: AppColor.almostWhite,
    ),

    /// Divider Theme
    dividerTheme: DividerThemeData(
      color: AppColor.grayishNavy.withOpacity(0.3),
      thickness: 1,
    ),

    /// Icon Theme
    iconTheme: IconThemeData(color: AppColor.darkNavyBlue, size: 24),
  );
}
