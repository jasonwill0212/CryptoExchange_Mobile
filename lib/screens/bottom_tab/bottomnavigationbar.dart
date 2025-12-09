import 'package:cryptoexchange/components/app_color.dart';
import 'package:cryptoexchange/provider/bottomnavigation_provider.dart';
import 'package:cryptoexchange/screens/favorite/favorites_screen.dart';
import 'package:cryptoexchange/screens/home/home_screen.dart';
import 'package:cryptoexchange/screens/market/market_screen.dart';
import 'package:cryptoexchange/screens/trade/trade_screen.dart';
import 'package:cryptoexchange/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
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
          bottomNavigationBar: _bottomNavigationBar(provider),
        );
      },
    );
  }
}

BottomNavigationBar _bottomNavigationBar(
  BottomnavigationProvider bottomProvider,
) {
  return BottomNavigationBar(
    backgroundColor: AppColor.white,
    currentIndex: bottomProvider.seletedIndex,
    onTap: bottomProvider.setSeletedIndex,
    selectedItemColor: AppColor.brightBlue,
    unselectedItemColor: Color(0XFF696F8C),
    type: BottomNavigationBarType.fixed,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Trade'),
      BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Market'),
      BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
      BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
    ],
  );
}
