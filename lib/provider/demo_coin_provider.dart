import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/repositories/coin_repository.dart';
import 'package:flutter/material.dart';

class DemoCoinProvider extends ChangeNotifier {
  final CoinRepository _coinRepository = CoinRepository();

  /// define state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Coin? _coin;
  Coin? get coin => _coin;

  /// Connect to ticker stream
  Future<void> connectToTickerStream(String symbol) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Connect to ticker stream -> websocket
      await _coinRepository.connectToTickerStream(symbol);

      /// Listen to ticker stream
      _coinRepository.tickerStream.listen((coinData) {
        _coin = coinData;
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = 'Error connecting to ticker stream: $e';
      _isLoading = false;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
