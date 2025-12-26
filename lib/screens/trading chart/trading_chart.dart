import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_segmented.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/provider/favorite_provider.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/ask_bid_orderbook.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/bottom_button.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/card_webview.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/listpopular_pairs_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradingChart extends StatefulWidget {
  const TradingChart({super.key});

  @override
  State<TradingChart> createState() => _TradingChartState();
}

class _TradingChartState extends State<TradingChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(child: _body()),
      bottomNavigationBar: BottomButton(),
    );
  }

  Padding _body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
      child: Column(
        children: [
          SizedBox(height: 16),
          AppSegmented(
            tabs: ['1Hour', '1Day', '1Month', '1Year'],
            selectedIndex: 0,
            onChanged: (index) {},
          ),
          SizedBox(height: 16),
          CardWebview(),
          SizedBox(height: 16),
          _titleText('Popular Pairs'),
          SizedBox(height: 8),
          ListpopularPairsWidget(),
          SizedBox(height: 16),
          _titleText('Trade History'),
          SizedBox(height: 8),
          AskBidOrderbook(),
        ],
      ),
    );
  }

  //title text
  Align _titleText(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AppText(
        text: text,
        style: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(height: 1.0),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      leading: BackButton(color: Theme.of(context).iconTheme.color),
      title: AppText(
        text: 'Trading Chart',
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
}
