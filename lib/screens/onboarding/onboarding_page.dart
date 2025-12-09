import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/provider/storage_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final storageProvider = context.watch<StorageProvider>();
    final onboardingProvider = context.watch<OnboardingProvider>();

    if (storageProvider.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (storageProvider.isCompleted) {
      Future.microtask(() {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, AppRoute.authPage);
        }
      });
    }
    return Consumer(
      builder: (context, storageProvider, _) => Scaffold(
        body: Column(
          children: [
            Expanded(
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
          ],
        ),
      ),
    );
  }
}

Container _onboardingItem(
  currentPageIndex,
  pageController,
  BuildContext context,
  String title,
  String description,
  String imagePath,
) {
  final onboardingPage = context.read<OnboardingProvider>();
  return Container(
    decoration: BoxDecoration(color: AppColor.almostWhite),
    child: Column(
      children: [
        SizedBox(height: 50),
        Image.asset(AppPath.imgCoinMoney),
        SizedBox(height: 50),
        SizedBox(height: 372, child: Image.asset(imagePath)),
        SizedBox(height: 66),
        SizedBox(
          height: 76,
          child: Center(
            child: AppText(
              text: title,
              style: AppTextstyle.tssemiBolddarkNavyBlue32.copyWith(height: 1),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 8),
        AppText(
          text: description,
          style: AppTextstyle.tsRegulardarkNavyBlue14.copyWith(height: 1),
        ),
        SizedBox(height: 48),
        AppButton(
          textButton: 'Next',
          buttonType: ButtonType.normal,
          ontap: () async {
            onboardingPage.nextPage(context);
          },
        ),
      ],
    ),
  );
}
