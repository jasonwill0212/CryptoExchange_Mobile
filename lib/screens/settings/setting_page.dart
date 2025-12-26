import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/screens/settings/widget/widget_tableview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appBar(context),
      body: SafeArea(child: _body(context)),
    );
  }
}

//appbar
AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    title: AppText(
      text: 'Settings',
      style: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SvgPicture.asset(AppPath.icSearch),
      ),
    ],
  );
}

//body
Widget _body(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        //infomation avatar and name
        _infoAvatarName(context),
        texttableview('Privacy'),
        //tableview privacy
        SettingCardWidget(
          items: [
            SettingCardItem(
              prefixIconPath: AppPath.icProfile,
              title: 'Profile',
            ),
            SettingCardItem(
              prefixIconPath: AppPath.icSecurity,
              title: 'Security',
            ),
          ],
        ),
        texttableview('Finance'),
        SettingCardWidget(
          items: [
            SettingCardItem(prefixIconPath: AppPath.icFile, title: 'History'),
            SettingCardItem(prefixIconPath: AppPath.icLimit, title: 'Limit'),
          ],
        ),
        texttableview('Account'),
        //tableview account
        SettingCardWidget(
          items: [
            SettingCardItem(
              prefixIconPath: AppPath.icFile,
              title: 'Notifications',
            ),
            SettingCardItem(
              prefixIconPath: AppPath.icLimit,
              title: 'Theme',
              hasSwitch: true,
            ),
          ],
        ),
        texttableview('More'),
        //tableview more
        SettingCardWidget(
          items: [
            SettingCardItem(prefixIconPath: AppPath.icGift, title: 'My Bonus'),
            SettingCardItem(
              prefixIconPath: AppPath.icUserPlus,
              title: 'Share with friends',
            ),
            SettingCardItem(prefixIconPath: AppPath.icQuestion, title: 'Help'),
          ],
        ),
        SizedBox(height: 24),
        //button logout
        AppButton(
          contentButtonType: ContentButtonType.normal,
          textButton: 'Log out',
          buttonType: ButtonType.second,
        ),
      ],
    ),
  );
}

//text tableview
Padding texttableview(String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 14, 0, 8),
    child: AppText(text: text, style: AppTextStyle.tsRegulargrayishNavy14),
  );
}

//infomation avatar and name
Container _infoAvatarName(BuildContext context) {
  final String email = 'thuongdo@gmail.com';
  return Container(
    height: context.w(80),
    width: context.w(344),
    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(foregroundImage: AssetImage(AppPath.imgAvatar)),
                SizedBox(width: 12),
                AppText(
                  text: 'Dmutro\nto**@***.com',
                  style: AppTextStyle.tsRegulardarkNavyBlue14,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(height: 8),
            //ID
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
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: email));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("$email copied to clipboard")),
                    );
                  },
                  child: SvgPicture.asset(AppPath.icCoppy),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        // verify card
        Container(
          width: context.w(94),
          height: context.w(36),
          decoration: BoxDecoration(
            color: AppColor.lightPastelGreen,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
