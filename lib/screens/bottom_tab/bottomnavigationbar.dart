import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/components/app_path.dart';
import 'package:cryptoexchange/provider/bottomnavigation_provider.dart';
import 'package:cryptoexchange/screens/favorite/favorites_screen.dart';
import 'package:cryptoexchange/screens/home/home_screen.dart';
import 'package:cryptoexchange/screens/market/market_screen.dart';
import 'package:cryptoexchange/screens/trade/trade_screen.dart';
import 'package:cryptoexchange/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Bottomnavigationbar extends StatelessWidget {
  const Bottomnavigationbar({super.key});

  static const List<Widget> pages = [
    HomeScreen(),
    TradeScreen(),
    MarketScreen(),
    FavoritesScreen(),
    WalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomnavigationProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: IndexedStack(index: provider.seletedIndex, children: pages),
          bottomNavigationBar: _bottomNavigationBar(provider, context),
        );
      },
    );
  }
}

BottomNavigationBar _bottomNavigationBar(
  BottomnavigationProvider bottomProvider,
  BuildContext context,
) {
  final unselectedColor =
      Theme.of(context).textTheme.bodyMedium?.color ?? Color(0XFF696F8C);
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).colorScheme.surface,
    currentIndex: bottomProvider.seletedIndex,
    onTap: bottomProvider.setSeletedIndex,
    selectedItemColor: Theme.of(context).colorScheme.primary,
    unselectedItemColor: unselectedColor,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppPath.icHome,
          colorFilter: ColorFilter.mode(
            bottomProvider.seletedIndex == 0
                ? Theme.of(context).colorScheme.primary
                : unselectedColor,
            BlendMode.srcIn,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppPath.icTrade,
          colorFilter: ColorFilter.mode(
            bottomProvider.seletedIndex == 1
                ? Theme.of(context).colorScheme.primary
                : unselectedColor,
            BlendMode.srcIn,
          ),
        ),
        label: 'Trade',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppPath.icMarket,
          colorFilter: ColorFilter.mode(
            bottomProvider.seletedIndex == 2
                ? Theme.of(context).colorScheme.primary
                : unselectedColor,
            BlendMode.srcIn,
          ),
        ),
        label: 'Market',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppPath.icStar,
          colorFilter: ColorFilter.mode(
            bottomProvider.seletedIndex == 3
                ? Theme.of(context).colorScheme.primary
                : unselectedColor,
            BlendMode.srcIn,
          ),
        ),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppPath.icWallet,
          colorFilter: ColorFilter.mode(
            bottomProvider.seletedIndex == 4
                ? Theme.of(context).colorScheme.primary
                : unselectedColor,
            BlendMode.srcIn,
          ),
        ),
        label: 'Wallet',
      ),
    ],
  );
}
