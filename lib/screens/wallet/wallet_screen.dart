import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/components/app_text.dart';
import 'package:cryptoexchange/components/app_textstyle.dart';
import 'package:cryptoexchange/core/utils/size_config.dart';
import 'package:cryptoexchange/provider/wallet_provider.dart';
import 'package:cryptoexchange/components/app_segmented.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _appBar(context),
      body: _body(context),
    );
  }
}

Widget _body(BuildContext context) {
  return SafeArea(
    child: Column(
      children: [
        Consumer<WalletProvider>(
          builder: (context, walletProvider, child) => AppSegmented(
            tabs: const ['Card', 'Portfolio'],
            selectedIndex: walletProvider.selectedTabIndex,
            onChanged: (index) {
              walletProvider.setSelectedTabIndex(index);
            },
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: 'My Balance: \$12,345.67',
                style: AppTextStyle.tsMediumdarkNavyBlue16.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SvgPicture.asset(AppPath.icEye),
            ],
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: context.h(200),
          width: context.w(300),
          child: Image.asset(AppPath.imgCreditcard),
        ),
      ],
    ),
  );
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    title: AppText(
      text: 'Wallet',
      style: AppTextStyle.tsMediumdarkNavyBlue18.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ),
    centerTitle: true,
  );
}
