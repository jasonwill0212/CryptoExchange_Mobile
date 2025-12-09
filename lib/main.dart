import 'package:cryptoexchange/provider/storage_provider.dart';
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
        ChangeNotifierProvider(create: (context) => StorageProvider()),
      ],
      child: Consumer<StorageProvider>(
        builder: (context, storageProvider, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: AppRoute.onboardingPage,
          routes: AppRoute().routes,
        ),
      ),
    );
  }
}
