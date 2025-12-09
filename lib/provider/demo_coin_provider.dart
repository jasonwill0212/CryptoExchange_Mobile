// import 'package:cryptoexchange/models/coin.dart';
// import 'package:cryptoexchange/repositories/coin_repository.dart';
// import 'package:flutter/material.dart';

// class DemoCoinProvider extends ChangeNotifier {
//   final CoinRepository coinRepository = CoinRepository();

//   /// define state
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   // String _errorMessage = '';
//   // String get errorMessage => _errorMessage;

//   Coin? _coin;
//   Coin? get coin => _coin;

//   /// Connect to ticker stream
//   Future<void> connectToTickerStream(List<String> listcoins) async {
//     _isLoading = true;
//     notifyListeners();
//     await coinRepository.connectToTickerStream(listcoins);
//     _isLoading = false;
//     notifyListeners();
//   }

//   // Stream<Coin> getTickerStream() {
//   //   return coinRepository.getTickerStream();
//   // }
// }
