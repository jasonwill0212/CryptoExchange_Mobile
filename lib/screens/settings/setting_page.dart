import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/theme_provider.dart';
import 'package:cryptoexchange/screens/settings/widget/widget_tableview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context).isDark
          ? AppColor.darkNavyBlue
          : AppColor.almostWhite,
      appBar: _appBar(),
      body: _body(context),
    );
  }
}

//appbar
AppBar _appBar() {
  return AppBar(
    backgroundColor: AppColor.almostWhite,
    centerTitle: true,
    title: AppText(
      text: 'Settings',
      style: AppTextStyle.tsMediumdarkNavyBlue18,
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
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            //infomation avatar and name
            _infoAvatarName(context),
            texttableview('Privacy'),
            //tableview privacy
            WidgetTableview(appPath: AppPath.icProfile, text: 'Profile'),
            WidgetTableview(appPath: AppPath.icSecurity, text: 'Security'),
            texttableview('Finance'),
            //tableview finance
            WidgetTableview(appPath: AppPath.icFile, text: 'History'),
            WidgetTableview(appPath: AppPath.icLimit, text: 'Limit'),
            texttableview('Account'),
            //tableview account
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) => WidgetTableview(
                appPath: AppPath.icTheme,
                text: 'Theme',
                tableViewType: TableViewType.withSwitch,
              ),
            ),
            WidgetTableview(appPath: AppPath.icBell, text: 'Notifications'),
            texttableview('More'),
            //tableview more
            WidgetTableview(appPath: AppPath.icGift, text: 'My Bonus'),
            WidgetTableview(
              appPath: AppPath.icUserPlus,
              text: 'Share with friends',
            ),
            WidgetTableview(appPath: AppPath.icQuestion, text: 'Help'),
            SizedBox(height: 24),
            //button logout
            AppButton(textButton: 'Log out', buttonType: ButtonType.second),
          ],
        ),
      ),
    ),
  );
}

//text tableview
Widget texttableview(String text) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 14, 0, 8),
    child: AppText(text: text, style: AppTextStyle.tsRegulargrayishNavy14),
  );
}

//infomation avatar and name
Widget _infoAvatarName(BuildContext context) {
  return Container(
    height: context.w(80),
    width: context.w(344),
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: AppColor.brightBlue.withValues(alpha: 0.12),
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
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
                  //name and gmail
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: 'Dmutro',
                        style: AppTextStyle.tsRegulardarkNavyBlue14,
                      ),
                      AppText(
                        text: 'to**@***.com',

                        /// TODO: Implement email masking
                        // text: 'to***@***.com',
                        style: AppTextStyle.tsRegulardarkNavyBlue14,
                      ),
                    ],
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
                      /// TODO: Implement copy to clipboard functionality
                      /// copy real email to clipboard
                      /// show snackbar 'Copied to clipboard' success message
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
    ),
  );
}
