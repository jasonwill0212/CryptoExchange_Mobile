import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_tableview.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cryptoexchange/components/app_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = 'thuong@gmail.com';
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _bodyWidget(email),
      ),
    );
  }
}

AppBar _appBar(context) {
  return AppBar(
    backgroundColor: AppColor.almostWhite,
    centerTitle: true,
    title: AppText(
      text: 'Settings',
      style: AppTextStyle.tsMediumdarkNavyBlue18,
    ),
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new, color: AppColor.grayishNavy),
    ),

    actions: [Icon(Icons.search), SizedBox(width: 15)],
  );
}

Padding _appText(String text) {
  return Padding(
    padding: EdgeInsets.only(left: 17),
    child: AppText(text: text, style: AppTextStyle.tsRegulargrayishNavy14),
  );
}

AppCard _avatarNameEmailAndID(String email) {
  return AppCard(
    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(foregroundImage: AssetImage(AppPath.imgAvatar)),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Dmutro',
                      style: AppTextStyle.tsRegulardarkNavyBlue14,
                      textAlign: TextAlign.left,
                    ),
                    AppText(
                      text: email,

                      /// TODO: Implement email masking
                      // text: 'to***@***.com',
                      style: AppTextStyle.tsRegulardarkNavyBlue14,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'ID 28954761',
                  style: AppTextStyle.tsRegulardarkNavyBlue14.copyWith(
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 4),
                // AppButton(
                //   ontap: () {
                //     /// TODO: Implement copy to clipboard functionality
                //     /// copy real email to clipboard
                //     /// show snackbar 'Copied to clipboard' success message
                //   },
                //   child: SvgPicture.asset(AppPath.icCoppy),
                // ),
              ],
            ),
          ],
        ),
        Spacer(),
        AppCard(
          width: 94,
          height: 36,
          color: AppColor.lightPastelGreen,
          child: Row(
            children: [
              SizedBox(width: 9),
              SvgPicture.asset(AppPath.icVerified),
              SizedBox(width: 4),
              AppText(
                text: 'Verified',
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

AppCard _privacy() {
  return AppCard(
    margin: EdgeInsets.fromLTRB(16, 0, 15, 0),
    height: 112,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconLabelAndAction('Profile', () {}, AppPath.icProfile),
        SizedBox(height: 16),
        _line(),
        SizedBox(height: 16),
        _iconLabelAndAction('Security', () {}, AppPath.icSecurity),
      ],
    ),
  );
}

AppCard _finance() {
  return AppCard(
    margin: EdgeInsets.fromLTRB(16, 0, 15, 0),
    height: 112,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconLabelAndAction('History', () {}, AppPath.icFile),
        SizedBox(height: 16),
        _line(),
        SizedBox(height: 16),
        _iconLabelAndAction('Limits', () {}, AppPath.icLimit),
      ],
    ),
  );
}

AppCard _account() {
  return AppCard(
    margin: EdgeInsets.fromLTRB(16, 0, 15, 0),
    height: 112,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconLabelAndAction('Theme', () {}, AppPath.icTheme),
        SizedBox(height: 16),
        _line(),
        SizedBox(height: 16),
        _iconLabelAndAction('Notifications', () {}, AppPath.icBell),
      ],
    ),
  );
}

AppCard _more() {
  return AppCard(
    margin: EdgeInsets.fromLTRB(16, 0, 15, 0),
    height: 168,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconLabelAndAction('My bouns', () {}, AppPath.icGift),
        SizedBox(height: 16),
        _line(),
        SizedBox(height: 16),
        _iconLabelAndAction('Share with friends', () {}, AppPath.icUserPlus),
        SizedBox(height: 16),
        _line(),
        SizedBox(height: 16),
        _iconLabelAndAction('Support', () {}, AppPath.icQuestion),
      ],
    ),
  );
}

//icon and label, action
InkWell _iconLabelAndAction(
  String label,
  GestureTapCallback ontap,
  String path,
) {
  return InkWell(
    onTap: ontap,
    child: Row(
      children: [
        SizedBox(width: 14),
        SvgPicture.asset(path),
        SizedBox(width: 4),
        AppText(text: label, style: AppTextStyle.tsRegulardarkNavyBlue16),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 14),
          child: Icon(Icons.arrow_forward_ios, color: AppColor.grayishNavy),
        ),
      ],
    ),
  );
}

//line
Align _line() {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(width: 330, height: 0.3, color: Color(0xFF000000)),
  );
}

//Privacy and Finance, Account, More, avatarnameEmailAndID
Column _bodyWidget(String email) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16),
      _avatarNameEmailAndID(email),
      SizedBox(height: 16),
      _appText('Privacy'),
      SizedBox(height: 8),
      _privacy(),
      SizedBox(height: 14),
      _appText('Finance'),
      SizedBox(height: 8),
      _finance(),
      SizedBox(height: 14),
      _appText('Account'),
      SizedBox(height: 8),
      _account(),
      SizedBox(height: 14),
      _appText('More'),
      SizedBox(height: 8),
      _more(),
      SizedBox(height: 24),
      AppButton(textButton: 'Logout', buttonType: ButtonType.second),
      SizedBox(height: 24),
    ],
  );
}
