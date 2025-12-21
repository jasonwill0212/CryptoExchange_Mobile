import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  /// Singleton -> it means only one instance of this class will be created and used throughout the app.
  /// Singleton pattern -> private constructor
  StorageService._privateConstructor();

  /// Singleton instance
  static final StorageService _instance = StorageService._privateConstructor();

  /// Getter for singleton instance
  static StorageService get instance => _instance;

  /// init SharedPreferences
  late SharedPreferences _prefs;

  /// Define key strings
  static const String onboardingCompletedKey = 'onboardingCompleted';
  static const String isDarkModeKey = 'isDarkMode';
  static const String favoriteCoinsKey = 'favoriteCoins';

  /// Stream , Stream Controller -> for listening list favorite coins
  StreamController<List<String>> favoriteCoinsStreamController =
      StreamController<List<String>>.broadcast();

  Stream<List<String>> get favoriteCoinsStream =>
      favoriteCoinsStreamController.stream;

  /// Functions
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// check onboarding status
  bool checkOnboardingStatus() {
    return _prefs.getBool(onboardingCompletedKey) ?? false;
  }

  /// set onboarding completed
  Future<void> setOnboardingCompleted([bool? isCompleted]) async {
    await _prefs.setBool(onboardingCompletedKey, isCompleted ?? true);
  }

  /// set theme mode
  Future<void> setThemeMode([bool isDark = false]) async {
    await _prefs.setBool(isDarkModeKey, isDark);
  }

  /// get theme mode
  bool getThemeMode() {
    return _prefs.getBool(isDarkModeKey) ?? false;
  }

  /// get list favorite coins
  List<String> getFavoriteCoins() {
    /// toLowercase all symbols
    /// Example: ['BTCUSDT', 'ETHUSDT'] -> ['btcusdt', 'ethusdt']
    /// Get stored list
    final List<String> storedCoins =
        _prefs.getStringList(favoriteCoinsKey) ?? [];

    /// toLowercase all symbols
    // return storedCoins.map((coin) => coin.toLowerCase()).toList();
    for (int i = 0; i < storedCoins.length; i++) {
      storedCoins[i] = storedCoins[i].toLowerCase();
    }
    return storedCoins;
  }

  /// toggle single favorite coin
  Future<void> toggleFavoriteCoin(String symbol) async {
    /// Get current list
    final List<String> favoriteCoins = getFavoriteCoins();

    if (favoriteCoins.contains(symbol.toLowerCase())) {
      /// Example: 'btcusdt' exists -> remove it
      favoriteCoins.remove(symbol.toLowerCase());
    } else {
      favoriteCoins.add(symbol.toLowerCase());
    }

    /// Save updated list
    await _prefs.setStringList(favoriteCoinsKey, favoriteCoins);

    /// Update stream to notify listeners
    favoriteCoinsStreamController.add(favoriteCoins);
  }
}
