import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/services/binance_websocket_service.dart';

class CoinRepository {
  final BinanceWebsocketService _binanceWebsocketService =
      BinanceWebsocketService();

  Future<void> connectToTickerStream(List<String> listcoins) async {
    await _binanceWebsocketService.connectToTickerStream(listcoins);
  }

  Stream<Coin> getTickerStream() {
    return _binanceWebsocketService.tickerStream;
  }
}
