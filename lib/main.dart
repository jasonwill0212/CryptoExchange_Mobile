import 'package:cryptoexchange/provider/home_provider.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/provider/market_provider.dart';
import 'package:cryptoexchange/provider/bottomnavigation_provider.dart';
import 'package:cryptoexchange/provider/order_book_provider.dart';
import 'package:cryptoexchange/provider/theme_provider.dart';
import 'package:cryptoexchange/provider/wallet_provider.dart';
import 'package:cryptoexchange/repositories/coin_repository.dart';
import 'package:cryptoexchange/repositories/orderbook_repository.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:cryptoexchange/services/binance_websocket_service.dart';
import 'package:cryptoexchange/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class TestClass {
//   final String name;

//   TestClass({required this.name});
// }

void main() async {
  // /// instance test
  // /// instance test1
  // final test1 = TestClass(name: 'Flutter');

  // /// instance test2
  // final test2 = TestClass(name: 'Flutter');
  // print(test2 == test1); // should print false
  // print('\n');
  // print(identical(test1, test2)); // should print false
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize StorageService singleton
  await StorageService.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Init singleton service and repositories
        Provider(create: (context) => BinanceWebsocketService()),
        Provider(
          create: (context) => CoinRepository(
            binanceWebsocketService: context.read<BinanceWebsocketService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              HomeProvider(coinRepository: context.read<CoinRepository>()),
        ),

        Provider(
          create: (context) => OrderbookRepository(
            binanceWebsocketService: context.read<BinanceWebsocketService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderBookProvider(
            orderbookRepository: context.read<OrderbookRepository>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => BottomnavigationProvider()),
        ChangeNotifierProvider(create: (context) => MarketProvider()),
        ChangeNotifierProvider(create: (context) => WalletProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (context) => DemoCoinProvider()),
      ],
      child: MyAppBody(),
    );
  }
}

class MyAppBody extends StatelessWidget {
  const MyAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      initialRoute: AppRoute.onboardingPage,
      routes: AppRoute().routes,
      themeMode: ThemeMode.system,
      theme: context.watch<ThemeProvider>().themeData,
    );
  }
}
