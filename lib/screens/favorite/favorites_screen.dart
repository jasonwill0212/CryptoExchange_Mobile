import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appBar(context),
      body: _body(),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
      title: AppText(
        text: 'Favorites',
        style: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: SvgPicture.asset(AppPath.icFilter),
        ),
      ],
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            children: [
              AppText(
                text: 'Pair\nUSDT',
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
              Spacer(),
              AppText(
                text: 'Last\nPrice',
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
              SizedBox(width: 16),
              AppText(
                text: '24H\nChange',
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Expanded(
          child: Consumer<FavoriteProvider>(
            builder: (_, favoriteProvider, _) {
              return ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: favoriteProvider.listOfFavoriteCoins.length,
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = favoriteProvider.listOfFavoriteCoins[index];
                  return Slidable(
                    key: const ValueKey(0),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      dismissible: DismissiblePane(onDismissed: () {}),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            context.read<FavoriteProvider>().toggleFavoriteCoin(
                              item.symbol,
                            );
                          },
                          backgroundColor: Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: _cryptoCoinCardItem(item, context),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _cryptoCoinCardItem(Coin item, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
      height: context.h(76),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.primary.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: item.symbol,
                style: AppTextStyle.tsMediumdarkNavyBlue16,
              ),
              SizedBox(height: 4),
              AppText(
                text:
                    'Vol ${double.tryParse(item.volume.toString())?.toStringAsFixed(2) ?? '0'}',
                style: AppTextStyle.tsRegulardarkNavyBlue14,
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Top Price',
                style: AppTextStyle.tsRegulardarkNavyBlue10,
              ),

              Image.asset(AppPath.imgChartMarket),
              AppText(
                text: 'Low Price',
                style: AppTextStyle.tsRegulardarkNavyBlue10,
              ),
            ],
          ),
          AppText(
            text: double.parse(item.currentPrice).toStringAsFixed(2),
            style: AppTextStyle.tsMediumdarkNavyBlue16,
          ),

          Container(
            width: context.w(47),
            height: context.h(16),
            decoration: BoxDecoration(
              color:
                  double.tryParse(item.priceChangePercent.toString()) != null &&
                      double.parse(item.priceChangePercent.toString()) >= 0
                  ? Colors.green
                  : Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: AppText(
                text:
                    '${double.tryParse(item.priceChangePercent.toString())?.toStringAsFixed(2) ?? '0'}%',
                style: AppTextStyle.tsRegularWhite14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
