import 'package:cryptoexchange/screens/navigationbottom/bottomnavigationbar.dart';
import 'package:cryptoexchange/screens/onboarding/onboarding_page.dart';
import 'package:cryptoexchange/screens/onboarding/onboarding_three_page.dart';
import 'package:cryptoexchange/screens/onboarding/onboarding_two_page.dart';
import 'package:cryptoexchange/screens/setting_page.dart';
import 'package:flutter/widgets.dart';

class AppRoute {
  static const String onboardingPage = '/onboarding';
  static const String onboardingPageTwo = '/onboardingTwo';
  static const String onboardingPageThree = '/onboardingThree';
  static const String homePage = '/homePage';
  static const String settingPage = '/settingPage';

  Map<String, Widget Function(BuildContext context)> routes =
      <String, WidgetBuilder>{
        AppRoute.onboardingPage: (context) => const OnboardingPage(),
        AppRoute.onboardingPageTwo: (context) => const OnboardingTwoPage(),
        AppRoute.onboardingPageThree: (context) => const OnboardingThreePage(),
        AppRoute.homePage: (context) => const Bottomnavigationbar(),
        AppRoute.settingPage: (context) => const SettingPage(),
      };
}
