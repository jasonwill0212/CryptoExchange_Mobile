import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/components/app_segmented.dart';
import 'package:cryptoexchange/screens/trade/widget/dropdown.dart';
import 'package:cryptoexchange/screens/trade/widget/segmented_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  int selectedQty = 10;
  double selectedStep = 0.00001;
  int selectedIndex = 0;
  int buttonType = 0; // 0: Buy, 1: Sell
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(),
      body: _body(),
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
          child: SvgPicture.asset(AppPath.icOrder),
        ),
      ],
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 15, 0),
      child: Column(
        children: [
          SizedBox(height: 18),
          // Custom trade tab
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
                          Row(
                            children: [
                              TradeDropdown<int>(
                                dropdownType: DropdownType.small,
                                value: selectedQty,
                                items: const [10, 20, 50, 100],
                                labelBuilder: (v) => v.toString(),
                                onChanged: (v) {
                                  setState(() => selectedQty = v);
                                },
                              ),
                              SizedBox(width: 16),
                              TradeDropdown<double>(
                                dropdownType: DropdownType.medium,
                                value: selectedStep,
                                items: const [0.00001, 0.0001, 0.001],
                                labelBuilder: (v) => v.toStringAsFixed(5),
                                onChanged: (v) {
                                  setState(() => selectedStep = v);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            children: [
                              AppText(
                                text: 'Prace',
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
                        ],
                      ),

                      SizedBox(width: 11),
                      Column(
                        children: [
                          SegmentedPicker(
                            tabs: const ['Buy', 'Sell'],
                            selectedIndex: buttonType,
                            onChanged: (index) {
                              setState(() {
                                buttonType = index;
                              });
                            },
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
