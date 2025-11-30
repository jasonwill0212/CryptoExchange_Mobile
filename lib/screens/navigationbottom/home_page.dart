import 'package:cryptoexchange/provider/bottomnavigation_provider.dart';
import 'package:cryptoexchange/screens/navigationbottom/favorites_screen.dart';
import 'package:cryptoexchange/screens/navigationbottom/home_screen.dart';
import 'package:cryptoexchange/screens/navigationbottom/market_screen.dart';
import 'package:cryptoexchange/screens/navigationbottom/trade_screen.dart';
import 'package:cryptoexchange/screens/navigationbottom/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Widget> pages = [
    HomeScreen(),
    TradeScreen(),
    MarketScreen(),
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
    currentIndex: bottomProvider.seletedIndex,
    onTap: bottomProvider.setSeletedIndex,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
        icon: Icon(Icons.candlestick_chart),
        label: 'Trade',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Market'),
    ],
  );
}
