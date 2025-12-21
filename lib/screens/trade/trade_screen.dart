import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/components/app_segmented.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trade/widget/dropdown.dart';
import 'package:cryptoexchange/screens/trade/widget/segmented_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

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
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(),
      body: SingleChildScrollView(child: _body(context)),
    );
  }

  //appbar
  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColor.almostWhite,
      centerTitle: true,
      title: AppText(text: 'Trade', style: AppTextStyle.tsMediumdarkNavyBlue18),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Icon(Icons.favorite_border, color: AppColor.darkNavyBlue),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
      child: Column(
        children: [
          SizedBox(height: 18),
          // Custom trade tab
          /// TODO: Implement Tabbar Flutter Widget
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

          SizedBox(height: 16),

          /// TODO: Implement bottomsheet for coin selection that displasys list of coins
          /// this coins data comes from HomeProvider and they're real-time updated via websocket
          /// default coin is BTCUSDT
          /// has check icon to indicate selected coin
          Consumer<HomeProvider>(
            builder: (_, homeProvider, __) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: homeProvider.coins.isNotEmpty
                            ? homeProvider.coins[0].symbol.toUpperCase()
                            : '',
                        style: AppTextStyle.tsRegulardarkNavyBlue16,
                      ),
                      SvgPicture.asset(AppPath.icGraph),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      AppText(
                        text: double.parse(
                          homeProvider.coins.isNotEmpty
                              ? homeProvider.coins[0].currentPrice
                              : '0',
                        ).toStringAsFixed(2),
                        style: AppTextStyle.tsRegulargreen16,
                      ),
                      SizedBox(width: 4),
                      AppText(
                        text:
                            '≈\$${(double.parse(homeProvider.coins.isNotEmpty ? homeProvider.coins[0].currentPrice : '0')).toStringAsFixed(2)}',
                        style: AppTextStyle.tsRegulargrayishNavy14,
                      ),
                      SizedBox(width: 4),
                      AppText(
                        text:
                            '${homeProvider.coins.isNotEmpty ? homeProvider.coins[0].priceChangePercent : '0.00'}%',
                        style:
                            double.parse(
                                  homeProvider.coins.isNotEmpty
                                      ? homeProvider.coins[0].priceChangePercent
                                      : '0',
                                ) >=
                                0
                            ? AppTextStyle.tsRegulargreen14
                            : AppTextStyle.tsRegularred14,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Order Bk No. and Unit labels
                          Row(
                            children: [
                              AppText(
                                text: 'Order Bk No.',
                                style: AppTextStyle.tsRegulargrayishNavy12,
                              ),
                              SizedBox(width: 46),
                              AppText(
                                text: 'Unit',
                                style: AppTextStyle.tsRegulargrayishNavy12,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          _tradeDropdown(context),
                          SizedBox(height: 12),
                          // Price and Amount labels
                          Row(
                            children: [
                              AppText(
                                text: 'Price',
                                style: AppTextStyle.tsRegulargrayishNavy12,
                              ),
                              SizedBox(width: 66),
                              AppText(
                                text: 'Amount',
                                style: AppTextStyle.tsRegulargrayishNavy12,
                              ),
                            ],
                          ),
                          SizedBox(height: 4),

                          _askBidConsumer(),
                        ],
                      ),

                      SizedBox(width: 11),
                      Column(
                        children: [
                          // Buy/Sell  Segmented Picker
                          SegmentedPicker(
                            tabs: const ['Buy', 'Sell'],
                            selectedIndex: buttonType,
                            onChanged: (index) {
                              setState(() {
                                buttonType = index;
                              });
                            },
                          ),

                          SizedBox(height: 24),

                          // Limit Card
                          _limitCard(),
                          SizedBox(height: 8),
                          // Available balance
                          AppText(
                            text: 'Available: 0.00000000 BTC',
                            style: AppTextStyle.tsRegulargrayishNavy14,
                          ),

                          //input fields
                          SizedBox(height: 16),
                          _inputField('USDT', context, true),
                          SizedBox(height: 12),
                          _inputField('BTC', context, true),
                          SizedBox(height: 16),
                          SfSlider(
                            activeColor: AppColor.brightBlue,
                            min: 0.0,
                            max: 100.0,
                            value: 50,
                            interval: 20,
                            showTicks: true,
                            enableTooltip: true,
                            onChanged: (dynamic value) {
                              setState(() {});
                            },
                          ),
                          SizedBox(height: 16),
                          _inputField('USDT', context, false),

                          SizedBox(height: 24),

                          //Buy sell button
                          AppButton(
                            textButton: 'Buy BTC',
                            buttonType: ButtonType.normal,
                            width: 188,
                            height: 48,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

//input field
Widget _inputField(String hintText, BuildContext context, bool icon) {
  return Container(
    width: 188,
    height: 32,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColor.lightgrayishblue,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: TextFormField(
      style: AppTextStyle.tsRegulardarkNavyBlue14,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),

        prefixIcon: icon ? Icon(Icons.remove, size: 18) : null,
        prefixIconConstraints: const BoxConstraints(minWidth: 32),

        suffixIcon: SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText(
                text: hintText,
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
              const SizedBox(width: 4),
              ?icon ? Icon(Icons.add, size: 18) : null,
              const SizedBox(width: 8),
            ],
          ),
        ),

        border: InputBorder.none,
        hintStyle: AppTextStyle.tsMediumdarkNavyBlue16,
      ),
    ),
  );
}

//limit card
Widget _limitCard() {
  return Container(
    width: 188,
    height: 32,
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: AppColor.lightgrayishblue,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Row(
        children: [
          AppText(text: 'Limit', style: AppTextStyle.tsRegulardarkNavyBlue14),
          Spacer(),
          Icon(Icons.keyboard_arrow_down, color: AppColor.darkNavyBlue),
        ],
      ),
    ),
  );
}

//TradeDropdown
Widget _tradeDropdown<T>(BuildContext context) {
  return Row(
    children: [
      TradeDropdown<int>(
        dropdownType: DropdownType.small,
        value: 10,
        items: const [10, 20, 50, 100],
        labelBuilder: (v) => v.toString(),
        onChanged: (v) {},
      ),

      SizedBox(width: 16),
      TradeDropdown<double>(
        dropdownType: DropdownType.medium,
        value: 0.00001,
        items: const [0.00001, 0.0001, 0.001],
        labelBuilder: (v) => v.toStringAsFixed(5),
        onChanged: (v) {},
      ),
    ],
  );
}

Consumer _askBidConsumer() {
  return Consumer<OrderBookProvider>(
    builder: (context, orderBookProvider, child) {
      final askEntries = orderBookProvider.orderbooks.askEntries;
      final bidEntries = orderBookProvider.orderbooks.bidEntries;

      if (askEntries.isEmpty || bidEntries.isEmpty) {
        return AppText(
          text: 'Loading order book...',
          style: AppTextStyle.tsRegulargrayishNavy14,
        );
      }
      return Column(
        children: [
          // Ask entries (Sell orders - red)
          ...askEntries.take(10).map((askEntry) => _askEntryRow(askEntry)),

          SizedBox(height: 8),
          // Bid entries (Buy orders - green)
          ...bidEntries.take(10).map((bidEntry) => _bidEntryRow(bidEntry)),
        ],
      );
    },
  );
}

Widget _askEntryRow(askEntry) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Price column - fixed width, right aligned
      SizedBox(
        width: 65,
        child: AppText(
          text: askEntry.price.toStringAsFixed(2),
          style: AppTextStyle.tsRegularred14,
        ),
      ),
      SizedBox(width: 30),
      // Quantity column - fixed width, left aligned
      SizedBox(
        width: 65,
        child: AppText(
          text: askEntry.quantity.toStringAsFixed(5),
          style: AppTextStyle.tsRegularred14,
        ),
      ),
    ],
  );
}

Widget _bidEntryRow(bidEntry) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Price column - fixed width, right aligned
      SizedBox(
        width: 65,
        child: AppText(
          text: bidEntry.price.toStringAsFixed(2),
          style: AppTextStyle.tsRegulargreen14,
        ),
      ),
      SizedBox(width: 30),
      // Quantity column - fixed width, left aligned
      SizedBox(
        width: 65,
        child: AppText(
          text: bidEntry.quantity.toStringAsFixed(5),
          style: AppTextStyle.tsRegulargreen14,
        ),
      ),
    ],
  );
}
