import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListpopularPairsWidget extends StatefulWidget {
  const ListpopularPairsWidget({super.key});

  @override
  State<ListpopularPairsWidget> createState() => _ListpopularPairsWidgetState();
}

class _ListpopularPairsWidgetState extends State<ListpopularPairsWidget> {
  @override
  Widget build(BuildContext context) {
    String selectedSymbol = context.watch<OrderBookProvider>().selectedSymbol;
    final orderBookProvider = context.watch<OrderBookProvider>();
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return SizedBox(
          height: context.h(28),
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: context.w(8)),
            scrollDirection: Axis.horizontal,
            itemCount: homeProvider.coins.length,
            itemBuilder: (context, index) {
              final item = homeProvider.coins[index];
              return GestureDetector(
                onTap: () {
                  orderBookProvider.setSelectedCoin(item);
                  orderBookProvider.connectToOrderBookStream(
                    item.symbol.toLowerCase(),
                  );
                },
                child: Container(
                  width: context.w(80),
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
                    color: selectedSymbol == item.symbol.toLowerCase()
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Align(
                    child: AppText(
                      text: item.symbol,
                      style: selectedSymbol == item.symbol.toLowerCase()
                          ? AppTextStyle.tsRegularWhite14
                          : AppTextStyle.tsRegulardarkNavyBlue14.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
