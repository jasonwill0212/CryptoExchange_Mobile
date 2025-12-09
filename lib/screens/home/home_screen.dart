import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      body: _body(context),
    );
  }
}

Column _body(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 50),
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Row(
          children: [
            Expanded(
              child: Row(children: [SvgPicture.asset(AppPath.icProfile)]),
            ),
            Image.asset(AppPath.imgCoinMoney),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.settingPage);
                    },
                    child: SvgPicture.asset(AppPath.icSetting),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      AppText(
        text: 'Portfolio Balance',
        style: AppTextstyle.tsMediumdarkNavyBlue16,
      ),
      SizedBox(height: 4),
      AppText(
        text: '\$2,760.23',
        style: AppTextstyle.tssemiBolddarkNavyBlue32.copyWith(height: 1.0),
      ),
      SizedBox(height: 4),
      AppText(text: '+2.60%'),
      SizedBox(height: 16),
      Image.asset(
        AppPath.imgChartBalance,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ],
  );
}
