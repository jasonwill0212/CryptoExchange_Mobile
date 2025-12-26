import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:cryptoexchange/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isCompletedOnboarding = StorageService.instance
          .checkOnboardingStatus();

      if (isCompletedOnboarding) {
        Navigator.pushReplacementNamed(context, AppRoute.authPage);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = context.watch<OnboardingProvider>();
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: PageView(
                controller: onboardingProvider.pageController,
                onPageChanged: (index) {
                  onboardingProvider.setCurrentPage(index);
                },
                children: [
                  _onboardingItem(
                    onboardingProvider.currentPage,
                    onboardingProvider.pageController,
                    context,
                    "Take hold of your\nfinances",
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.",
                    AppPath.imgPeopleillustration,
                  ),
                  _onboardingItem(
                    onboardingProvider.currentPage,
                    onboardingProvider.pageController,
                    context,
                    "Smart trading tools",
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.",
                    AppPath.imgPhoneillustration,
                  ),
                  _onboardingItem(
                    onboardingProvider.currentPage,
                    onboardingProvider.pageController,
                    context,
                    "Invest in the future",
                    "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Ut eget mauris massa pharetra.",
                    AppPath.imgLaptopillustration,
                  ),
                ],
              ),
            ),
            AppButton(
              contentButtonType: ContentButtonType.normal,
              textButton: 'Next',
              buttonType: ButtonType.normal,
              ontap: () async {
                onboardingProvider.nextPage(context);
              },
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

Column _onboardingItem(
  currentPageIndex,
  pageController,
  BuildContext context,
  String title,
  String description,
  String imagePath,
) {
  return Column(
    children: [
      Image.asset(AppPath.imgCoinMoney),
      SizedBox(height: 50),
      SizedBox(
        height: (372 / 812) * context.screenHeight,
        child: Image.asset(imagePath),
      ),
      SizedBox(
        height: 76,
        child: Center(
          child: AppText(
            text: title,
            style: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(height: 1),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      SizedBox(height: 8),
      AppText(
        text: description,
        style: AppTextStyle.tsRegulardarkNavyBlue14.copyWith(height: 1),
      ),
    ],
  );
}
