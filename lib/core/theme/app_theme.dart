import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    primaryColor: AppColor.darkNavyBlue,
    scaffoldBackgroundColor: AppColor.darkNavyBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.darkNavyBlue,
      titleTextStyle: AppTextStyle.tsMediumdarkNavyBlue18,
      iconTheme: IconThemeData(color: AppColor.darkNavyBlue),
    ),

    /// textStyle
    textTheme: TextTheme(
      displayLarge: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      displayMedium: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.white,
      ),
      displaySmall: AppTextStyle.tsRegulargrayishNavy14.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      bodyLarge: AppTextStyle.tsRegulargreen16.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      bodyMedium: AppTextStyle.tsRegularred14.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      bodySmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.darkNavyBlue,
      ),
    ),

    /// color scheme
    colorScheme: ColorScheme.light(
      primary: AppColor.darkNavyBlue,
      secondary: AppColor.red,
      primaryContainer: AppColor.green,
      onPrimary: AppColor.brightBlue,
    ),
  );

  /// Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    // brightness: Brightness.light,
    primaryColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.almostWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.almostWhite,
      titleTextStyle: AppTextStyle.tsMediumdarkNavyBlue18,
      iconTheme: IconThemeData(color: AppColor.white),
    ),

    /// textStyle
    textTheme: TextTheme(
      displayLarge: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: AppColor.almostWhite,
      ),
      displayMedium: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
        color: AppColor.darkNavyBlue,
      ),
      displaySmall: AppTextStyle.tsRegulargrayishNavy14.copyWith(
        color: AppColor.almostWhite,
      ),
      bodyLarge: AppTextStyle.tsRegulargreen16.copyWith(
        color: AppColor.almostWhite,
      ),
      bodyMedium: AppTextStyle.tsRegularred14.copyWith(
        color: AppColor.almostWhite,
      ),
      bodySmall: AppTextStyle.tsRegulargrayishNavy12.copyWith(
        color: AppColor.almostWhite,
      ),
    ),

    /// color scheme
    colorScheme: ColorScheme.light(
      primary: AppColor.white,
      secondary: AppColor.brightBlue,
      primaryContainer: AppColor.almostWhite,
      onPrimary: AppColor.white,
    ),
  );
}
