import 'dart:async';

import 'package:cryptoexchange/provider/demo_coin_provider.dart';
import 'package:cryptoexchange/provider/onboarding_provider.dart';
import 'package:cryptoexchange/provider/bottomnavigation_provider.dart';
import 'package:cryptoexchange/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OnboardingProvider()),
        ChangeNotifierProvider(create: (context) => BottomnavigationProvider()),
        ChangeNotifierProvider(create: (context) => DemoCoinProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: AppRoute.onboardingPage,
        routes: AppRoute().routes,
        // home: const DemoSingleSubscriptionStreamScreen(),
        // home: const DemoCoinScreen(),
      ),
    );
  }
}

class DemoCoinScreen extends StatefulWidget {
  const DemoCoinScreen({super.key});

  @override
  State<DemoCoinScreen> createState() => _DemoCoinScreenState();
}

class _DemoCoinScreenState extends State<DemoCoinScreen> {
  String percent = '0';
  bool isPositive = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DemoCoinProvider>().connectToTickerStream('btcusdt');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Demo Coin Screen',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Consumer<DemoCoinProvider>(
            builder: (context, demoCoinProvider, child) {
              if (demoCoinProvider.isLoading) {
                return const CircularProgressIndicator();
              } else if (demoCoinProvider.errorMessage.isNotEmpty) {
                return Text(
                  demoCoinProvider.errorMessage,
                  style: const TextStyle(color: Colors.red),
                );
              } else if (demoCoinProvider.coin != null) {
                final coin = demoCoinProvider.coin!;

                /// convert to 2 decimal places
                final doublePriceChangePercent =
                    double.tryParse(coin.priceChangePercent) ?? 0.0;
                if (doublePriceChangePercent >= 0) {
                  isPositive = true;
                } else {
                  isPositive = false;
                }

                percent = doublePriceChangePercent.toStringAsFixed(2);
                percent = '${isPositive ? '+' : '-'}$percent%';
                return Text(
                  'Symbol: ${coin.symbol}\nPrice Change Percent: $percent\nVolume: ${coin.volume}\nCurrent Price: ${coin.currentPrice}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                );
              } else {
                return const Text('No data available');
              }
            },
          ),
        ],
      ),
    );
  }
}

/// Demo Stringlge - Subscription Stream

class DemoSingleSubscriptionStreamScreen extends StatefulWidget {
  const DemoSingleSubscriptionStreamScreen({super.key});

  @override
  State<DemoSingleSubscriptionStreamScreen> createState() =>
      _DemoSingleSubscriptionStreamScreenState();
}

class _DemoSingleSubscriptionStreamScreenState
    extends State<DemoSingleSubscriptionStreamScreen> {
  int _counter = 0;

  /// Single Subscription Stream
  // final StreamController _streamController = StreamController<int>();

  /// Broadcast Stream - Multiple Subscription Stream
  final StreamController _streamController = StreamController<int>.broadcast();

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Single Subscription Stream Demo',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Counter: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24),
                );
              } else {
                return const Text('No data', style: TextStyle(fontSize: 24));
              }
            },
          ),
          const SizedBox(height: 20),
          StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Counter2: ${snapshot.data}',
                  style: const TextStyle(fontSize: 24),
                );
              } else {
                return const Text('No data', style: TextStyle(fontSize: 24));
              }
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              for (int i = 0; i < 100; i++) {
                _counter++;
                await Future.delayed(const Duration(milliseconds: 500));
                _streamController.sink.add(_counter);
              }
            },
            child: const Text('Increment Counter'),
          ),
        ],
      ),
    );
  }
}
