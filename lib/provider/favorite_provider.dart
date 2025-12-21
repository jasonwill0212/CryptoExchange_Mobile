import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/repositories/coin_repository.dart';
import 'package:cryptoexchange/repositories/favorite_repository.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final FavoriteRepository favoriteRepository;
  final CoinRepository coinRepository;

  FavoriteProvider({
    required this.favoriteRepository,
    required this.coinRepository,
  }) {
    init();
  }

  /// define state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Coin> _listOfFavoriteCoins = [];
  List<Coin> get listOfFavoriteCoins => _listOfFavoriteCoins;

  List<String> _listOfFavoriteCoinFromStorage = [];

  Future<void> init() async {
    try {
      _isLoading = true;
      notifyListeners();

      /// logic
      /// Get favorite coins from local storage
      _listOfFavoriteCoinFromStorage = favoriteRepository.getFavoriteCoins();

      /// Listen to favorite coins stream from storage service
      favoriteRepository.favoriteCoinsStream.listen((favoriteCoins) {
        _listOfFavoriteCoinFromStorage = favoriteCoins;
        updateFavoritesCoinToDisplay(coinRepository.listOfCoins);
      });

      /// Listen to all coins stream change in home provider
      coinRepository.tickerStream.listen((allCoins) {
        updateFavoritesCoinToDisplay(allCoins);
      });
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void updateFavoritesCoinToDisplay(List<Coin> allCoins) {
    _listOfFavoriteCoins = allCoins
        .where(
          (coin) => _listOfFavoriteCoinFromStorage.contains(
            coin.symbol.toLowerCase(),
          ),
        )
        .toList();
    notifyListeners();
  }

  /// toggle favorite coin
  Future<void> toggleFavoriteCoin(String symbol) async {
    await favoriteRepository.toggleFavoriteCoin(symbol);
  }
}
