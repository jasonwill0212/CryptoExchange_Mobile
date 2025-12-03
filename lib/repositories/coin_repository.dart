import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/services/binance_websocket_service.dart';

class CoinRepository {
  final BinanceWebsocketService _binanceWebsocketService =
      BinanceWebsocketService();

  /// Expose ticker stream
  Stream<Coin> get tickerStream => _binanceWebsocketService.tickerStream;

  /// Connect to ticker stream
  Future<void> connectToTickerStream(String symbol) async {
    await _binanceWebsocketService.connectToTickerStream(symbol);
  }
}
