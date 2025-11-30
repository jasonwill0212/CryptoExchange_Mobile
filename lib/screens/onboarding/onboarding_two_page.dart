import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingTwoPage extends StatelessWidget {
  const OnboardingTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );

    return Scaffold(body: _body(context, onboardingProvider));
  }
}

//body
Center _body(BuildContext context, OnboardingProvider onboardingProvider) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(110, 50, 111, 81),
          child: Image.asset(AppPath.imgCoinMoney),
        ),
        Image.asset(AppPath.imgPhoneillustration),
        _vectorTextAndButton(context, onboardingProvider),
      ],
    ),
  );
}

// Vector Text Button
Stack _vectorTextAndButton(context, OnboardingProvider onboardingProvider) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(
        AppPath.imgVectorTwo,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      Positioned(
        child: Column(
          children: [
            AppText(
              text: 'Smart trading tools',
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
            Navigator.pushNamed(context, AppRoute.onboardingPageThree);
          },
          textButton: 'Next',
        ),
      ),
    ],
  );
}
