import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: Change to use PageView
    final onboarding = context.watch<OnboardingProvider>();
    if (onboarding.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (onboarding.isCompleted) {
      Future.microtask(() {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, AppRoute.homePage);
        }
      });
    }

    return Scaffold(body: _body(context));
  }
}

//body
Center _body(context) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(110, 50, 111, 81),
          child: Image.asset(AppPath.imgCoinMoney),
        ),
        Image.asset(AppPath.imgPeopleillustration),
        _vectorTextAndButton(context),
      ],
    ),
  );
}

// Vector Text Button
Stack _vectorTextAndButton(context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(AppPath.imgVector, width: double.infinity, fit: BoxFit.cover),

      Positioned(
        child: Column(
          children: [
            AppText(
              text: 'Take hold of your\nfinances',
              style: AppTextstyle.tssemiBolddarkNavyBlue32.copyWith(
                height: 1.0,
              ),
            ),
            SizedBox(height: 8),
            AppText(
              text:
                  'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.',
              style: AppTextstyle.tsRegulardarkNavyBlue14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

      Positioned(
        bottom: 24,
        child: AppButton(
          ontap: () {
            Navigator.pushNamed(context, AppRoute.onboardingPageTwo);
          },
          textButton: 'Next',
        ),
      ),
    ],
  );
}
