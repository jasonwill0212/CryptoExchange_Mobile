import 'package:cryptoexchange/components/app_button.dart';
import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trade/widget/segmented_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BuySellSectionWidget extends StatefulWidget {
  const BuySellSectionWidget({super.key});

  @override
  State<BuySellSectionWidget> createState() => _BuySellSectionWidgetState();
}

class _BuySellSectionWidgetState extends State<BuySellSectionWidget> {
  int buttonType = 0; // 0: Buy, 1: Sell
  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          width: 188,
          child: SfSlider(
            activeColor: Theme.of(context).colorScheme.primary,
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
        ),
        SizedBox(height: 16),
        _inputField('USDT', context, false),

        SizedBox(height: 24),

        //Buy sell button
        AppButton(
          contentButtonType: ContentButtonType.normal,
          textButton:
              'Buy ${context.watch<OrderBookProvider>().selectedSymbol.toUpperCase()}',
          buttonType: ButtonType.normal,
          width: 188,
          height: 48,
        ),
      ],
    );
  }

  //input field
  Widget _inputField(String hintText, BuildContext context, bool icon) {
    return Container(
      width: 188,
      height: 32,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
        color: Theme.of(context).colorScheme.surface,
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
            Icon(
              Icons.keyboard_arrow_down,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
