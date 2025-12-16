import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
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
      backgroundColor: AppColor.almostWhite,
      appBar: _appBar(),
      body: _body(context),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    backgroundColor: AppColor.almostWhite,
    centerTitle: true,
    title: AppText(text: 'Market', style: AppTextStyle.tsMediumdarkNavyBlue18),
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
          ],
        ),
      ),
    ),
  );
}

//textfield cryptocoin search with search icon prefix
Widget _searchTextField(BuildContext context) {
  return Container(
    height: context.h(48),
    decoration: BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColor.brightBlue.withValues(alpha: 0.12),
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
