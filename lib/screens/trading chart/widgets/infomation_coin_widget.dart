import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/string_helper.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class InfomationCoinWidget extends StatefulWidget {
  const InfomationCoinWidget({super.key});

  @override
  State<InfomationCoinWidget> createState() => _InfomationCoinWidgetState();
}

class _InfomationCoinWidgetState extends State<InfomationCoinWidget> {
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
        return Padding(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 4),
          child: Row(
            children: [
              SvgPicture.asset(
                StringHelper.getCoinImage(selectedSymbol.toUpperCase()),
                width: 40,
                height: 40,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: selectedCoin.symbol.split('USDT')[0],
                    style: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  AppText(
                    text: selectedCoin.symbol.split('USDT')[0],
                    style: AppTextStyle.tsRegulargrayishNavy14.copyWith(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(
                    text:
                        '\$${double.parse(selectedCoin.currentPrice).toStringAsFixed(2)}',
                    style: AppTextStyle.tsRegulardarkNavyBlue16.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
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
}
