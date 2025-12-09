import 'dart:async';
import 'dart:convert';

import 'package:cryptoexchange/models/coin.dart';
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

  /// Declare stream variable
  final StreamController<List<Coin>> _tickerStreamController =
      StreamController<List<Coin>>.broadcast();

  /// Expose ticker stream -> for listening
  Stream<List<Coin>> get tickerStream => _tickerStreamController.stream;

  /// Map of coin data
  final Map<String, Coin> _coinDataMap = {};

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
}
