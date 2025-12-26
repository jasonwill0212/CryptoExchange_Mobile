import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_social.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      body: _body(context),
    );
  }
}

Center _body(context) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
          child: Image.asset(AppPath.imgCoinMoney),
        ),
        AppText(
          text: 'Hello! Start your\ncrypto investment\ntoday',
          style: AppTextStyle.tssemiBolddarkNavyBlue32,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 16),
          child: AppSocial(type: SocialType.google),
        ),
        AppSocial(type: SocialType.facebook),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: AppSocial(type: SocialType.apple),
        ),
        AppButton(
          contentButtonType: ContentButtonType.normal,
          textButton: 'Sign up with email',
          buttonType: ButtonType.normal,
          ontap: () {
            Navigator.pushNamed(context, AppRoute.homePage);
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 108, 0, 36),
          child: AppText(
            text: 'Already have an account?',
            style: AppTextStyle.tsRegulardarkNavyBlue14,
          ),
        ),
        AppButton(
          contentButtonType: ContentButtonType.normal,
          textButton: 'Sign in',
          buttonType: ButtonType.second,
          ontap: () {
            Navigator.pushNamed(context, AppRoute.homePage);
          },
        ),
      ],
    ),
  );
}
