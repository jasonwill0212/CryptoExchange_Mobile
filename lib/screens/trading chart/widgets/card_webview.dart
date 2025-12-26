import 'package:cryptoexchange/core/utils/size_config.dart';

import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/infomation_coin_widget.dart';
import 'package:cryptoexchange/screens/trading%20chart/widgets/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardWebview extends StatelessWidget {
  const CardWebview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderBookProvider>(
      builder: (context, orderBookProvider, child) {
        final symbol = orderBookProvider.selectedSymbol.toUpperCase();
        return Container(
          height: context.h(301),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.12),
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              InfomationCoinWidget(),
              WebviewWidget(symbol: symbol),
            ],
          ),
        );
      },
    );
  }
}
