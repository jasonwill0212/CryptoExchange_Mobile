import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/provider/favorite_provider.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/components/app_segmented.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trade/widget/buy_sell_section_widget.dart';
import 'package:cryptoexchange/screens/trade/widget/coin_price_header_widget.dart';
import 'package:cryptoexchange/screens/trade/widget/orderbook_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// State Mangemenent
/// Global State -> use in multiple places
/// Local State -> use in one place only
class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  int selectedIndex = 0;
  int buttonType = 0; // 0: Buy, 1: Sell
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Connect to order book stream for orderbook data
      context.read<OrderBookProvider>().connectToOrderBookStream('btcusdt');

      // Connect to ticker stream for coin prices
      context.read<HomeProvider>().connectToTickerStream();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appBar(),
      body: SingleChildScrollView(child: _body(context)),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      title: AppText(
        text: 'Trade',
        style: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              context.read<FavoriteProvider>().toggleFavoriteCoin(
                context.read<OrderBookProvider>().selectedSymbol,
              );
            },
            child: Icon(
              Icons.favorite_border,
              color: context.watch<OrderBookProvider>().isFavoriteCoin
                  ? AppColor.red
                  : Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
      child: Column(
        children: [
          SizedBox(height: 16),
          AppSegmented(
            tabs: const ['Spot', 'Margin', 'Grid', 'Fiat'],
            selectedIndex: selectedIndex,
            onChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          SizedBox(height: 16),
          Column(
            children: [
              const CoinPriceHeaderWidget(),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const OrderbookSectionWidget(),
                  SizedBox(width: 11),
                  const BuySellSectionWidget(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
