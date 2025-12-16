import 'package:cryptoexchange/models/orderbook.dart';
import 'package:cryptoexchange/services/binance_websocket_service.dart';

class OrderbookRepository {
  final BinanceWebsocketService binanceWebsocketService;

  /// get order book stream
  Stream<List<Orderbook>> get orderBookStream =>
      binanceWebsocketService.orderBookStream;

  OrderbookRepository({required this.binanceWebsocketService});

  Future<void> connectToOrderBookStream(List<String> listcoins) async {
    await binanceWebsocketService.connectToOrderBookStream(listcoins);
  }
}
