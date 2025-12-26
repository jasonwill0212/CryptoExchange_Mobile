import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/models/orderbook.dart';
import 'package:cryptoexchange/repositories/favorite_repository.dart';
import 'package:cryptoexchange/repositories/orderbook_repository.dart';
import 'package:flutter/material.dart';

class OrderBookProvider extends ChangeNotifier {
  final OrderbookRepository orderbookRepository;
  final FavoriteRepository favoriteRepository;

  OrderBookProvider({
    required this.orderbookRepository,
    required this.favoriteRepository,
  });

  /// define state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Orderbook _orderbooks = Orderbook(asks: [], bids: [], symbol: '');
  Orderbook get orderbooks => _orderbooks;

  String _selectedSymbol = 'btcusdt';
  String get selectedSymbol => _selectedSymbol;
  Coin? _selectedCoin;
  Coin? get selectedCoin => _selectedCoin;

  void setSelectedCoin(Coin coin) {
    _selectedCoin = coin;
    notifyListeners();
  }

  void setSelectedSymbol(String symbol) {
    _selectedSymbol = symbol;
    notifyListeners();
  }

  /// Logic to check if selectedSymbol is favorite or not
  bool get isFavoriteCoin =>
      favoriteRepository.getFavoriteCoins().contains(selectedSymbol);

  /// Connect to order book stream
  Future<void> connectToOrderBookStream(String symbol) async {
    try {
      _selectedSymbol = symbol;
      _isLoading = true;
      notifyListeners();

      /// Connect to order book stream with predefined coin list
      await orderbookRepository.connectToOrderBookStream(symbol);

      /// Listen to order book stream
      orderbookRepository.orderBookStream.listen((onData) {
        _orderbooks = onData;
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
