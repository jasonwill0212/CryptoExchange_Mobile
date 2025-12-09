import 'package:cryptoexchange/core/const/app_data.dart';
import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/repositories/coin_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  final CoinRepository coinRepository;

  HomeProvider({required this.coinRepository});

  /// define state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Coin> _coins = [];
  List<Coin> get coins => _coins;

  /// Connect to ticker stream
  Future<void> connectToTickerStream() async {
    try {
      _isLoading = true;
      notifyListeners();

      /// Connect to ticker stream with predefined coin list
      await coinRepository.connectToTickerStream(AppData.coins);

      /// Listen to ticker stream
      coinRepository.tickerStream.listen((onData) {
        _coins = onData;
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
