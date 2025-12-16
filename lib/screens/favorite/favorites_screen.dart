import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(),
      body: _body(),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: AppColor.almostWhite,
    centerTitle: true,
    title: AppText(
      text: 'Favorites',
      style: AppTextStyle.tsMediumdarkNavyBlue18,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SvgPicture.asset(AppPath.icFilter),
      ),
    ],
  );
}

Widget _body() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Row(
          children: [
            AppText(
              text: 'Pair\nUSDT',
              style: AppTextStyle.tsRegulardarkNavyBlue14,
            ),
            Spacer(),
            AppText(
              text: 'Last\nPrice',
              style: AppTextStyle.tsRegulardarkNavyBlue14,
            ),
            SizedBox(width: 16),
            AppText(
              text: '24H\nChange',
              style: AppTextStyle.tsRegulardarkNavyBlue14,
            ),
          ],
        ),
      ),
    ],
  );
}
