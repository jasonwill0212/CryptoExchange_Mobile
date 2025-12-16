import 'package:cryptoexchange/core/const/app_data.dart';
import 'package:cryptoexchange/models/orderbook.dart';
import 'package:cryptoexchange/repositories/orderbook_repository.dart';
import 'package:flutter/material.dart';

class OrderBookProvider extends ChangeNotifier {
  final OrderbookRepository orderbookRepository;

  OrderBookProvider({required this.orderbookRepository});

  /// define state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Orderbook> _orderbooks = [];
  List<Orderbook> get orderbooks => _orderbooks;

  /// Connect to order book stream
  Future<void> connectToOrderBookStream(List<String> listcoins) async {
    try {
      _isLoading = true;
      notifyListeners();

      /// Connect to order book stream with predefined coin list
      await orderbookRepository.connectToOrderBookStream(AppData.coins);

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
