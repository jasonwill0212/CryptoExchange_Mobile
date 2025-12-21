import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/services/binance_websocket_service.dart';

class CoinRepository {
  final BinanceWebsocketService binanceWebsocketService;

  /// get ticker stream
  Stream<List<Coin>> get tickerStream => binanceWebsocketService.tickerStream;

  /// get list of coins
  List<Coin> get listOfCoins => binanceWebsocketService.listOfCoins;

  CoinRepository({required this.binanceWebsocketService});

  Future<void> connectToTickerStream(List<String> listcoins) async {
    await binanceWebsocketService.connectToTickerStream(listcoins);
  }
}
