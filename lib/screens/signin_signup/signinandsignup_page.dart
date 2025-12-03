import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SigninandsignupPage extends StatelessWidget {
  const SigninandsignupPage({super.key});

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
          style: AppTextstyle.tssemiBolddarkNavyBlue32,
        ),
        SizedBox(height: 24),
        _appButtonFacebookGoogleApple(
          'Continue with Facebook',
          AppPath.icFacebook,
          context,
        ),
        _appButtonFacebookGoogleApple(
          'Continue with Google',
          AppPath.icGoogle,
          context,
        ),
        _appButtonFacebookGoogleApple(
          'Continue with Apple',
          AppPath.icApple,
          context,
        ),
        _buttonSigninAndSignup('Sign up with email', () {}, true),
        SizedBox(height: 123),
        AppText(
          text: 'Already have an account?',
          style: AppTextstyle.tsRegulardarkNavyBlue14,
        ),
        SizedBox(height: 36),
        _buttonSigninAndSignup('Sign In', () {
          Navigator.pushNamed(context, AppRoute.signinPage);
        }, false),
      ],
    ),
  );
}

AppButton _buttonSigninAndSignup(
  String label,
  GestureTapCallback ontap,
  bool isSigninorSignup,
) {
  return isSigninorSignup
      ? AppButton(ontap: ontap, textButton: label)
      : AppButton(
          ontap: ontap,
          textButton: label,
          style: AppTextstyle.tsMediumbrightBlue16,
        );
}

Padding _appButtonFacebookGoogleApple(String label, String apppath, context) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
    child: AppButton(
      ontap: () {
        Navigator.pushNamed(context, AppRoute.homePage);
      },
      childContent: Row(
        children: [
          SizedBox(width: 14),
          SvgPicture.asset(apppath),
          SizedBox(width: 8),
          AppText(text: label, style: AppTextstyle.tsRegulardarkNavyBlue14),
        ],
      ),
    ),
  );
}
