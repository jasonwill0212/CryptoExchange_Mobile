import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      body: _body(context),
    );
  }
}

Center _body(context) {
  bool isSwitched = false;
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
          child: Image.asset(AppPath.imgCoinMoney),
        ),
        AppText(
          text: 'Login to your\nAccount',
          style: AppTextstyle.tssemiBolddarkNavyBlue32,
        ),
        SizedBox(height: 16),
        inputEmailandPass('Email address'),
        inputEmailandPass('Pasword'),
        AppText(
          text: 'Forgot your password? Click here',
          style: AppTextstyle.tsRegulardarkNavyBlue14,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 0, 19),
          child: unlockTouchid(isSwitched),
        ),
        AppButton(
          ontap: () {
            Navigator.pushNamed(context, AppRoute.homePage);
          },
          textButton: 'Sign In',
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 159, 0, 36),
          child: AppText(
            text: 'or continue with',
            style: AppTextstyle.tsRegulardarkNavyBlue14,
          ),
        ),
        _buttonFacebookGoogleApple(),
      ],
    ),
  );
}

Padding inputEmailandPass(String label) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
    child: TextFormField(
      decoration: InputDecoration(
        focusColor: AppColor.brightBlue,
        filled: true,
        labelText: label,
        labelStyle: AppTextstyle.tsRegulardarkNavyBlue14,
        fillColor: AppColor.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.brightBlue, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.brightBlue, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

Row unlockTouchid(isSwitched) {
  return Row(
    children: [
      SizedBox(width: 30),
      AppText(
        text: 'Unlock with Touch ID?',
        style: AppTextstyle.tsRegulardarkNavyBlue14,
      ),
      Spacer(),
      Padding(
        padding: const EdgeInsets.only(right: 29),
        child: Switch(
          inactiveTrackColor: AppColor.lightgrayishblue,
          inactiveThumbColor: AppColor.almostWhite,
          value: isSwitched,
          onChanged: (value) {},
        ),
      ),
    ],
  );
}

AppButton _socialButton(String apppath) {
  return AppButton(
    ontap: () {},
    height: 48,
    width: 48,
    isBorderbox: true,
    color: AppColor.lightgrayishblue,
    widthBorder: 1,
    childContent: SvgPicture.asset(apppath),
  );
}

Row _buttonFacebookGoogleApple() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _socialButton(AppPath.icFacebook),
      Padding(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: _socialButton(AppPath.icApple),
      ),
      _socialButton(AppPath.icGoogle),
    ],
  );
}
