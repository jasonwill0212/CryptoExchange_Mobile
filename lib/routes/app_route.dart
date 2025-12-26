import 'package:cryptoexchange/screens/bottom_tab/bottomnavigationbar.dart';
import 'package:cryptoexchange/screens/onboarding/onboarding_page.dart';
import 'package:cryptoexchange/screens/auth/auth_page.dart';
import 'package:cryptoexchange/screens/settings/setting_page.dart';
import 'package:cryptoexchange/screens/trading%20chart/trading_chart.dart';
import 'package:flutter/widgets.dart';

class AppRoute {
  static const String onboardingPage = '/onboarding';
  static const String homePage = '/homePage';
  static const String settingPage = '/settingPage';
  static const String authPage = '/AuthPage';
  static const String tradeChartPage = '/tradeChartPage';

  Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
        AppRoute.onboardingPage: (context) => const OnboardingPage(),
        AppRoute.homePage: (context) => const Bottomnavigationbar(),
        AppRoute.authPage: (context) => const AuthPage(),
        AppRoute.settingPage: (context) => const SettingPage(),
        AppRoute.tradeChartPage: (context) => const TradingChart(),
      };
}
