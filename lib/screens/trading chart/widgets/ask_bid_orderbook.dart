import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/models/orderbook.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AskBidOrderbook extends StatefulWidget {
  const AskBidOrderbook({super.key});

  @override
  State<AskBidOrderbook> createState() => _AskBidOrderbookState();
}

class _AskBidOrderbookState extends State<AskBidOrderbook> {
  @override
  Widget build(BuildContext context) {
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
        return SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: 'Price',
                    style: AppTextStyle.tsRegulardarkNavyBlue14,
                  ),
                  SizedBox(height: 4),
                  ...askEntries
                      .take(10)
                      .map((askEntry) => _askEntryRow(askEntry)),
                  ...bidEntries
                      .take(10)
                      .map((bidEntry) => _bidEntryRow(bidEntry)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppText(
                    text: 'Amount',
                    style: AppTextStyle.tsRegulardarkNavyBlue14,
                  ),
                  SizedBox(height: 4),
                  ...askEntries
                      .take(10)
                      .map((askEntry) => _askEntryAmountRow(askEntry)),
                  ...bidEntries
                      .take(10)
                      .map((bidEntry) => _bidEntryAmoutRow(bidEntry)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _askEntryRow(OrderbookEntry askEntry) {
    return AppText(
      text: askEntry.price.toStringAsFixed(2),
      style: AppTextStyle.tsRegularred14,
      textAlign: TextAlign.start,
    );
  }

  Widget _bidEntryAmoutRow(OrderbookEntry bidEntry) {
    return AppText(
      text: bidEntry.quantity.toStringAsFixed(2),
      style: AppTextStyle.tsRegulargreen14,
    );
  }

  Widget _askEntryAmountRow(OrderbookEntry askEntry) {
    return AppText(
      text: askEntry.quantity.toStringAsFixed(2),
      style: AppTextStyle.tsRegularred14,
    );
  }

  Widget _bidEntryRow(OrderbookEntry bidEntry) {
    return AppText(
      text: bidEntry.price.toStringAsFixed(2),
      style: AppTextStyle.tsRegulargreen14,
    );
  }
}
