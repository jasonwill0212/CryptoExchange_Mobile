import 'dart:ffi';

import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_card.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(context),
      body: SingleChildScrollView(child: _body()),
    );
  }
}

Padding _body() {
  return Padding(
    padding: EdgeInsets.only(left: 16),
    child: _privacyFinanceAccountMoreAvatarNameEmailAndID(),
  );
}

AppBar _appBar(context) {
  return AppBar(
    backgroundColor: AppColor.almostWhite,
    centerTitle: true,
    title: AppText(
      text: 'Settings',
      style: AppTextstyle.tsMediumdarkNavyBlue18,
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
    child: AppText(text: text, style: AppTextstyle.tsRegulargrayishNavy14),
  );
}

AppCard _avatarNameEmailAndID() {
  return AppCard(
    isShawdow: true,
    width: 30,
    height: 80,
    child: Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 14),
                CircleAvatar(foregroundImage: AssetImage(AppPath.imgAvatar)),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: 'Dmutro',
                      style: AppTextstyle.tsRegulardarkNavyBlue14,
                      textAlign: TextAlign.left,
                    ),
                    AppText(
                      text: 'to***@***.com',
                      style: AppTextstyle.tsRegulardarkNavyBlue14,
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
                SizedBox(width: 14),
                AppText(
                  text: 'ID 28954761',
                  style: AppTextstyle.tsRegulardarkNavyBlue14.copyWith(
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 4),
                AppButton(
                  ontap: () {},
                  child: SvgPicture.asset(AppPath.icCoppy),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(right: 14),
          child: AppCard(
            width: 330,
            height: 36,
            color: AppColor.lightPastelGreen,
            child: Row(
              children: [
                SizedBox(width: 9),
                SvgPicture.asset(AppPath.icVerified),
                SizedBox(width: 4),
                AppText(
                  text: 'Verified',
                  style: AppTextstyle.tsRegulardarkNavyBlue14,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

AppCard _privacy() {
  return AppCard(
    width: 30,
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
    width: 30,
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
    width: 30,
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
    width: 30,
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
        AppText(text: label, style: AppTextstyle.tsRegulardarkNavyBlue16),
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
Column _privacyFinanceAccountMoreAvatarNameEmailAndID() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16),
      _avatarNameEmailAndID(),
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
      _button(),
      SizedBox(height: 24),
    ],
  );
}

AppButton _button() {
  return AppButton(
    ontap: () {},
    isBorderbox: true,
    textButton: 'Log Out',
    style: AppTextstyle.tsMediumbrightBlue16,
  );
}
