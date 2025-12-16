import 'dart:async';
import 'dart:convert';

import 'package:cryptoexchange/models/coin.dart';
import 'package:cryptoexchange/models/orderbook.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebsocketService {
  /// Delcare constructor
  BinanceWebsocketService();

  /// Declare websocket url
  static const String _baseUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// Declare websocket channel variable
  WebSocketChannel? _tickerWebSocketChannel;
  WebSocketChannel? _orderBookWebSocketChannel;

  /// Declare stream variable
  final StreamController<List<Coin>> _tickerStreamController =
      StreamController<List<Coin>>.broadcast();

  ///order book stream controller
  final StreamController<List<Orderbook>> _orderBookStreamController =
      StreamController<List<Orderbook>>.broadcast();

  /// Expose ticker stream -> for listening
  Stream<List<Coin>> get tickerStream => _tickerStreamController.stream;

  /// Expose order book stream -> for listening
  Stream<List<Orderbook>> get orderBookStream =>
      _orderBookStreamController.stream;

  /// Map of coin data
  final Map<String, Coin> _coinDataMap = {};
  final Map<String, Orderbook> _orderBookDataMap = {};

  /// Connect to ticker stream
  Future<void> connectToTickerStream(List<String> listcoin) async {
    try {
      // Fix: Add @ticker suffix to each coin symbol
      final streams = listcoin
          .map((coin) => '${coin.toLowerCase()}@ticker')
          .join('/');

      _tickerWebSocketChannel = WebSocketChannel.connect(
        Uri.parse('$_baseUrl$streams'),
      );

      _tickerWebSocketChannel?.stream.listen(
        (data) {
          try {
            final jsonData = jsonDecode(data);

            // Handle the stream format: {"stream":"...", "data":{...}}
            if (jsonData.containsKey('data')) {
              final coin = Coin.fromJson(jsonData['data']);
              _coinDataMap[coin.symbol] = coin;

              _tickerStreamController.add(_coinDataMap.values.toList());
            } else {
              debugPrint('Unexpected data format: $jsonData');
            }
          } catch (e, stackTrace) {
            debugPrint('Error parsing coin data: $e, stackTrace: $stackTrace');
          }
        },
        onError: (error) {
          debugPrint('WebSocket error: $error');
        },
        onDone: () {
          debugPrint('WebSocket connection closed');
        },
        cancelOnError: false,
      );
    } catch (e, stackTrace) {
      debugPrint('Error connecting to WebSocket: $e, stackTrace: $stackTrace');
    }
  }

  //order book stream
  Future<void> connectToOrderBookStream(symbol) async {
    try {
      final websocketUrl = "wss://stream.binance.com:9443/ws/$symbol@depth";

      _orderBookWebSocketChannel = WebSocketChannel.connect(
        Uri.parse(websocketUrl),
      );
      _orderBookWebSocketChannel?.stream.listen(
        (data) {
          try {
            final jsonData = jsonDecode(data);

            if (jsonData.containsKey('data')) {
              final orderbook = Orderbook.fromJson(jsonData['data']);
              _orderBookDataMap[orderbook.symbol] = orderbook;

              _orderBookStreamController.add(_orderBookDataMap.values.toList());
            } else {
              debugPrint('Unexpected data format: $jsonData');
            }
          } catch (e, stackTrace) {
            debugPrint(
              'Error parsing order book data: $e, stackTrace: $stackTrace',
            );
          }
        },
        onError: (error) {
          debugPrint('Order Book WebSocket error: $error');
        },
        onDone: () {
          debugPrint('Order Book WebSocket connection closed');
        },
        cancelOnError: false,
      );
    } catch (e, stackTrace) {
      debugPrint(
        'Error connecting to Order Book WebSocket: $e, stackTrace: $stackTrace',
      );
    }
  }
}
