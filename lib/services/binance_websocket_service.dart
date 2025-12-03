import 'dart:async';
import 'dart:convert';

import 'package:cryptoexchange/models/coin.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class BinanceWebsocketService {
  /// Declare websocket url
  static const String _baseUrl =
      'wss://stream.binance.com:9443/stream?streams=';

  /// Declare websocket channel variable
  WebSocketChannel? _tickerWebSocketChannel;

  /// Declare stream variable
  final StreamController<Coin> _tickerStreamController =
      StreamController<Coin>.broadcast();

  /// Expose ticker stream -> for listening
  Stream<Coin> get tickerStream => _tickerStreamController.stream;

  /// Connect to Binance Websocket for Ticker Stream
  /// TODO: handle List<String> symbols
  Future<void> connectToTickerStream(String symbol) async {
    try {
      final String url = '$_baseUrl${symbol.toLowerCase()}@ticker';

      _tickerWebSocketChannel = WebSocketChannel.connect(Uri.parse(url));

      if (_tickerWebSocketChannel == null) {
        throw Exception('Failed to connect to Binance WebSocket');
      }

      _tickerWebSocketChannel?.stream.listen((data) {
        debugPrint('Received data: $data');

        /// Handle incoming data
        final jsonData = jsonDecode(data);
        if (jsonData != null && jsonData['data'] != null) {
          final coinData = Coin.fromJson(jsonData['data']);

          /// Add data to stream
          _tickerStreamController.add(coinData);
          debugPrint('Received Coin Data: ${coinData.toJson()}');
        } else {
          debugPrint('Invalid data format received: $jsonData');
        }
      });
    } catch (e, stackTrace) {
      // Handle connection errors
      debugPrint('Error connecting to Binance WebSocket: $e, $stackTrace');
    }
  }
}
