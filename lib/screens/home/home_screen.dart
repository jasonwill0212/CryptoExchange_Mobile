import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:cryptoexchange/core/utils/string_helper.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:cryptoexchange/screens/home/widget/widget_boxdecoration.dart';
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
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(child: _body(context)),
    );
  }
}

Column _body(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 50, 18, 0),
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
      AppText(text: '+2.60%', style: AppTextStyle.tsRegulardarkNavyBlue16),
      SizedBox(height: 16),
      Image.asset(
        AppPath.imgChartBalance,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Column(children: [_textandMore('Market Movers')]),
      //list coin horizontal
      Consumer<HomeProvider>(
        builder: (_, homeProvider, __) {
          if (homeProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (homeProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(homeProvider.errorMessage));
          }
          return SizedBox(
            height: 172,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = homeProvider.coins[index];
                return _cardCoin(context, item);
              },
              separatorBuilder: (context, index) => SizedBox(width: 12),
              itemCount: homeProvider.coins.length,
            ),
          );
        },
      ),
      SizedBox(height: 8),

      _textandMore('Portfolio'),
      //list coin vertical
      Consumer(
        builder: (_, HomeProvider homeProvider, __) {
          if (homeProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (homeProvider.errorMessage.isNotEmpty) {
            return Center(child: Text(homeProvider.errorMessage));
          }
          return SizedBox(
            height: context.screenHeight * 0.4,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              itemBuilder: (context, index) {
                final item = homeProvider.coins[index];
                return _cardCoinPortfolio(context, item);
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemCount: homeProvider.coins.length,
            ),
          );
        },
      ),
    ],
  );
}

//card coin portfolio
Container _cardCoinPortfolio(BuildContext context, Coin item) {
  final percent = double.tryParse(item.priceChangePercent.toString()) ?? 0;
  return Container(
    width: context.screenWidth * 0.9,
    height: context.screenHeight * 0.08,
    decoration: WidgetBoxDecoration.boxDecoration,
    padding: const EdgeInsets.fromLTRB(14, 0, 8, 0),
    child: Row(
      children: [
        SvgPicture.asset(
          StringHelper.getCoinImage(item.symbol),
          width: 40,
          height: 40,
        ),
        SizedBox(width: 8),

        /// Text.rich
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: item.symbol,
              style: AppTextStyle.tsRegulardarkNavyBlue16,
            ),
            AppText(
              text: item.symbol.split('USDT')[0],
              style: AppTextStyle.tsRegulargrayishNavy14,
            ),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppText(
              text: '\$${double.parse(item.currentPrice).toStringAsFixed(2)}',
              style: AppTextStyle.tsRegulardarkNavyBlue16,
            ),
            AppText(
              text: '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%',
              style: AppTextStyle.tsMediumdarkNavyBlue16.copyWith(
                color: percent >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//card coin
Container _cardCoin(BuildContext context, Coin item) {
  final percent = double.tryParse(item.priceChangePercent.toString()) ?? 0;
  return Container(
    width: context.screenWidth * 0.41,
    decoration: WidgetBoxDecoration.boxDecoration,
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //symbol and Price change, image coin icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text:
                  '${item.symbol} \n${double.parse(item.currentPrice).toStringAsFixed(2)}',
              textAlign: TextAlign.start,
              style: AppTextStyle.tsRegulardarkNavyBlue16,
            ),
            //image coin icon
            SvgPicture.asset(
              StringHelper.getCoinImage(item.symbol),
              width: 40,
              height: 40,
            ),
          ],
        ),

        //chart and percentage change
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
          child: AppText(
            text: '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%',
            style: AppTextStyle.tsMediumdarkNavyBlue16.copyWith(
              color: percent >= 0 ? Colors.green : Colors.red,
            ),
          ),
        ),
        //chart icon
        SvgPicture.asset(AppPath.icChartMini),

        //market cap
        AppText(
          text: '24H Vol',
          style: AppTextStyle.tsRegulargrayishNavy12.copyWith(height: 1.0),
        ),
        SizedBox(height: 4),
        AppText(
          text: double.parse(item.volume).toStringAsFixed(2),
          style: AppTextStyle.tsRegulargrayishNavy12.copyWith(height: 1.0),
        ),
      ],
    ),
  );
}

Padding _textandMore(String text) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
    child: Row(
      children: [
        AppText(text: text, style: AppTextStyle.tsMediumdarkNavyBlue16),
        Spacer(),
        AppText(text: 'More', style: AppTextStyle.tsMediumbrightBlue16),
      ],
    ),
  );
}
