import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/enum/enum.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trade/widget/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderbookSectionWidget extends StatelessWidget {
  const OrderbookSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            AppText(text: 'Unit', style: AppTextStyle.tsRegulargrayishNavy12),
          ],
        ),
        SizedBox(height: 4),
        _tradeDropdown(context),
        SizedBox(height: 12),
        // Price and Amount labels
        Row(
          children: [
            AppText(text: 'Price', style: AppTextStyle.tsRegulargrayishNavy12),
            SizedBox(width: 66),
            AppText(text: 'Amount', style: AppTextStyle.tsRegulargrayishNavy12),
          ],
        ),
        SizedBox(height: 4),

        _askBidConsumer(),
      ],
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 30),
        // Quantity column - fixed width, left aligned
        SizedBox(
          width: 65,
          child: AppText(
            text: askEntry.quantity.toStringAsFixed(2).toString(),
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
            text: bidEntry.price.toStringAsFixed(2).toString(),
            style: AppTextStyle.tsRegulargreen14,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(width: 30),
        // Quantity column - fixed width, left aligned
        SizedBox(
          width: 65,
          child: AppText(
            text: bidEntry.quantity.toStringAsFixed(2).toString(),
            style: AppTextStyle.tsRegulargreen14,
          ),
        ),
      ],
    );
  }
}
