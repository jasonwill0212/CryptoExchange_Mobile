import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/string_helper.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeProvider = context.read<HomeProvider>();
      homeProvider.connectToTickerStream();
    });
    super.initState();
  }

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
        style: AppTextStyle.tsMediumdarkNavyBlue16,
      ),
      SizedBox(height: 4),
      AppText(
        text: '\$2,760.23',
        style: AppTextStyle.tssemiBolddarkNavyBlue32.copyWith(height: 1.0),
      ),
      SizedBox(height: 4),
      AppText(text: '+2.60%'),
      SizedBox(height: 16),
      Image.asset(
        AppPath.imgChartBalance,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Consumer<HomeProvider>(
        builder: (_, homeProvider, __) {
          if (homeProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (homeProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(homeProvider.errorMessage));
          }
          return Flexible(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = homeProvider.coins[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        StringHelper().getCoinImage(item.symbol),
                      ),
                      Text(item.symbol),
                      SizedBox(height: 8),
                      Text(item.currentPrice),
                      SizedBox(height: 8),
                      Text(item.priceChangePercent),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
              itemCount: homeProvider.coins.length,
            ),
          );
        },
      ),
    ],
  );
}
