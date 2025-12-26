import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/extension/context_extension.dart';
import 'package:cryptoexchange/core/utils/string_helper.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:cryptoexchange/screens/home/widget/widget_boxdecoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CoinPriceHeaderWidget extends StatelessWidget {
  const CoinPriceHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, _) {
        final selectedSymbol = context
            .watch<OrderBookProvider>()
            .selectedSymbol;
        final selectedCoin = homeProvider.coins.firstWhere(
          (coin) => coin.symbol.toLowerCase() == selectedSymbol,
          orElse: () => Coin(
            symbol: '',
            currentPrice: '0',
            priceChangePercent: '0',
            volume: '',
          ),
        );
        return GestureDetector(
          onTap: () {
            /// Implement bottomsheet for coin selection from list of coins list in HomeProvider
            /// Use showModalBottomSheet function
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Consumer<HomeProvider>(
                  builder: (_, homeProvider, _) {
                    return Container(
                      height: context.screenHeight * 0.7,
                      padding: EdgeInsets.all(16),
                      child: ListView.separated(
                        itemCount: homeProvider.coins.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final coin = homeProvider.coins[index];
                          return _cardCoinPortfolio(context, coin);
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppText(
                    text: selectedCoin.symbol.toUpperCase(),
                    style: AppTextStyle.tsRegulardarkNavyBlue16,
                  ),
                  Icon(Icons.keyboard_arrow_down, color: AppColor.darkNavyBlue),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.tradeChartPage);
                    },
                    child: SvgPicture.asset(AppPath.icGraph),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  AppText(
                    text: double.parse(
                      selectedCoin.currentPrice,
                    ).toStringAsFixed(2),
                    style: AppTextStyle.tsRegulargreen16,
                  ),
                  SizedBox(width: 4),
                  AppText(
                    text:
                        '≈\$${(double.parse(selectedCoin.currentPrice)).toStringAsFixed(2)}',
                    style: AppTextStyle.tsRegulargrayishNavy14,
                  ),
                  SizedBox(width: 4),
                  AppText(
                    text: '${selectedCoin.priceChangePercent}%',
                    style: double.parse(selectedCoin.priceChangePercent) >= 0
                        ? AppTextStyle.tsRegulargreen14
                        : AppTextStyle.tsRegularred14,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector _cardCoinPortfolio(BuildContext context, Coin item) {
    final percent = double.tryParse(item.priceChangePercent.toString()) ?? 0;
    return GestureDetector(
      onTap: () {
        context.read<OrderBookProvider>().connectToOrderBookStream(
          item.symbol.toLowerCase(),
        );
        Navigator.pop(context);
      },
      child: Container(
        width: context.screenWidth * 0.9,
        height: context.screenHeight * 0.08,
        decoration: WidgetBoxDecoration.boxDecoration(context),
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
                  text:
                      '\$${double.parse(item.currentPrice).toStringAsFixed(2)}',
                  style: AppTextStyle.tsRegulardarkNavyBlue16,
                ),
                AppText(
                  text:
                      '${percent >= 0 ? '+' : ''}${percent.toStringAsFixed(2)}%',
                  style: AppTextStyle.tsMediumdarkNavyBlue16.copyWith(
                    color: percent >= 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
