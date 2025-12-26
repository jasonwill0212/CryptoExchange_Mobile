import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/market_provider.dart';
import 'package:cryptoexchange/screens/market/widget/widget_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appBar(context),
      body: _body(context),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    centerTitle: true,
    title: AppText(
      text: 'Market',
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

Widget _body(BuildContext context) {
  final marketProvider = context.read<MarketProvider>();
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _searchTextField(context),
            SizedBox(height: 16),
            WidgetTag(
              tags: ['All Coins', 'Most Trade', 'Most Lose', 'New Coin'],
              onChanged: (index) {
                // MarketProvider exposes an update method rather than a public setter
                marketProvider.updateIndex(index);
              },
            ),

            SizedBox(height: 16),
            //header row
            _headerRow(),

            SizedBox(height: 16),
            Consumer<HomeProvider>(
              builder: (context, homeProvider, child) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeProvider.coins.length,
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = homeProvider.coins[index];
                    return _cryptoCoinCardItem(item, context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

//card cryptocoin item
Widget _cryptoCoinCardItem(Coin item, BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
    height: context.h(76),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
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

//header row
Padding _headerRow() {
  return Padding(
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
  );
}

//textfield cryptocoin search with search icon prefix
Widget _searchTextField(BuildContext context) {
  return Container(
    height: context.h(48),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.12),
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Cryptocoin search',
        hintStyle: AppTextStyle.tsRegulargray60size16,
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(7, 14, 7, 14),
          child: SvgPicture.asset(AppPath.icSearch),
        ),
        filled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
