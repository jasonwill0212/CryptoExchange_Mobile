import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingThreePage extends StatelessWidget {
  const OnboardingThreePage({super.key});

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
Center _body(context, OnboardingProvider onboardingProvide) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(110, 50, 111, 81),
          child: Image.asset(AppPath.imgCoinMoney),
        ),
        Image.asset(AppPath.imgLaptopillustration),
        _vectorTextAndButton(context, onboardingProvide),
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
        AppPath.imgVectorThree,
        width: double.infinity,
        fit: BoxFit.cover,
      ),

      Positioned(
        child: Column(
          children: [
            AppText(
              text: 'Invest in the future',
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
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoute.homePage,
              (route) => false,
            );
            onboardingProvider.completed();
          },
          textButton: 'Next',
        ),
      ),
    ],
  );
}
